local var_0_0 = {}
local var_0_1
local var_0_2
local var_0_3
local var_0_4
local var_0_5

local function var_0_6(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0:Find("base")

	if IsNil(var_1_0) then
		return
	end

	local var_1_1 = arg_1_1.name
	local var_1_2 = arg_1_1.value

	setActive(var_1_0, var_1_2)

	if not var_1_2 then
		return
	end

	setText(var_1_0:Find("name"), var_1_1)
	Canvas.ForceUpdateCanvases()

	if not IsNil(var_1_0:Find("value")) then
		setActive(var_1_0:Find("value"), var_1_2)
		changeToScrollText(var_1_0:Find("value/Text"), var_1_2)
	end

	if not IsNil(var_1_0:Find("effect")) then
		setActive(var_1_0:Find("effect"), false)
	end

	setActive(var_1_0:Find("value/up"), arg_1_1.compare and arg_1_1.compare > 0)
	setActive(var_1_0:Find("value/down"), arg_1_1.compare and arg_1_1.compare < 0)
	triggerToggle(var_1_0, arg_1_1.lock_open)

	if not arg_1_1.lock_open and arg_1_1.sub and #arg_1_1.sub > 0 then
		GetComponent(var_1_0, typeof(Toggle)).enabled = true
	else
		setActive(var_1_0:Find("name/close"), false)
		setActive(var_1_0:Find("name/open"), false)

		GetComponent(var_1_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_7(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0:Find("desc")

	if IsNil(var_2_0) then
		return
	end

	setActive(var_2_0, arg_2_1.desc)

	if not arg_2_1.desc then
		return
	end

	setText(var_2_0:Find("Text"), arg_2_1.desc)
end

local function var_0_8(arg_3_0, arg_3_1)
	var_0_6(arg_3_0, arg_3_1)
	var_0_7(arg_3_0, arg_3_1)
end

local function var_0_9(arg_4_0, arg_4_1, arg_4_2)
	removeAllChildren(arg_4_0)
	var_0_5(arg_4_0, arg_4_1, arg_4_2)
end

function var_0_5(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_2) do
		local var_5_0 = cloneTplTo(arg_5_1, arg_5_0)

		var_0_8(var_5_0, iter_5_1)
	end
end

function updateSpWeaponInfo(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0:Find("attr_tpl")

	var_0_9(arg_6_0:Find("attrs"), var_6_0, arg_6_1.attrs)

	local var_6_1 = {}

	if arg_6_2[1].skillId > 0 then
		local var_6_2 = getSkillDesc(arg_6_2[1].skillId, arg_6_2[1].lv)

		if not arg_6_2[1].unlock then
			var_6_2 = setColorStr(i18n("spweapon_tip_skill_locked") .. var_6_2, "#a2a2a2")
		end

		table.insert(var_6_1, {
			name = i18n("spweapon_attr_effect"),
			value = setColorStr(getSkillName(arg_6_2[1].skillId), arg_6_2[1].unlock and "#FFDE00FF" or "#A2A2A2"),
			desc = var_6_2
		})
	end

	for iter_6_0, iter_6_1 in ipairs(arg_6_2[2]) do
		local var_6_3 = getSkillDesc(iter_6_1.skillId, iter_6_1.lv)

		if not iter_6_1.unlock then
			var_6_3 = setColorStr(i18n("spweapon_tip_skill_locked") .. var_6_3, "#a2a2a2")
		end

		table.insert(var_6_1, {
			name = i18n("spweapon_attr_skillupgrade"),
			value = setColorStr(getSkillName(iter_6_1.skillId), iter_6_1.unlock and "#FFDE00FF" or "#A2A2A2"),
			desc = var_6_3
		})
	end

	var_0_5(arg_6_0:Find("attrs"), var_6_0, var_6_1)

	local var_6_4 = cloneTplTo(var_6_0, arg_6_0:Find("part"))

	var_6_4:SetSiblingIndex(0)
	var_0_8(var_6_4, {
		value = "",
		name = i18n("equip_info_23")
	})

	local var_6_5 = arg_6_0:Find("part/value")
	local var_6_6 = var_6_5:Find("label")
	local var_6_7 = {}
	local var_6_8 = {}

	if #arg_6_1.part[1] == 0 and #arg_6_1.part[2] == 0 then
		setmetatable(var_6_7, {
			__index = function(arg_7_0, arg_7_1)
				return true
			end
		})
		setmetatable(var_6_8, {
			__index = function(arg_8_0, arg_8_1)
				return true
			end
		})
	else
		for iter_6_2, iter_6_3 in ipairs(arg_6_1.part[1]) do
			var_6_7[iter_6_3] = true
		end

		for iter_6_4, iter_6_5 in ipairs(arg_6_1.part[2]) do
			var_6_8[iter_6_5] = true
		end
	end

	local var_6_9 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_6_7, var_6_8)

	UIItemList.StaticAlign(var_6_5, var_6_6, #var_6_9, function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_1 = arg_9_1 + 1

		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = var_6_9[arg_9_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_9_0), arg_9_2)
			setActive(arg_9_2:Find("main"), var_6_7[var_9_0] and not var_6_8[var_9_0])
			setActive(arg_9_2:Find("sub"), var_6_8[var_9_0] and not var_6_7[var_9_0])
			setImageAlpha(arg_9_2, not var_6_7[var_9_0] and not var_6_8[var_9_0] and 0.3 or 1)
		end
	end)
	setActive(var_6_0, false)
end

function var_0_0.AlignAttrs(arg_10_0, arg_10_1)
	for iter_10_0 = 1, #arg_10_0 do
		if not arg_10_1[iter_10_0] or arg_10_0[iter_10_0].type ~= arg_10_1[iter_10_0].type then
			local var_10_0 = false

			for iter_10_1 = iter_10_0 + 1, #arg_10_1 do
				if arg_10_1[iter_10_0].type == arg_10_1[iter_10_1].type then
					local var_10_1 = table.remove(arg_10_1, iter_10_1)

					table.insert(arg_10_1, iter_10_0, var_10_1)

					var_10_0 = true

					break
				end
			end

			if not var_10_0 then
				table.insert(arg_10_1, iter_10_0, {
					type = arg_10_0[iter_10_0].type
				})

				arg_10_1[iter_10_0].empty = true
			end
		end
	end

	for iter_10_2 = #arg_10_0 + 1, #arg_10_1 do
		table.insert(arg_10_0, {
			type = arg_10_1[iter_10_2].type
		})

		arg_10_0[iter_10_2].empty = true
	end
end

function var_0_0.CompareInfo(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.empty and 0 or arg_11_0.configAttr + arg_11_0.baseAttr

	arg_11_1.compare = (arg_11_1.empty and 0 or arg_11_1.configAttr + arg_11_1.baseAttr) - var_11_0
end

function var_0_0.InsertAttrsCompare(arg_12_0, arg_12_1)
	var_0_0.AlignAttrs(arg_12_0, arg_12_1)

	for iter_12_0 = 1, #arg_12_0 do
		var_0_0.CompareInfo(arg_12_0[iter_12_0], arg_12_1[iter_12_0])
	end
end

local function var_0_10(arg_13_0)
	local var_13_0 = arg_13_0:GetConfigAttributes()
	local var_13_1 = arg_13_0:GetBaseAttributes()

	return {
		{
			type = arg_13_0:getConfig("attribute_1"),
			configAttr = var_13_0[1],
			baseAttr = var_13_1[1]
		},
		{
			type = arg_13_0:getConfig("attribute_2"),
			configAttr = var_13_0[2],
			baseAttr = var_13_1[2]
		}
	}
end

local function var_0_11(arg_14_0, arg_14_1)
	local var_14_0 = {
		attrs = {}
	}

	for iter_14_0 = 1, #arg_14_0 do
		local var_14_1 = arg_14_0[iter_14_0]
		local var_14_2 = AttributeType.Type2Name(var_14_1.type)
		local var_14_3

		if not var_14_1.empty then
			var_14_3 = var_14_1.configAttr .. " + " .. var_14_1.baseAttr

			if not arg_14_1:IsReal() then
				var_14_3 = var_14_3 .. "~" .. arg_14_1:GetAttributesRange()[iter_14_0]
			end
		else
			var_14_3 = 0
		end

		table.insert(var_14_0.attrs, {
			name = var_14_2,
			value = var_14_3,
			compare = var_14_1.compare
		})
	end

	local var_14_4 = arg_14_1:GetWearableShipTypes()

	var_14_0.part = {
		var_14_4,
		var_14_4
	}

	return var_14_0
end

function var_0_0.TransformNormalInfo(arg_15_0)
	local var_15_0 = var_0_10(arg_15_0)

	return var_0_11(var_15_0, arg_15_0)
end

function var_0_0.CompareNormalInfo(arg_16_0, arg_16_1)
	local var_16_0 = var_0_10(arg_16_0)
	local var_16_1 = var_0_10(arg_16_1)

	var_0_0.InsertAttrsCompare(var_16_0, var_16_1)

	return var_0_11(var_16_0, arg_16_0), var_0_11(var_16_1, arg_16_1)
end

function var_0_0.TransformCompositeInfo(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = {
		arg_17_0:getConfig("attribute_1"),
		arg_17_0:getConfig("attribute_2")
	}
	local var_17_2 = arg_17_0:GetConfigAttributes()
	local var_17_3 = arg_17_0:GetAttributesRange()

	for iter_17_0 = 1, 2 do
		local var_17_4 = AttributeType.Type2Name(var_17_1[iter_17_0])
		local var_17_5 = var_17_2[iter_17_0] .. " + 0~" .. var_17_3[iter_17_0]

		table.insert(var_17_0, {
			name = var_17_4,
			value = var_17_5
		})
	end

	return var_17_0
end

function var_0_0.TransformUpgradeInfo(arg_18_0, arg_18_1)
	local var_18_0 = {}
	local var_18_1 = {
		arg_18_0:getConfig("attribute_1"),
		arg_18_0:getConfig("attribute_2")
	}
	local var_18_2 = arg_18_0:GetConfigAttributes()
	local var_18_3 = arg_18_1:GetConfigAttributes()
	local var_18_4 = arg_18_0:GetBaseAttributes()

	for iter_18_0 = 1, 2 do
		local var_18_5 = AttributeType.Type2Name(var_18_1[iter_18_0])
		local var_18_6 = var_18_3[iter_18_0] .. " + " .. var_18_4[iter_18_0]

		if var_18_2[iter_18_0] ~= var_18_3[iter_18_0] then
			var_18_6 = var_18_2[iter_18_0] .. "   >   " .. var_18_6
		end

		table.insert(var_18_0, {
			name = var_18_5,
			value = var_18_6
		})
	end

	return var_18_0
end

return var_0_0

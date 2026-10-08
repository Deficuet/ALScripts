local var_0_0 = class("EquipUpgradeLayer", import("..base.BaseUI"))

var_0_0.CHAT_DURATION_TIME = 0.3

function var_0_0.getUIName(arg_1_0)
	return "EquipUpgradeUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"shiptype",
		"ui/iconcolorful"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))

	return var_2_0
end

function var_0_0.init(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, {
		staticBlur = true
	})

	arg_3_0.mainPanel = arg_3_0._tf:Find("main")
	arg_3_0.finishPanel = arg_3_0._tf:Find("finish_panel")

	setActive(arg_3_0.mainPanel, true)
	setActive(arg_3_0.finishPanel, false)

	arg_3_0.equipmentList = arg_3_0.mainPanel:Find("panel/equipment_list")
	arg_3_0.equipmentContain = arg_3_0.equipmentList:Find("equipments")
	arg_3_0.equipmentTpl = arg_3_0:getTpl("equiptpl", arg_3_0.equipmentContain)

	setActive(arg_3_0.equipmentList, false)

	arg_3_0.equipmentPanel = arg_3_0.mainPanel:Find("panel/equipment_panel")
	arg_3_0.materialPanel = arg_3_0.mainPanel:Find("panel/material_panel")
	arg_3_0.startBtn = arg_3_0.materialPanel:Find("start_btn")
	arg_3_0.overLimit = arg_3_0.materialPanel:Find("materials/limit")

	setText(arg_3_0.overLimit:Find("text"), i18n("equipment_upgrade_overlimit"))

	arg_3_0.materialsContain = arg_3_0.materialPanel:Find("materials/materials")

	setText(arg_3_0.rtTogglesEmpty:Find("Text"), i18n("equip_enhancement_finish"))
	setText(arg_3_0.rtPanelTitle, i18n("equip_enhancement_required"))
	setText(arg_3_0.rtTitle, i18n("equip_enhancement_title"))
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0._tf:Find("bg"), function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_4_0, arg_4_0.btnCancel, function()
		arg_4_0:closeView()
	end, SFX_CANCEL)
	arg_4_0:updateAll()
end

function var_0_0.updateAll(arg_7_0)
	setActive(arg_7_0.equipmentList, arg_7_0.contextData.shipVO)

	if arg_7_0.contextData.shipVO then
		arg_7_0:displayEquipments()

		if arg_7_0.contextData.pos then
			triggerButton(arg_7_0.equipmentTFs[arg_7_0.contextData.pos])
		else
			triggerButton(arg_7_0.equipmentContain:GetChild(0))
		end
	else
		arg_7_0:updateEquipment()
		arg_7_0:updateMaterials()
	end
end

function var_0_0.displayEquipments(arg_8_0)
	arg_8_0.equipmentTFs = {}

	removeAllChildren(arg_8_0.equipmentContain)

	local var_8_0 = arg_8_0.contextData.shipVO

	for iter_8_0, iter_8_1 in ipairs(var_8_0.equipments) do
		if iter_8_1 then
			local var_8_1 = cloneTplTo(arg_8_0.equipmentTpl, arg_8_0.equipmentContain)

			updateEquipment(var_8_1, iter_8_1)

			local var_8_2 = var_8_1:Find("tip")

			setActive(var_8_2, false)

			if arg_8_0:isMaterialEnough(iter_8_1) and iter_8_1:getConfig("next") ~= 0 then
				setActive(var_8_2, true)
				blinkAni(var_8_2, 0.5)
			end

			onButton(arg_8_0, var_8_1, function()
				local var_9_0 = arg_8_0.contextData.pos

				if var_9_0 then
					setActive(arg_8_0.equipmentTFs[var_9_0]:Find("selected"), false)
					setActive(arg_8_0.equipmentTFs[var_9_0]:Find("tip"), arg_8_0:isMaterialEnough(var_8_0:getEquip(var_9_0)) and var_8_0:getEquip(var_9_0):getConfig("next") ~= 0)
				end

				arg_8_0.contextData.pos = iter_8_0
				arg_8_0.contextData.equipmentId = iter_8_1.id
				arg_8_0.contextData.equipmentVO = iter_8_1

				local var_9_1 = arg_8_0.contextData.pos

				setActive(arg_8_0.equipmentTFs[var_9_1]:Find("selected"), true)
				setActive(arg_8_0.equipmentTFs[var_9_1]:Find("tip"), false)
				arg_8_0:updateEquipment()
				arg_8_0:updateMaterials()
			end, SFX_PANEL)

			arg_8_0.equipmentTFs[iter_8_0] = var_8_1
		end
	end
end

function var_0_0.isMaterialEnough(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:getConfig("trans_use_item")

	if not var_10_0 then
		return false
	end

	for iter_10_0, iter_10_1 in ipairs(underscore.map(var_10_0, function(arg_11_0)
		local var_11_0, var_11_1 = unpack(arg_11_0)

		return Drop.New({
			type = DROP_TYPE_ITEM,
			id = var_11_0,
			count = var_11_1
		})
	end)) do
		if iter_10_1.count > iter_10_1:getOwnedCount() then
			return false
		end
	end

	return true
end

function var_0_0.updateEquipment(arg_12_0)
	local var_12_0 = arg_12_0.contextData.equipmentVO

	arg_12_0.contextData.equipmentId = var_12_0.id

	changeToScrollText(arg_12_0.equipmentPanel:Find("name_container"), var_12_0:getConfig("name"))
	setActive(findTF(arg_12_0.equipmentPanel, "unique"), var_12_0:isUnique())
	updateEquipment(arg_12_0.equipmentPanel:Find("equiptpl"), var_12_0)

	arg_12_0.nextEquips = {}

	while var_12_0:getConfig("next") > 0 do
		var_12_0 = var_12_0:MigrateTo(var_12_0:getConfig("next"))

		table.insert(arg_12_0.nextEquips, var_12_0)
	end

	if #arg_12_0.nextEquips == 0 then
		arg_12_0.toggleEquips = nil
	else
		arg_12_0.toggleEquips = {
			arg_12_0.nextEquips[1]
		}

		if #arg_12_0.nextEquips > 0 then
			local var_12_1 = arg_12_0.nextEquips[#arg_12_0.nextEquips]
			local var_12_2 = var_12_1:getConfig("level")
			local var_12_3 = switch(var_12_1:getConfig("level") - 1, {
				[13] = function()
					return {
						10,
						13
					}
				end,
				[11] = function()
					return {
						10,
						11
					}
				end,
				[10] = function()
					return {
						10
					}
				end,
				[7] = function()
					return {
						6,
						7
					}
				end,
				[6] = function()
					return {
						6
					}
				end,
				[3] = function()
					return {
						3
					}
				end
			}, function()
				return {}
			end)

			for iter_12_0, iter_12_1 in ipairs(var_12_3) do
				if #arg_12_0.nextEquips > var_12_2 - 1 - iter_12_1 then
					table.insert(arg_12_0.toggleEquips, arg_12_0.nextEquips[#arg_12_0.nextEquips - (var_12_2 - 1 - iter_12_1)])
				end
			end
		end
	end

	arg_12_0:updateToggles()
end

function var_0_0.updateToggles(arg_20_0)
	setActive(arg_20_0.rtToggles, tobool(arg_20_0.toggleEquips))
	setActive(arg_20_0.rtTogglesEmpty, not tobool(arg_20_0.toggleEquips))

	if arg_20_0.toggleEquips then
		UIItemList.StaticAlign(arg_20_0.rtToggles, arg_20_0.rtToggleTpl, #arg_20_0.toggleEquips, function(arg_21_0, arg_21_1, arg_21_2)
			arg_21_1 = arg_21_1 + 1

			if arg_21_0 == UIItemList.EventUpdate then
				local var_21_0 = arg_20_0.toggleEquips[arg_21_1]

				if arg_21_1 == 1 then
					setText(arg_21_2:Find("Text"), i18n("equip_enhancement_lv1"))
				else
					setText(arg_21_2:Find("Text"), i18n("equip_enhancement_lvx", var_21_0:getConfig("level") - 1))
				end

				onToggle(arg_20_0, arg_21_2, function(arg_22_0)
					if arg_22_0 then
						arg_20_0.targetEquip = var_21_0

						arg_20_0:updateMaterials()
					end
				end, SFX_PANEL)
			end
		end)
		triggerToggle(arg_20_0.rtToggles:GetChild(0), true)
	else
		arg_20_0.targetEquip = nil

		arg_20_0:updateMaterials()
	end
end

local function var_0_1(arg_23_0)
	local var_23_0 = _.detect(arg_23_0.sub, function(arg_24_0)
		return arg_24_0.type == AttributeType.Damage
	end)

	arg_23_0.sub = {
		var_23_0
	}
end

local function var_0_2(arg_25_0)
	local var_25_0 = _.detect(arg_25_0.sub, function(arg_26_0)
		return arg_26_0.type == AttributeType.Corrected
	end)

	arg_25_0.sub = {
		var_25_0
	}
end

function var_0_0.updateAttrs(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = arg_27_2:GetPropertiesInfo()

	for iter_27_0 = 1, #var_27_0.weapon.sub do
		var_0_1(var_27_0.weapon.sub[iter_27_0])
	end

	var_0_2(var_27_0.equipInfo)

	var_27_0.equipInfo.lock_open = true

	if arg_27_3 then
		local var_27_1 = arg_27_3:GetPropertiesInfo()

		Equipment.InsertAttrsUpgrade(var_27_0.attrs, var_27_1.attrs)

		local var_27_2 = arg_27_2:GetSkill()
		local var_27_3 = arg_27_3:GetSkill()

		if checkExist(var_27_2, {
			"name"
		}) ~= checkExist(var_27_3, {
			"name"
		}) then
			local var_27_4 = {
				lock_open = true,
				name = i18n("skill"),
				value = setColorStr(checkExist(var_27_2, {
					"name"
				}) or i18n("equip_info_25"), "#FFDE00FF"),
				sub = {
					{
						name = i18n("equip_info_26"),
						value = setColorStr(checkExist(var_27_3, {
							"name"
						}) or i18n("equip_info_25"), "#FFDE00FF")
					}
				}
			}

			table.insert(var_27_0.attrs, var_27_4)
		end

		if #var_27_1.weapon.sub > #var_27_0.weapon.sub then
			for iter_27_1 = #var_27_0.weapon.sub, #var_27_1.weapon.sub do
				table.insert(var_27_0.weapon.sub, {
					name = i18n("equip_info_25"),
					sub = {}
				})
			end
		end

		for iter_27_2 = #var_27_0.weapon.sub, 1, -1 do
			local var_27_5 = var_27_0.weapon.sub[iter_27_2]
			local var_27_6 = var_27_1.weapon.sub[iter_27_2]

			if var_27_6 then
				var_0_1(var_27_1.weapon.sub[iter_27_2])
			else
				var_27_6 = {
					name = i18n("equip_info_25"),
					sub = {}
				}
			end

			if var_27_5.name ~= var_27_6.name then
				var_27_5.sub = {
					{
						name = i18n("equip_info_27"),
						value = var_27_6.name
					}
				}
			else
				Equipment.InsertAttrsUpgrade(var_27_5.sub, var_27_6.sub)
			end

			if #var_27_5.sub == 0 then
				table.remove(var_27_0.weapon.sub, iter_27_2)

				if var_27_1.weapon.sub[iter_27_2] then
					table.remove(var_27_1.weapon.sub, iter_27_2)
				end
			end
		end

		var_0_2(var_27_1.equipInfo)
		Equipment.InsertAttrsUpgrade(var_27_0.equipInfo.sub, var_27_1.equipInfo.sub)
	end

	updateEquipUpgradeInfo(arg_27_1, var_27_0, arg_27_0.contextData.shipVO)
end

function var_0_0.updateMaterials(arg_28_0)
	local var_28_0 = tobool(arg_28_0.targetEquip)

	setActive(arg_28_0.materialsContain, var_28_0)
	setActive(arg_28_0.overLimit, not var_28_0)
	setButtonEnabled(arg_28_0.startBtn, var_28_0)
	setTextAlpha(arg_28_0.startBtn:Find("consume"), var_28_0 and 1 or 0.5)

	local var_28_1 = arg_28_0.contextData.equipmentVO

	arg_28_0:updateAttrs(arg_28_0.equipmentPanel:Find("view/content"), var_28_1, arg_28_0.targetEquip)
	setText(arg_28_0.rtLevel:Find("before"), i18n("equip_enhancement_lv"))
	setText(arg_28_0.rtLevel:Find("before/number"), var_28_1:getConfig("level") - 1)
	setText(arg_28_0.rtLevel:Find("after"), i18n("equip_enhancement_lv"))
	setText(arg_28_0.rtLevel:Find("after/number"), (arg_28_0.targetEquip or var_28_1):getConfig("level") - 1)
	setActive(arg_28_0.rtLevel:Find("before"), var_28_0)
	setActive(arg_28_0.rtLevel:Find("Image"), var_28_0)

	if not var_28_0 then
		setText(arg_28_0.startBtn:Find("consume"), 0)

		return
	end

	local var_28_2 = underscore.to_array(var_28_1:getConfig("trans_use_item") or {})
	local var_28_3 = defaultValue(var_28_1:getConfig("trans_use_gold"), 0)

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.nextEquips) do
		if iter_28_1 == arg_28_0.targetEquip then
			break
		else
			table.insertto(var_28_2, iter_28_1:getConfig("trans_use_item") or {})

			var_28_3 = var_28_3 + defaultValue(iter_28_1:getConfig("trans_use_gold"), 0)
		end
	end

	local var_28_4 = PlayerConst.MergeSameDrops(underscore.map(var_28_2, function(arg_29_0)
		local var_29_0, var_29_1 = unpack(arg_29_0)

		return Drop.New({
			type = DROP_TYPE_ITEM,
			id = var_29_0,
			count = var_29_1
		})
	end))
	local var_28_5 = true
	local var_28_6
	local var_28_7 = 0

	for iter_28_2 = 1, 5 do
		local var_28_8 = arg_28_0.materialsContain:GetChild(iter_28_2 - 1)
		local var_28_9 = var_28_4[iter_28_2]

		setActive(findTF(var_28_8, "off"), not var_28_9)
		setActive(findTF(var_28_8, "equiptpl"), var_28_9)

		if var_28_9 then
			local var_28_10 = findTF(var_28_8, "equiptpl")

			updateItem(var_28_10, var_28_9:getSubClass())
			onButton(arg_28_0, var_28_10, function()
				arg_28_0:emit(BaseUI.ON_DROP, var_28_9)
			end, SFX_PANEL)

			local var_28_11 = var_28_9:getOwnedCount()
			local var_28_12 = var_28_10:Find("icon_bg/count")

			if var_28_11 < var_28_9.count then
				setText(var_28_12, setColorStr(var_28_11, COLOR_RED) .. "/" .. var_28_9.count)

				var_28_5 = false
				var_28_6 = var_28_9.id
			else
				setText(var_28_12, var_28_11 .. "/" .. var_28_9.count)
			end

			setActive(var_28_12, true)
			onButton(arg_28_0, var_28_10:Find("click"), function()
				setActive(var_28_10:Find("click"), false)

				var_28_7 = var_28_7 - 1
			end, SFX_PANEL)

			local var_28_13 = var_28_9:getDropRarity() > 3

			setActive(var_28_10:Find("click"), var_28_13)

			var_28_7 = var_28_7 + (var_28_13 and 1 or 0)
		end
	end

	local var_28_14 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = PlayerConst.ResGold,
		count = var_28_3
	})
	local var_28_15 = var_28_14:getOwnedCount()

	if var_28_15 < var_28_14.count then
		setText(arg_28_0.startBtn:Find("consume"), setColorStr(var_28_3, COLOR_RED))
	else
		setText(arg_28_0.startBtn:Find("consume"), var_28_3)
	end

	onButton(arg_28_0, arg_28_0.startBtn, function()
		if not var_28_5 then
			if not ItemTipPanel.ShowItemTipbyID(var_28_6) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_shipUpgradeLayer2_noMaterail"))
			end

			return
		end

		if var_28_7 > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipment_upgrade_costcheck_error"))

			return
		end

		if var_28_15 < var_28_3 then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					var_28_3 - var_28_15,
					var_28_3
				}
			})

			return
		end

		arg_28_0:emit(EquipUpgradeMediator.EQUIPMENT_UPGRDE, arg_28_0.targetEquip, var_28_4, var_28_3)
	end, SFX_UI_DOCKYARD_REINFORCE)
end

function var_0_0.upgradeFinish(arg_33_0, arg_33_1, arg_33_2)
	setActive(arg_33_0.mainPanel, false)
	setActive(arg_33_0.finishPanel, true)
	onButton(arg_33_0, arg_33_0.finishPanel:Find("bg"), function()
		setActive(arg_33_0.mainPanel, true)
		setActive(arg_33_0.finishPanel, false)
	end, SFX_CANCEL)
	changeToScrollText(arg_33_0.finishPanel:Find("frame/equipment_panel/name_container"), arg_33_2:getConfig("name"))
	setActive(findTF(arg_33_0.finishPanel, "frame/equipment_panel/unique"), arg_33_2:isUnique())

	local var_33_0 = arg_33_0.finishPanel:Find("frame/equipment_panel/equiptpl")

	updateEquipment(var_33_0, arg_33_2)
	arg_33_0:updateAttrs(arg_33_0.finishPanel:Find("frame/equipment_panel/view/content"), arg_33_1, arg_33_2)
end

function var_0_0.willExit(arg_35_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_35_0._tf)
end

return var_0_0

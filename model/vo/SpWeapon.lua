local var_0_0 = class("SpWeapon", import(".BaseVO"))

var_0_0.type = DROP_TYPE_SPWEAPON
var_0_0.CONFIRM_OP_DISCARD = 0
var_0_0.CONFIRM_OP_EXCHANGE = 1

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.configId = arg_1_1.id
end

function var_0_0.CreateByNet(arg_2_0)
	if arg_2_0.template_id == 0 then
		return
	end

	local var_2_0 = {
		uid = arg_2_0.id,
		id = arg_2_0.template_id,
		attr1 = arg_2_0.attr_1,
		attr2 = arg_2_0.attr_2,
		attrTemp1 = arg_2_0.attr_temp_1,
		attrTemp2 = arg_2_0.attr_temp_2,
		pt = arg_2_0.pt
	}

	return var_0_0.New(var_2_0)
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.spweapon_data_statistics
end

function var_0_0.GetUID(arg_4_0)
	return arg_4_0.uid
end

function var_0_0.IsReal(arg_5_0)
	return tobool(arg_5_0:GetUID())
end

function var_0_0.GetConfigID(arg_6_0)
	return arg_6_0.configId
end

function var_0_0.GetOriginID(arg_7_0)
	return arg_7_0:getConfig("base") or arg_7_0:GetConfigID()
end

function var_0_0.IsImportant(arg_8_0)
	return arg_8_0:getConfig("important") == 2
end

function var_0_0.IsUnique(arg_9_0)
	return arg_9_0:getConfig("unique") ~= 0
end

function var_0_0.GetUniqueGroup(arg_10_0)
	return arg_10_0:getConfig("unique")
end

function var_0_0.GetUniqueShips(arg_11_0)
	local var_11_0 = arg_11_0:GetUniqueGroup()

	return getProxy(BayProxy):findShipsByGroup(var_11_0)
end

function var_0_0.GetType(arg_12_0)
	return arg_12_0:getConfig("type")
end

function var_0_0.GetName(arg_13_0)
	return arg_13_0:getConfig("name")
end

function var_0_0.GetLevel(arg_14_0)
	return arg_14_0:getConfig("level")
end

function var_0_0.GetTechTier(arg_15_0)
	return arg_15_0:getConfig("tech")
end

function var_0_0.GetIconPath(arg_16_0)
	return "SpWeapon/" .. arg_16_0:getConfig("icon")
end

function var_0_0.GetRarity(arg_17_0)
	return arg_17_0:getConfig("rarity")
end

function var_0_0.GetPt(arg_18_0)
	return arg_18_0:IsReal() and arg_18_0.pt or 0
end

function var_0_0.SetPt(arg_19_0, arg_19_1)
	assert(arg_19_1)

	arg_19_0.pt = arg_19_1 or 0
end

function var_0_0.GetEffect(arg_20_0)
	return arg_20_0:getConfig("effect_id")
end

function var_0_0.GetDisplayEffect(arg_21_0)
	return arg_21_0:getConfig("effect_id_display")
end

function var_0_0.GetUpgradableSkillIds(arg_22_0)
	return arg_22_0:getConfig("skill_upgrade")
end

function var_0_0.GetUpgradableHiddenSkillIds(arg_23_0)
	return arg_23_0:getConfig("hide_buff_upgrade")
end

function var_0_0.GetNextUpgradeID(arg_24_0)
	return arg_24_0:getConfig("next")
end

function var_0_0.GetPrevUpgradeID(arg_25_0)
	return arg_25_0:getConfig("prev")
end

function var_0_0.MigrateTo(arg_26_0, arg_26_1)
	local var_26_0 = Clone(arg_26_0)

	var_26_0.id = arg_26_1
	var_26_0.configId = arg_26_1
	var_26_0.pt = 0

	return var_26_0
end

function var_0_0.GetLabel(arg_27_0)
	return arg_27_0:getConfig("label")
end

function var_0_0.SetShipId(arg_28_0, arg_28_1)
	arg_28_0.shipId = arg_28_1
end

function var_0_0.GetShipId(arg_29_0)
	return arg_29_0.shipId
end

function var_0_0.GetSkill(arg_30_0)
	local var_30_0 = arg_30_0:GetEffect()

	return var_30_0 > 0 and getSkillConfig(var_30_0) or nil
end

function var_0_0.GetSkillInfo(arg_31_0)
	local var_31_0 = {
		lv = 1,
		skillId = arg_31_0:GetDisplayEffect()
	}

	var_31_0.unlock = var_31_0.skillId == arg_31_0:GetEffect()

	local var_31_1 = arg_31_0:GetShipId()

	if not var_31_1 or var_31_1 == 0 then
		var_31_0.descTrigger = true
	end

	return var_31_0
end

function var_0_0.GetUpgradableSkillInfo(arg_32_0)
	local var_32_0 = arg_32_0:GetShipId()
	local var_32_1 = {}
	local var_32_2
	local var_32_3

	if var_32_0 then
		var_32_2 = getProxy(BayProxy):getShipById(var_32_0)
		var_32_3 = arg_32_0:GetActiveUpgradableSkillList(var_32_2)
	end

	for iter_32_0, iter_32_1 in ipairs(arg_32_0:GetUpgradableSkillIds()) do
		local var_32_4 = iter_32_1[2]
		local var_32_5 = 1
		local var_32_6 = false

		if var_32_2 then
			for iter_32_2, iter_32_3 in ipairs(var_32_3) do
				if iter_32_3.mapSkillID == iter_32_1[2] and iter_32_3.originalSkillID == iter_32_1[1] then
					local var_32_7 = var_32_2.skills[iter_32_3.originalSkillID]

					var_32_5 = var_32_7 and var_32_7.level or 1
					var_32_6 = true

					break
				end
			end
		else
			var_32_6 = var_32_6 or iter_32_1[1] ~= 0
		end

		table.insert(var_32_1, {
			skillId = var_32_4,
			lv = var_32_5,
			unlock = var_32_6,
			descTrigger = not var_32_2 or nil
		})
	end

	return var_32_1
end

function var_0_0.GetActiveUpgradableSkillList(arg_33_0, arg_33_1)
	local var_33_0 = {}

	for iter_33_0, iter_33_1 in ipairs(arg_33_1:getSkillList()) do
		local var_33_1, var_33_2 = arg_33_0:RemapSkillId(iter_33_1)

		if var_33_2 then
			table.insert(var_33_0, {
				mapSkillID = var_33_1,
				originalSkillID = iter_33_1
			})
		end
	end

	local var_33_3 = pg.ship_data_template[arg_33_1.configId].hide_buff_list

	for iter_33_2, iter_33_3 in ipairs(var_33_3) do
		local var_33_4, var_33_5 = arg_33_0:RemapSkillId(iter_33_3)

		if var_33_5 then
			table.insert(var_33_0, {
				mapSkillID = var_33_4,
				originalSkillID = iter_33_3
			})
		end
	end

	return var_33_0
end

function var_0_0.RemapSkillId(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0:GetUpgradableSkillIds()) do
		if iter_34_1[1] == arg_34_1 then
			return iter_34_1[2], true
		end
	end

	return arg_34_1, false
end

function var_0_0.RemapHiddenSkillId(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in ipairs(arg_35_0:GetUpgradableHiddenSkillIds()) do
		if iter_35_1[1] == arg_35_1 then
			return iter_35_1[2], true
		end
	end

	return arg_35_1, false
end

function var_0_0.GetSkillGroup(arg_36_0)
	return {
		arg_36_0:GetSkillInfo(),
		(arg_36_0:GetUpgradableSkillInfo())
	}
end

function var_0_0.GetConfigAttributes(arg_37_0)
	return {
		arg_37_0:getConfig("value_1"),
		arg_37_0:getConfig("value_2")
	}
end

function var_0_0.GetAttributesRange(arg_38_0)
	return {
		arg_38_0:getConfig("value_1_random"),
		arg_38_0:getConfig("value_2_random")
	}
end

function var_0_0.GetAttributes(arg_39_0)
	local var_39_0 = arg_39_0:GetConfigAttributes()

	if arg_39_0:IsReal() then
		var_39_0[1] = var_39_0[1] + arg_39_0.attr1
		var_39_0[2] = var_39_0[2] + arg_39_0.attr2
	end

	return var_39_0
end

function var_0_0.GetBaseAttributes(arg_40_0)
	return {
		arg_40_0.attr1 or 0,
		arg_40_0.attr2 or 0
	}
end

function var_0_0.SetBaseAttributes(arg_41_0, arg_41_1)
	arg_41_0.attr1 = arg_41_1[1]
	arg_41_0.attr2 = arg_41_1[2]
end

function var_0_0.GetAttributeOptions(arg_42_0)
	return {
		arg_42_0.attrTemp1 or 0,
		arg_42_0.attrTemp2 or 0
	}
end

function var_0_0.SetAttributeOptions(arg_43_0, arg_43_1)
	arg_43_0.attrTemp1 = arg_43_1[1]
	arg_43_0.attrTemp2 = arg_43_1[2]
end

function var_0_0.GetPropertiesInfo(arg_44_0)
	local var_44_0 = {
		attrs = {}
	}
	local var_44_1 = arg_44_0:GetAttributes()

	table.insert(var_44_0.attrs, {
		type = arg_44_0:getConfig("attribute_1"),
		value = var_44_1[1]
	})
	table.insert(var_44_0.attrs, {
		type = arg_44_0:getConfig("attribute_2"),
		value = var_44_1[2]
	})

	var_44_0.weapon = {
		sub = {}
	}
	var_44_0.equipInfo = {
		sub = {}
	}

	local var_44_2 = arg_44_0:GetWearableShipTypes()

	var_44_0.part = {
		var_44_2,
		var_44_2
	}

	return var_44_0
end

function var_0_0.GetWearableShipTypes(arg_45_0)
	local var_45_0 = arg_45_0:getConfig("usability")

	if var_45_0 and #var_45_0 > 0 then
		return var_45_0
	end

	return pg.spweapon_type[arg_45_0:GetType()].ship_type
end

function var_0_0.IsCraftable(arg_46_0)
	return not arg_46_0:IsUnCraftable() and arg_46_0:GetUpgradeConfig().create_use_gold > 0
end

function var_0_0.GetUpgradeConfig(arg_47_0)
	local var_47_0 = arg_47_0:getConfig("upgrade_id")

	return pg.spweapon_upgrade[var_47_0]
end

function var_0_0.IsUnCraftable(arg_48_0)
	return arg_48_0:getConfig("uncraftable") == 1
end

function var_0_0.CalculateHistoryPt(arg_49_0, arg_49_1)
	local var_49_0 = _.reduce(arg_49_0, 0, function(arg_50_0, arg_50_1)
		return arg_50_0 + Item.getConfigData(arg_50_1.id).usage_arg[1] * arg_50_1.count
	end)

	return (_.reduce(arg_49_1, var_49_0, function(arg_51_0, arg_51_1)
		return arg_51_0 + (0 + arg_51_1:GetUpgradeConfig().upgrade_supply_pt)
	end))
end

function var_0_0.IsMatchKey(arg_52_0, arg_52_1)
	local var_52_0 = {
		arg_52_0:getConfig("name")
	}

	return EquipmentTools.IsMatchKey(var_52_0, arg_52_1)
end

return var_0_0

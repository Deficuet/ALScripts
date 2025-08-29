local var_0_0 = class("IslandShip", import("model.vo.BaseVO"))

var_0_0.STATE_NORMAL = 0
var_0_0.STATE_DELEGATION = 1
var_0_0.STATE_TECHNOLOGY = 2
var_0_0.STATE_RESTAURANT = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id or 0
	arg_1_0.configId = arg_1_0.id
	arg_1_0.exp = arg_1_1.exp or 0
	arg_1_0.level = arg_1_1.lv or 1
	arg_1_0.breakLevel = arg_1_1.break_lv or 0
	arg_1_0.energy = arg_1_1.power or 0
	arg_1_0.recorverTime = arg_1_1.recover_time or 0
	arg_1_0.unlockExtraAttLimit = (arg_1_1.up_limit_state or 0) == 1
	arg_1_0.extraAttrs = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.extra_attr_list or {}) do
		local var_1_0 = IslandShipAttr.GetAtrrName(iter_1_1.id)

		arg_1_0.extraAttrs[var_1_0] = iter_1_1.value
	end

	arg_1_0.skill = IslandShipSkill.New({
		id = arg_1_0:getConfig("skill_id"),
		level = arg_1_1.skill_lv or 0
	})
	arg_1_0.maxEnerey = arg_1_0:getConfig("power")

	arg_1_0:InitMaxEnergy()

	arg_1_0.maxLevel = 1

	arg_1_0:InitMaxLevel()

	arg_1_0.attrs = {}

	arg_1_0:InitAttrs()

	arg_1_0.maxExtraAttrs = {}

	arg_1_0:InitMaxExtraAttrs()
	arg_1_0:InitSkill()

	arg_1_0.status = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.buff_list or {}) do
		local var_1_1 = IslandShipStatus.New(iter_1_3)

		table.insert(arg_1_0.status, var_1_1)
	end

	arg_1_0:InitEnergyRecoverTime()

	local var_1_2 = arg_1_1.work_place or {}

	arg_1_0.state = var_1_2.type or 0
	arg_1_0.stateId = var_1_2.place or 0
	arg_1_0.currentDressTypeDic = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.currentDressTypeDic or {}) do
		arg_1_0.currentDressTypeDic[iter_1_4] = iter_1_5
	end

	arg_1_0.cur_skin_id = arg_1_1.cur_skin_id
	arg_1_0.hasOwnDressList = {}

	for iter_1_6, iter_1_7 in ipairs(arg_1_1.dress_list or {}) do
		table.insert(arg_1_0.hasOwnDressList, IslandShipDressItem.New(iter_1_7))
	end
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_chara_template
end

function var_0_0.GetLevel(arg_3_0)
	return arg_3_0.level or 1
end

function var_0_0.GetExp(arg_4_0)
	return arg_4_0.exp or 0
end

function var_0_0.AddExp(arg_5_0, arg_5_1)
	if arg_5_0:IsMaxLevel() then
		return
	end

	arg_5_0.exp = arg_5_0.exp + arg_5_1

	while arg_5_0:CanUpgrade() do
		arg_5_0.exp = arg_5_0.exp - arg_5_0:GetTargetExp()
		arg_5_0.level = arg_5_0.level + 1

		arg_5_0:InitAttrs()
	end

	if arg_5_0:IsMaxLevel() then
		arg_5_0.exp = 0
	end
end

function var_0_0.CanUpgrade(arg_6_0)
	return not arg_6_0:IsMaxLevel() and arg_6_0.exp >= arg_6_0:GetTargetExp()
end

function var_0_0.GetTargetExp(arg_7_0)
	if arg_7_0:IsMaxLevel() then
		return 0
	end

	return pg.island_chara_level[arg_7_0.level].level_up_exp
end

function var_0_0.IsMaxLevel(arg_8_0)
	return arg_8_0.level >= arg_8_0.maxLevel
end

function var_0_0.InitMaxLevel(arg_9_0)
	arg_9_0.maxLevel = arg_9_0:GetBreakLevel() * arg_9_0:GetBreakPhaseValue()
end

function var_0_0.GetMaxLevel(arg_10_0)
	return arg_10_0.maxLevel
end

function var_0_0.GetEnergy(arg_11_0)
	return arg_11_0.energy
end

function var_0_0.AddEnergy(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.energy + arg_12_1
	local var_12_1 = arg_12_0:GetMaxEnergy()

	if var_12_1 < var_12_0 then
		arg_12_0.energy = var_12_1
	else
		arg_12_0.energy = var_12_0
	end
end

function var_0_0.UpdateEnergy(arg_13_0, arg_13_1)
	arg_13_0.energy = arg_13_1
end

function var_0_0.UpdateEnergyBeginRecoverTime(arg_14_0, arg_14_1)
	arg_14_0.recorverTime = arg_14_1
end

function var_0_0.GetMaxEnergy(arg_15_0)
	return arg_15_0.maxEnerey
end

function var_0_0.InitMaxEnergy(arg_16_0)
	local var_16_0 = arg_16_0.maxEnerey
	local var_16_1, var_16_2 = arg_16_0:GetBreakLevel(), arg_16_0:getConfig("upgrade_power")

	for iter_16_0 = 1, var_16_1 do
		arg_16_0.maxEnerey = arg_16_0.maxEnerey + (var_16_2[iter_16_0] or 0)
	end

	if arg_16_0.maxEnerey - var_16_0 > 0 then
		local var_16_3 = var_16_0 - arg_16_0.energy

		arg_16_0.energy = arg_16_0.maxEnerey - var_16_3
	end
end

function var_0_0.InitEnergyRecoverTime(arg_17_0)
	arg_17_0.recoverSpeed = arg_17_0:getConfig("power_recover")
end

function var_0_0.GetCurrentEnergy(arg_18_0)
	if arg_18_0:GetState() ~= var_0_0.STATE_NORMAL then
		return math.min(arg_18_0.maxEnerey, arg_18_0.energy)
	end

	local var_18_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_18_1 = math.floor(arg_18_0.energy + (var_18_0 - arg_18_0.recorverTime) / arg_18_0.recoverSpeed)
	local var_18_2 = arg_18_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_18_2 == 0 then
		return math.min(arg_18_0.maxEnerey, var_18_1)
	end

	local function var_18_3(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
		local var_19_0 = math.max(arg_19_0, arg_19_2)
		local var_19_1 = math.min(arg_19_1, arg_19_3)

		if var_19_0 < var_19_1 then
			return var_19_1 - var_19_0
		else
			return 0
		end
	end

	local var_18_4 = var_18_2:GetBuffEffect()[1] * 0.01
	local var_18_5 = var_18_3(arg_18_0.recorverTime, var_18_0, var_18_2:GetStartTime(), var_18_2:GetEndTime())
	local var_18_6 = var_18_1 + math.floor(var_18_5 / arg_18_0.recoverSpeed * var_18_4)

	return math.min(arg_18_0.maxEnerey, var_18_6)
end

function var_0_0.GetCurrentEnergyDecimal(arg_20_0)
	local var_20_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_20_1 = arg_20_0.energy + (var_20_0 - arg_20_0.recorverTime) / arg_20_0.recoverSpeed
	local var_20_2 = arg_20_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_20_2 == 0 then
		return math.min(arg_20_0.maxEnerey, var_20_1)
	end

	local function var_20_3(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
		local var_21_0 = math.max(arg_21_0, arg_21_2)
		local var_21_1 = math.min(arg_21_1, arg_21_3)

		if var_21_0 < var_21_1 then
			return var_21_1 - var_21_0
		else
			return 0
		end
	end

	local var_20_4 = var_20_2:GetBuffEffect()[1] * 0.01
	local var_20_5 = var_20_1 + var_20_3(arg_20_0.recorverTime, var_20_0, var_20_2:GetStartTime(), var_20_2:GetEndTime()) / arg_20_0.recoverSpeed * var_20_4

	return math.min(arg_20_0.maxEnerey, var_20_5)
end

function var_0_0.GetEnergyMaxTime(arg_22_0)
	local var_22_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_22_1 = arg_22_0.maxEnerey - arg_22_0:GetCurrentEnergyDecimal()
	local var_22_2 = arg_22_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_22_2 == 0 then
		return var_22_0 + var_22_1 * arg_22_0.recoverSpeed
	end

	if var_22_0 <= var_22_2:GetEndTime() then
		local var_22_3 = var_22_2:GetEndTime() - var_22_0
		local var_22_4 = var_22_2:GetBuffEffect()[1] * 0.01
		local var_22_5 = arg_22_0.recoverSpeed / (1 + var_22_4)
		local var_22_6 = var_22_5 * var_22_3

		if var_22_1 <= var_22_6 then
			return var_22_0 + var_22_1 / var_22_5
		end

		return var_22_0 + (var_22_1 - var_22_6) / arg_22_0.recoverSpeed + var_22_1 / var_22_5
	end

	return var_22_0 + var_22_1 * arg_22_0.recoverSpeed
end

function var_0_0.AnySkillCanUpgrade(arg_23_0)
	return arg_23_0:CanUpgradeSkill()
end

function var_0_0.HasStatus(arg_24_0)
	return table.getCount(arg_24_0:GetVaildStatus()) > 0
end

function var_0_0.GetPower(arg_25_0)
	local var_25_0 = arg_25_0:GetLevel() * 1000000
	local var_25_1 = 0

	for iter_25_0, iter_25_1 in pairs(arg_25_0:GetAttrs()) do
		var_25_1 = var_25_1 + iter_25_1
	end

	return var_25_0 + var_25_1
end

function var_0_0.GetName(arg_26_0)
	return arg_26_0:getConfig("name")
end

function var_0_0.GetEnName(arg_27_0)
	local var_27_0 = arg_27_0:GetShipGroup()

	return ShipGroup.getDefaultShipConfig(var_27_0).english_name
end

function var_0_0.StaticGetName(arg_28_0)
	return pg.island_chara_template[arg_28_0].name
end

function var_0_0.GetPrefab(arg_29_0)
	return var_0_0.StaticGetPrefab(arg_29_0.configId)
end

function var_0_0.GetModelUnit(arg_30_0)
	local var_30_0 = arg_30_0:getConfig("unit_id")

	if arg_30_0.cur_skin_id and arg_30_0.cur_skin_id ~= 0 then
		var_30_0 = pg.island_skin_template[arg_30_0.cur_skin_id].model

		local var_30_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetCurrentSkinColorByShipId(arg_30_0.id, arg_30_0.cur_skin_id)

		if var_30_1 ~= 0 then
			var_30_0 = pg.island_skin_colordiff_template[var_30_1].model
		end
	end

	return var_30_0
end

function var_0_0.GetModel(arg_31_0)
	local var_31_0 = arg_31_0:GetModelUnit()
	local var_31_1 = pg.island_unit_character[var_31_0]

	return {
		model = var_31_1.model,
		animator = var_31_1.animator
	}
end

function var_0_0.GetModelBySkinAndColorId(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0:getConfig("unit_id")

	if arg_32_1 and arg_32_1 ~= 0 then
		var_32_0 = pg.island_skin_template[arg_32_1].model

		if arg_32_2 ~= 0 then
			var_32_0 = pg.island_skin_colordiff_template[arg_32_2].model
		end
	end

	return var_32_0
end

function var_0_0.ChangeSkinId(arg_33_0, arg_33_1)
	if arg_33_0.cur_skin_id ~= arg_33_1 then
		arg_33_0.cur_skin_id = arg_33_1
	end
end

function var_0_0.GetCurSkinId(arg_34_0)
	return arg_34_0.cur_skin_id or 0
end

function var_0_0.GetNewShipWord(arg_35_0)
	return ""
end

function var_0_0.GetShipGroup(arg_36_0)
	return arg_36_0.configId
end

function var_0_0.StaticGetPrefab(arg_37_0)
	if arg_37_0 == IslandCharacterAgency.NPC_CONFIG_ID then
		return "jiujiu"
	end

	local var_37_0 = arg_37_0
	local var_37_1 = ShipGroup.getDefaultShipConfig(var_37_0).skin_id

	return pg.ship_skin_template[var_37_1].prefab
end

function var_0_0.UpdateState(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0.state = arg_38_1
	arg_38_0.stateId = arg_38_2
end

function var_0_0.GetState(arg_39_0)
	if pg.TimeMgr.GetInstance():GetServerTime() > arg_39_0.recorverTime then
		return var_0_0.STATE_NORMAL
	end

	return arg_39_0.state
end

function var_0_0.GetStateId(arg_40_0)
	return arg_40_0.stateId
end

function var_0_0.GetStatePlaceName(arg_41_0)
	return switch(arg_41_0.state, {
		[var_0_0.STATE_DELEGATION] = function()
			return pg.island_production_place[arg_41_0.stateId].name
		end,
		[var_0_0.STATE_TECHNOLOGY] = function()
			return pg.island_production_place[arg_41_0.stateId].name
		end,
		[var_0_0.STATE_RESTAURANT] = function()
			return pg.island_manage_restaurant[arg_41_0.stateId].name
		end
	}, function()
		return ""
	end)
end

function var_0_0.GetBreakLevel(arg_46_0)
	return arg_46_0.breakLevel
end

function var_0_0.GetBreakMaxLevel(arg_47_0)
	return arg_47_0:getConfig("upgrade_level")[2] + 1
end

function var_0_0.GetBreakPhaseValue(arg_48_0)
	return arg_48_0:getConfig("upgrade_level")[1]
end

function var_0_0.IsMaxBreakLevel(arg_49_0)
	return arg_49_0:GetBreakMaxLevel() <= arg_49_0:GetBreakLevel()
end

function var_0_0.CanBreakOut(arg_50_0)
	if arg_50_0:IsMaxBreakLevel() then
		return false
	end

	local var_50_0 = arg_50_0:GetBreakPhaseValue()

	return arg_50_0.level % var_50_0 == 0
end

function var_0_0.UpgradeBreakOut(arg_51_0)
	arg_51_0.breakLevel = arg_51_0.breakLevel + 1

	arg_51_0:InitMaxLevel()

	local var_51_0 = arg_51_0:GetMaxEnergy()
	local var_51_1 = var_51_0 - arg_51_0:GetEnergy()

	arg_51_0:InitMaxEnergy()

	if var_51_0 < arg_51_0:GetMaxEnergy() then
		arg_51_0.energy = arg_51_0.energy + var_51_1
	end

	arg_51_0:InitSkill()
end

function var_0_0.GetBreakoutMatrials(arg_52_0)
	local var_52_0 = arg_52_0:getConfig("upgrade_material")
	local var_52_1 = {}
	local var_52_2 = var_52_0[arg_52_0:GetBreakLevel()] or {}

	for iter_52_0, iter_52_1 in ipairs(var_52_2) do
		table.insert(var_52_1, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_52_1[1],
			count = iter_52_1[2]
		})
	end

	return var_52_1
end

function var_0_0.InitAttrs(arg_53_0)
	local var_53_0 = arg_53_0:GetBreakPhaseValue()
	local var_53_1 = math.floor(arg_53_0.level / var_53_0)
	local var_53_2 = arg_53_0.level % var_53_0
	local var_53_3 = arg_53_0:getConfig("base_att")

	for iter_53_0, iter_53_1 in ipairs(var_53_3) do
		local var_53_4 = iter_53_1[1]
		local var_53_5 = iter_53_1[2]
		local var_53_6 = IslandShipAttr.GetAtrrName(var_53_4)

		arg_53_0.attrs[var_53_6] = var_53_5
	end

	local var_53_7 = arg_53_0:getConfig("growth_att")

	for iter_53_2, iter_53_3 in ipairs(var_53_7) do
		local var_53_8 = iter_53_3[1]
		local var_53_9 = iter_53_3[2]
		local var_53_10 = IslandShipAttr.GetAtrrName(var_53_8)
		local var_53_11 = 0

		for iter_53_4 = 1, var_53_1 do
			var_53_11 = var_53_11 + var_53_9[iter_53_4] * var_53_0
		end

		if var_53_1 < #var_53_9 then
			var_53_11 = var_53_11 + var_53_9[var_53_1 + 1] * var_53_2
		end

		arg_53_0.attrs[var_53_10] = arg_53_0.attrs[var_53_10] + var_53_11
	end

	for iter_53_5, iter_53_6 in pairs(arg_53_0.extraAttrs) do
		arg_53_0.attrs[iter_53_5] = arg_53_0.attrs[iter_53_5] + iter_53_6
	end
end

function var_0_0.GetGrowthAtt(arg_54_0)
	local var_54_0 = {}
	local var_54_1 = arg_54_0:getConfig("growth_att")

	for iter_54_0, iter_54_1 in ipairs(var_54_1) do
		local var_54_2 = iter_54_1[1]
		local var_54_3 = iter_54_1[2]

		var_54_0[IslandShipAttr.GetAtrrName(var_54_2)] = var_54_3[arg_54_0:GetBreakLevel()] or 0
	end

	return var_54_0
end

function var_0_0.GetAttrs(arg_55_0)
	return arg_55_0.attrs
end

function var_0_0.GetAttr(arg_56_0, arg_56_1)
	return arg_56_0.attrs[arg_56_1] or 0
end

function var_0_0.GetAttrGradeCnt(arg_57_0, arg_57_1)
	local var_57_0 = 0

	for iter_57_0, iter_57_1 in pairs(arg_57_0.attrs) do
		if arg_57_1 >= arg_57_0:GetAttrGrade(iter_57_0) then
			var_57_0 = var_57_0 + 1
		end
	end

	return var_57_0
end

function var_0_0.GetAttrGradeByValue(arg_58_0, arg_58_1)
	local var_58_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_58_0, iter_58_1 in ipairs(pg.island_chara_att.all) do
		local var_58_1 = pg.island_chara_att[iter_58_1]
		local var_58_2 = var_58_1.range[1]
		local var_58_3 = var_58_1.range[2]

		if var_58_2 <= arg_58_1 and arg_58_1 <= var_58_3 then
			var_58_0 = iter_58_1

			break
		end
	end

	return var_58_0
end

function var_0_0.GetAttrGrade(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0:GetAttr(arg_59_1)

	return arg_59_0:GetAttrGradeByValue(var_59_0)
end

function var_0_0.GetAttrGradeName(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0:GetAttrGrade(arg_60_1)

	return pg.island_chara_att[var_60_0].name
end

function var_0_0.GetAttrGradeEffect(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_0:GetAttrGrade(arg_61_1)

	return pg.island_chara_att[var_61_0].effect
end

function var_0_0.SetUnlockExtraAttLimit(arg_62_0)
	arg_62_0.unlockExtraAttLimit = true

	arg_62_0:InitMaxExtraAttrs()
end

function var_0_0.IsUnlockExtraAttLimit(arg_63_0)
	return arg_63_0.unlockExtraAttLimit
end

function var_0_0.InitMaxExtraAttrs(arg_64_0)
	for iter_64_0, iter_64_1 in ipairs(arg_64_0:getConfig("extra_max")) do
		local var_64_0 = iter_64_1[1]
		local var_64_1 = iter_64_1[2][1]
		local var_64_2 = iter_64_1[2][2]
		local var_64_3 = arg_64_0.unlockExtraAttLimit and var_64_2 or var_64_1
		local var_64_4 = IslandShipAttr.GetAtrrName(var_64_0)

		arg_64_0.maxExtraAttrs[var_64_4] = var_64_3
	end
end

function var_0_0.GetExtraAttrLimit(arg_65_0, arg_65_1)
	return arg_65_0.maxExtraAttrs[arg_65_1] or 0
end

function var_0_0.GetExtraAttrValue(arg_66_0, arg_66_1)
	return arg_66_0.extraAttrs[arg_66_1] or 0
end

function var_0_0.ExistPotency(arg_67_0)
	for iter_67_0, iter_67_1 in pairs(IslandShipAttr.ATTRS) do
		if arg_67_0:GetExtraAttrLimit(iter_67_1) > arg_67_0:GetExtraAttrValue(iter_67_1) then
			return true
		end
	end

	return false
end

function var_0_0.AddExtraAttr(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = arg_68_0:GetExtraAttrLimit(arg_68_1)
	local var_68_1 = arg_68_0:GetExtraAttrValue(arg_68_1) + arg_68_2

	arg_68_0.extraAttrs[arg_68_1] = math.min(var_68_1, var_68_0)

	arg_68_0:InitAttrs()
end

function var_0_0.GetUpgradeExtraAttrConsume(arg_69_0, arg_69_1)
	local var_69_0 = table.indexof(IslandShipAttr.ATTRS, arg_69_1)

	if var_69_0 <= 0 then
		return {}
	end

	local var_69_1 = arg_69_0:getConfig("att_item")
	local var_69_2 = {}

	for iter_69_0, iter_69_1 in ipairs(var_69_1[var_69_0] or {}) do
		table.insert(var_69_2, {
			count = 1,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_69_1
		})
	end

	return var_69_2
end

function var_0_0.GetExtraAttrLimitUnlockConsume(arg_70_0)
	return {
		{
			id = 100000,
			count = 1,
			type = DROP_TYPE_ISLAND_ITEM
		}
	}
end

function var_0_0.InitSkill(arg_71_0)
	if arg_71_0:getConfig("skill_unlock") <= arg_71_0:GetBreakLevel() then
		arg_71_0.skill:Unlock()
	end
end

function var_0_0.GetSkillUnlockLevel(arg_72_0)
	return arg_72_0:getConfig("skill_unlock")
end

function var_0_0.GetSkill(arg_73_0)
	return arg_73_0.skill
end

function var_0_0.CanUpgradeSkill(arg_74_0)
	if not arg_74_0.skill:IsUnlock() then
		return false
	end

	if arg_74_0.skill:IsMaxLevel() then
		return false
	end

	local var_74_0 = arg_74_0.skill:GetUpgradeMaterial()
	local var_74_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	return _.all(var_74_0, function(arg_75_0)
		return var_74_1:GetOwnCount(arg_75_0.id) >= arg_75_0.count
	end)
end

function var_0_0.GetVaildStatusByGroup(arg_76_0, arg_76_1)
	return _.select(arg_76_0.status, function(arg_77_0)
		return not arg_77_0:IsExpiration() and arg_77_0:GetGroup() == arg_76_1
	end)
end

function var_0_0.GetVaildStatus(arg_78_0)
	return _.select(arg_78_0.status, function(arg_79_0)
		return not arg_79_0:IsExpiration()
	end)
end

function var_0_0.GetVaildStatusByType(arg_80_0, arg_80_1)
	return _.select(arg_80_0.status, function(arg_81_0)
		return not arg_81_0:IsExpiration() and arg_81_0:GetBuffType() == arg_80_1
	end)
end

function var_0_0.GetDisplayStatus(arg_82_0)
	return _.select(arg_82_0.status, function(arg_83_0)
		return not arg_83_0:IsExpiration() and arg_83_0:CanDisplay()
	end)
end

function var_0_0.GetFavoriteGift(arg_84_0)
	return arg_84_0:getConfig("gift_id")
end

function var_0_0.IsFavoriteGift(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0:GetFavoriteGift()

	return _.any(var_85_0, function(arg_86_0)
		return arg_86_0 == arg_85_1
	end)
end

function var_0_0.AddStatus(arg_87_0, arg_87_1)
	local var_87_0 = _.detect(arg_87_0.status, function(arg_88_0)
		return arg_88_0.id == arg_87_1.id
	end)

	if var_87_0 then
		table.removebyvalue(arg_87_0.status, var_87_0)
	end

	local var_87_1 = arg_87_0:GetVaildStatus()
	local var_87_2 = arg_87_1:GetDuelTypeList()
	local var_87_3 = _.detect(var_87_1, function(arg_89_0)
		return table.contains(var_87_2, arg_89_0:GetGroup())
	end)

	if var_87_3 then
		table.removebyvalue(arg_87_0.status, var_87_3)
	end

	local var_87_4 = arg_87_1:GetDuelIdList()
	local var_87_5 = _.detect(var_87_1, function(arg_90_0)
		return table.contains(var_87_4, arg_90_0.id)
	end)

	if var_87_5 then
		table.removebyvalue(arg_87_0.status, var_87_5)
	end

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandShipAddBuff(arg_87_0.id, arg_87_1.id))
	table.insert(arg_87_0.status, arg_87_1)
end

function var_0_0.CheckHasOwnDressByDressId(arg_91_0, arg_91_1)
	return arg_91_0.hasOwnDressList[arg_91_1] or false
end

function var_0_0.GetDressUpData(arg_92_0)
	return arg_92_0.currentDressTypeDic
end

function var_0_0.GetDressByType(arg_93_0, arg_93_1)
	return arg_93_0.currentDressTypeDic[arg_93_1]
end

function var_0_0.GetAllOwnDressList(arg_94_0)
	local var_94_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_94_1 = {}

	for iter_94_0, iter_94_1 in pairs(var_94_0:GetAllOwnDressDic() or {}) do
		if iter_94_1.num > 0 and not arg_94_0:CheckHasOwnDressByDressId(iter_94_0) then
			table.insert(var_94_1, iter_94_0)
		end
	end

	return var_94_1
end

function var_0_0.GetALLHasSendToShipDress(arg_95_0)
	local var_95_0 = {}

	for iter_95_0, iter_95_1 in ipairs(arg_95_0.hasOwnDressList or {}) do
		table.insert(var_95_0, iter_95_1.id)
	end

	return var_95_0
end

function var_0_0.GetHasSendToShipDressByType(arg_96_0, arg_96_1)
	local var_96_0 = {}

	for iter_96_0, iter_96_1 in pairs(arg_96_0.hasOwnDressList or {}) do
		if pg.island_dress_template[iter_96_1.id].type == arg_96_1 then
			table.insert(var_96_0, iter_96_1.id)
		end
	end

	return var_96_0
end

function var_0_0.SetDressIdOwned(arg_97_0, arg_97_1)
	table.insert(arg_97_0.hasOwnDressList, IslandShipDressItem.New({
		color = 0,
		id = arg_97_1,
		color_list = {}
	}))
end

function var_0_0.ChangeDressColor(arg_98_0, arg_98_1)
	for iter_98_0, iter_98_1 in ipairs(arg_98_0.hasOwnDressList) do
		if iter_98_1.id == arg_98_1.id then
			iter_98_1:ChangeColor(arg_98_1.color)

			return
		end
	end
end

return var_0_0

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
	arg_1_0.cur_skin_id = arg_1_1.cur_skin_id
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_chara_template
end

function var_0_0.GetCantFollowTaskIdList(arg_3_0)
	return arg_3_0:getConfig("in_task")
end

function var_0_0.GetLevel(arg_4_0)
	return arg_4_0.level or 1
end

function var_0_0.GetExp(arg_5_0)
	return arg_5_0.exp or 0
end

function var_0_0.AddExp(arg_6_0, arg_6_1)
	if arg_6_0:IsMaxLevel() then
		return
	end

	arg_6_0.exp = arg_6_0.exp + arg_6_1

	while arg_6_0:CanUpgrade() do
		arg_6_0.exp = arg_6_0.exp - arg_6_0:GetTargetExp()
		arg_6_0.level = arg_6_0.level + 1

		arg_6_0:InitAttrs()
	end

	if arg_6_0:IsMaxLevel() then
		arg_6_0.exp = 0
	end
end

function var_0_0.CanUpgrade(arg_7_0)
	return not arg_7_0:IsMaxLevel() and arg_7_0.exp >= arg_7_0:GetTargetExp()
end

function var_0_0.GetTargetExp(arg_8_0)
	if arg_8_0:IsMaxLevel() then
		return 0
	end

	return pg.island_chara_level[arg_8_0.level].level_up_exp
end

function var_0_0.IsMaxLevel(arg_9_0)
	return arg_9_0.level >= arg_9_0.maxLevel
end

function var_0_0.InitMaxLevel(arg_10_0)
	arg_10_0.maxLevel = arg_10_0:GetBreakLevel() * arg_10_0:GetBreakPhaseValue()
end

function var_0_0.GetMaxLevel(arg_11_0)
	return arg_11_0.maxLevel
end

function var_0_0.GetEnergy(arg_12_0)
	return arg_12_0.energy
end

function var_0_0.AddEnergy(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.energy + arg_13_1
	local var_13_1 = arg_13_0:GetMaxEnergy()

	if var_13_1 < var_13_0 then
		arg_13_0.energy = var_13_1
	else
		arg_13_0.energy = var_13_0
	end
end

function var_0_0.UpdateEnergy(arg_14_0, arg_14_1)
	arg_14_0.energy = arg_14_1
end

function var_0_0.UpdateEnergyBeginRecoverTime(arg_15_0, arg_15_1)
	arg_15_0.recorverTime = arg_15_1
end

function var_0_0.GetMaxEnergy(arg_16_0)
	return arg_16_0.maxEnerey
end

function var_0_0.InitMaxEnergy(arg_17_0)
	local var_17_0 = arg_17_0.maxEnerey
	local var_17_1, var_17_2 = arg_17_0:GetBreakLevel(), arg_17_0:getConfig("upgrade_power")

	for iter_17_0 = 1, var_17_1 do
		arg_17_0.maxEnerey = arg_17_0.maxEnerey + (var_17_2[iter_17_0] or 0)
	end

	if arg_17_0.maxEnerey - var_17_0 > 0 then
		local var_17_3 = var_17_0 - arg_17_0.energy

		arg_17_0.energy = arg_17_0.maxEnerey - var_17_3
	end
end

function var_0_0.InitEnergyRecoverTime(arg_18_0)
	arg_18_0.recoverSpeed = arg_18_0:getConfig("power_recover")
end

function var_0_0.GetCurrentEnergy(arg_19_0)
	if arg_19_0:GetState() ~= var_0_0.STATE_NORMAL then
		return math.min(arg_19_0.maxEnerey, arg_19_0.energy)
	end

	local var_19_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_19_1 = math.floor(arg_19_0.energy + (var_19_0 - arg_19_0.recorverTime) / arg_19_0.recoverSpeed)
	local var_19_2 = arg_19_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_19_2 == 0 then
		return math.min(arg_19_0.maxEnerey, var_19_1)
	end

	local function var_19_3(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		local var_20_0 = math.max(arg_20_0, arg_20_2)
		local var_20_1 = math.min(arg_20_1, arg_20_3)

		if var_20_0 < var_20_1 then
			return var_20_1 - var_20_0
		else
			return 0
		end
	end

	local var_19_4 = var_19_2:GetBuffEffect()[1] * 0.01
	local var_19_5 = var_19_3(arg_19_0.recorverTime, var_19_0, var_19_2:GetStartTime(), var_19_2:GetEndTime())
	local var_19_6 = var_19_1 + math.floor(var_19_5 / arg_19_0.recoverSpeed * var_19_4)

	return math.min(arg_19_0.maxEnerey, var_19_6)
end

function var_0_0.GetCurrentEnergyDecimal(arg_21_0)
	local var_21_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_21_1 = arg_21_0.energy + (var_21_0 - arg_21_0.recorverTime) / arg_21_0.recoverSpeed
	local var_21_2 = arg_21_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_21_2 == 0 then
		return math.min(arg_21_0.maxEnerey, var_21_1)
	end

	local function var_21_3(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
		local var_22_0 = math.max(arg_22_0, arg_22_2)
		local var_22_1 = math.min(arg_22_1, arg_22_3)

		if var_22_0 < var_22_1 then
			return var_22_1 - var_22_0
		else
			return 0
		end
	end

	local var_21_4 = var_21_2:GetBuffEffect()[1] * 0.01
	local var_21_5 = var_21_1 + var_21_3(arg_21_0.recorverTime, var_21_0, var_21_2:GetStartTime(), var_21_2:GetEndTime()) / arg_21_0.recoverSpeed * var_21_4

	return math.min(arg_21_0.maxEnerey, var_21_5)
end

function var_0_0.GetEnergyMaxTime(arg_23_0)
	local var_23_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_23_1 = arg_23_0.maxEnerey - arg_23_0:GetCurrentEnergyDecimal()
	local var_23_2 = arg_23_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_23_2 == 0 then
		return var_23_0 + var_23_1 * arg_23_0.recoverSpeed
	end

	if var_23_0 <= var_23_2:GetEndTime() then
		local var_23_3 = var_23_2:GetEndTime() - var_23_0
		local var_23_4 = var_23_2:GetBuffEffect()[1] * 0.01
		local var_23_5 = arg_23_0.recoverSpeed / (1 + var_23_4)
		local var_23_6 = var_23_5 * var_23_3

		if var_23_1 <= var_23_6 then
			return var_23_0 + var_23_1 / var_23_5
		end

		return var_23_0 + (var_23_1 - var_23_6) / arg_23_0.recoverSpeed + var_23_1 / var_23_5
	end

	return var_23_0 + var_23_1 * arg_23_0.recoverSpeed
end

function var_0_0.AnySkillCanUpgrade(arg_24_0)
	return arg_24_0:CanUpgradeSkill()
end

function var_0_0.HasStatus(arg_25_0)
	return table.getCount(arg_25_0:GetVaildStatus()) > 0
end

function var_0_0.GetPower(arg_26_0)
	local var_26_0 = arg_26_0:GetLevel() * 1000000
	local var_26_1 = 0

	for iter_26_0, iter_26_1 in pairs(arg_26_0:GetAttrs()) do
		var_26_1 = var_26_1 + iter_26_1
	end

	return var_26_0 + var_26_1
end

function var_0_0.GetName(arg_27_0)
	return arg_27_0:getConfig("name")
end

function var_0_0.GetEnName(arg_28_0)
	local var_28_0 = arg_28_0:GetShipGroup()

	return ShipGroup.getDefaultShipConfig(var_28_0).english_name
end

function var_0_0.StaticGetName(arg_29_0)
	return pg.island_chara_template[arg_29_0].name
end

function var_0_0.GetPrefab(arg_30_0)
	return var_0_0.StaticGetPrefab(arg_30_0.configId)
end

function var_0_0.GetModelUnit(arg_31_0)
	local var_31_0 = arg_31_0:getConfig("unit_id")

	if arg_31_0.cur_skin_id and arg_31_0.cur_skin_id ~= 0 then
		var_31_0 = pg.island_skin_template[arg_31_0.cur_skin_id].model

		local var_31_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetCurrentSkinColorByShipId(arg_31_0.id, arg_31_0.cur_skin_id)

		if var_31_1 ~= 0 then
			var_31_0 = pg.island_skin_colordiff_template[var_31_1].model
		end
	end

	return var_31_0
end

function var_0_0.GetCurrentSkinId(arg_32_0)
	return arg_32_0.cur_skin_id or 0
end

function var_0_0.GetModel(arg_33_0)
	local var_33_0 = arg_33_0:GetModelUnit()
	local var_33_1 = pg.island_unit_character[var_33_0]
	local var_33_2 = var_33_1.personal_ani

	return {
		model = var_33_1.model,
		animator = var_33_1.animator,
		personal_ani = var_33_2
	}
end

function var_0_0.GetModelBySkinAndColorId(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0:getConfig("unit_id")

	if arg_34_1 and arg_34_1 ~= 0 then
		var_34_0 = pg.island_skin_template[arg_34_1].model

		if arg_34_2 ~= 0 then
			var_34_0 = pg.island_skin_colordiff_template[arg_34_2].model
		end
	end

	return var_34_0
end

function var_0_0.ChangeSkinId(arg_35_0, arg_35_1)
	if arg_35_0.cur_skin_id ~= arg_35_1 then
		arg_35_0.cur_skin_id = arg_35_1
	end
end

function var_0_0.GetCurSkinId(arg_36_0)
	return arg_36_0.cur_skin_id or 0
end

function var_0_0.GetNewShipWord(arg_37_0)
	return ""
end

function var_0_0.GetShipGroup(arg_38_0)
	return arg_38_0.configId
end

function var_0_0.StaticGetPrefab(arg_39_0)
	local var_39_0 = pg.island_chara_template[arg_39_0].unit_id

	return pg.island_unit_character[var_39_0].IslandShipIcon
end

function var_0_0.UpdateState(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0.state = arg_40_1
	arg_40_0.stateId = arg_40_2
end

function var_0_0.GetState(arg_41_0)
	if pg.TimeMgr.GetInstance():GetServerTime() > arg_41_0.recorverTime then
		return var_0_0.STATE_NORMAL
	end

	return arg_41_0.state
end

function var_0_0.GetStateId(arg_42_0)
	return arg_42_0.stateId
end

function var_0_0.GetStatePlaceName(arg_43_0)
	return switch(arg_43_0.state, {
		[var_0_0.STATE_DELEGATION] = function()
			return pg.island_production_place[arg_43_0.stateId].name
		end,
		[var_0_0.STATE_TECHNOLOGY] = function()
			return pg.island_production_place[arg_43_0.stateId].name
		end,
		[var_0_0.STATE_RESTAURANT] = function()
			return pg.island_manage_restaurant[arg_43_0.stateId].name
		end
	}, function()
		return ""
	end)
end

function var_0_0.GetBreakLevel(arg_48_0)
	return arg_48_0.breakLevel
end

function var_0_0.GetBreakMaxLevel(arg_49_0)
	return arg_49_0:getConfig("upgrade_level")[2] + 1
end

function var_0_0.GetBreakPhaseValue(arg_50_0)
	return arg_50_0:getConfig("upgrade_level")[1]
end

function var_0_0.IsMaxBreakLevel(arg_51_0)
	return arg_51_0:GetBreakMaxLevel() <= arg_51_0:GetBreakLevel()
end

function var_0_0.CanBreakOut(arg_52_0)
	if arg_52_0:IsMaxBreakLevel() then
		return false
	end

	local var_52_0 = arg_52_0:GetBreakPhaseValue()

	return arg_52_0.level % var_52_0 == 0
end

function var_0_0.UpgradeBreakOut(arg_53_0)
	arg_53_0.breakLevel = arg_53_0.breakLevel + 1

	arg_53_0:InitMaxLevel()

	local var_53_0 = arg_53_0:GetMaxEnergy()
	local var_53_1 = var_53_0 - arg_53_0:GetEnergy()

	arg_53_0:InitMaxEnergy()

	if var_53_0 < arg_53_0:GetMaxEnergy() then
		arg_53_0.energy = arg_53_0.energy + var_53_1
	end

	arg_53_0:InitSkill()
end

function var_0_0.GetBreakoutMatrials(arg_54_0)
	local var_54_0 = arg_54_0:getConfig("upgrade_material")
	local var_54_1 = {}
	local var_54_2 = var_54_0[arg_54_0:GetBreakLevel()] or {}

	for iter_54_0, iter_54_1 in ipairs(var_54_2) do
		table.insert(var_54_1, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_54_1[1],
			count = iter_54_1[2]
		})
	end

	return var_54_1
end

function var_0_0.InitAttrs(arg_55_0)
	local var_55_0 = arg_55_0:GetBreakPhaseValue()
	local var_55_1 = math.floor(arg_55_0.level / var_55_0)
	local var_55_2 = arg_55_0.level % var_55_0
	local var_55_3 = arg_55_0:getConfig("base_att")

	for iter_55_0, iter_55_1 in ipairs(var_55_3) do
		local var_55_4 = iter_55_1[1]
		local var_55_5 = iter_55_1[2]
		local var_55_6 = IslandShipAttr.GetAtrrName(var_55_4)

		arg_55_0.attrs[var_55_6] = var_55_5
	end

	local var_55_7 = arg_55_0:getConfig("growth_att")

	for iter_55_2, iter_55_3 in ipairs(var_55_7) do
		local var_55_8 = iter_55_3[1]
		local var_55_9 = iter_55_3[2]
		local var_55_10 = IslandShipAttr.GetAtrrName(var_55_8)
		local var_55_11 = 0

		for iter_55_4 = 1, var_55_1 do
			var_55_11 = var_55_11 + var_55_9[iter_55_4] * var_55_0
		end

		if var_55_1 < #var_55_9 then
			var_55_11 = var_55_11 + var_55_9[var_55_1 + 1] * var_55_2
		end

		arg_55_0.attrs[var_55_10] = arg_55_0.attrs[var_55_10] + var_55_11
	end

	for iter_55_5, iter_55_6 in pairs(arg_55_0.extraAttrs) do
		arg_55_0.attrs[iter_55_5] = arg_55_0.attrs[iter_55_5] + iter_55_6
	end
end

function var_0_0.GetGrowthAtt(arg_56_0)
	local var_56_0 = {}
	local var_56_1 = arg_56_0:getConfig("growth_att")

	for iter_56_0, iter_56_1 in ipairs(var_56_1) do
		local var_56_2 = iter_56_1[1]
		local var_56_3 = iter_56_1[2]

		var_56_0[IslandShipAttr.GetAtrrName(var_56_2)] = var_56_3[arg_56_0:GetBreakLevel()] or 0
	end

	return var_56_0
end

function var_0_0.GetAttrs(arg_57_0)
	return arg_57_0.attrs
end

function var_0_0.GetAttr(arg_58_0, arg_58_1)
	return arg_58_0.attrs[arg_58_1] or 0
end

function var_0_0.GetAttrGradeCnt(arg_59_0, arg_59_1)
	local var_59_0 = 0

	for iter_59_0, iter_59_1 in pairs(arg_59_0.attrs) do
		if arg_59_1 >= arg_59_0:GetAttrGrade(iter_59_0) then
			var_59_0 = var_59_0 + 1
		end
	end

	return var_59_0
end

function var_0_0.GetAttrGradeByValue(arg_60_0, arg_60_1)
	local var_60_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_60_0, iter_60_1 in ipairs(pg.island_chara_att.all) do
		local var_60_1 = pg.island_chara_att[iter_60_1]
		local var_60_2 = var_60_1.range[1]
		local var_60_3 = var_60_1.range[2]

		if var_60_2 <= arg_60_1 and arg_60_1 <= var_60_3 then
			var_60_0 = iter_60_1

			break
		end
	end

	return var_60_0
end

function var_0_0.GetAttrGrade(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_0:GetAttr(arg_61_1)

	return arg_61_0:GetAttrGradeByValue(var_61_0)
end

function var_0_0.GetAttrGradeName(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_0:GetAttrGrade(arg_62_1)

	return pg.island_chara_att[var_62_0].name
end

function var_0_0.GetAttrGradeEffect(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0:GetAttrGrade(arg_63_1)

	return pg.island_chara_att[var_63_0].effect
end

function var_0_0.SetUnlockExtraAttLimit(arg_64_0)
	arg_64_0.unlockExtraAttLimit = true

	arg_64_0:InitMaxExtraAttrs()
end

function var_0_0.IsUnlockExtraAttLimit(arg_65_0)
	return arg_65_0.unlockExtraAttLimit
end

function var_0_0.InitMaxExtraAttrs(arg_66_0)
	for iter_66_0, iter_66_1 in ipairs(arg_66_0:getConfig("extra_max")) do
		local var_66_0 = iter_66_1[1]
		local var_66_1 = iter_66_1[2][1]
		local var_66_2 = iter_66_1[2][2]
		local var_66_3 = arg_66_0.unlockExtraAttLimit and var_66_2 or var_66_1
		local var_66_4 = IslandShipAttr.GetAtrrName(var_66_0)

		arg_66_0.maxExtraAttrs[var_66_4] = var_66_3
	end
end

function var_0_0.GetExtraAttrLimit(arg_67_0, arg_67_1)
	return arg_67_0.maxExtraAttrs[arg_67_1] or 0
end

function var_0_0.GetExtraAttrValue(arg_68_0, arg_68_1)
	return arg_68_0.extraAttrs[arg_68_1] or 0
end

function var_0_0.ExistPotency(arg_69_0)
	for iter_69_0, iter_69_1 in pairs(IslandShipAttr.ATTRS) do
		if arg_69_0:GetExtraAttrLimit(iter_69_1) > arg_69_0:GetExtraAttrValue(iter_69_1) then
			return true
		end
	end

	return false
end

function var_0_0.AddExtraAttr(arg_70_0, arg_70_1, arg_70_2)
	local var_70_0 = arg_70_0:GetExtraAttrLimit(arg_70_1)
	local var_70_1 = arg_70_0:GetExtraAttrValue(arg_70_1) + arg_70_2

	arg_70_0.extraAttrs[arg_70_1] = math.min(var_70_1, var_70_0)

	arg_70_0:InitAttrs()
end

function var_0_0.GetUpgradeExtraAttrConsume(arg_71_0, arg_71_1)
	local var_71_0 = table.indexof(IslandShipAttr.ATTRS, arg_71_1)

	if var_71_0 <= 0 then
		return {}
	end

	local var_71_1 = arg_71_0:getConfig("att_item")
	local var_71_2 = {}

	for iter_71_0, iter_71_1 in ipairs(var_71_1[var_71_0] or {}) do
		table.insert(var_71_2, {
			count = 1,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_71_1
		})
	end

	return var_71_2
end

function var_0_0.GetExtraAttrLimitUnlockConsume(arg_72_0)
	return {
		{
			id = 100000,
			count = 1,
			type = DROP_TYPE_ISLAND_ITEM
		}
	}
end

function var_0_0.InitSkill(arg_73_0)
	if arg_73_0:getConfig("skill_unlock") <= arg_73_0:GetBreakLevel() then
		arg_73_0.skill:Unlock()
	end
end

function var_0_0.GetSkillUnlockLevel(arg_74_0)
	return arg_74_0:getConfig("skill_unlock")
end

function var_0_0.GetSkill(arg_75_0)
	return arg_75_0.skill
end

function var_0_0.CanUpgradeSkill(arg_76_0)
	if not arg_76_0.skill:IsUnlock() then
		return false
	end

	if arg_76_0.skill:IsMaxLevel() then
		return false
	end

	local var_76_0 = arg_76_0.skill:GetUpgradeMaterial()
	local var_76_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	return _.all(var_76_0, function(arg_77_0)
		return var_76_1:GetOwnCount(arg_77_0.id) >= arg_77_0.count
	end)
end

function var_0_0.GetVaildStatusByGroup(arg_78_0, arg_78_1)
	return _.select(arg_78_0.status, function(arg_79_0)
		return not arg_79_0:IsExpiration() and arg_79_0:GetGroup() == arg_78_1
	end)
end

function var_0_0.GetVaildStatus(arg_80_0)
	return _.select(arg_80_0.status, function(arg_81_0)
		return not arg_81_0:IsExpiration()
	end)
end

function var_0_0.GetVaildStatusByType(arg_82_0, arg_82_1)
	return _.select(arg_82_0.status, function(arg_83_0)
		return not arg_83_0:IsExpiration() and arg_83_0:GetBuffType() == arg_82_1
	end)
end

function var_0_0.GetDisplayStatus(arg_84_0)
	return _.select(arg_84_0.status, function(arg_85_0)
		return not arg_85_0:IsExpiration() and arg_85_0:CanDisplay()
	end)
end

function var_0_0.GetFavoriteGift(arg_86_0)
	return arg_86_0:getConfig("gift_id")
end

function var_0_0.IsFavoriteGift(arg_87_0, arg_87_1)
	local var_87_0 = arg_87_0:GetFavoriteGift()

	return _.any(var_87_0, function(arg_88_0)
		return arg_88_0 == arg_87_1
	end)
end

function var_0_0.AddStatus(arg_89_0, arg_89_1)
	local var_89_0 = _.detect(arg_89_0.status, function(arg_90_0)
		return arg_90_0.id == arg_89_1.id
	end)

	if var_89_0 then
		table.removebyvalue(arg_89_0.status, var_89_0)
	end

	local var_89_1 = arg_89_0:GetVaildStatus()
	local var_89_2 = arg_89_1:GetDuelTypeList()
	local var_89_3 = _.detect(var_89_1, function(arg_91_0)
		return table.contains(var_89_2, arg_91_0:GetGroup())
	end)

	if var_89_3 then
		table.removebyvalue(arg_89_0.status, var_89_3)
	end

	local var_89_4 = arg_89_1:GetDuelIdList()
	local var_89_5 = _.detect(var_89_1, function(arg_92_0)
		return table.contains(var_89_4, arg_92_0.id)
	end)

	if var_89_5 then
		table.removebyvalue(arg_89_0.status, var_89_5)
	end

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandShipAddBuff(arg_89_0.id, arg_89_1.id))
	table.insert(arg_89_0.status, arg_89_1)
end

return var_0_0

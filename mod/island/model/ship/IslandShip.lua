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

function var_0_0.InitMaxEnergy(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.maxEnerey
	local var_17_1, var_17_2 = arg_17_0:GetBreakLevel(), arg_17_0:getConfig("upgrade_power")
	local var_17_3 = arg_17_0:getConfig("power")
	local var_17_4 = 0

	for iter_17_0 = 1, var_17_1 do
		var_17_4 = var_17_4 + (var_17_2[iter_17_0] or 0)
	end

	arg_17_0.maxEnerey = var_17_3 + var_17_4

	if not arg_17_1 then
		return
	end

	if arg_17_0.maxEnerey - var_17_0 > 0 then
		local var_17_5 = var_17_0 - arg_17_0.energy

		arg_17_0.energy = arg_17_0.maxEnerey - var_17_5
	end
end

function var_0_0.InitEnergyRecoverTime(arg_18_0)
	arg_18_0.recoverSpeed = arg_18_0:getConfig("power_recover")
end

function var_0_0.GetSkillAddRecoverSpeed(arg_19_0)
	local var_19_0 = 0

	if arg_19_0.skill then
		local var_19_1 = arg_19_0.skill:GetUnlockShipEffectIds()

		for iter_19_0, iter_19_1 in ipairs(var_19_1) do
			local var_19_2 = pg.island_buff_template[iter_19_1]

			if var_19_2.buff_type == IslandBuffType.SHIP_POWER_RECOVER then
				var_19_0 = var_19_0 + var_19_2.type_use[1]
			end
		end
	end

	return var_19_0
end

function var_0_0.GetCurrentEnergy(arg_20_0)
	if arg_20_0:GetState() ~= var_0_0.STATE_NORMAL then
		return math.min(arg_20_0.maxEnerey, arg_20_0.energy)
	end

	local var_20_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_20_1 = math.floor(arg_20_0.energy + (var_20_0 - arg_20_0.recorverTime) / arg_20_0.recoverSpeed)
	local var_20_2 = arg_20_0:GetSkillAddRecoverSpeed()

	if var_20_2 > 0 then
		local var_20_3 = math.floor((var_20_0 - arg_20_0.recorverTime) / arg_20_0.recoverSpeed)

		var_20_1 = var_20_1 + math.floor(var_20_3 * var_20_2 * 0.01)
	end

	local var_20_4 = arg_20_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)

	if #var_20_4 == 0 then
		return math.min(arg_20_0.maxEnerey, var_20_1)
	end

	local function var_20_5(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
		local var_21_0 = math.max(arg_21_0, arg_21_2)
		local var_21_1 = math.min(arg_21_1, arg_21_3)

		if var_21_0 < var_21_1 then
			return var_21_1 - var_21_0
		else
			return 0
		end
	end

	local var_20_6 = var_20_4:GetBuffEffect()[1] * 0.01
	local var_20_7 = var_20_5(arg_20_0.recorverTime, var_20_0, var_20_4:GetStartTime(), var_20_4:GetEndTime())
	local var_20_8 = var_20_1 + math.floor(var_20_7 / arg_20_0.recoverSpeed * var_20_6)

	return math.min(arg_20_0.maxEnerey, var_20_8)
end

function var_0_0.GetCurrentEnergyDecimal(arg_22_0)
	local var_22_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_22_1 = arg_22_0.energy + (var_22_0 - arg_22_0.recorverTime) / arg_22_0.recoverSpeed
	local var_22_2 = arg_22_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)
	local var_22_3 = arg_22_0:GetSkillAddRecoverSpeed()

	if var_22_3 > 0 then
		var_22_1 = var_22_1 + (var_22_0 - arg_22_0.recorverTime) / arg_22_0.recoverSpeed * var_22_3 * 0.01
	end

	if #var_22_2 == 0 then
		return math.min(arg_22_0.maxEnerey, var_22_1)
	end

	local function var_22_4(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
		local var_23_0 = math.max(arg_23_0, arg_23_2)
		local var_23_1 = math.min(arg_23_1, arg_23_3)

		if var_23_0 < var_23_1 then
			return var_23_1 - var_23_0
		else
			return 0
		end
	end

	local var_22_5 = var_22_2:GetBuffEffect()[1] * 0.01
	local var_22_6 = var_22_1 + var_22_4(arg_22_0.recorverTime, var_22_0, var_22_2:GetStartTime(), var_22_2:GetEndTime()) / arg_22_0.recoverSpeed * var_22_5

	return math.min(arg_22_0.maxEnerey, var_22_6)
end

function var_0_0.GetEnergyMaxTime(arg_24_0)
	local var_24_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_24_1 = arg_24_0.maxEnerey - arg_24_0:GetCurrentEnergyDecimal()
	local var_24_2 = arg_24_0:GetVaildStatusByType(IslandBuffType.SHIP_POWER_RECOVER)
	local var_24_3 = arg_24_0:GetSkillAddRecoverSpeed()
	local var_24_4 = var_24_3 > 0 and arg_24_0.recoverSpeed / (1 + var_24_3 * 0.01) or arg_24_0.recoverSpeed

	if #var_24_2 == 0 then
		return var_24_0 + math.floor(var_24_1 * var_24_4)
	end

	if var_24_0 <= var_24_2:GetEndTime() then
		local var_24_5 = var_24_2:GetEndTime() - var_24_0
		local var_24_6 = var_24_4 / (1 + var_24_2:GetBuffEffect()[1] * 0.01)
		local var_24_7 = var_24_6 * var_24_5

		if var_24_1 <= var_24_7 then
			return var_24_0 + math.floor(var_24_1 / var_24_6)
		end

		local var_24_8 = var_24_1 - var_24_7

		return var_24_0 + math.floor(var_24_8 / var_24_4) + math.floor(var_24_1 / var_24_6)
	end

	return var_24_0 + math.floor(var_24_1 * var_24_4)
end

function var_0_0.AnySkillCanUpgrade(arg_25_0)
	return arg_25_0:CanUpgradeSkill()
end

function var_0_0.HasStatus(arg_26_0)
	return table.getCount(arg_26_0:GetVaildStatus()) > 0
end

function var_0_0.GetPower(arg_27_0)
	local var_27_0 = arg_27_0:GetLevel() * 1000000
	local var_27_1 = 0

	for iter_27_0, iter_27_1 in pairs(arg_27_0:GetAttrs()) do
		var_27_1 = var_27_1 + iter_27_1
	end

	return var_27_0 + var_27_1
end

function var_0_0.GetName(arg_28_0)
	return arg_28_0:getConfig("name")
end

function var_0_0.GetEnName(arg_29_0)
	local var_29_0 = arg_29_0:GetShipGroup()

	return ShipGroup.getDefaultShipConfig(var_29_0).english_name
end

function var_0_0.StaticGetName(arg_30_0)
	return pg.island_chara_template[arg_30_0].name
end

function var_0_0.GetPrefab(arg_31_0)
	return var_0_0.StaticGetPrefab(arg_31_0.configId)
end

function var_0_0.GetModelUnit(arg_32_0)
	local var_32_0 = arg_32_0:getConfig("unit_id")

	if arg_32_0.cur_skin_id and arg_32_0.cur_skin_id ~= 0 then
		var_32_0 = pg.island_skin_template[arg_32_0.cur_skin_id].model

		local var_32_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetCurrentSkinColorByShipId(arg_32_0.id, arg_32_0.cur_skin_id)

		if var_32_1 ~= 0 then
			var_32_0 = pg.island_skin_colordiff_template[var_32_1].model
		end
	end

	return var_32_0
end

function var_0_0.GetCurrentSkinId(arg_33_0)
	return arg_33_0.cur_skin_id or 0
end

function var_0_0.GetModel(arg_34_0)
	local var_34_0 = arg_34_0:GetModelUnit()
	local var_34_1 = pg.island_unit_character[var_34_0]
	local var_34_2 = var_34_1.personal_ani

	return {
		model = var_34_1.model,
		animator = var_34_1.animator,
		personal_ani = var_34_2
	}
end

function var_0_0.GetModelBySkinAndColorId(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_0:getConfig("unit_id")

	if arg_35_1 and arg_35_1 ~= 0 then
		var_35_0 = pg.island_skin_template[arg_35_1].model

		if arg_35_2 ~= 0 then
			var_35_0 = pg.island_skin_colordiff_template[arg_35_2].model
		end
	end

	return var_35_0
end

function var_0_0.ChangeSkinId(arg_36_0, arg_36_1)
	if arg_36_0.cur_skin_id ~= arg_36_1 then
		arg_36_0.cur_skin_id = arg_36_1
	end
end

function var_0_0.GetCurSkinId(arg_37_0)
	return arg_37_0.cur_skin_id or 0
end

function var_0_0.GetNewShipWord(arg_38_0)
	return ""
end

function var_0_0.GetShipGroup(arg_39_0)
	return arg_39_0.configId
end

function var_0_0.StaticGetPrefab(arg_40_0)
	local var_40_0 = pg.island_chara_template[arg_40_0].unit_id

	return pg.island_unit_character[var_40_0].IslandShipIcon
end

function var_0_0.UpdateState(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0.state = arg_41_1
	arg_41_0.stateId = arg_41_2
end

function var_0_0.GetState(arg_42_0)
	if pg.TimeMgr.GetInstance():GetServerTime() >= arg_42_0.recorverTime then
		return var_0_0.STATE_NORMAL
	end

	return arg_42_0.state
end

function var_0_0.GetStateId(arg_43_0)
	return arg_43_0.stateId
end

function var_0_0.GetStatePlaceName(arg_44_0)
	return switch(arg_44_0.state, {
		[var_0_0.STATE_DELEGATION] = function()
			return pg.island_production_place[arg_44_0.stateId].name
		end,
		[var_0_0.STATE_TECHNOLOGY] = function()
			return pg.island_production_place[arg_44_0.stateId].name
		end,
		[var_0_0.STATE_RESTAURANT] = function()
			return pg.island_manage_restaurant[arg_44_0.stateId].name
		end
	}, function()
		return ""
	end)
end

function var_0_0.IsDelegable(arg_49_0)
	return arg_49_0:GetState() == var_0_0.STATE_NORMAL and not getProxy(IslandProxy):GetIsland():GetFollowerAgency():Following(arg_49_0.id)
end

function var_0_0.GetBreakLevel(arg_50_0)
	return arg_50_0.breakLevel
end

function var_0_0.GetBreakMaxLevel(arg_51_0)
	return arg_51_0:getConfig("upgrade_level")[2] + 1
end

function var_0_0.GetBreakPhaseValue(arg_52_0)
	return arg_52_0:getConfig("upgrade_level")[1]
end

function var_0_0.IsMaxBreakLevel(arg_53_0)
	return arg_53_0:GetBreakMaxLevel() <= arg_53_0:GetBreakLevel()
end

function var_0_0.CanBreakOut(arg_54_0)
	if arg_54_0:IsMaxBreakLevel() then
		return false
	end

	local var_54_0 = arg_54_0:GetBreakPhaseValue()

	return arg_54_0.level % var_54_0 == 0
end

function var_0_0.UpgradeBreakOut(arg_55_0)
	arg_55_0.breakLevel = arg_55_0.breakLevel + 1

	arg_55_0:InitMaxLevel()

	local var_55_0 = arg_55_0:GetMaxEnergy()
	local var_55_1 = var_55_0 - arg_55_0:GetEnergy()

	arg_55_0:InitMaxEnergy(true)

	local var_55_2 = arg_55_0:GetMaxEnergy()

	if var_55_0 < var_55_2 then
		arg_55_0.energy = var_55_2 - var_55_1
	end

	arg_55_0:InitSkill()
end

function var_0_0.GetBreakoutMatrials(arg_56_0)
	local var_56_0 = arg_56_0:getConfig("upgrade_material")
	local var_56_1 = {}
	local var_56_2 = var_56_0[arg_56_0:GetBreakLevel()] or {}

	for iter_56_0, iter_56_1 in ipairs(var_56_2) do
		table.insert(var_56_1, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_56_1[1],
			count = iter_56_1[2]
		})
	end

	return var_56_1
end

function var_0_0.InitAttrs(arg_57_0)
	local var_57_0 = arg_57_0:GetBreakPhaseValue()
	local var_57_1 = math.floor(arg_57_0.level / var_57_0)
	local var_57_2 = arg_57_0.level % var_57_0
	local var_57_3 = arg_57_0:getConfig("base_att")

	for iter_57_0, iter_57_1 in ipairs(var_57_3) do
		local var_57_4 = iter_57_1[1]
		local var_57_5 = iter_57_1[2]
		local var_57_6 = IslandShipAttr.GetAtrrName(var_57_4)

		arg_57_0.attrs[var_57_6] = var_57_5
	end

	local var_57_7 = arg_57_0:getConfig("growth_att")

	for iter_57_2, iter_57_3 in ipairs(var_57_7) do
		local var_57_8 = iter_57_3[1]
		local var_57_9 = iter_57_3[2]
		local var_57_10 = IslandShipAttr.GetAtrrName(var_57_8)
		local var_57_11 = 0

		for iter_57_4 = 1, var_57_1 do
			var_57_11 = var_57_11 + var_57_9[iter_57_4] * var_57_0
		end

		if var_57_1 < #var_57_9 then
			var_57_11 = var_57_11 + var_57_9[var_57_1 + 1] * var_57_2
		end

		arg_57_0.attrs[var_57_10] = arg_57_0.attrs[var_57_10] + var_57_11
	end

	for iter_57_5, iter_57_6 in pairs(arg_57_0.extraAttrs) do
		arg_57_0.attrs[iter_57_5] = arg_57_0.attrs[iter_57_5] + iter_57_6
	end

	for iter_57_7, iter_57_8 in pairs(arg_57_0.attrs) do
		arg_57_0.attrs[iter_57_7] = math.floor(iter_57_8)
	end
end

function var_0_0.GetGrowthAtt(arg_58_0)
	local var_58_0 = {}
	local var_58_1 = arg_58_0:getConfig("growth_att")

	for iter_58_0, iter_58_1 in ipairs(var_58_1) do
		local var_58_2 = iter_58_1[1]
		local var_58_3 = iter_58_1[2]

		var_58_0[IslandShipAttr.GetAtrrName(var_58_2)] = var_58_3[arg_58_0:GetBreakLevel()] or 0
	end

	return var_58_0
end

function var_0_0.GetAttrs(arg_59_0)
	return arg_59_0.attrs
end

function var_0_0.GetAttr(arg_60_0, arg_60_1)
	return arg_60_0.attrs[arg_60_1] or 0
end

function var_0_0.GetAttrGradeCnt(arg_61_0, arg_61_1)
	local var_61_0 = 0

	for iter_61_0, iter_61_1 in pairs(arg_61_0.attrs) do
		if arg_61_1 >= arg_61_0:GetAttrGrade(iter_61_0) then
			var_61_0 = var_61_0 + 1
		end
	end

	return var_61_0
end

function var_0_0.GetAttrGradeByValue(arg_62_0, arg_62_1)
	local var_62_0 = pg.island_chara_att.all[#pg.island_chara_att.all]

	for iter_62_0, iter_62_1 in ipairs(pg.island_chara_att.all) do
		local var_62_1 = pg.island_chara_att[iter_62_1]
		local var_62_2 = var_62_1.range[1]
		local var_62_3 = var_62_1.range[2]

		if var_62_2 <= arg_62_1 and arg_62_1 <= var_62_3 then
			var_62_0 = iter_62_1

			break
		end
	end

	return var_62_0
end

function var_0_0.GetAttrGrade(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0:GetAttr(arg_63_1)

	return arg_63_0:GetAttrGradeByValue(var_63_0)
end

function var_0_0.GetAttrGradeName(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_0:GetAttrGrade(arg_64_1)

	return pg.island_chara_att[var_64_0].name
end

function var_0_0.GetAttrGradeEffect(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0:GetAttrGrade(arg_65_1)

	return pg.island_chara_att[var_65_0].effect
end

function var_0_0.SetUnlockExtraAttLimit(arg_66_0)
	arg_66_0.unlockExtraAttLimit = true

	arg_66_0:InitMaxExtraAttrs()
end

function var_0_0.IsUnlockExtraAttLimit(arg_67_0)
	return arg_67_0.unlockExtraAttLimit
end

function var_0_0.InitMaxExtraAttrs(arg_68_0)
	for iter_68_0, iter_68_1 in ipairs(arg_68_0:getConfig("extra_max")) do
		local var_68_0 = iter_68_1[1]
		local var_68_1 = iter_68_1[2][1]
		local var_68_2 = iter_68_1[2][2]
		local var_68_3 = arg_68_0.unlockExtraAttLimit and var_68_2 or var_68_1
		local var_68_4 = IslandShipAttr.GetAtrrName(var_68_0)

		arg_68_0.maxExtraAttrs[var_68_4] = var_68_3
	end
end

function var_0_0.GetExtraAttrLimit(arg_69_0, arg_69_1)
	return arg_69_0.maxExtraAttrs[arg_69_1] or 0
end

function var_0_0.GetExtraAttrValue(arg_70_0, arg_70_1)
	return arg_70_0.extraAttrs[arg_70_1] or 0
end

function var_0_0.ExistPotency(arg_71_0)
	for iter_71_0, iter_71_1 in pairs(IslandShipAttr.ATTRS) do
		if arg_71_0:GetExtraAttrLimit(iter_71_1) > arg_71_0:GetExtraAttrValue(iter_71_1) then
			return true
		end
	end

	return false
end

function var_0_0.AddExtraAttr(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_0:GetExtraAttrLimit(arg_72_1)
	local var_72_1 = arg_72_0:GetExtraAttrValue(arg_72_1) + arg_72_2

	arg_72_0.extraAttrs[arg_72_1] = math.min(var_72_1, var_72_0)

	arg_72_0:InitAttrs()
end

function var_0_0.GetUpgradeExtraAttrConsume(arg_73_0, arg_73_1)
	local var_73_0 = table.indexof(IslandShipAttr.ATTRS, arg_73_1)

	if var_73_0 <= 0 then
		return {}
	end

	local var_73_1 = arg_73_0:getConfig("att_item")
	local var_73_2 = {}

	for iter_73_0, iter_73_1 in ipairs(var_73_1[var_73_0] or {}) do
		table.insert(var_73_2, {
			count = 1,
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_73_1
		})
	end

	return var_73_2
end

function var_0_0.GetExtraAttrLimitUnlockConsume(arg_74_0)
	return {
		{
			id = 100000,
			count = 1,
			type = DROP_TYPE_ISLAND_ITEM
		}
	}
end

function var_0_0.InitSkill(arg_75_0)
	if arg_75_0:getConfig("skill_unlock") <= arg_75_0:GetBreakLevel() then
		arg_75_0.skill:Unlock()
	end
end

function var_0_0.GetSkillUnlockLevel(arg_76_0)
	return arg_76_0:getConfig("skill_unlock")
end

function var_0_0.GetSkill(arg_77_0)
	return arg_77_0.skill
end

function var_0_0.CanUpgradeSkill(arg_78_0)
	if not arg_78_0.skill:IsUnlock() then
		return false
	end

	if arg_78_0.skill:IsMaxLevel() then
		return false
	end

	local var_78_0 = arg_78_0.skill:GetUpgradeMaterial()
	local var_78_1 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	return _.all(var_78_0, function(arg_79_0)
		return var_78_1:GetOwnCount(arg_79_0.id) >= arg_79_0.count
	end)
end

function var_0_0.GetVaildStatusByGroup(arg_80_0, arg_80_1)
	return _.select(arg_80_0.status, function(arg_81_0)
		return not arg_81_0:IsExpiration() and arg_81_0:GetGroup() == arg_80_1
	end)
end

function var_0_0.GetVaildStatus(arg_82_0)
	return _.select(arg_82_0.status, function(arg_83_0)
		return not arg_83_0:IsExpiration()
	end)
end

function var_0_0.GetVaildStatusByType(arg_84_0, arg_84_1)
	return _.select(arg_84_0.status, function(arg_85_0)
		return not arg_85_0:IsExpiration() and arg_85_0:GetBuffType() == arg_84_1
	end)
end

function var_0_0.GetDisplayStatus(arg_86_0)
	return _.select(arg_86_0.status, function(arg_87_0)
		return not arg_87_0:IsExpiration() and arg_87_0:CanDisplay()
	end)
end

function var_0_0.GetFavoriteGift(arg_88_0)
	return arg_88_0:getConfig("gift_id")
end

function var_0_0.IsFavoriteGift(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0:GetFavoriteGift()

	return _.any(var_89_0, function(arg_90_0)
		return arg_90_0 == arg_89_1
	end)
end

function var_0_0.AddStatus(arg_91_0, arg_91_1)
	local var_91_0 = _.detect(arg_91_0.status, function(arg_92_0)
		return arg_92_0.id == arg_91_1.id
	end)

	if var_91_0 then
		table.removebyvalue(arg_91_0.status, var_91_0)
	end

	local var_91_1 = arg_91_0:GetVaildStatus()
	local var_91_2 = arg_91_1:GetDuelTypeList()
	local var_91_3 = _.detect(var_91_1, function(arg_93_0)
		return table.contains(var_91_2, arg_93_0:GetGroup())
	end)

	if var_91_3 then
		table.removebyvalue(arg_91_0.status, var_91_3)
	end

	local var_91_4 = arg_91_1:GetDuelIdList()
	local var_91_5 = _.detect(var_91_1, function(arg_94_0)
		return table.contains(var_91_4, arg_94_0.id)
	end)

	if var_91_5 then
		table.removebyvalue(arg_91_0.status, var_91_5)
	end

	pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandShipAddBuff(arg_91_0.id, arg_91_1.id))
	table.insert(arg_91_0.status, arg_91_1)
end

return var_0_0

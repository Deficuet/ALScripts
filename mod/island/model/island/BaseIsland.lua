local var_0_0 = class("BaseIsland", import("Mod.Island.IslandDispatcher"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.id = arg_1_1.id
	arg_1_0.level = arg_1_1.level or 1
	arg_1_0.configId = arg_1_0.level
	arg_1_0.exp = arg_1_1.exp or 0
	arg_1_0.name = arg_1_1.name or "1"
	arg_1_0.prosperity = arg_1_1.prosperity or 0
	arg_1_0.manifesto = arg_1_1.signature or ""
	arg_1_0.prosperityList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.prosperity_rewarded or {}) do
		arg_1_0.prosperityList[iter_1_1] = true
	end

	arg_1_0.ablityAgency = IslandAblityAgency.New(arg_1_0, arg_1_1)
	arg_1_0.characterAgency = IslandCharacterAgency.New(arg_1_0, arg_1_1)
	arg_1_0.visitorAgency = IslandVisitorAgency.New(arg_1_0, arg_1_1)
	arg_1_0.technologyAgency = IslandTechnologyAgency.New(arg_1_0, arg_1_1)
	arg_1_0.signInAgency = IslandSignInAgency.New(arg_1_0, arg_1_1)
	arg_1_0.taskAgency = IslandTaskAgency.New(arg_1_0, arg_1_1)
	arg_1_0.accessAgency = IslandAccessAgency.New(arg_1_0, arg_1_1)
	arg_1_0.gatherCollectAgency = IslandGatherCollectAgency.New(arg_1_0)
	arg_1_0.buildingAgency = IslandBuildingAgency.New(arg_1_0, arg_1_1)
	arg_1_0.agoraAgency = IslandAgoraAgency.New(arg_1_0, arg_1_1)
	arg_1_0.manageAgency = IslandManageAgecny.New(arg_1_0, arg_1_1)
	arg_1_0.mapID = pg.island_set.initial_scene.key_value_int
	arg_1_0.lastExitPosition = {
		mapId = 0,
		position = Vector3.zero,
		rotation = Vector3.zero
	}

	if not arg_1_0.taskAgency:IsFinishTask(IslandGuideChecker.MOVE_TASK_ID) then
		arg_1_0:SetSpawnPointId(pg.island_set.initial_spawn_point.key_value_int)
	end
end

function var_0_0.GetAccessAgency(arg_2_0)
	return arg_2_0.accessAgency
end

function var_0_0.IsPrivate(arg_3_0)
	return false
end

function var_0_0.GetVisitorAgency(arg_4_0)
	return arg_4_0.visitorAgency
end

function var_0_0.GetAgoraAgency(arg_5_0)
	return arg_5_0.agoraAgency
end

function var_0_0.GetCharacterAgency(arg_6_0)
	return arg_6_0.characterAgency
end

function var_0_0.GetTechnologyAgency(arg_7_0)
	return arg_7_0.technologyAgency
end

function var_0_0.GetAblityAgency(arg_8_0)
	return arg_8_0.ablityAgency
end

function var_0_0.GetSignInAgency(arg_9_0)
	return arg_9_0.signInAgency
end

function var_0_0.GetTaskAgency(arg_10_0)
	return arg_10_0.taskAgency
end

function var_0_0.GetManageAgency(arg_11_0)
	return arg_11_0.manageAgency
end

function var_0_0.GetWildCollectAgency(arg_12_0)
	return arg_12_0.gatherCollectAgency
end

function var_0_0.GetBuildingAgency(arg_13_0)
	return arg_13_0.buildingAgency
end

function var_0_0.SetSpawnPointId(arg_14_0, arg_14_1)
	arg_14_0.spawnPointId = arg_14_1
end

function var_0_0.GetSpawnPointId(arg_15_0)
	local var_15_0 = arg_15_0.spawnPointId

	arg_15_0.spawnPointId = nil

	return var_15_0
end

function var_0_0.SetLastExitPosition(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	if arg_16_1 <= 0 then
		return
	end

	arg_16_0.lastExitPosition = {
		mapId = arg_16_1,
		position = arg_16_2,
		rotation = arg_16_3
	}
end

function var_0_0.GetLastExitPosition(arg_17_0)
	return arg_17_0.lastExitPosition
end

function var_0_0.GetMapId(arg_18_0)
	return arg_18_0.mapID
end

function var_0_0.SetMapId(arg_19_0, arg_19_1)
	local var_19_0 = pg.island_map[arg_19_1]

	if not var_19_0 then
		return
	end

	if not pg.TimeMgr.GetInstance():inTime(var_19_0.time) then
		return
	end

	arg_19_0.mapID = arg_19_1
end

function var_0_0.GetUnlockBuildingList(arg_20_0)
	if arg_20_0:IsMaxLevel() then
		return {}
	end

	return pg.island_level[arg_20_0.level].island_level_award
end

function var_0_0.IsNew(arg_21_0)
	return arg_21_0.name == ""
end

function var_0_0.CanModifyName(arg_22_0)
	return true
end

function var_0_0.SetName(arg_23_0, arg_23_1)
	arg_23_0.name = arg_23_1
end

function var_0_0.GetName(arg_24_0)
	if arg_24_0.name == "" then
		local var_24_0 = getProxy(PlayerProxy):getRawData().name

		return i18n("island_default_name", var_24_0)
	else
		return arg_24_0.name
	end
end

function var_0_0.SetManifesto(arg_25_0, arg_25_1)
	arg_25_0.manifesto = arg_25_1
end

function var_0_0.GetManifesto(arg_26_0)
	return arg_26_0.manifesto
end

function var_0_0.GetModifyNameConsume(arg_27_0)
	return {
		DROP_TYPE_RESOURCE,
		1,
		1
	}
end

function var_0_0.AddExp(arg_28_0, arg_28_1)
	if arg_28_0:IsMaxLevel() then
		return
	end

	arg_28_0.exp = arg_28_0.exp + arg_28_1
end

function var_0_0.Upgrade(arg_29_0)
	if arg_29_0:IsMaxLevel() then
		return
	end

	if arg_29_0:CanLevelUp() then
		arg_29_0.exp = arg_29_0:IsMaxLevel() and 0 or arg_29_0.exp - arg_29_0:GetTargeExp()

		arg_29_0:LevelUp()
	end
end

function var_0_0.LevelUp(arg_30_0)
	arg_30_0.level = arg_30_0.level + 1
	arg_30_0.configId = arg_30_0.level
end

function var_0_0.GetTargeExp(arg_31_0)
	local var_31_0 = pg.island_level[arg_31_0.level]

	assert(var_31_0)

	return var_31_0.island_exp
end

function var_0_0.CanLevelUp(arg_32_0)
	if arg_32_0:IsMaxLevel() then
		return false
	end

	return arg_32_0:GetTargeExp() <= arg_32_0.exp
end

function var_0_0.IsMaxLevel(arg_33_0)
	local var_33_0 = #pg.island_level.all

	return pg.island_level.all[var_33_0] <= arg_33_0.level
end

function var_0_0.StaticIsMaxLevel(arg_34_0, arg_34_1)
	local var_34_0 = #pg.island_level.all

	return arg_34_1 >= pg.island_level.all[var_34_0]
end

function var_0_0.GetLevel(arg_35_0)
	return arg_35_0.level
end

function var_0_0.GetExp(arg_36_0)
	return arg_36_0.exp
end

function var_0_0.GetUpgradeAwardsByLevel(arg_37_0, arg_37_1)
	if arg_37_0:StaticIsMaxLevel(arg_37_1) then
		return {}
	end

	local var_37_0 = pg.island_level[arg_37_1]

	assert(var_37_0)

	local var_37_1 = {}

	for iter_37_0, iter_37_1 in ipairs(var_37_0.island_level_award) do
		table.insert(var_37_1, {
			DROP_TYPE_ISLAND_ITEM,
			iter_37_1[1],
			iter_37_1[2]
		})
	end

	return var_37_1
end

function var_0_0.GetUpgradeAwards(arg_38_0)
	return (arg_38_0:GetUpgradeAwardsByLevel(arg_38_0.level))
end

function var_0_0.AddProsperity(arg_39_0, arg_39_1)
	if not arg_39_0:CanAddProsperity() then
		return
	end

	arg_39_0.prosperity = arg_39_0.prosperity + arg_39_1
end

function var_0_0.CanAddProsperity(arg_40_0)
	local var_40_0 = arg_40_0:GetMaxProsperityLevel()

	return pg.island_prosperity[var_40_0].prosperity > arg_40_0.prosperity
end

function var_0_0.GetProsperity(arg_41_0)
	return arg_41_0.prosperity
end

function var_0_0.GetMaxProsperityLevel(arg_42_0)
	local var_42_0 = pg.island_prosperity.all

	return var_42_0[#var_42_0]
end

function var_0_0.GetTargetProsperityByLevel(arg_43_0, arg_43_1)
	assert(pg.island_prosperity[arg_43_1])

	return pg.island_prosperity[arg_43_1].prosperity
end

function var_0_0.GetTargetProsperity(arg_44_0)
	local var_44_0 = 0
	local var_44_1 = arg_44_0:GetProsperity()

	for iter_44_0, iter_44_1 in ipairs(pg.island_prosperity.all) do
		local var_44_2 = arg_44_0:GetTargetProsperityByLevel(iter_44_1)

		if var_44_1 < var_44_2 then
			return var_44_2
		end
	end

	return var_44_0
end

function var_0_0.GetProsperityLevel(arg_45_0)
	local var_45_0 = arg_45_0:GetProsperity()

	for iter_45_0, iter_45_1 in ipairs(pg.island_prosperity.all) do
		if var_45_0 < arg_45_0:GetTargetProsperityByLevel(iter_45_1) then
			return iter_45_1
		end
	end

	return arg_45_0:GetMaxProsperityLevel()
end

function var_0_0.CanGetProsperityAwards(arg_46_0, arg_46_1)
	if arg_46_0:IsReceiveProsperityAwards(arg_46_1) then
		return false
	end

	local var_46_0 = pg.island_prosperity[arg_46_1]

	if not var_46_0 then
		return false
	end

	return var_46_0.prosperity <= arg_46_0:GetProsperity()
end

function var_0_0.AnyProsperityAwardCanGet(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(pg.island_prosperity.all) do
		if arg_47_0:CanGetProsperityAwards(iter_47_1) then
			return true
		end
	end

	return false
end

function var_0_0.IsReceiveProsperityAwards(arg_48_0, arg_48_1)
	return arg_48_0.prosperityList[arg_48_1] == true
end

function var_0_0.ReceiveProsperityAwards(arg_49_0, arg_49_1)
	arg_49_0.prosperityList[arg_49_1] = true
end

function var_0_0.GetProsperityAward(arg_50_0, arg_50_1)
	return pg.island_prosperity[arg_50_1].award_display
end

function var_0_0.getConfig(arg_51_0, arg_51_1)
	return pg.island_level[arg_51_0.configId][arg_51_1]
end

function var_0_0.UpdatePerDay(arg_52_0)
	arg_52_0:GetSignInAgency():ResetSignInCnt()
	arg_52_0:GetAccessAgency():ResetFreshInviteCodeFlag()
end

function var_0_0.UpdatePerSecond(arg_53_0)
	if arg_53_0.buildingAgency then
		arg_53_0.buildingAgency:UpdatePerSecond()
	end
end

return var_0_0

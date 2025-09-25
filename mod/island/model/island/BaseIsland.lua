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
	arg_1_0.gatherCollectAgency = IslandGatherCollectAgency.New(arg_1_0, arg_1_1)
	arg_1_0.buildingAgency = IslandBuildingAgency.New(arg_1_0, arg_1_1)
	arg_1_0.followerAgency = IslandFollowerAgency.New(arg_1_0)
	arg_1_0.activityNpcAgency = IslandActivityNpcAgency.New(arg_1_0)
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

function var_0_0.GetActivityNpcAgency(arg_2_0)
	return arg_2_0.activityNpcAgency
end

function var_0_0.GetFollowerAgency(arg_3_0)
	return arg_3_0.followerAgency
end

function var_0_0.GetAccessAgency(arg_4_0)
	return arg_4_0.accessAgency
end

function var_0_0.IsPrivate(arg_5_0)
	return false
end

function var_0_0.GetVisitorAgency(arg_6_0)
	return arg_6_0.visitorAgency
end

function var_0_0.GetAgoraAgency(arg_7_0)
	return arg_7_0.agoraAgency
end

function var_0_0.GetCharacterAgency(arg_8_0)
	return arg_8_0.characterAgency
end

function var_0_0.GetTechnologyAgency(arg_9_0)
	return arg_9_0.technologyAgency
end

function var_0_0.GetAblityAgency(arg_10_0)
	return arg_10_0.ablityAgency
end

function var_0_0.GetSignInAgency(arg_11_0)
	return arg_11_0.signInAgency
end

function var_0_0.GetTaskAgency(arg_12_0)
	return arg_12_0.taskAgency
end

function var_0_0.GetManageAgency(arg_13_0)
	return arg_13_0.manageAgency
end

function var_0_0.GetWildCollectAgency(arg_14_0)
	return arg_14_0.gatherCollectAgency
end

function var_0_0.GetBuildingAgency(arg_15_0)
	return arg_15_0.buildingAgency
end

function var_0_0.SetSpawnPointId(arg_16_0, arg_16_1)
	arg_16_0.spawnPointId = arg_16_1
end

function var_0_0.GetSpawnPointId(arg_17_0)
	local var_17_0 = arg_17_0.spawnPointId

	arg_17_0.spawnPointId = nil

	return var_17_0
end

function var_0_0.SetLastExitPosition(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_1 <= 0 then
		return
	end

	arg_18_0.lastExitPosition = {
		mapId = arg_18_1,
		position = arg_18_2,
		rotation = arg_18_3
	}
end

function var_0_0.GetLastExitPosition(arg_19_0)
	return arg_19_0.lastExitPosition
end

function var_0_0.GetMapId(arg_20_0)
	return arg_20_0.mapID
end

function var_0_0.SetMapId(arg_21_0, arg_21_1)
	local var_21_0 = pg.island_map[arg_21_1]

	if not var_21_0 then
		return
	end

	if not pg.TimeMgr.GetInstance():inTime(var_21_0.time) then
		return
	end

	arg_21_0.mapID = arg_21_1
end

function var_0_0.GetUnlockBuildingList(arg_22_0)
	if arg_22_0:IsMaxLevel() then
		return {}
	end

	return pg.island_level[arg_22_0.level].island_level_award
end

function var_0_0.IsNew(arg_23_0)
	return arg_23_0.name == ""
end

function var_0_0.CanModifyName(arg_24_0)
	return true
end

function var_0_0.SetName(arg_25_0, arg_25_1)
	arg_25_0.name = arg_25_1
end

function var_0_0.GetName(arg_26_0)
	if arg_26_0.name == "" then
		local var_26_0 = getProxy(PlayerProxy):getRawData().name

		return i18n("island_default_name", var_26_0)
	else
		return arg_26_0.name
	end
end

function var_0_0.SetManifesto(arg_27_0, arg_27_1)
	arg_27_0.manifesto = arg_27_1
end

function var_0_0.GetManifesto(arg_28_0)
	return arg_28_0.manifesto
end

function var_0_0.GetModifyNameConsume(arg_29_0)
	return {
		DROP_TYPE_RESOURCE,
		1,
		1
	}
end

function var_0_0.AddExp(arg_30_0, arg_30_1)
	if arg_30_0:IsMaxLevel() then
		return
	end

	arg_30_0.exp = arg_30_0.exp + arg_30_1
end

function var_0_0.Upgrade(arg_31_0)
	if arg_31_0:IsMaxLevel() then
		return
	end

	if arg_31_0:CanLevelUp() then
		arg_31_0.exp = arg_31_0:IsMaxLevel() and 0 or arg_31_0.exp - arg_31_0:GetTargeExp()

		arg_31_0:LevelUp()
	end
end

function var_0_0.LevelUp(arg_32_0)
	arg_32_0.level = arg_32_0.level + 1
	arg_32_0.configId = arg_32_0.level
end

function var_0_0.GetTargeExp(arg_33_0)
	local var_33_0 = pg.island_level[arg_33_0.level]

	assert(var_33_0)

	return var_33_0.island_exp
end

function var_0_0.CanLevelUp(arg_34_0)
	if arg_34_0:IsMaxLevel() then
		return false
	end

	return arg_34_0:GetTargeExp() <= arg_34_0.exp
end

function var_0_0.IsMaxLevel(arg_35_0)
	local var_35_0 = #pg.island_level.all

	return pg.island_level.all[var_35_0] <= arg_35_0.level
end

function var_0_0.StaticIsMaxLevel(arg_36_0, arg_36_1)
	local var_36_0 = #pg.island_level.all

	return arg_36_1 >= pg.island_level.all[var_36_0]
end

function var_0_0.GetLevel(arg_37_0)
	return arg_37_0.level
end

function var_0_0.GetExp(arg_38_0)
	return arg_38_0.exp
end

function var_0_0.GetUpgradeAwardsByLevel(arg_39_0, arg_39_1)
	if arg_39_0:StaticIsMaxLevel(arg_39_1) then
		return {}
	end

	local var_39_0 = pg.island_level[arg_39_1]

	assert(var_39_0)

	local var_39_1 = {}

	for iter_39_0, iter_39_1 in ipairs(var_39_0.island_level_award) do
		table.insert(var_39_1, {
			DROP_TYPE_ISLAND_ITEM,
			iter_39_1[1],
			iter_39_1[2]
		})
	end

	return var_39_1
end

function var_0_0.GetUpgradeAwards(arg_40_0)
	return (arg_40_0:GetUpgradeAwardsByLevel(arg_40_0.level))
end

function var_0_0.AddProsperity(arg_41_0, arg_41_1)
	if not arg_41_0:CanAddProsperity() then
		return
	end

	arg_41_0.prosperity = arg_41_0.prosperity + arg_41_1
end

function var_0_0.CanAddProsperity(arg_42_0)
	local var_42_0 = arg_42_0:GetMaxProsperityLevel()

	return pg.island_prosperity[var_42_0].prosperity > arg_42_0.prosperity
end

function var_0_0.GetProsperity(arg_43_0)
	return arg_43_0.prosperity
end

function var_0_0.GetMaxProsperityLevel(arg_44_0)
	local var_44_0 = pg.island_prosperity.all

	return var_44_0[#var_44_0]
end

function var_0_0.GetTargetProsperityByLevel(arg_45_0, arg_45_1)
	assert(pg.island_prosperity[arg_45_1])

	return pg.island_prosperity[arg_45_1].prosperity
end

function var_0_0.GetTargetProsperity(arg_46_0)
	local var_46_0 = 0
	local var_46_1 = arg_46_0:GetProsperity()

	for iter_46_0, iter_46_1 in ipairs(pg.island_prosperity.all) do
		local var_46_2 = arg_46_0:GetTargetProsperityByLevel(iter_46_1)

		if var_46_1 < var_46_2 then
			return var_46_2
		end
	end

	return var_46_0
end

function var_0_0.GetProsperityLevel(arg_47_0)
	local var_47_0 = arg_47_0:GetProsperity()

	for iter_47_0, iter_47_1 in ipairs(pg.island_prosperity.all) do
		if var_47_0 < arg_47_0:GetTargetProsperityByLevel(iter_47_1) then
			return iter_47_1
		end
	end

	return arg_47_0:GetMaxProsperityLevel()
end

function var_0_0.CanGetProsperityAwards(arg_48_0, arg_48_1)
	if arg_48_0:IsReceiveProsperityAwards(arg_48_1) then
		return false
	end

	local var_48_0 = pg.island_prosperity[arg_48_1]

	if not var_48_0 then
		return false
	end

	return var_48_0.prosperity <= arg_48_0:GetProsperity()
end

function var_0_0.AnyProsperityAwardCanGet(arg_49_0)
	for iter_49_0, iter_49_1 in ipairs(pg.island_prosperity.all) do
		if arg_49_0:CanGetProsperityAwards(iter_49_1) then
			return true
		end
	end

	return false
end

function var_0_0.IsReceiveProsperityAwards(arg_50_0, arg_50_1)
	return arg_50_0.prosperityList[arg_50_1] == true
end

function var_0_0.ReceiveProsperityAwards(arg_51_0, arg_51_1)
	arg_51_0.prosperityList[arg_51_1] = true
end

function var_0_0.GetProsperityAward(arg_52_0, arg_52_1)
	return pg.island_prosperity[arg_52_1].award_display
end

function var_0_0.getConfig(arg_53_0, arg_53_1)
	return pg.island_level[arg_53_0.configId][arg_53_1]
end

function var_0_0.UpdatePerDay(arg_54_0)
	arg_54_0:GetSignInAgency():ResetSignInCnt()
	arg_54_0:GetAccessAgency():ResetFreshInviteCodeFlag()
end

function var_0_0.UpdatePerSecond(arg_55_0)
	if arg_55_0.buildingAgency then
		arg_55_0.buildingAgency:UpdatePerSecond()
	end
end

return var_0_0

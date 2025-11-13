local var_0_0 = class("IslandController", import(".IslandBaseController"))

function var_0_0.Init(arg_1_0)
	arg_1_0.sceneData = IslandDataConvertor.Island2SceneData(arg_1_0.island)
	arg_1_0.mapId = arg_1_0.sceneData.mapId
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0.strollAllocator = IslandStrollAllocator.New(arg_2_0)
	arg_2_0.visibilityAllocator = IslandVisibilityAllocator.New(arg_2_0)
	arg_2_0.giftAllocator = IslandGiftAllocator.New(arg_2_0)
	arg_2_0.activityNpcAllocator = IslandActivityNpcAllocator.New(arg_2_0)
	arg_2_0.timeDelayCreate = IslandDelayCreationSystem.New(arg_2_0)
	arg_2_0.playerInputManager = PlayerInputManager.New(arg_2_0)
	arg_2_0.islandSyncMgr = IslandSyncMgr.New(arg_2_0)

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.sceneData.unitList) do
		if arg_2_0.visibilityAllocator:IsVisible(iter_2_1.id) then
			arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_1)
		end
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.sceneData.activityUnits) do
		if arg_2_0.activityNpcAllocator:IsVisible(iter_2_3.id) then
			arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_3)
		end
	end

	for iter_2_4, iter_2_5 in ipairs(arg_2_0.sceneData.giftUnits) do
		if arg_2_0.giftAllocator:IsVisible(iter_2_4) then
			arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_5)
		end
	end

	for iter_2_6, iter_2_7 in ipairs(arg_2_0.sceneData.systemList) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_SYSTEM, iter_2_7)
	end

	for iter_2_8, iter_2_9 in ipairs(arg_2_0.sceneData.systemUnits) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_9)
	end

	for iter_2_10, iter_2_11 in ipairs(arg_2_0.sceneData.strollUnits) do
		local var_2_0, var_2_1 = arg_2_0.strollAllocator:Allocator(iter_2_11:GetDefaultPathId(arg_2_0.mapId))

		iter_2_11:SetPath(var_2_0, var_2_1)
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_11)
	end

	for iter_2_12, iter_2_13 in ipairs(arg_2_0.sceneData.followUnits) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_13)
	end

	arg_2_0.timeDelayCreate:InitUnit()
end

function var_0_0.ResetPlayerPosition(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.sceneData.unitList) do
		if iter_3_1:IsPlayer() then
			arg_3_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, iter_3_1.id, IslandConst.UNIT_LIST_PLAYER, iter_3_1.position)
		end
	end
end

function var_0_0.OnCoreInitFinish(arg_4_0)
	arg_4_0:NotifiyCore(ISLAND_EVT.INIT_FINISH, arg_4_0.sceneData.camreaZoomData)
	arg_4_0:NotifiyIsland(ISLAND_EX_EVT.INIT_FINISH)
	arg_4_0.playerInputManager:Init()
	arg_4_0:InitSyncMgr()
	arg_4_0:InitStrollUnitsAwards()
end

function var_0_0.InitStrollUnitsAwards(arg_5_0)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.sceneData.strollUnits) do
		if iter_5_1:ExistActionFeedback() then
			arg_5_0:NotifiyCore(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, iter_5_1)
		end
	end
end

function var_0_0.GetMapID(arg_6_0)
	return arg_6_0.mapId
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_7_0.OnPlayerAdd)
	arg_7_0:AddIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_7_0.OnPlayerExit)
	arg_7_0:AddIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_7_0.OnPlayerChangeDress)
	arg_7_0:AddIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_7_0.OnShipChangeDress)
	arg_7_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_7_0.OnSyncDataUpdate)
	arg_7_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_7_0.OnSyncObjUpdate)
	arg_7_0:AddIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_7_0.OnCollectSlotUnitInit)
	arg_7_0:AddIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_UPDATE, arg_7_0.OnCollectSlotUnitUpdate)
	arg_7_0:AddIslandListener(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, arg_7_0.OnCollectSloSlotUnitRemove)
	arg_7_0:AddIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_7_0.OnStartDelegation)
	arg_7_0:AddIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_7_0.OnEndDelegation)
	arg_7_0:AddIslandListener(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, arg_7_0.OnGetAllDelegationAward)
	arg_7_0:AddIslandListener(IslandTaskAgency.TASK_ADDED, arg_7_0.OnTaskAdd)
	arg_7_0:AddIslandListener(IslandTaskAgency.TASK_FINISH, arg_7_0.OnFinishTask)
	arg_7_0:AddIslandListener(IslandTaskAgency.TASK_UPDATED, arg_7_0.OnUpdateTask)
	arg_7_0:AddIslandListener(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, arg_7_0.OnStartPlant)
	arg_7_0:AddIslandListener(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, arg_7_0.OnEndPlant)
	arg_7_0:AddIslandListener(IslandSlotCollectCommand.START_HAND_COLLECT_DONE, arg_7_0.OnStartHandCollect)
	arg_7_0:AddIslandListener(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, arg_7_0.OnHandPlantSlotChangeUnit)
	arg_7_0:AddIslandListener(IslandBuildingAgency.CHANGE_PRODUCT_MODEL, arg_7_0.OnProductPlaceChangeUnit)
	arg_7_0:AddIslandListener(IslandGatherCollectAgency.RemoveGatherUnit, arg_7_0.OnRemoveWildGatherDone)
	arg_7_0:AddIslandListener(IslandGatherCollectAgency.AddGatherUnit, arg_7_0.OnAddWildGatherDone)
	arg_7_0:AddIslandListener(ISLAND_EVT.CHANGE_SLOT_MODEL, arg_7_0.OnChangeSlotModel)
	arg_7_0:AddIslandListener(IslandOpenRestaurantCommand.OPEN_RESTAURANT, arg_7_0.OnOpenRestaurant)
	arg_7_0:AddIslandListener(IslandCloseRestaurantCommand.CLOSE_RESTAURANT, arg_7_0.OnCloseRestaurant)
	arg_7_0:AddIslandListener(IslandProxy.STORY_START, arg_7_0.OnStartStory)
	arg_7_0:AddIslandListener(IslandProxy.STORY_END, arg_7_0.OnEndStory)
	arg_7_0:AddIslandListener(IslandProxy.PERFORMANCE_START, arg_7_0.OnStartPerformance)
	arg_7_0:AddIslandListener(IslandProxy.PERFORMANCE_END, arg_7_0.OnEndPerformance)
	arg_7_0:AddIslandListener(IslandProxy.START_PATHFINDER, arg_7_0.OnStartPathFinder)
	arg_7_0:AddIslandListener(IslandProxy.END_PATHFINDER, arg_7_0.OnEndPathFinder)
	arg_7_0:AddIslandListener(IslandProxy.ACTIVE_OR_DISABLE_UNIT, arg_7_0.OnActiveOrDisableUnit)
	arg_7_0:AddIslandListener(IslandProxy.LINK_CORE, arg_7_0.OnLinkCore)
	arg_7_0:AddIslandListener(IslandBuildingAgency.GEN_ANIMAL_INT, arg_7_0.OnAnimalInit)
	arg_7_0:AddIslandListener(IslandNpcFeedbackAgency.NPC_ACTION_CHANGE, arg_7_0.OnNpcActionFeedBackChange)
	arg_7_0:AddIslandListener(IslandNpcFeedbackAgency.RESET_NPC_ACTIONS, arg_7_0.OnResetNpcActionFeedback)
	arg_7_0:AddIslandListener(IslandFollowerAgency.ADD_FOLLOWER, arg_7_0.OnAddFollower)
	arg_7_0:AddIslandListener(IslandFollowerAgency.DEL_FOLLOWER, arg_7_0.OnDelFollower)
	arg_7_0:AddIslandListener(ActivityProxy.ACTIVITY_UPDATED, arg_7_0.OnActivityUpdate)
	arg_7_0:AddIslandListener(IslandProxy.GEN_RECYCLEITEM, arg_7_0.OnGenRecycleItem)
	arg_7_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_ADD, arg_7_0.OnActivityNpcAdd)
	arg_7_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_UPDATE, arg_7_0.OnActivityNpcUpdate)
	arg_7_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_DEL, arg_7_0.OnActivityNpcDel)
	arg_7_0:AddIslandListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_7_0.OnSystemUnlock)
	arg_7_0:AddIslandListener(IslandProxy.LOCK_NPC_REFRESH, arg_7_0.OnLockNpcRefresh)
	arg_7_0:AddIslandListener(IslandProxy.RELEASE_NPC_REFRESH, arg_7_0.OnReleaseNpcRefresh)
	arg_7_0:AddIslandListener(IslandProxy.RESET_SP, arg_7_0.OnResetSp)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_8_0.OnPlayerAdd)
	arg_8_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_8_0.OnPlayerExit)
	arg_8_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_8_0.OnPlayerChangeDress)
	arg_8_0:RemoveIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_8_0.OnShipChangeDress)
	arg_8_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_8_0.OnSyncDataUpdate)
	arg_8_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_8_0.OnSyncObjUpdate)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_8_0.OnCollectSlotUnitInit)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_UPDATE, arg_8_0.OnCollectSlotUnitUpdate)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, arg_8_0.OnCollectSloSlotUnitRemove)
	arg_8_0:RemoveIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_8_0.OnStartDelegation)
	arg_8_0:RemoveIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_8_0.OnEndDelegation)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, arg_8_0.OnGetAllDelegationAward)
	arg_8_0:RemoveIslandListener(IslandTaskAgency.TASK_ADDED, arg_8_0.OnTaskAdd)
	arg_8_0:RemoveIslandListener(IslandTaskAgency.TASK_FINISH, arg_8_0.OnFinishTask)
	arg_8_0:RemoveIslandListener(IslandTaskAgency.TASK_UPDATED, arg_8_0.OnUpdateTask)
	arg_8_0:RemoveIslandListener(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, arg_8_0.OnStartPlant)
	arg_8_0:RemoveIslandListener(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, arg_8_0.OnEndPlant)
	arg_8_0:RemoveIslandListener(IslandSlotCollectCommand.START_HAND_COLLECT_DONE, arg_8_0.OnStartHandCollect)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, arg_8_0.OnHandPlantSlotChangeUnit)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.CHANGE_PRODUCT_MODEL, arg_8_0.OnProductPlaceChangeUnit)
	arg_8_0:RemoveIslandListener(IslandGatherCollectAgency.RemoveGatherUnit, arg_8_0.OnRemoveWildGatherDone)
	arg_8_0:RemoveIslandListener(IslandGatherCollectAgency.AddGatherUnit, arg_8_0.OnAddWildGatherDone)
	arg_8_0:RemoveIslandListener(ISLAND_EVT.CHANGE_SLOT_MODEL, arg_8_0.OnChangeSlotModel)
	arg_8_0:RemoveIslandListener(IslandOpenRestaurantCommand.OPEN_RESTAURANT, arg_8_0.OnOpenRestaurant)
	arg_8_0:RemoveIslandListener(IslandProxy.STORY_START, arg_8_0.OnStartStory)
	arg_8_0:RemoveIslandListener(IslandProxy.STORY_END, arg_8_0.OnEndStory)
	arg_8_0:RemoveIslandListener(IslandProxy.PERFORMANCE_START, arg_8_0.OnStartPerformance)
	arg_8_0:RemoveIslandListener(IslandProxy.PERFORMANCE_END, arg_8_0.OnEndPerformance)
	arg_8_0:RemoveIslandListener(IslandProxy.START_PATHFINDER, arg_8_0.OnStartPathFinder)
	arg_8_0:RemoveIslandListener(IslandProxy.END_PATHFINDER, arg_8_0.OnEndPathFinder)
	arg_8_0:RemoveIslandListener(IslandProxy.ACTIVE_OR_DISABLE_UNIT, arg_8_0.OnActiveOrDisableUnit)
	arg_8_0:RemoveIslandListener(IslandProxy.LINK_CORE, arg_8_0.OnLinkCore)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.GEN_ANIMAL_INT, arg_8_0.OnAnimalInit)
	arg_8_0:RemoveIslandListener(IslandNpcFeedbackAgency.NPC_ACTION_CHANGE, arg_8_0.OnNpcActionFeedBackChange)
	arg_8_0:RemoveIslandListener(IslandNpcFeedbackAgency.RESET_NPC_ACTIONS, arg_8_0.OnResetNpcActionFeedback)
	arg_8_0:RemoveIslandListener(IslandFollowerAgency.ADD_FOLLOWER, arg_8_0.OnAddFollower)
	arg_8_0:RemoveIslandListener(IslandFollowerAgency.DEL_FOLLOWER, arg_8_0.OnDelFollower)
	arg_8_0:RemoveIslandListener(ActivityProxy.ACTIVITY_UPDATED, arg_8_0.OnActivityUpdate)
	arg_8_0:RemoveIslandListener(IslandProxy.GEN_RECYCLEITEM, arg_8_0.OnGenRecycleItem)
	arg_8_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_ADD, arg_8_0.OnActivityNpcAdd)
	arg_8_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_UPDATE, arg_8_0.OnActivityNpcUpdate)
	arg_8_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_DEL, arg_8_0.OnActivityNpcDel)
	arg_8_0:RemoveIslandListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_8_0.OnSystemUnlock)
	arg_8_0:RemoveIslandListener(IslandProxy.LOCK_NPC_REFRESH, arg_8_0.OnLockNpcRefresh)
	arg_8_0:RemoveIslandListener(IslandProxy.RELEASE_NPC_REFRESH, arg_8_0.OnReleaseNpcRefresh)
	arg_8_0:RemoveIslandListener(IslandProxy.RESET_SP, arg_8_0.OnResetSp)
end

function var_0_0.OnResetSp(arg_9_0)
	local var_9_0 = arg_9_0.mapId
	local var_9_1 = pg.island_world_objects.get_id_list_by_mapId[var_9_0] or {}

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		local var_9_2 = pg.island_world_objects[iter_9_1]

		if var_9_2.unitId == 0 then
			spConfig = var_9_2

			break
		end
	end

	if not spConfig then
		return
	end

	local var_9_3 = BuildVector3(spConfig.param.position)
	local var_9_4 = BuildVector3(spConfig.param.rotation)
	local var_9_5 = getProxy(PlayerProxy):getRawData().id

	arg_9_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, var_9_5, IslandConst.UNIT_LIST_PLAYER, var_9_3)
	arg_9_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_ROT, var_9_5, IslandConst.UNIT_LIST_PLAYER, var_9_4)
end

function var_0_0.OnLockNpcRefresh(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.visibilityAllocator:LockNpc(arg_10_1, arg_10_2)
end

function var_0_0.OnReleaseNpcRefresh(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.visibilityAllocator:ReleaseNpc(arg_11_1, arg_11_2)
end

function var_0_0.OnSystemUnlock(arg_12_0, arg_12_1)
	arg_12_0:NotifiyCore(ISLAND_EVT.SYSTEM_UNLOCK, arg_12_1)
end

function var_0_0.OnActivityNpcAdd(arg_13_0, arg_13_1)
	arg_13_0.activityNpcAllocator:AddNpc(arg_13_1)
	arg_13_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcUpdate(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.activityNpcAllocator:DelNpc(arg_14_1)
	arg_14_0.activityNpcAllocator:AddNpc(arg_14_2)
	arg_14_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcDel(arg_15_0, arg_15_1)
	arg_15_0.activityNpcAllocator:DelNpc(arg_15_1)
	arg_15_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityUpdate(arg_16_0)
	arg_16_0.activityNpcAllocator:Flush()
end

function var_0_0.OnGenRecycleItem(arg_17_0, arg_17_1)
	local var_17_0 = IslandDataConvertor.GenDelayRecycleIslandUnit(arg_17_1)

	arg_17_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_17_0)
end

function var_0_0.OnAddFollower(arg_18_0, arg_18_1)
	local var_18_0 = #arg_18_0.sceneData.followUnits > 0
	local var_18_1 = arg_18_0:GetIsland():GetCharacterAgency():GetShipById(arg_18_1)
	local var_18_2 = var_18_1:GetModelUnit()
	local var_18_3 = arg_18_0:GetView():GetPlayerPosition()
	local var_18_4 = IslandFollowerUnitVO.New(var_18_1.id, arg_18_1, var_18_2, var_18_3, Vector3(0, 0, 0), not var_18_0)

	table.insert(arg_18_0.sceneData.followUnits, var_18_4)
	arg_18_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_18_4)

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.sceneData.strollUnits) do
		if var_18_1:getConfig("unit_id") == iter_18_1.config.unit_id then
			arg_18_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_STROLL, iter_18_1.id)
		end
	end

	arg_18_0:NotifiyCore(ISLAND_EVT.ADD_FOLLOWER, var_18_4.id)
end

function var_0_0.OnDelFollower(arg_19_0, arg_19_1)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.sceneData.followUnits) do
		if iter_19_1.id == arg_19_1 then
			var_19_0 = iter_19_0

			break
		end
	end

	if var_19_0 <= 0 then
		return
	end

	local var_19_1 = table.remove(arg_19_0.sceneData.followUnits, var_19_0)

	arg_19_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_FOLLOW, var_19_1.id)

	if var_19_1:IsRandomizer() and #arg_19_0.sceneData.followUnits > 0 then
		local var_19_2 = arg_19_0.sceneData.followUnits[1]

		var_19_2:ActiveRandomizer()
		arg_19_0:NotifiyCore(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, var_19_2.id)
	end

	local var_19_3 = arg_19_0:GetIsland():GetCharacterAgency():GetShipById(arg_19_1)

	for iter_19_2, iter_19_3 in ipairs(arg_19_0.sceneData.strollUnits) do
		if var_19_3:getConfig("unit_id") == iter_19_3.config.unit_id then
			arg_19_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_19_3)
		end
	end

	arg_19_0:NotifiyCore(ISLAND_EVT.DEL_FOLLOWER, var_19_1.id)
end

function var_0_0.OnResetNpcActionFeedback(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0.sceneData.strollUnits) do
		if iter_20_1:ExistActionFeedback() then
			iter_20_1:ClearActionFeedback()
			arg_20_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_20_1)
		end
	end

	IslandDataConvertor.DistributeAward4StrollUnits(arg_20_0.sceneData.strollUnits, arg_20_0:GetIsland())
	arg_20_0:InitStrollUnitsAwards()
end

function var_0_0.OnNpcActionFeedBackChange(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.sceneData.strollUnits) do
		if iter_21_1.id == arg_21_1 and iter_21_1:ExistActionFeedback() then
			iter_21_1:ClearActionFeedback()
			arg_21_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_21_1)
		end
	end
end

function var_0_0.OnLinkCore(arg_22_0, arg_22_1, ...)
	arg_22_0:NotifiyCore(arg_22_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	arg_23_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_23_1, arg_23_2, arg_23_3)
end

function var_0_0.OnStartPathFinder(arg_24_0, arg_24_1)
	arg_24_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_24_1)
end

function var_0_0.OnEndPathFinder(arg_25_0)
	arg_25_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_26_0)
	arg_26_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_26_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_27_0, arg_27_1)
	arg_27_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_27_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)

	if arg_27_1 then
		arg_27_0:OnUpdateTask()
	end
end

function var_0_0.OnStartStory(arg_28_0)
	arg_28_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_29_0, arg_29_1)
	arg_29_0:NotifiyCore(ISLAND_EVT.END_STORY)

	if arg_29_1 then
		arg_29_0.visibilityAllocator:Flush()
	end
end

function var_0_0.OnTaskAdd(arg_30_0)
	arg_30_0.visibilityAllocator:Flush()
	arg_30_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_30_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_31_0)
	arg_31_0.visibilityAllocator:Flush()
	arg_31_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_31_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnUpdateTask(arg_32_0)
	arg_32_0:Debounce("RefreshTask", function()
		if not arg_32_0.visibilityAllocator then
			return
		end

		arg_32_0.visibilityAllocator:Flush()
		arg_32_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
		arg_32_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	end, 0.5, false)()
end

function var_0_0.Debounce(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	if not arg_34_0.__debouncers then
		arg_34_0.__debouncers = {}
	end

	if not arg_34_0.__debouncers[arg_34_1] then
		arg_34_0.__debouncers[arg_34_1] = debounce(arg_34_2, arg_34_3, arg_34_4)
	end

	return arg_34_0.__debouncers[arg_34_1]
end

function var_0_0.OnPlayerAdd(arg_35_0, arg_35_1)
	local var_35_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_35_1.player, arg_35_0.mapId, arg_35_0:GetIsland().id)

	arg_35_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_35_0, function(arg_36_0)
		arg_35_0.islandSyncMgr:OnVisitorEnter(arg_35_1.player.id, arg_36_0)
	end)
end

function var_0_0.OnPlayerExit(arg_37_0, arg_37_1)
	arg_37_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_37_1.id)
	arg_37_0.islandSyncMgr:OnVisitorExit(arg_37_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_38_1, arg_38_2)
end

function var_0_0.OnShipChangeDress(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	arg_39_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
end

function var_0_0.OnStartPlant(arg_40_0, arg_40_1)
	local var_40_0

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.sceneData.productSystems) do
		if iter_40_1.id == arg_40_1.build_id then
			var_40_0 = iter_40_1

			break
		end
	end

	if not var_40_0 then
		return
	end

	local var_40_1 = var_40_0:GetUnitIdBySlotId(arg_40_1.area_id)

	arg_40_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_40_1)

	local var_40_2 = var_40_0:GenHandPlantUnitBySlotData(arg_40_1.area_id, arg_40_1.formula_id)

	arg_40_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_40_2)
	arg_40_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_40_1)
end

function var_0_0.OnEndPlant(arg_41_0, arg_41_1)
	local var_41_0

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.sceneData.productSystems) do
		if iter_41_1.id == arg_41_1.build_id then
			var_41_0 = iter_41_1

			break
		end
	end

	if not var_41_0 then
		return
	end

	local var_41_1 = var_41_0:GetUnitIdBySlotId(arg_41_1.area_id)

	arg_41_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_41_1)

	local var_41_2 = var_41_0:GenHandPlantUnitBySlotData(arg_41_1.area_id)

	arg_41_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_41_2)
	arg_41_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_41_1)
end

function var_0_0.OnStartDelegation(arg_42_0, arg_42_1)
	local var_42_0

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.sceneData.systemList) do
		if isa(iter_42_1, IslandCharacterSystemVO) and iter_42_1.id == arg_42_1.build_id then
			var_42_0 = iter_42_1

			break
		end
	end

	if not var_42_0 then
		return
	end

	local var_42_1

	for iter_42_2, iter_42_3 in ipairs(arg_42_0.sceneData.productSystems) do
		if iter_42_3.id == arg_42_1.build_id then
			var_42_1 = iter_42_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_42_1.build_id) then
		local var_42_2 = pg.island_production_slot[arg_42_1.area_id]

		for iter_42_4, iter_42_5 in ipairs(var_42_2.exclusion_slot) do
			local var_42_3 = var_42_1:GetUnitIdBySlotId(iter_42_5)
			local var_42_4 = var_42_1:GetUnitVOByUnitId(var_42_3)

			if var_42_4 then
				var_42_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_42_5 = var_42_0:GetUnit(arg_42_1.ship_id, arg_42_1.area_id, true)

	if var_42_5 then
		arg_42_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_42_5)
	end

	arg_42_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_42_1, var_42_1)
end

function var_0_0.OnEndDelegation(arg_43_0, arg_43_1)
	local var_43_0

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.sceneData.systemList) do
		if isa(iter_43_1, IslandCharacterSystemVO) and iter_43_1.id == arg_43_1.build_id then
			var_43_0 = iter_43_1

			break
		end
	end

	if not var_43_0 then
		return
	end

	arg_43_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_43_1)

	local var_43_1 = var_43_0:GetUnitShipIdBySlotId(arg_43_1.ship_id, arg_43_1.area_id)

	if var_43_1 then
		arg_43_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_43_1)
	end

	if arg_43_1.remainReward then
		return
	end

	local var_43_2

	for iter_43_2, iter_43_3 in ipairs(arg_43_0.sceneData.productSystems) do
		if iter_43_3.id == arg_43_1.build_id then
			var_43_2 = iter_43_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_43_1.build_id) then
		local var_43_3 = pg.island_production_slot[arg_43_1.area_id]

		for iter_43_4, iter_43_5 in ipairs(var_43_3.exclusion_slot) do
			local var_43_4 = var_43_2:GetUnitIdBySlotId(iter_43_5)

			arg_43_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_43_4)

			local var_43_5 = var_43_2:GenHandPlantUnitBySlotData(iter_43_5)

			arg_43_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_43_5)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_44_0, arg_44_1)
	local var_44_0

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.sceneData.systemList) do
		if isa(iter_44_1, IslandCharacterSystemVO) and iter_44_1.id == arg_44_1.build_id then
			var_44_0 = iter_44_1

			break
		end
	end

	if not var_44_0 then
		return
	end

	local var_44_1

	for iter_44_2, iter_44_3 in ipairs(arg_44_0.sceneData.productSystems) do
		if iter_44_3.id == arg_44_1.build_id then
			var_44_1 = iter_44_3

			break
		end
	end

	if arg_44_1.build_id == IslandProductConst.FarmlandPlaceId or arg_44_1.build_id == IslandProductConst.OrchardPlaceId or arg_44_1.build_id == IslandProductConst.GardenPlaceId then
		local var_44_2 = pg.island_production_slot[arg_44_1.area_id]

		for iter_44_4, iter_44_5 in ipairs(var_44_2.exclusion_slot) do
			local var_44_3 = var_44_1:GetUnitIdBySlotId(iter_44_5)

			arg_44_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_44_3)

			local var_44_4 = var_44_1:GenHandPlantUnitBySlotData(iter_44_5)

			arg_44_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_44_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_45_0, arg_45_1)
	local var_45_0

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.sceneData.productSystems) do
		if iter_45_1.id == IslandProductConst.FarmlandPlaceId then
			var_45_0 = iter_45_1

			break
		end
	end

	if not var_45_0 then
		return
	end

	arg_45_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_45_1.id)

	local var_45_1 = var_45_0:GetUnitVOByUnitId(arg_45_1.id)

	var_45_1.modelId = arg_45_1.modelId

	arg_45_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_45_1)
end

function var_0_0.OnStartHandCollect(arg_46_0, arg_46_1)
	local var_46_0

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.sceneData.productSystems) do
		if iter_46_1.id == arg_46_1.build_id then
			var_46_0 = iter_46_1

			break
		end
	end

	if not var_46_0 then
		return
	end

	local var_46_1 = var_46_0:GetUnitIdBySlotId(arg_46_1.area_id)

	arg_46_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_46_1)
	arg_46_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_46_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_47_0, arg_47_1)
	local var_47_0

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.sceneData.productSystems) do
		if iter_47_1.id == arg_47_1.build_id then
			var_47_0 = iter_47_1

			break
		end
	end

	if not var_47_0 then
		return
	end

	local var_47_1 = var_47_0:GetUnitIdBySlotId(arg_47_1.slotId)

	arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_47_1)

	local var_47_2 = var_47_0:GenHandPlantUnitBySlotData(arg_47_1.slotId)

	arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_47_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_1.build_id
	local var_48_1

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.sceneData.productSystems) do
		if iter_48_1.id == var_48_0 then
			var_48_1 = iter_48_1

			break
		end
	end

	if not var_48_1 then
		return
	end

	local var_48_2 = var_48_1:GetPlaceModelId(false)

	arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_48_2)

	local var_48_3 = var_48_1:GetPlaceModelUnit(true)

	arg_48_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_48_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_49_0, arg_49_1)
	arg_49_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_49_1.unitId)
	arg_49_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_49_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_50_0, arg_50_1)
	local var_50_0 = IslandDataConvertor.GenWildGatherUnit(arg_50_1)

	arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_50_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.slotId
	local var_51_1 = pg.island_production_slot[var_51_0].place
	local var_51_2

	for iter_51_0, iter_51_1 in ipairs(arg_51_0.sceneData.productSystems) do
		if iter_51_1.id == var_51_1 then
			var_51_2 = iter_51_1

			break
		end
	end

	if not var_51_2 then
		return
	end

	local var_51_3 = var_51_2:InitHandCollectSlotBySlotId(var_51_0)

	if var_51_3 then
		arg_51_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_51_3)
	end
end

function var_0_0.OnCollectSlotUnitUpdate(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.slotId
	local var_52_1 = pg.island_production_slot[var_52_0].place
	local var_52_2

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.productSystems) do
		if iter_52_1.id == var_52_1 then
			var_52_2 = iter_52_1

			break
		end
	end

	if not var_52_2 then
		return
	end

	local var_52_3 = var_52_2:GetUnitIdBySlotId(arg_52_1.slotId)

	if var_52_3 then
		arg_52_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_52_3)
		arg_52_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_52_3)
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.slotId
	local var_53_1 = pg.island_production_slot[var_53_0].place
	local var_53_2

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.sceneData.productSystems) do
		if iter_53_1.id == var_53_1 then
			var_53_2 = iter_53_1

			break
		end
	end

	if not var_53_2 then
		return
	end

	local var_53_3 = var_53_2:GetHandCollectSlotBySlotId(var_53_0)

	arg_53_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_53_3)
end

function var_0_0.OnSyncDataUpdate(arg_54_0, arg_54_1)
	arg_54_0.islandSyncMgr:HandleSyncData(arg_54_1)
end

function var_0_0.OnSyncObjUpdate(arg_55_0, arg_55_1)
	arg_55_0.islandSyncMgr:HandleSyncObj(arg_55_1)
end

function var_0_0.Update(arg_56_0)
	arg_56_0.playerInputManager:Update()
	arg_56_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_57_0)
	if arg_57_0.playerInputManager then
		arg_57_0.playerInputManager:Dispose()

		arg_57_0.playerInputManager = nil
	end

	if arg_57_0.islandSyncMgr then
		arg_57_0.islandSyncMgr:Dispose()

		arg_57_0.islandSyncMgr = nil
	end

	if arg_57_0.strollAllocator then
		arg_57_0.strollAllocator:Dispose()

		arg_57_0.strollAllocator = nil
	end

	if arg_57_0.visibilityAllocator then
		arg_57_0.visibilityAllocator:Dispose()

		arg_57_0.visibilityAllocator = nil
	end

	if arg_57_0.giftAllocator then
		arg_57_0.giftAllocator:Dispose()

		arg_57_0.giftAllocator = nil
	end

	if arg_57_0.timeDelayCreate then
		arg_57_0.timeDelayCreate:Dispose()

		arg_57_0.timeDelayCreate = nil
	end

	if arg_57_0.activityNpcAllocator then
		arg_57_0.activityNpcAllocator:Dispose()

		arg_57_0.activityNpcAllocator = nil
	end

	arg_57_0.__debouncers = nil
end

function var_0_0.OnAnimalInit(arg_58_0, arg_58_1)
	local var_58_0

	for iter_58_0, iter_58_1 in ipairs(arg_58_0.sceneData.productSystems) do
		if iter_58_1.id == IslandProductConst.PasturePlaceId then
			var_58_0 = iter_58_1

			break
		end
	end

	if not var_58_0 then
		return
	end

	local var_58_1 = arg_58_1.slotId

	for iter_58_2, iter_58_3 in ipairs(arg_58_1.aniList) do
		local var_58_2 = var_58_0:GenAnimalByAnialConfig(iter_58_3, var_58_1)

		arg_58_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_58_2)
	end
end

function var_0_0.IsPlayerInTimeline(arg_59_0)
	return arg_59_0.islandSyncMgr.player:InTimeline()
end

function var_0_0.InitSyncMgr(arg_60_0)
	arg_60_0.islandSyncMgr:Init(arg_60_0.sceneData.unitList)
	arg_60_0:NotifiyCore(ISLAND_EVT.INIT_INTERACTION_OP_VIEW)
end

function var_0_0.SetVisitorSyncData(arg_61_0, arg_61_1, arg_61_2)
	arg_61_0:NotifiyCore(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_61_1, arg_61_2)
end

function var_0_0.WorldObjectInterAction(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	arg_62_3 = arg_62_3 or 1

	local var_62_0 = _.detect(arg_62_0.sceneData.unitList, function(arg_63_0)
		return arg_63_0.id == arg_62_1
	end)

	if not var_62_0 or not var_62_0:Interactable() then
		return
	end

	local var_62_1 = var_62_0:GetEmptySlot()

	if not var_62_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_interact_point"))

		return
	end

	local function var_62_2()
		var_62_1:Lock(arg_62_2)
		arg_62_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_62_0, var_62_1, arg_62_3)
	end

	arg_62_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_62_1, var_62_1.id, arg_62_3, function(arg_65_0)
		if arg_65_0 then
			var_62_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_66_0, arg_66_1, arg_66_2, arg_66_3, arg_66_4)
	arg_66_3 = arg_66_3 or 1

	local var_66_0 = _.detect(arg_66_0.sceneData.unitList, function(arg_67_0)
		return arg_67_0.id == arg_66_1
	end)

	if not var_66_0 or not var_66_0:Interactable() then
		return
	end

	local var_66_1 = var_66_0:GetSlotById(arg_66_4)

	var_66_1:Lock(arg_66_2)
	arg_66_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_66_0, var_66_1, arg_66_3)
end

function var_0_0.WorldObjectInterActionEnd(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = _.detect(arg_68_0.sceneData.unitList, function(arg_69_0)
		return arg_69_0.id == arg_68_1
	end)

	if not var_68_0 or not var_68_0:Interactable() then
		return
	end

	local var_68_1 = var_68_0:GetUsingSlot(arg_68_2)

	local function var_68_2()
		local var_70_0 = Clone(var_68_1)

		var_68_1:Release()
		arg_68_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_68_0, var_70_0)
	end

	arg_68_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_68_1, var_68_1.id, function(arg_71_0)
		if arg_71_0 then
			var_68_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = _.detect(arg_72_0.sceneData.unitList, function(arg_73_0)
		return arg_73_0.id == arg_72_1
	end)

	if not var_72_0 or not var_72_0:Interactable() then
		return
	end

	local var_72_1 = var_72_0:GetUsingSlot(arg_72_2)
	local var_72_2 = Clone(var_72_1)

	var_72_1:Release()
	arg_72_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_72_0, var_72_2)
end

function var_0_0.WorldObjectInitStatus(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = _.detect(arg_74_0.sceneData.unitList, function(arg_75_0)
		return arg_75_0.id == arg_74_1
	end)

	warning("init", arg_74_1, arg_74_2, var_74_0)

	if not var_74_0 or not var_74_0:Interactable() then
		return
	end

	arg_74_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_74_0, arg_74_2)
end

function var_0_0.OnOpenRestaurant(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_1.restId
	local var_76_1 = arg_76_1.postList
	local var_76_2

	for iter_76_0, iter_76_1 in ipairs(arg_76_0.sceneData.systemList) do
		if isa(iter_76_1, IslandManageSystemVO) and iter_76_1.id == var_76_0 then
			var_76_2 = iter_76_1

			break
		end
	end

	if not var_76_2 then
		return
	end

	local var_76_3 = var_76_2:GetUnits(var_76_1)

	for iter_76_2, iter_76_3 in ipairs(var_76_3) do
		arg_76_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_76_3)
	end

	arg_76_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_76_2)
end

function var_0_0.OnCloseRestaurant(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_1.restId
	local var_77_1 = arg_77_1.postList
	local var_77_2

	for iter_77_0, iter_77_1 in ipairs(arg_77_0.sceneData.systemList) do
		if isa(iter_77_1, IslandManageSystemVO) and iter_77_1.id == var_77_0 then
			var_77_2 = iter_77_1

			break
		end
	end

	if not var_77_2 then
		return
	end

	arg_77_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_77_2)

	local var_77_3 = var_77_2:GetUnits(var_77_1)

	for iter_77_2, iter_77_3 in ipairs(var_77_3) do
		arg_77_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_77_3.id)
	end
end

return var_0_0

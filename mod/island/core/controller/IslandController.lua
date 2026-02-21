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
	arg_4_0:InitStrollUnitsAwards()
	arg_4_0:InitSyncMgr()
	arg_4_0:InitVisitor()
end

function var_0_0.InitVisitor(arg_5_0)
	local var_5_0 = arg_5_0.island:GetVisitorAgency():GetMapVisitorList()

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		if not iter_5_1:IsSelf() then
			arg_5_0:OnPlayerAdd({
				player = iter_5_1
			})
		else
			arg_5_0.islandSyncMgr:OnVisitorEnter(iter_5_1.id, nil)
		end
	end
end

function var_0_0.InitStrollUnitsAwards(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.sceneData.strollUnits) do
		if iter_6_1:ExistActionFeedback() then
			arg_6_0:NotifiyCore(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, iter_6_1)
		end
	end
end

function var_0_0.GetMapID(arg_7_0)
	return arg_7_0.mapId
end

function var_0_0.AddListeners(arg_8_0)
	arg_8_0:AddIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_8_0.OnPlayerAdd)
	arg_8_0:AddIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_8_0.OnPlayerExit)
	arg_8_0:AddIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_8_0.OnPlayerChangeDress)
	arg_8_0:AddIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_8_0.OnShipChangeDress)
	arg_8_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_8_0.OnSyncDataUpdate)
	arg_8_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_8_0.OnSyncObjUpdate)
	arg_8_0:AddIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_8_0.OnCollectSlotUnitInit)
	arg_8_0:AddIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_UPDATE, arg_8_0.OnCollectSlotUnitUpdate)
	arg_8_0:AddIslandListener(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, arg_8_0.OnCollectSloSlotUnitRemove)
	arg_8_0:AddIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_8_0.OnStartDelegation)
	arg_8_0:AddIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_8_0.OnEndDelegation)
	arg_8_0:AddIslandListener(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, arg_8_0.OnGetAllDelegationAward)
	arg_8_0:AddIslandListener(IslandTaskAgency.TASK_ADDED, arg_8_0.OnTaskAdd)
	arg_8_0:AddIslandListener(IslandTaskAgency.TASK_FINISH, arg_8_0.OnFinishTask)
	arg_8_0:AddIslandListener(IslandTaskAgency.TASK_UPDATED, arg_8_0.OnUpdateTask)
	arg_8_0:AddIslandListener(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, arg_8_0.OnStartPlant)
	arg_8_0:AddIslandListener(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, arg_8_0.OnEndPlant)
	arg_8_0:AddIslandListener(IslandSlotCollectCommand.START_HAND_COLLECT_DONE, arg_8_0.OnStartHandCollect)
	arg_8_0:AddIslandListener(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, arg_8_0.OnHandPlantSlotChangeUnit)
	arg_8_0:AddIslandListener(IslandBuildingAgency.CHANGE_PRODUCT_MODEL, arg_8_0.OnProductPlaceChangeUnit)
	arg_8_0:AddIslandListener(IslandGatherCollectAgency.RemoveGatherUnit, arg_8_0.OnRemoveWildGatherDone)
	arg_8_0:AddIslandListener(IslandGatherCollectAgency.AddGatherUnit, arg_8_0.OnAddWildGatherDone)
	arg_8_0:AddIslandListener(ISLAND_EVT.CHANGE_SLOT_MODEL, arg_8_0.OnChangeSlotModel)
	arg_8_0:AddIslandListener(IslandOpenRestaurantCommand.OPEN_RESTAURANT, arg_8_0.OnOpenRestaurant)
	arg_8_0:AddIslandListener(IslandCloseRestaurantCommand.CLOSE_RESTAURANT, arg_8_0.OnCloseRestaurant)
	arg_8_0:AddIslandListener(IslandProxy.STORY_START, arg_8_0.OnStartStory)
	arg_8_0:AddIslandListener(IslandProxy.STORY_END, arg_8_0.OnEndStory)
	arg_8_0:AddIslandListener(IslandProxy.PERFORMANCE_START, arg_8_0.OnStartPerformance)
	arg_8_0:AddIslandListener(IslandProxy.PERFORMANCE_END, arg_8_0.OnEndPerformance)
	arg_8_0:AddIslandListener(IslandProxy.START_PATHFINDER, arg_8_0.OnStartPathFinder)
	arg_8_0:AddIslandListener(IslandProxy.END_PATHFINDER, arg_8_0.OnEndPathFinder)
	arg_8_0:AddIslandListener(IslandProxy.ACTIVE_OR_DISABLE_UNIT, arg_8_0.OnActiveOrDisableUnit)
	arg_8_0:AddIslandListener(IslandProxy.LINK_CORE, arg_8_0.OnLinkCore)
	arg_8_0:AddIslandListener(IslandBuildingAgency.GEN_ANIMAL_INT, arg_8_0.OnAnimalInit)
	arg_8_0:AddIslandListener(IslandBuildingAgency.SLOT_DELEGATE_INIT, arg_8_0.OnSlotDelegateInit)
	arg_8_0:AddIslandListener(IslandNpcFeedbackAgency.NPC_ACTION_CHANGE, arg_8_0.OnNpcActionFeedBackChange)
	arg_8_0:AddIslandListener(IslandNpcFeedbackAgency.RESET_NPC_ACTIONS, arg_8_0.OnResetNpcActionFeedback)
	arg_8_0:AddIslandListener(IslandFollowerAgency.ADD_FOLLOWER, arg_8_0.OnAddFollower)
	arg_8_0:AddIslandListener(IslandFollowerAgency.DEL_FOLLOWER, arg_8_0.OnDelFollower)
	arg_8_0:AddIslandListener(ActivityProxy.ACTIVITY_UPDATED, arg_8_0.OnActivityUpdate)
	arg_8_0:AddIslandListener(IslandProxy.GEN_RECYCLEITEM, arg_8_0.OnGenRecycleItem)
	arg_8_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_ADD, arg_8_0.OnActivityNpcAdd)
	arg_8_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_UPDATE, arg_8_0.OnActivityNpcUpdate)
	arg_8_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_DEL, arg_8_0.OnActivityNpcDel)
	arg_8_0:AddIslandListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_8_0.OnSystemUnlock)
	arg_8_0:AddIslandListener(IslandProxy.LOCK_NPC_REFRESH, arg_8_0.OnLockNpcRefresh)
	arg_8_0:AddIslandListener(IslandProxy.RELEASE_NPC_REFRESH, arg_8_0.OnReleaseNpcRefresh)
	arg_8_0:AddIslandListener(IslandProxy.RESET_SP, arg_8_0.OnResetSp)
	arg_8_0:AddIslandListener(IslandFishingAgency.BAIT_UPDATE, arg_8_0.OnBaitUpdate)
end

function var_0_0.RemoveListeners(arg_9_0)
	arg_9_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_9_0.OnPlayerAdd)
	arg_9_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_9_0.OnPlayerExit)
	arg_9_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_9_0.OnPlayerChangeDress)
	arg_9_0:RemoveIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_9_0.OnShipChangeDress)
	arg_9_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_9_0.OnSyncDataUpdate)
	arg_9_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_9_0.OnSyncObjUpdate)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_9_0.OnCollectSlotUnitInit)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_UPDATE, arg_9_0.OnCollectSlotUnitUpdate)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, arg_9_0.OnCollectSloSlotUnitRemove)
	arg_9_0:RemoveIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_9_0.OnStartDelegation)
	arg_9_0:RemoveIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_9_0.OnEndDelegation)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, arg_9_0.OnGetAllDelegationAward)
	arg_9_0:RemoveIslandListener(IslandTaskAgency.TASK_ADDED, arg_9_0.OnTaskAdd)
	arg_9_0:RemoveIslandListener(IslandTaskAgency.TASK_FINISH, arg_9_0.OnFinishTask)
	arg_9_0:RemoveIslandListener(IslandTaskAgency.TASK_UPDATED, arg_9_0.OnUpdateTask)
	arg_9_0:RemoveIslandListener(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, arg_9_0.OnStartPlant)
	arg_9_0:RemoveIslandListener(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, arg_9_0.OnEndPlant)
	arg_9_0:RemoveIslandListener(IslandSlotCollectCommand.START_HAND_COLLECT_DONE, arg_9_0.OnStartHandCollect)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, arg_9_0.OnHandPlantSlotChangeUnit)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.CHANGE_PRODUCT_MODEL, arg_9_0.OnProductPlaceChangeUnit)
	arg_9_0:RemoveIslandListener(IslandGatherCollectAgency.RemoveGatherUnit, arg_9_0.OnRemoveWildGatherDone)
	arg_9_0:RemoveIslandListener(IslandGatherCollectAgency.AddGatherUnit, arg_9_0.OnAddWildGatherDone)
	arg_9_0:RemoveIslandListener(ISLAND_EVT.CHANGE_SLOT_MODEL, arg_9_0.OnChangeSlotModel)
	arg_9_0:RemoveIslandListener(IslandOpenRestaurantCommand.OPEN_RESTAURANT, arg_9_0.OnOpenRestaurant)
	arg_9_0:RemoveIslandListener(IslandProxy.STORY_START, arg_9_0.OnStartStory)
	arg_9_0:RemoveIslandListener(IslandProxy.STORY_END, arg_9_0.OnEndStory)
	arg_9_0:RemoveIslandListener(IslandProxy.PERFORMANCE_START, arg_9_0.OnStartPerformance)
	arg_9_0:RemoveIslandListener(IslandProxy.PERFORMANCE_END, arg_9_0.OnEndPerformance)
	arg_9_0:RemoveIslandListener(IslandProxy.START_PATHFINDER, arg_9_0.OnStartPathFinder)
	arg_9_0:RemoveIslandListener(IslandProxy.END_PATHFINDER, arg_9_0.OnEndPathFinder)
	arg_9_0:RemoveIslandListener(IslandProxy.ACTIVE_OR_DISABLE_UNIT, arg_9_0.OnActiveOrDisableUnit)
	arg_9_0:RemoveIslandListener(IslandProxy.LINK_CORE, arg_9_0.OnLinkCore)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.GEN_ANIMAL_INT, arg_9_0.OnAnimalInit)
	arg_9_0:RemoveIslandListener(IslandBuildingAgency.SLOT_DELEGATE_INIT, arg_9_0.OnSlotDelegateInit)
	arg_9_0:RemoveIslandListener(IslandNpcFeedbackAgency.NPC_ACTION_CHANGE, arg_9_0.OnNpcActionFeedBackChange)
	arg_9_0:RemoveIslandListener(IslandNpcFeedbackAgency.RESET_NPC_ACTIONS, arg_9_0.OnResetNpcActionFeedback)
	arg_9_0:RemoveIslandListener(IslandFollowerAgency.ADD_FOLLOWER, arg_9_0.OnAddFollower)
	arg_9_0:RemoveIslandListener(IslandFollowerAgency.DEL_FOLLOWER, arg_9_0.OnDelFollower)
	arg_9_0:RemoveIslandListener(ActivityProxy.ACTIVITY_UPDATED, arg_9_0.OnActivityUpdate)
	arg_9_0:RemoveIslandListener(IslandProxy.GEN_RECYCLEITEM, arg_9_0.OnGenRecycleItem)
	arg_9_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_ADD, arg_9_0.OnActivityNpcAdd)
	arg_9_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_UPDATE, arg_9_0.OnActivityNpcUpdate)
	arg_9_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_DEL, arg_9_0.OnActivityNpcDel)
	arg_9_0:RemoveIslandListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_9_0.OnSystemUnlock)
	arg_9_0:RemoveIslandListener(IslandProxy.LOCK_NPC_REFRESH, arg_9_0.OnLockNpcRefresh)
	arg_9_0:RemoveIslandListener(IslandProxy.RELEASE_NPC_REFRESH, arg_9_0.OnReleaseNpcRefresh)
	arg_9_0:RemoveIslandListener(IslandProxy.RESET_SP, arg_9_0.OnResetSp)
	arg_9_0:RemoveIslandListener(IslandFishingAgency.BAIT_UPDATE, arg_9_0.OnBaitUpdate)
end

function var_0_0.OnBaitUpdate(arg_10_0, arg_10_1)
	arg_10_0:NotifiyCore(ISLAND_EVT.BAIT_UPDATE, arg_10_1)
end

function var_0_0.OnResetSp(arg_11_0)
	local var_11_0 = arg_11_0.mapId
	local var_11_1 = pg.island_world_objects.get_id_list_by_mapId[var_11_0] or {}

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		local var_11_2 = pg.island_world_objects[iter_11_1]

		if var_11_2.unitId == 0 then
			spConfig = var_11_2

			break
		end
	end

	if not spConfig then
		return
	end

	local var_11_3 = BuildVector3(spConfig.param.position)
	local var_11_4 = BuildVector3(spConfig.param.rotation)
	local var_11_5 = getProxy(PlayerProxy):getRawData().id

	arg_11_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, var_11_5, IslandConst.UNIT_LIST_PLAYER, var_11_3)
	arg_11_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_ROT, var_11_5, IslandConst.UNIT_LIST_PLAYER, var_11_4)
end

function var_0_0.OnLockNpcRefresh(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.visibilityAllocator:LockNpc(arg_12_1, arg_12_2)
end

function var_0_0.OnReleaseNpcRefresh(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.visibilityAllocator:ReleaseNpc(arg_13_1, arg_13_2)
end

function var_0_0.OnSystemUnlock(arg_14_0, arg_14_1)
	arg_14_0:NotifiyCore(ISLAND_EVT.SYSTEM_UNLOCK, arg_14_1)
end

function var_0_0.OnActivityNpcAdd(arg_15_0, arg_15_1)
	arg_15_0.activityNpcAllocator:AddNpc(arg_15_1)
	arg_15_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcUpdate(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.activityNpcAllocator:DelNpc(arg_16_1)
	arg_16_0.activityNpcAllocator:AddNpc(arg_16_2)
	arg_16_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcDel(arg_17_0, arg_17_1)
	arg_17_0.activityNpcAllocator:DelNpc(arg_17_1)
	arg_17_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityUpdate(arg_18_0)
	arg_18_0.activityNpcAllocator:Flush()
end

function var_0_0.OnGenRecycleItem(arg_19_0, arg_19_1)
	local var_19_0 = IslandDataConvertor.GenDelayRecycleIslandUnit(arg_19_1)

	arg_19_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_19_0)
end

function var_0_0.OnAddFollower(arg_20_0, arg_20_1)
	local var_20_0 = #arg_20_0.sceneData.followUnits > 0
	local var_20_1 = arg_20_0:GetIsland():GetCharacterAgency():GetShipById(arg_20_1)
	local var_20_2 = var_20_1:GetModelUnit()
	local var_20_3 = arg_20_0:GetView():GetPlayerPosition()
	local var_20_4 = IslandFollowerUnitVO.New(var_20_1.id, arg_20_1, var_20_2, var_20_3, Vector3(0, 0, 0), not var_20_0)

	table.insert(arg_20_0.sceneData.followUnits, var_20_4)
	arg_20_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_20_4)

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.sceneData.strollUnits) do
		if var_20_1:getConfig("unit_id") == iter_20_1.config.unit_id then
			arg_20_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_STROLL, iter_20_1.id)
		end
	end

	arg_20_0:NotifiyCore(ISLAND_EVT.ADD_FOLLOWER, var_20_4.id)
end

function var_0_0.OnDelFollower(arg_21_0, arg_21_1)
	local var_21_0 = 0

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.sceneData.followUnits) do
		if iter_21_1.id == arg_21_1 then
			var_21_0 = iter_21_0

			break
		end
	end

	if var_21_0 <= 0 then
		return
	end

	local var_21_1 = table.remove(arg_21_0.sceneData.followUnits, var_21_0)

	arg_21_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_FOLLOW, var_21_1.id)

	if var_21_1:IsRandomizer() and #arg_21_0.sceneData.followUnits > 0 then
		local var_21_2 = arg_21_0.sceneData.followUnits[1]

		var_21_2:ActiveRandomizer()
		arg_21_0:NotifiyCore(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, var_21_2.id)
	end

	local var_21_3 = arg_21_0:GetIsland():GetCharacterAgency():GetShipById(arg_21_1)

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.sceneData.strollUnits) do
		if var_21_3:getConfig("unit_id") == iter_21_3.config.unit_id then
			arg_21_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_21_3)
		end
	end

	arg_21_0:NotifiyCore(ISLAND_EVT.DEL_FOLLOWER, var_21_1.id)
end

function var_0_0.OnResetNpcActionFeedback(arg_22_0)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.sceneData.strollUnits) do
		if iter_22_1:ExistActionFeedback() then
			iter_22_1:ClearActionFeedback()
			arg_22_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_22_1)
		end
	end

	IslandDataConvertor.DistributeAward4StrollUnits(arg_22_0.sceneData.strollUnits, arg_22_0:GetIsland())
	arg_22_0:InitStrollUnitsAwards()
end

function var_0_0.OnNpcActionFeedBackChange(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.sceneData.strollUnits) do
		if iter_23_1.id == arg_23_1 and iter_23_1:ExistActionFeedback() then
			iter_23_1:ClearActionFeedback()
			arg_23_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_23_1)
		end
	end
end

function var_0_0.OnLinkCore(arg_24_0, arg_24_1, ...)
	arg_24_0:NotifiyCore(arg_24_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_25_1, arg_25_2, arg_25_3)
end

function var_0_0.OnStartPathFinder(arg_26_0, arg_26_1)
	arg_26_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_26_1)
end

function var_0_0.OnEndPathFinder(arg_27_0)
	arg_27_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_28_0)
	arg_28_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_28_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_29_0, arg_29_1)
	arg_29_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_29_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)

	if arg_29_1 then
		arg_29_0:OnUpdateTask()
	end
end

function var_0_0.OnStartStory(arg_30_0)
	arg_30_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_31_0, arg_31_1)
	arg_31_0:NotifiyCore(ISLAND_EVT.END_STORY)

	if arg_31_1 then
		arg_31_0.visibilityAllocator:Flush()
	end
end

function var_0_0.OnTaskAdd(arg_32_0)
	arg_32_0.visibilityAllocator:Flush()
	arg_32_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_32_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_33_0, arg_33_1)
	arg_33_0.visibilityAllocator:Flush()
	arg_33_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_33_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	arg_33_0:CheckFinishTask(arg_33_1, IslandTaskType.DAILY, "daily_task_follow_action")
	arg_33_0:CheckFinishTask(arg_33_1, IslandTaskType.WEEKLY, "weekly_task_follow_action")
end

local function var_0_1(arg_34_0)
	if #arg_34_0 == 0 then
		return nil
	end

	return arg_34_0[math.random(1, #arg_34_0)]
end

function var_0_0.CheckFinishTask(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	if IslandTask.New({
		id = arg_35_1,
		process_list = {}
	}):GetType() ~= arg_35_2 then
		return
	end

	local var_35_0 = pg.island_set[arg_35_3]

	if not var_35_0 then
		return
	end

	local var_35_1 = var_35_0 and (var_35_0.key_value_varchar or {}) or {}
	local var_35_2 = arg_35_0:GetSelfIsland():GetTaskAgency()
	local var_35_3 = var_35_2:GetTasks()

	for iter_35_0, iter_35_1 in ipairs(var_35_3) do
		if iter_35_1:GetType() == arg_35_2 then
			return
		end
	end

	local var_35_4 = false
	local var_35_5 = var_35_2:GetFinishedIds()

	for iter_35_2, iter_35_3 in ipairs(var_35_5) do
		if IslandTask.New({
			id = iter_35_3,
			process_list = {}
		}):GetType() == arg_35_2 then
			var_35_4 = true

			break
		end
	end

	if var_35_4 then
		arg_35_0:NotifiyCore(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, var_0_1(var_35_1))
	end
end

function var_0_0.OnUpdateTask(arg_36_0)
	arg_36_0:Debounce("RefreshTask", function()
		if not arg_36_0.visibilityAllocator then
			return
		end

		arg_36_0.visibilityAllocator:Flush()
		arg_36_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
		arg_36_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	end, 0.5, false)()
end

function var_0_0.Debounce(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	if not arg_38_0.__debouncers then
		arg_38_0.__debouncers = {}
	end

	if not arg_38_0.__debouncers[arg_38_1] then
		arg_38_0.__debouncers[arg_38_1] = debounce(arg_38_2, arg_38_3, arg_38_4)
	end

	return arg_38_0.__debouncers[arg_38_1]
end

function var_0_0.OnPlayerAdd(arg_39_0, arg_39_1)
	local var_39_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_39_1.player, arg_39_0.mapId, arg_39_0:GetIsland().id)

	arg_39_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_39_0, function(arg_40_0)
		arg_39_0.islandSyncMgr:OnVisitorEnter(arg_39_1.player.id, arg_40_0)
	end)
end

function var_0_0.OnPlayerExit(arg_41_0, arg_41_1)
	arg_41_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_41_1.id)
	arg_41_0.islandSyncMgr:OnVisitorExit(arg_41_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_42_1, arg_42_2)
end

function var_0_0.OnShipChangeDress(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
	arg_43_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
end

function var_0_0.OnStartPlant(arg_44_0, arg_44_1)
	local var_44_0

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.sceneData.productSystems) do
		if iter_44_1.id == arg_44_1.build_id then
			var_44_0 = iter_44_1

			break
		end
	end

	if not var_44_0 then
		return
	end

	local var_44_1 = var_44_0:GetUnitIdBySlotId(arg_44_1.area_id)

	arg_44_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_44_1)

	local var_44_2 = var_44_0:GenHandPlantUnitBySlotData(arg_44_1.area_id, arg_44_1.formula_id)

	arg_44_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_44_2)
	arg_44_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_44_1)
end

function var_0_0.OnEndPlant(arg_45_0, arg_45_1)
	local var_45_0

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.sceneData.productSystems) do
		if iter_45_1.id == arg_45_1.build_id then
			var_45_0 = iter_45_1

			break
		end
	end

	if not var_45_0 then
		return
	end

	local var_45_1 = var_45_0:GetUnitIdBySlotId(arg_45_1.area_id)

	arg_45_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_45_1)

	local var_45_2 = var_45_0:GenHandPlantUnitBySlotData(arg_45_1.area_id)

	arg_45_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_45_2)
	arg_45_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_45_1)
end

function var_0_0.OnStartDelegation(arg_46_0, arg_46_1)
	local var_46_0

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.sceneData.systemList) do
		if isa(iter_46_1, IslandCharacterSystemVO) and iter_46_1.id == arg_46_1.build_id then
			var_46_0 = iter_46_1

			break
		end
	end

	if not var_46_0 then
		return
	end

	local var_46_1

	for iter_46_2, iter_46_3 in ipairs(arg_46_0.sceneData.productSystems) do
		if iter_46_3.id == arg_46_1.build_id then
			var_46_1 = iter_46_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_46_1.build_id) then
		local var_46_2 = pg.island_production_slot[arg_46_1.area_id]

		for iter_46_4, iter_46_5 in ipairs(var_46_2.exclusion_slot) do
			local var_46_3 = var_46_1:GetUnitIdBySlotId(iter_46_5)
			local var_46_4 = var_46_1:GetUnitVOByUnitId(var_46_3)

			if var_46_4 then
				var_46_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_46_5 = {}

	if table.contains(IslandProductConst.havePerformPlace, arg_46_1.build_id) then
		local var_46_6 = var_46_1:GetDelegateUnitsByBuildIdAndSlotId(arg_46_1.build_id, arg_46_1.area_id, arg_46_1.formula_id)

		var_46_5.commissionSlotId = var_46_1:GetCommissionSlotId(arg_46_1.area_id)
		var_46_5.unitIds = {}

		for iter_46_6, iter_46_7 in ipairs(var_46_6) do
			table.insert(var_46_5.unitIds, iter_46_7.id)
		end

		for iter_46_8, iter_46_9 in ipairs(var_46_6) do
			arg_46_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_46_9)
		end
	end

	local var_46_7 = var_46_1:GetDelegateEffectsByCommissonId(arg_46_1.area_id)

	if var_46_7 then
		local var_46_8 = var_46_1:GenUnitByDelegateEffectId(var_46_7)

		if var_46_8 then
			arg_46_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_46_8)
		end
	end

	local var_46_9 = var_46_0:GetUnit(arg_46_1.ship_id, arg_46_1.area_id, true)

	if var_46_9 then
		arg_46_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_46_9)
	end

	arg_46_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_46_1, var_46_5)
end

function var_0_0.OnEndDelegation(arg_47_0, arg_47_1)
	local var_47_0

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.sceneData.systemList) do
		if isa(iter_47_1, IslandCharacterSystemVO) and iter_47_1.id == arg_47_1.build_id then
			var_47_0 = iter_47_1

			break
		end
	end

	if not var_47_0 then
		return
	end

	arg_47_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_47_1)

	local var_47_1 = var_47_0:GetUnitShipIdBySlotId(arg_47_1.ship_id, arg_47_1.area_id)

	if var_47_1 then
		arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_47_1)
	end

	local var_47_2

	for iter_47_2, iter_47_3 in ipairs(arg_47_0.sceneData.productSystems) do
		if iter_47_3.id == arg_47_1.build_id then
			var_47_2 = iter_47_3

			break
		end
	end

	if table.contains(IslandProductConst.havePerformPlace, arg_47_1.build_id) then
		local var_47_3 = var_47_2:GetDelegatUnitsBySlotId(arg_47_1.area_id)

		for iter_47_4, iter_47_5 in ipairs(var_47_3) do
			arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATE_UNIT, iter_47_5)
		end
	end

	local var_47_4 = var_47_2:GetDelegateEffectsByCommissonId(arg_47_1.area_id)

	if var_47_4 then
		arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_47_4)
	end

	if arg_47_1.remainReward then
		return
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_47_1.build_id) then
		local var_47_5 = pg.island_production_slot[arg_47_1.area_id]

		for iter_47_6, iter_47_7 in ipairs(var_47_5.exclusion_slot) do
			local var_47_6 = var_47_2:GetUnitIdBySlotId(iter_47_7)

			arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_47_6)

			local var_47_7 = var_47_2:GenHandPlantUnitBySlotData(iter_47_7)

			arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_47_7)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_48_0, arg_48_1)
	local var_48_0

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.sceneData.systemList) do
		if isa(iter_48_1, IslandCharacterSystemVO) and iter_48_1.id == arg_48_1.build_id then
			var_48_0 = iter_48_1

			break
		end
	end

	if not var_48_0 then
		return
	end

	local var_48_1

	for iter_48_2, iter_48_3 in ipairs(arg_48_0.sceneData.productSystems) do
		if iter_48_3.id == arg_48_1.build_id then
			var_48_1 = iter_48_3

			break
		end
	end

	if arg_48_1.build_id == IslandProductConst.FarmlandPlaceId or arg_48_1.build_id == IslandProductConst.OrchardPlaceId or arg_48_1.build_id == IslandProductConst.GardenPlaceId then
		local var_48_2 = pg.island_production_slot[arg_48_1.area_id]

		for iter_48_4, iter_48_5 in ipairs(var_48_2.exclusion_slot) do
			local var_48_3 = var_48_1:GetUnitIdBySlotId(iter_48_5)

			arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_48_3)

			local var_48_4 = var_48_1:GenHandPlantUnitBySlotData(iter_48_5)

			arg_48_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_48_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_49_0, arg_49_1)
	local var_49_0

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.sceneData.productSystems) do
		if iter_49_1.id == IslandProductConst.FarmlandPlaceId then
			var_49_0 = iter_49_1

			break
		end
	end

	if not var_49_0 then
		return
	end

	arg_49_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_49_1.id)

	local var_49_1 = var_49_0:GetUnitVOByUnitId(arg_49_1.id)

	var_49_1.modelId = arg_49_1.modelId

	arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_49_1)
end

function var_0_0.OnStartHandCollect(arg_50_0, arg_50_1)
	local var_50_0

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.sceneData.productSystems) do
		if iter_50_1.id == arg_50_1.build_id then
			var_50_0 = iter_50_1

			break
		end
	end

	if not var_50_0 then
		return
	end

	local var_50_1 = var_50_0:GetUnitIdBySlotId(arg_50_1.area_id)

	arg_50_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_50_1)
	arg_50_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_50_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_51_0, arg_51_1)
	local var_51_0

	for iter_51_0, iter_51_1 in ipairs(arg_51_0.sceneData.productSystems) do
		if iter_51_1.id == arg_51_1.build_id then
			var_51_0 = iter_51_1

			break
		end
	end

	if not var_51_0 then
		return
	end

	local var_51_1 = var_51_0:GetUnitIdBySlotId(arg_51_1.slotId)

	arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_51_1)

	local var_51_2 = var_51_0:GenHandPlantUnitBySlotData(arg_51_1.slotId)

	arg_51_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_51_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.build_id
	local var_52_1

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.productSystems) do
		if iter_52_1.id == var_52_0 then
			var_52_1 = iter_52_1

			break
		end
	end

	if not var_52_1 then
		return
	end

	local var_52_2 = var_52_1:GetPlaceModelId(false)

	arg_52_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_52_2)

	local var_52_3 = var_52_1:GetPlaceModelUnit(true)

	arg_52_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_52_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_53_0, arg_53_1)
	arg_53_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_53_1.unitId)
	arg_53_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_53_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_54_0, arg_54_1)
	local var_54_0 = IslandDataConvertor.GenWildGatherUnit(arg_54_1)

	arg_54_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_54_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1.slotId
	local var_55_1 = pg.island_production_slot[var_55_0].place
	local var_55_2

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.sceneData.productSystems) do
		if iter_55_1.id == var_55_1 then
			var_55_2 = iter_55_1

			break
		end
	end

	if not var_55_2 then
		return
	end

	local var_55_3 = var_55_2:InitHandCollectSlotBySlotId(var_55_0)

	if var_55_3 then
		arg_55_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_55_3)
	end
end

function var_0_0.OnCollectSlotUnitUpdate(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_1.slotId
	local var_56_1 = pg.island_production_slot[var_56_0].place
	local var_56_2

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.sceneData.productSystems) do
		if iter_56_1.id == var_56_1 then
			var_56_2 = iter_56_1

			break
		end
	end

	if not var_56_2 then
		return
	end

	local var_56_3 = var_56_2:GetUnitIdBySlotId(arg_56_1.slotId)

	if var_56_3 then
		arg_56_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_56_3)
		arg_56_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_56_3)
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_1.slotId
	local var_57_1 = pg.island_production_slot[var_57_0].place
	local var_57_2

	for iter_57_0, iter_57_1 in ipairs(arg_57_0.sceneData.productSystems) do
		if iter_57_1.id == var_57_1 then
			var_57_2 = iter_57_1

			break
		end
	end

	if not var_57_2 then
		return
	end

	local var_57_3 = var_57_2:GetHandCollectSlotBySlotId(var_57_0)

	arg_57_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_57_3)
end

function var_0_0.OnSyncDataUpdate(arg_58_0, arg_58_1)
	arg_58_0.islandSyncMgr:HandleSyncData(arg_58_1)
end

function var_0_0.OnSyncObjUpdate(arg_59_0, arg_59_1)
	arg_59_0.islandSyncMgr:HandleSyncObj(arg_59_1)
end

function var_0_0.Update(arg_60_0)
	arg_60_0.playerInputManager:Update()
	arg_60_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_61_0)
	if arg_61_0.playerInputManager then
		arg_61_0.playerInputManager:Dispose()

		arg_61_0.playerInputManager = nil
	end

	if arg_61_0.islandSyncMgr then
		arg_61_0.islandSyncMgr:Dispose()

		arg_61_0.islandSyncMgr = nil
	end

	if arg_61_0.strollAllocator then
		arg_61_0.strollAllocator:Dispose()

		arg_61_0.strollAllocator = nil
	end

	if arg_61_0.visibilityAllocator then
		arg_61_0.visibilityAllocator:Dispose()

		arg_61_0.visibilityAllocator = nil
	end

	if arg_61_0.giftAllocator then
		arg_61_0.giftAllocator:Dispose()

		arg_61_0.giftAllocator = nil
	end

	if arg_61_0.timeDelayCreate then
		arg_61_0.timeDelayCreate:Dispose()

		arg_61_0.timeDelayCreate = nil
	end

	if arg_61_0.activityNpcAllocator then
		arg_61_0.activityNpcAllocator:Dispose()

		arg_61_0.activityNpcAllocator = nil
	end

	arg_61_0.__debouncers = nil
end

function var_0_0.OnAnimalInit(arg_62_0, arg_62_1)
	local var_62_0

	for iter_62_0, iter_62_1 in ipairs(arg_62_0.sceneData.productSystems) do
		if iter_62_1.id == IslandProductConst.PasturePlaceId then
			var_62_0 = iter_62_1

			break
		end
	end

	if not var_62_0 then
		return
	end

	local var_62_1 = arg_62_1.slotId

	for iter_62_2, iter_62_3 in ipairs(arg_62_1.aniList) do
		local var_62_2 = var_62_0:GenAnimalByAnialConfig(iter_62_3, var_62_1)

		arg_62_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_62_2)
	end
end

function var_0_0.OnSlotDelegateInit(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1.slotId
	local var_63_1 = pg.island_production_slot[var_63_0].place
	local var_63_2

	for iter_63_0, iter_63_1 in ipairs(arg_63_0.sceneData.productSystems) do
		if iter_63_1.id == var_63_1 then
			var_63_2 = iter_63_1

			break
		end
	end

	if not var_63_2 then
		return
	end

	local var_63_3 = var_63_2:GetCommissionSlotId(var_63_0)
	local var_63_4 = pg.island_production_commission[var_63_3].unlockObjid

	if var_63_4 ~= 0 then
		arg_63_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_63_4)
	end
end

function var_0_0.IsPlayerInTimeline(arg_64_0)
	return arg_64_0.islandSyncMgr.player:InTimeline()
end

function var_0_0.InitSyncMgr(arg_65_0)
	arg_65_0.islandSyncMgr:Init(arg_65_0.sceneData.unitList)
	arg_65_0:NotifiyCore(ISLAND_EVT.INIT_INTERACTION_OP_VIEW)
end

function var_0_0.SetVisitorSyncData(arg_66_0, arg_66_1, arg_66_2)
	arg_66_0:NotifiyCore(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_66_1, arg_66_2)
end

function var_0_0.WorldObjectInterAction(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	arg_67_3 = arg_67_3 or 1

	local var_67_0 = _.detect(arg_67_0.sceneData.unitList, function(arg_68_0)
		return arg_68_0.id == arg_67_1
	end)

	if not var_67_0 or not var_67_0:Interactable() then
		return
	end

	local var_67_1 = var_67_0:GetEmptySlot()

	if not var_67_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_interact_point"))

		return
	end

	local function var_67_2()
		var_67_1:Lock(arg_67_2)
		arg_67_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_67_0, var_67_1, arg_67_3)
	end

	arg_67_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_67_1, var_67_1.id, arg_67_3, function(arg_70_0)
		if arg_70_0 then
			var_67_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4)
	arg_71_3 = arg_71_3 or 1

	local var_71_0 = _.detect(arg_71_0.sceneData.unitList, function(arg_72_0)
		return arg_72_0.id == arg_71_1
	end)

	if not var_71_0 or not var_71_0:Interactable() then
		return
	end

	local var_71_1 = var_71_0:GetSlotById(arg_71_4)

	var_71_1:Lock(arg_71_2)
	arg_71_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_71_0, var_71_1, arg_71_3)
end

function var_0_0.WorldObjectInterActionEnd(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = _.detect(arg_73_0.sceneData.unitList, function(arg_74_0)
		return arg_74_0.id == arg_73_1
	end)

	if not var_73_0 or not var_73_0:Interactable() then
		return
	end

	local var_73_1 = var_73_0:GetUsingSlot(arg_73_2)

	local function var_73_2()
		local var_75_0 = Clone(var_73_1)

		var_73_1:Release()
		arg_73_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_73_0, var_75_0)
	end

	arg_73_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_73_1, var_73_1.id, function(arg_76_0)
		if arg_76_0 then
			var_73_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = _.detect(arg_77_0.sceneData.unitList, function(arg_78_0)
		return arg_78_0.id == arg_77_1
	end)

	if not var_77_0 or not var_77_0:Interactable() then
		return
	end

	local var_77_1 = var_77_0:GetUsingSlot(arg_77_2)
	local var_77_2 = Clone(var_77_1)

	var_77_1:Release()
	arg_77_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_77_0, var_77_2)
end

function var_0_0.WorldObjectInitStatus(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0 = _.detect(arg_79_0.sceneData.unitList, function(arg_80_0)
		return arg_80_0.id == arg_79_1
	end)

	warning("init", arg_79_1, arg_79_2, var_79_0)

	if not var_79_0 or not var_79_0:Interactable() then
		return
	end

	arg_79_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_79_0, arg_79_2)
end

function var_0_0.OnOpenRestaurant(arg_81_0, arg_81_1)
	local var_81_0 = arg_81_1.restId
	local var_81_1 = arg_81_1.postList
	local var_81_2

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.sceneData.systemList) do
		if isa(iter_81_1, IslandManageSystemVO) and iter_81_1.id == var_81_0 then
			var_81_2 = iter_81_1

			break
		end
	end

	if not var_81_2 then
		return
	end

	local var_81_3 = var_81_2:GetUnits(var_81_1)

	for iter_81_2, iter_81_3 in ipairs(var_81_3) do
		arg_81_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_81_3)
	end

	arg_81_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_81_2)
end

function var_0_0.OnCloseRestaurant(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1.restId
	local var_82_1 = arg_82_1.postList
	local var_82_2

	for iter_82_0, iter_82_1 in ipairs(arg_82_0.sceneData.systemList) do
		if isa(iter_82_1, IslandManageSystemVO) and iter_82_1.id == var_82_0 then
			var_82_2 = iter_82_1

			break
		end
	end

	if not var_82_2 then
		return
	end

	arg_82_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_82_2)

	local var_82_3 = var_82_2:GetUnits(var_82_1)

	for iter_82_2, iter_82_3 in ipairs(var_82_3) do
		arg_82_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_82_3.id)
	end
end

return var_0_0

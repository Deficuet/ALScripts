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

function var_0_0.OnFinishTask(arg_33_0)
	arg_33_0.visibilityAllocator:Flush()
	arg_33_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_33_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnUpdateTask(arg_34_0)
	arg_34_0:Debounce("RefreshTask", function()
		if not arg_34_0.visibilityAllocator then
			return
		end

		arg_34_0.visibilityAllocator:Flush()
		arg_34_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
		arg_34_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	end, 0.5, false)()
end

function var_0_0.Debounce(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	if not arg_36_0.__debouncers then
		arg_36_0.__debouncers = {}
	end

	if not arg_36_0.__debouncers[arg_36_1] then
		arg_36_0.__debouncers[arg_36_1] = debounce(arg_36_2, arg_36_3, arg_36_4)
	end

	return arg_36_0.__debouncers[arg_36_1]
end

function var_0_0.OnPlayerAdd(arg_37_0, arg_37_1)
	local var_37_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_37_1.player, arg_37_0.mapId, arg_37_0:GetIsland().id)

	arg_37_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_37_0, function(arg_38_0)
		arg_37_0.islandSyncMgr:OnVisitorEnter(arg_37_1.player.id, arg_38_0)
	end)
end

function var_0_0.OnPlayerExit(arg_39_0, arg_39_1)
	arg_39_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_39_1.id)
	arg_39_0.islandSyncMgr:OnVisitorExit(arg_39_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_40_1, arg_40_2)
end

function var_0_0.OnShipChangeDress(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	arg_41_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
end

function var_0_0.OnStartPlant(arg_42_0, arg_42_1)
	local var_42_0

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.sceneData.productSystems) do
		if iter_42_1.id == arg_42_1.build_id then
			var_42_0 = iter_42_1

			break
		end
	end

	if not var_42_0 then
		return
	end

	local var_42_1 = var_42_0:GetUnitIdBySlotId(arg_42_1.area_id)

	arg_42_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_42_1)

	local var_42_2 = var_42_0:GenHandPlantUnitBySlotData(arg_42_1.area_id, arg_42_1.formula_id)

	arg_42_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_42_2)
	arg_42_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_42_1)
end

function var_0_0.OnEndPlant(arg_43_0, arg_43_1)
	local var_43_0

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.sceneData.productSystems) do
		if iter_43_1.id == arg_43_1.build_id then
			var_43_0 = iter_43_1

			break
		end
	end

	if not var_43_0 then
		return
	end

	local var_43_1 = var_43_0:GetUnitIdBySlotId(arg_43_1.area_id)

	arg_43_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_43_1)

	local var_43_2 = var_43_0:GenHandPlantUnitBySlotData(arg_43_1.area_id)

	arg_43_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_43_2)
	arg_43_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_43_1)
end

function var_0_0.OnStartDelegation(arg_44_0, arg_44_1)
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

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_44_1.build_id) then
		local var_44_2 = pg.island_production_slot[arg_44_1.area_id]

		for iter_44_4, iter_44_5 in ipairs(var_44_2.exclusion_slot) do
			local var_44_3 = var_44_1:GetUnitIdBySlotId(iter_44_5)
			local var_44_4 = var_44_1:GetUnitVOByUnitId(var_44_3)

			if var_44_4 then
				var_44_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_44_5 = {}

	if table.contains(IslandProductConst.havePerformPlace, arg_44_1.build_id) then
		local var_44_6 = var_44_1:GetDelegateUnitsByBuildIdAndSlotId(arg_44_1.build_id, arg_44_1.area_id, arg_44_1.formula_id)

		var_44_5.commissionSlotId = var_44_1:GetCommissionSlotId(arg_44_1.area_id)
		var_44_5.unitIds = {}

		for iter_44_6, iter_44_7 in ipairs(var_44_6) do
			table.insert(var_44_5.unitIds, iter_44_7.id)
		end

		for iter_44_8, iter_44_9 in ipairs(var_44_6) do
			arg_44_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_44_9)
		end
	end

	local var_44_7 = var_44_1:GetDelegateEffectsByCommissonId(arg_44_1.area_id)

	if var_44_7 then
		local var_44_8 = var_44_1:GenUnitByDelegateEffectId(var_44_7)

		if var_44_8 then
			arg_44_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_44_8)
		end
	end

	local var_44_9 = var_44_0:GetUnit(arg_44_1.ship_id, arg_44_1.area_id, true)

	if var_44_9 then
		arg_44_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_44_9)
	end

	arg_44_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_44_1, var_44_5)
end

function var_0_0.OnEndDelegation(arg_45_0, arg_45_1)
	local var_45_0

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.sceneData.systemList) do
		if isa(iter_45_1, IslandCharacterSystemVO) and iter_45_1.id == arg_45_1.build_id then
			var_45_0 = iter_45_1

			break
		end
	end

	if not var_45_0 then
		return
	end

	arg_45_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_45_1)

	local var_45_1 = var_45_0:GetUnitShipIdBySlotId(arg_45_1.ship_id, arg_45_1.area_id)

	if var_45_1 then
		arg_45_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_45_1)
	end

	local var_45_2

	for iter_45_2, iter_45_3 in ipairs(arg_45_0.sceneData.productSystems) do
		if iter_45_3.id == arg_45_1.build_id then
			var_45_2 = iter_45_3

			break
		end
	end

	if table.contains(IslandProductConst.havePerformPlace, arg_45_1.build_id) then
		local var_45_3 = var_45_2:GetDelegatUnitsBySlotId(arg_45_1.area_id)

		for iter_45_4, iter_45_5 in ipairs(var_45_3) do
			arg_45_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATE_UNIT, iter_45_5)
		end
	end

	local var_45_4 = var_45_2:GetDelegateEffectsByCommissonId(arg_45_1.area_id)

	if var_45_4 then
		arg_45_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_45_4)
	end

	if arg_45_1.remainReward then
		return
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_45_1.build_id) then
		local var_45_5 = pg.island_production_slot[arg_45_1.area_id]

		for iter_45_6, iter_45_7 in ipairs(var_45_5.exclusion_slot) do
			local var_45_6 = var_45_2:GetUnitIdBySlotId(iter_45_7)

			arg_45_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_45_6)

			local var_45_7 = var_45_2:GenHandPlantUnitBySlotData(iter_45_7)

			arg_45_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_45_7)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_46_0, arg_46_1)
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

	if arg_46_1.build_id == IslandProductConst.FarmlandPlaceId or arg_46_1.build_id == IslandProductConst.OrchardPlaceId or arg_46_1.build_id == IslandProductConst.GardenPlaceId then
		local var_46_2 = pg.island_production_slot[arg_46_1.area_id]

		for iter_46_4, iter_46_5 in ipairs(var_46_2.exclusion_slot) do
			local var_46_3 = var_46_1:GetUnitIdBySlotId(iter_46_5)

			arg_46_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_46_3)

			local var_46_4 = var_46_1:GenHandPlantUnitBySlotData(iter_46_5)

			arg_46_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_46_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_47_0, arg_47_1)
	local var_47_0

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.sceneData.productSystems) do
		if iter_47_1.id == IslandProductConst.FarmlandPlaceId then
			var_47_0 = iter_47_1

			break
		end
	end

	if not var_47_0 then
		return
	end

	arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_47_1.id)

	local var_47_1 = var_47_0:GetUnitVOByUnitId(arg_47_1.id)

	var_47_1.modelId = arg_47_1.modelId

	arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_47_1)
end

function var_0_0.OnStartHandCollect(arg_48_0, arg_48_1)
	local var_48_0

	for iter_48_0, iter_48_1 in ipairs(arg_48_0.sceneData.productSystems) do
		if iter_48_1.id == arg_48_1.build_id then
			var_48_0 = iter_48_1

			break
		end
	end

	if not var_48_0 then
		return
	end

	local var_48_1 = var_48_0:GetUnitIdBySlotId(arg_48_1.area_id)

	arg_48_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_48_1)
	arg_48_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_48_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_49_0, arg_49_1)
	local var_49_0

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.sceneData.productSystems) do
		if iter_49_1.id == arg_49_1.build_id then
			var_49_0 = iter_49_1

			break
		end
	end

	if not var_49_0 then
		return
	end

	local var_49_1 = var_49_0:GetUnitIdBySlotId(arg_49_1.slotId)

	arg_49_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_49_1)

	local var_49_2 = var_49_0:GenHandPlantUnitBySlotData(arg_49_1.slotId)

	arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_49_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1.build_id
	local var_50_1

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.sceneData.productSystems) do
		if iter_50_1.id == var_50_0 then
			var_50_1 = iter_50_1

			break
		end
	end

	if not var_50_1 then
		return
	end

	local var_50_2 = var_50_1:GetPlaceModelId(false)

	arg_50_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_50_2)

	local var_50_3 = var_50_1:GetPlaceModelUnit(true)

	arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_50_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_51_0, arg_51_1)
	arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_51_1.unitId)
	arg_51_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_51_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_52_0, arg_52_1)
	local var_52_0 = IslandDataConvertor.GenWildGatherUnit(arg_52_1)

	arg_52_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_52_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_53_0, arg_53_1)
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

	local var_53_3 = var_53_2:InitHandCollectSlotBySlotId(var_53_0)

	if var_53_3 then
		arg_53_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_53_3)
	end
end

function var_0_0.OnCollectSlotUnitUpdate(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_1.slotId
	local var_54_1 = pg.island_production_slot[var_54_0].place
	local var_54_2

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.sceneData.productSystems) do
		if iter_54_1.id == var_54_1 then
			var_54_2 = iter_54_1

			break
		end
	end

	if not var_54_2 then
		return
	end

	local var_54_3 = var_54_2:GetUnitIdBySlotId(arg_54_1.slotId)

	if var_54_3 then
		arg_54_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_54_3)
		arg_54_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_54_3)
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_55_0, arg_55_1)
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

	local var_55_3 = var_55_2:GetHandCollectSlotBySlotId(var_55_0)

	arg_55_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_55_3)
end

function var_0_0.OnSyncDataUpdate(arg_56_0, arg_56_1)
	arg_56_0.islandSyncMgr:HandleSyncData(arg_56_1)
end

function var_0_0.OnSyncObjUpdate(arg_57_0, arg_57_1)
	arg_57_0.islandSyncMgr:HandleSyncObj(arg_57_1)
end

function var_0_0.Update(arg_58_0)
	arg_58_0.playerInputManager:Update()
	arg_58_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_59_0)
	if arg_59_0.playerInputManager then
		arg_59_0.playerInputManager:Dispose()

		arg_59_0.playerInputManager = nil
	end

	if arg_59_0.islandSyncMgr then
		arg_59_0.islandSyncMgr:Dispose()

		arg_59_0.islandSyncMgr = nil
	end

	if arg_59_0.strollAllocator then
		arg_59_0.strollAllocator:Dispose()

		arg_59_0.strollAllocator = nil
	end

	if arg_59_0.visibilityAllocator then
		arg_59_0.visibilityAllocator:Dispose()

		arg_59_0.visibilityAllocator = nil
	end

	if arg_59_0.giftAllocator then
		arg_59_0.giftAllocator:Dispose()

		arg_59_0.giftAllocator = nil
	end

	if arg_59_0.timeDelayCreate then
		arg_59_0.timeDelayCreate:Dispose()

		arg_59_0.timeDelayCreate = nil
	end

	if arg_59_0.activityNpcAllocator then
		arg_59_0.activityNpcAllocator:Dispose()

		arg_59_0.activityNpcAllocator = nil
	end

	arg_59_0.__debouncers = nil
end

function var_0_0.OnAnimalInit(arg_60_0, arg_60_1)
	local var_60_0

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.sceneData.productSystems) do
		if iter_60_1.id == IslandProductConst.PasturePlaceId then
			var_60_0 = iter_60_1

			break
		end
	end

	if not var_60_0 then
		return
	end

	local var_60_1 = arg_60_1.slotId

	for iter_60_2, iter_60_3 in ipairs(arg_60_1.aniList) do
		local var_60_2 = var_60_0:GenAnimalByAnialConfig(iter_60_3, var_60_1)

		arg_60_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_60_2)
	end
end

function var_0_0.OnSlotDelegateInit(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1.slotId
	local var_61_1 = pg.island_production_slot[var_61_0].place
	local var_61_2

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.sceneData.productSystems) do
		if iter_61_1.id == var_61_1 then
			var_61_2 = iter_61_1

			break
		end
	end

	if not var_61_2 then
		return
	end

	local var_61_3 = var_61_2:GetCommissionSlotId(var_61_0)
	local var_61_4 = pg.island_production_commission[var_61_3].unlockObjid

	if var_61_4 ~= 0 then
		arg_61_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_61_4)
	end
end

function var_0_0.IsPlayerInTimeline(arg_62_0)
	return arg_62_0.islandSyncMgr.player:InTimeline()
end

function var_0_0.InitSyncMgr(arg_63_0)
	arg_63_0.islandSyncMgr:Init(arg_63_0.sceneData.unitList)
	arg_63_0:NotifiyCore(ISLAND_EVT.INIT_INTERACTION_OP_VIEW)
end

function var_0_0.SetVisitorSyncData(arg_64_0, arg_64_1, arg_64_2)
	arg_64_0:NotifiyCore(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_64_1, arg_64_2)
end

function var_0_0.WorldObjectInterAction(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	arg_65_3 = arg_65_3 or 1

	local var_65_0 = _.detect(arg_65_0.sceneData.unitList, function(arg_66_0)
		return arg_66_0.id == arg_65_1
	end)

	if not var_65_0 or not var_65_0:Interactable() then
		return
	end

	local var_65_1 = var_65_0:GetEmptySlot()

	if not var_65_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_interact_point"))

		return
	end

	local function var_65_2()
		var_65_1:Lock(arg_65_2)
		arg_65_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_65_0, var_65_1, arg_65_3)
	end

	arg_65_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_65_1, var_65_1.id, arg_65_3, function(arg_68_0)
		if arg_68_0 then
			var_65_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_69_0, arg_69_1, arg_69_2, arg_69_3, arg_69_4)
	arg_69_3 = arg_69_3 or 1

	local var_69_0 = _.detect(arg_69_0.sceneData.unitList, function(arg_70_0)
		return arg_70_0.id == arg_69_1
	end)

	if not var_69_0 or not var_69_0:Interactable() then
		return
	end

	local var_69_1 = var_69_0:GetSlotById(arg_69_4)

	var_69_1:Lock(arg_69_2)
	arg_69_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_69_0, var_69_1, arg_69_3)
end

function var_0_0.WorldObjectInterActionEnd(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = _.detect(arg_71_0.sceneData.unitList, function(arg_72_0)
		return arg_72_0.id == arg_71_1
	end)

	if not var_71_0 or not var_71_0:Interactable() then
		return
	end

	local var_71_1 = var_71_0:GetUsingSlot(arg_71_2)

	local function var_71_2()
		local var_73_0 = Clone(var_71_1)

		var_71_1:Release()
		arg_71_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_71_0, var_73_0)
	end

	arg_71_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_71_1, var_71_1.id, function(arg_74_0)
		if arg_74_0 then
			var_71_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = _.detect(arg_75_0.sceneData.unitList, function(arg_76_0)
		return arg_76_0.id == arg_75_1
	end)

	if not var_75_0 or not var_75_0:Interactable() then
		return
	end

	local var_75_1 = var_75_0:GetUsingSlot(arg_75_2)
	local var_75_2 = Clone(var_75_1)

	var_75_1:Release()
	arg_75_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_75_0, var_75_2)
end

function var_0_0.WorldObjectInitStatus(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = _.detect(arg_77_0.sceneData.unitList, function(arg_78_0)
		return arg_78_0.id == arg_77_1
	end)

	warning("init", arg_77_1, arg_77_2, var_77_0)

	if not var_77_0 or not var_77_0:Interactable() then
		return
	end

	arg_77_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_77_0, arg_77_2)
end

function var_0_0.OnOpenRestaurant(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_1.restId
	local var_79_1 = arg_79_1.postList
	local var_79_2

	for iter_79_0, iter_79_1 in ipairs(arg_79_0.sceneData.systemList) do
		if isa(iter_79_1, IslandManageSystemVO) and iter_79_1.id == var_79_0 then
			var_79_2 = iter_79_1

			break
		end
	end

	if not var_79_2 then
		return
	end

	local var_79_3 = var_79_2:GetUnits(var_79_1)

	for iter_79_2, iter_79_3 in ipairs(var_79_3) do
		arg_79_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_79_3)
	end

	arg_79_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_79_2)
end

function var_0_0.OnCloseRestaurant(arg_80_0, arg_80_1)
	local var_80_0 = arg_80_1.restId
	local var_80_1 = arg_80_1.postList
	local var_80_2

	for iter_80_0, iter_80_1 in ipairs(arg_80_0.sceneData.systemList) do
		if isa(iter_80_1, IslandManageSystemVO) and iter_80_1.id == var_80_0 then
			var_80_2 = iter_80_1

			break
		end
	end

	if not var_80_2 then
		return
	end

	arg_80_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_80_2)

	local var_80_3 = var_80_2:GetUnits(var_80_1)

	for iter_80_2, iter_80_3 in ipairs(var_80_3) do
		arg_80_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_80_3.id)
	end
end

return var_0_0

local var_0_0 = class("IslandController", import(".IslandBaseController"))

function var_0_0.Init(arg_1_0)
	arg_1_0.sceneData = IslandDataConvertor.Island2SceneData(arg_1_0.island)
	arg_1_0.mapId = arg_1_0.sceneData.mapId
end

function var_0_0.SystemCtor(arg_2_0)
	arg_2_0.strollAllocator = IslandStrollAllocator.New(arg_2_0)
	arg_2_0.visibilityAllocator = IslandVisibilityAllocator.New(arg_2_0)
	arg_2_0.giftAllocator = IslandGiftAllocator.New(arg_2_0)
	arg_2_0.activityNpcAllocator = IslandActivityNpcAllocator.New(arg_2_0)
	arg_2_0.timeDelayCreate = IslandDelayCreationSystem.New(arg_2_0)
	arg_2_0.playerInputManager = PlayerInputManager.New(arg_2_0)
	arg_2_0.islandSyncMgr = IslandSyncMgr.New(arg_2_0)
end

function var_0_0.SetUp(arg_3_0)
	arg_3_0:SystemCtor()

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.sceneData.unitList) do
		if arg_3_0.visibilityAllocator:IsVisible(iter_3_1.id) then
			arg_3_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_3_1)
		end
	end

	for iter_3_2, iter_3_3 in ipairs(arg_3_0.sceneData.activityUnits) do
		if arg_3_0.activityNpcAllocator:IsVisible(iter_3_3.id) then
			arg_3_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_3_3)
		end
	end

	for iter_3_4, iter_3_5 in ipairs(arg_3_0.sceneData.giftUnits) do
		if arg_3_0.giftAllocator:IsVisible(iter_3_4) then
			arg_3_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_3_5)
		end
	end

	for iter_3_6, iter_3_7 in ipairs(arg_3_0.sceneData.systemList) do
		arg_3_0:NotifiyCore(ISLAND_EVT.GEN_SYSTEM, iter_3_7)
	end

	for iter_3_8, iter_3_9 in ipairs(arg_3_0.sceneData.systemUnits) do
		arg_3_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_3_9)
	end

	for iter_3_10, iter_3_11 in ipairs(arg_3_0.sceneData.strollUnits) do
		local var_3_0, var_3_1 = arg_3_0.strollAllocator:Allocator(iter_3_11:GetDefaultPathId(arg_3_0.mapId))

		iter_3_11:SetPath(var_3_0, var_3_1)
		arg_3_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_3_11)
	end

	for iter_3_12, iter_3_13 in ipairs(arg_3_0.sceneData.followUnits) do
		arg_3_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_3_13)
	end

	arg_3_0.timeDelayCreate:InitUnit()
end

function var_0_0.ResetPlayerPosition(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.sceneData.unitList) do
		if iter_4_1:IsPlayer() then
			arg_4_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, iter_4_1.id, IslandConst.UNIT_LIST_PLAYER, iter_4_1.position)
		end
	end
end

function var_0_0.OnCoreInitFinish(arg_5_0)
	arg_5_0:NotifiyCore(ISLAND_EVT.INIT_FINISH, arg_5_0.sceneData.camreaZoomData)
	arg_5_0:NotifiyIsland(ISLAND_EX_EVT.INIT_FINISH)
	arg_5_0.playerInputManager:Init()
	arg_5_0:InitStrollUnitsAwards()
	arg_5_0:InitSyncMgr()
	arg_5_0:InitVisitor()
end

function var_0_0.InitVisitor(arg_6_0)
	local var_6_0 = arg_6_0.island:GetVisitorAgency():GetMapVisitorList()

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		if not iter_6_1:IsSelf() then
			arg_6_0:OnPlayerAdd({
				player = iter_6_1
			})
		else
			arg_6_0.islandSyncMgr:OnVisitorEnter(iter_6_1.id, nil)
		end
	end
end

function var_0_0.InitStrollUnitsAwards(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.sceneData.strollUnits) do
		if iter_7_1:ExistActionFeedback() then
			arg_7_0:NotifiyCore(ISLAND_EVT.SHOW_NPC_ANIMATION_BUBBLE, iter_7_1)
		end
	end
end

function var_0_0.GetMapID(arg_8_0)
	return arg_8_0.mapId
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_9_0.OnPlayerAdd)
	arg_9_0:AddIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_9_0.OnPlayerExit)
	arg_9_0:AddIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_9_0.OnPlayerChangeDress)
	arg_9_0:AddIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_9_0.OnShipChangeDress)
	arg_9_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_9_0.OnSyncDataUpdate)
	arg_9_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_9_0.OnSyncObjUpdate)
	arg_9_0:AddIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_9_0.OnCollectSlotUnitInit)
	arg_9_0:AddIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_UPDATE, arg_9_0.OnCollectSlotUnitUpdate)
	arg_9_0:AddIslandListener(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, arg_9_0.OnCollectSloSlotUnitRemove)
	arg_9_0:AddIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_9_0.OnStartDelegation)
	arg_9_0:AddIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_9_0.OnEndDelegation)
	arg_9_0:AddIslandListener(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, arg_9_0.OnGetAllDelegationAward)
	arg_9_0:AddIslandListener(IslandTaskAgency.TASK_ADDED, arg_9_0.OnTaskAdd)
	arg_9_0:AddIslandListener(IslandTaskAgency.TASK_FINISH, arg_9_0.OnFinishTask)
	arg_9_0:AddIslandListener(IslandTaskAgency.TASK_UPDATED, arg_9_0.OnUpdateTask)
	arg_9_0:AddIslandListener(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, arg_9_0.OnStartPlant)
	arg_9_0:AddIslandListener(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, arg_9_0.OnEndPlant)
	arg_9_0:AddIslandListener(IslandSlotCollectCommand.START_HAND_COLLECT_DONE, arg_9_0.OnStartHandCollect)
	arg_9_0:AddIslandListener(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, arg_9_0.OnHandPlantSlotChangeUnit)
	arg_9_0:AddIslandListener(IslandBuildingAgency.CHANGE_PRODUCT_MODEL, arg_9_0.OnProductPlaceChangeUnit)
	arg_9_0:AddIslandListener(IslandGatherCollectAgency.RemoveGatherUnit, arg_9_0.OnRemoveWildGatherDone)
	arg_9_0:AddIslandListener(IslandGatherCollectAgency.AddGatherUnit, arg_9_0.OnAddWildGatherDone)
	arg_9_0:AddIslandListener(ISLAND_EVT.CHANGE_SLOT_MODEL, arg_9_0.OnChangeSlotModel)
	arg_9_0:AddIslandListener(IslandOpenRestaurantCommand.OPEN_RESTAURANT, arg_9_0.OnOpenRestaurant)
	arg_9_0:AddIslandListener(IslandCloseRestaurantCommand.CLOSE_RESTAURANT, arg_9_0.OnCloseRestaurant)
	arg_9_0:AddIslandListener(IslandProxy.STORY_START, arg_9_0.OnStartStory)
	arg_9_0:AddIslandListener(IslandProxy.STORY_END, arg_9_0.OnEndStory)
	arg_9_0:AddIslandListener(IslandProxy.PERFORMANCE_START, arg_9_0.OnStartPerformance)
	arg_9_0:AddIslandListener(IslandProxy.PERFORMANCE_END, arg_9_0.OnEndPerformance)
	arg_9_0:AddIslandListener(IslandProxy.START_PATHFINDER, arg_9_0.OnStartPathFinder)
	arg_9_0:AddIslandListener(IslandProxy.END_PATHFINDER, arg_9_0.OnEndPathFinder)
	arg_9_0:AddIslandListener(IslandProxy.ACTIVE_OR_DISABLE_UNIT, arg_9_0.OnActiveOrDisableUnit)
	arg_9_0:AddIslandListener(IslandProxy.LINK_CORE, arg_9_0.OnLinkCore)
	arg_9_0:AddIslandListener(IslandBuildingAgency.GEN_ANIMAL_INT, arg_9_0.OnAnimalInit)
	arg_9_0:AddIslandListener(IslandBuildingAgency.SLOT_DELEGATE_INIT, arg_9_0.OnSlotDelegateInit)
	arg_9_0:AddIslandListener(IslandNpcFeedbackAgency.NPC_ACTION_CHANGE, arg_9_0.OnNpcActionFeedBackChange)
	arg_9_0:AddIslandListener(IslandNpcFeedbackAgency.RESET_NPC_ACTIONS, arg_9_0.OnResetNpcActionFeedback)
	arg_9_0:AddIslandListener(IslandFollowerAgency.ADD_FOLLOWER, arg_9_0.OnAddFollower)
	arg_9_0:AddIslandListener(IslandFollowerAgency.DEL_FOLLOWER, arg_9_0.OnDelFollower)
	arg_9_0:AddIslandListener(ActivityProxy.ACTIVITY_UPDATED, arg_9_0.OnActivityUpdate)
	arg_9_0:AddIslandListener(IslandProxy.GEN_RECYCLEITEM, arg_9_0.OnGenRecycleItem)
	arg_9_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_ADD, arg_9_0.OnActivityNpcAdd)
	arg_9_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_UPDATE, arg_9_0.OnActivityNpcUpdate)
	arg_9_0:AddIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_DEL, arg_9_0.OnActivityNpcDel)
	arg_9_0:AddIslandListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_9_0.OnSystemUnlock)
	arg_9_0:AddIslandListener(IslandProxy.LOCK_NPC_REFRESH, arg_9_0.OnLockNpcRefresh)
	arg_9_0:AddIslandListener(IslandProxy.RELEASE_NPC_REFRESH, arg_9_0.OnReleaseNpcRefresh)
	arg_9_0:AddIslandListener(IslandProxy.RESET_SP, arg_9_0.OnResetSp)
	arg_9_0:AddIslandListener(IslandFishingAgency.BAIT_UPDATE, arg_9_0.OnBaitUpdate)
	arg_9_0:AddIslandListener(ISLAND_EVT.SWITCH_MAP, arg_9_0.OnSwitchMap)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_10_0.OnPlayerAdd)
	arg_10_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_10_0.OnPlayerExit)
	arg_10_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_10_0.OnPlayerChangeDress)
	arg_10_0:RemoveIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_10_0.OnShipChangeDress)
	arg_10_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_10_0.OnSyncDataUpdate)
	arg_10_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_10_0.OnSyncObjUpdate)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_10_0.OnCollectSlotUnitInit)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_UPDATE, arg_10_0.OnCollectSlotUnitUpdate)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SLOT_UNIT_REMOVE, arg_10_0.OnCollectSloSlotUnitRemove)
	arg_10_0:RemoveIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_10_0.OnStartDelegation)
	arg_10_0:RemoveIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_10_0.OnEndDelegation)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.SLOT_RESET_DELEGATION_STATE_DONE, arg_10_0.OnGetAllDelegationAward)
	arg_10_0:RemoveIslandListener(IslandTaskAgency.TASK_ADDED, arg_10_0.OnTaskAdd)
	arg_10_0:RemoveIslandListener(IslandTaskAgency.TASK_FINISH, arg_10_0.OnFinishTask)
	arg_10_0:RemoveIslandListener(IslandTaskAgency.TASK_UPDATED, arg_10_0.OnUpdateTask)
	arg_10_0:RemoveIslandListener(IslandSlotHandPlantCommand.START_HANDPLANT_DONE, arg_10_0.OnStartPlant)
	arg_10_0:RemoveIslandListener(IslandSlotHandPlantAwardCommand.START_HANDPLANT_AWARD_DONE, arg_10_0.OnEndPlant)
	arg_10_0:RemoveIslandListener(IslandSlotCollectCommand.START_HAND_COLLECT_DONE, arg_10_0.OnStartHandCollect)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.SLOT_HANDPLABT_SLOT_UNIT_CHANGE, arg_10_0.OnHandPlantSlotChangeUnit)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.CHANGE_PRODUCT_MODEL, arg_10_0.OnProductPlaceChangeUnit)
	arg_10_0:RemoveIslandListener(IslandGatherCollectAgency.RemoveGatherUnit, arg_10_0.OnRemoveWildGatherDone)
	arg_10_0:RemoveIslandListener(IslandGatherCollectAgency.AddGatherUnit, arg_10_0.OnAddWildGatherDone)
	arg_10_0:RemoveIslandListener(ISLAND_EVT.CHANGE_SLOT_MODEL, arg_10_0.OnChangeSlotModel)
	arg_10_0:RemoveIslandListener(IslandOpenRestaurantCommand.OPEN_RESTAURANT, arg_10_0.OnOpenRestaurant)
	arg_10_0:RemoveIslandListener(IslandProxy.STORY_START, arg_10_0.OnStartStory)
	arg_10_0:RemoveIslandListener(IslandProxy.STORY_END, arg_10_0.OnEndStory)
	arg_10_0:RemoveIslandListener(IslandProxy.PERFORMANCE_START, arg_10_0.OnStartPerformance)
	arg_10_0:RemoveIslandListener(IslandProxy.PERFORMANCE_END, arg_10_0.OnEndPerformance)
	arg_10_0:RemoveIslandListener(IslandProxy.START_PATHFINDER, arg_10_0.OnStartPathFinder)
	arg_10_0:RemoveIslandListener(IslandProxy.END_PATHFINDER, arg_10_0.OnEndPathFinder)
	arg_10_0:RemoveIslandListener(IslandProxy.ACTIVE_OR_DISABLE_UNIT, arg_10_0.OnActiveOrDisableUnit)
	arg_10_0:RemoveIslandListener(IslandProxy.LINK_CORE, arg_10_0.OnLinkCore)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.GEN_ANIMAL_INT, arg_10_0.OnAnimalInit)
	arg_10_0:RemoveIslandListener(IslandBuildingAgency.SLOT_DELEGATE_INIT, arg_10_0.OnSlotDelegateInit)
	arg_10_0:RemoveIslandListener(IslandNpcFeedbackAgency.NPC_ACTION_CHANGE, arg_10_0.OnNpcActionFeedBackChange)
	arg_10_0:RemoveIslandListener(IslandNpcFeedbackAgency.RESET_NPC_ACTIONS, arg_10_0.OnResetNpcActionFeedback)
	arg_10_0:RemoveIslandListener(IslandFollowerAgency.ADD_FOLLOWER, arg_10_0.OnAddFollower)
	arg_10_0:RemoveIslandListener(IslandFollowerAgency.DEL_FOLLOWER, arg_10_0.OnDelFollower)
	arg_10_0:RemoveIslandListener(ActivityProxy.ACTIVITY_UPDATED, arg_10_0.OnActivityUpdate)
	arg_10_0:RemoveIslandListener(IslandProxy.GEN_RECYCLEITEM, arg_10_0.OnGenRecycleItem)
	arg_10_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_ADD, arg_10_0.OnActivityNpcAdd)
	arg_10_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_UPDATE, arg_10_0.OnActivityNpcUpdate)
	arg_10_0:RemoveIslandListener(IslandActivityNpcAgency.ACTIVITY_NPC_DEL, arg_10_0.OnActivityNpcDel)
	arg_10_0:RemoveIslandListener(IslandAblityAgency.UNLOCK_SYSTEM, arg_10_0.OnSystemUnlock)
	arg_10_0:RemoveIslandListener(IslandProxy.LOCK_NPC_REFRESH, arg_10_0.OnLockNpcRefresh)
	arg_10_0:RemoveIslandListener(IslandProxy.RELEASE_NPC_REFRESH, arg_10_0.OnReleaseNpcRefresh)
	arg_10_0:RemoveIslandListener(IslandProxy.RESET_SP, arg_10_0.OnResetSp)
	arg_10_0:RemoveIslandListener(IslandFishingAgency.BAIT_UPDATE, arg_10_0.OnBaitUpdate)
	arg_10_0:RemoveIslandListener(ISLAND_EVT.SWITCH_MAP, arg_10_0.OnSwitchMap)
end

function var_0_0.OnBaitUpdate(arg_11_0, arg_11_1)
	arg_11_0:NotifiyCore(ISLAND_EVT.BAIT_UPDATE, arg_11_1)
end

function var_0_0.OnResetSp(arg_12_0)
	local var_12_0 = arg_12_0.mapId
	local var_12_1 = pg.island_world_objects.get_id_list_by_mapId[var_12_0] or {}

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		local var_12_2 = pg.island_world_objects[iter_12_1]

		if var_12_2.unitId == 0 then
			spConfig = var_12_2

			break
		end
	end

	if not spConfig then
		return
	end

	local var_12_3 = BuildVector3(spConfig.param.position)
	local var_12_4 = BuildVector3(spConfig.param.rotation)
	local var_12_5 = getProxy(PlayerProxy):getRawData().id

	arg_12_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, var_12_5, IslandConst.UNIT_LIST_PLAYER, var_12_3)
	arg_12_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_ROT, var_12_5, IslandConst.UNIT_LIST_PLAYER, var_12_4)
end

function var_0_0.OnLockNpcRefresh(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.visibilityAllocator:LockNpc(arg_13_1, arg_13_2)
end

function var_0_0.OnReleaseNpcRefresh(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.visibilityAllocator:ReleaseNpc(arg_14_1, arg_14_2)
end

function var_0_0.OnSystemUnlock(arg_15_0, arg_15_1)
	arg_15_0:NotifiyCore(ISLAND_EVT.SYSTEM_UNLOCK, arg_15_1)
end

function var_0_0.OnActivityNpcAdd(arg_16_0, arg_16_1)
	arg_16_0.activityNpcAllocator:AddNpc(arg_16_1)
	arg_16_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcUpdate(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.activityNpcAllocator:DelNpc(arg_17_1)
	arg_17_0.activityNpcAllocator:AddNpc(arg_17_2)
	arg_17_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcDel(arg_18_0, arg_18_1)
	arg_18_0.activityNpcAllocator:DelNpc(arg_18_1)
	arg_18_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityUpdate(arg_19_0)
	arg_19_0.activityNpcAllocator:Flush()
end

function var_0_0.OnGenRecycleItem(arg_20_0, arg_20_1)
	local var_20_0 = IslandDataConvertor.GenDelayRecycleIslandUnit(arg_20_1)

	arg_20_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_20_0)
end

function var_0_0.OnAddFollower(arg_21_0, arg_21_1)
	local var_21_0 = #arg_21_0.sceneData.followUnits > 0
	local var_21_1 = arg_21_0:GetIsland():GetCharacterAgency():GetShipById(arg_21_1)
	local var_21_2 = var_21_1:GetModelUnit()
	local var_21_3 = arg_21_0:GetView():GetPlayerPosition()
	local var_21_4 = IslandFollowerUnitVO.New(var_21_1.id, arg_21_1, var_21_2, var_21_3, Vector3(0, 0, 0), not var_21_0)

	table.insert(arg_21_0.sceneData.followUnits, var_21_4)
	arg_21_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_21_4)

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.sceneData.strollUnits) do
		if var_21_1:getConfig("unit_id") == iter_21_1.config.unit_id then
			arg_21_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_STROLL, iter_21_1.id)
		end
	end

	arg_21_0:NotifiyCore(ISLAND_EVT.ADD_FOLLOWER, var_21_4.id)
end

function var_0_0.OnDelFollower(arg_22_0, arg_22_1)
	local var_22_0 = 0

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.sceneData.followUnits) do
		if iter_22_1.id == arg_22_1 then
			var_22_0 = iter_22_0

			break
		end
	end

	if var_22_0 <= 0 then
		return
	end

	local var_22_1 = table.remove(arg_22_0.sceneData.followUnits, var_22_0)

	arg_22_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_FOLLOW, var_22_1.id)

	if var_22_1:IsRandomizer() and #arg_22_0.sceneData.followUnits > 0 then
		local var_22_2 = arg_22_0.sceneData.followUnits[1]

		var_22_2:ActiveRandomizer()
		arg_22_0:NotifiyCore(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, var_22_2.id)
	end

	local var_22_3 = arg_22_0:GetIsland():GetCharacterAgency():GetShipById(arg_22_1)

	for iter_22_2, iter_22_3 in ipairs(arg_22_0.sceneData.strollUnits) do
		if var_22_3:getConfig("unit_id") == iter_22_3.config.unit_id then
			arg_22_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_22_3)
		end
	end

	arg_22_0:NotifiyCore(ISLAND_EVT.DEL_FOLLOWER, var_22_1.id)
end

function var_0_0.OnResetNpcActionFeedback(arg_23_0)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.sceneData.strollUnits) do
		if iter_23_1:ExistActionFeedback() then
			iter_23_1:ClearActionFeedback()
			arg_23_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_23_1)
		end
	end

	IslandDataConvertor.DistributeAward4StrollUnits(arg_23_0.sceneData.strollUnits, arg_23_0:GetIsland())
	arg_23_0:InitStrollUnitsAwards()
end

function var_0_0.OnNpcActionFeedBackChange(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.sceneData.strollUnits) do
		if iter_24_1.id == arg_24_1 and iter_24_1:ExistActionFeedback() then
			iter_24_1:ClearActionFeedback()
			arg_24_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_24_1)
		end
	end
end

function var_0_0.OnLinkCore(arg_25_0, arg_25_1, ...)
	arg_25_0:NotifiyCore(arg_25_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	arg_26_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_26_1, arg_26_2, arg_26_3)
end

function var_0_0.OnStartPathFinder(arg_27_0, arg_27_1)
	arg_27_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_27_1)
end

function var_0_0.OnEndPathFinder(arg_28_0)
	arg_28_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_29_0)
	arg_29_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_29_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_30_0, arg_30_1)
	arg_30_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_30_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)

	if arg_30_1 then
		arg_30_0:OnUpdateTask()
	end
end

function var_0_0.OnStartStory(arg_31_0)
	arg_31_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_32_0, arg_32_1)
	arg_32_0:NotifiyCore(ISLAND_EVT.END_STORY)

	if arg_32_1 then
		arg_32_0.visibilityAllocator:Flush()
	end
end

function var_0_0.OnTaskAdd(arg_33_0)
	arg_33_0.visibilityAllocator:Flush()
	arg_33_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_33_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_34_0, arg_34_1)
	arg_34_0.visibilityAllocator:Flush()
	arg_34_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_34_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	arg_34_0:CheckFinishTask(arg_34_1, IslandTaskType.DAILY, "daily_task_follow_action")
	arg_34_0:CheckFinishTask(arg_34_1, IslandTaskType.WEEKLY, "weekly_task_follow_action")
end

local function var_0_1(arg_35_0)
	if #arg_35_0 == 0 then
		return nil
	end

	return arg_35_0[math.random(1, #arg_35_0)]
end

function var_0_0.CheckFinishTask(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	if IslandTask.New({
		id = arg_36_1,
		process_list = {}
	}):GetType() ~= arg_36_2 then
		return
	end

	local var_36_0 = pg.island_set[arg_36_3]

	if not var_36_0 then
		return
	end

	local var_36_1 = var_36_0 and (var_36_0.key_value_varchar or {}) or {}
	local var_36_2 = arg_36_0:GetSelfIsland():GetTaskAgency()
	local var_36_3 = var_36_2:GetTasks()

	for iter_36_0, iter_36_1 in ipairs(var_36_3) do
		if iter_36_1:GetType() == arg_36_2 then
			return
		end
	end

	local var_36_4 = false
	local var_36_5 = var_36_2:GetFinishedIds()

	for iter_36_2, iter_36_3 in ipairs(var_36_5) do
		if IslandTask.New({
			id = iter_36_3,
			process_list = {}
		}):GetType() == arg_36_2 then
			var_36_4 = true

			break
		end
	end

	if var_36_4 then
		arg_36_0:NotifiyCore(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, var_0_1(var_36_1))
	end
end

function var_0_0.OnUpdateTask(arg_37_0)
	arg_37_0:Debounce("RefreshTask", function()
		if not arg_37_0.visibilityAllocator then
			return
		end

		arg_37_0.visibilityAllocator:Flush()
		arg_37_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
		arg_37_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	end, 0.5, false)()
end

function var_0_0.Debounce(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	if not arg_39_0.__debouncers then
		arg_39_0.__debouncers = {}
	end

	if not arg_39_0.__debouncers[arg_39_1] then
		arg_39_0.__debouncers[arg_39_1] = debounce(arg_39_2, arg_39_3, arg_39_4)
	end

	return arg_39_0.__debouncers[arg_39_1]
end

function var_0_0.OnPlayerAdd(arg_40_0, arg_40_1)
	local var_40_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_40_1.player, arg_40_0.mapId, arg_40_0:GetIsland().id)

	arg_40_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_40_0, function(arg_41_0)
		arg_40_0.islandSyncMgr:OnVisitorEnter(arg_40_1.player.id, arg_41_0)
	end)
end

function var_0_0.OnPlayerExit(arg_42_0, arg_42_1)
	arg_42_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_42_1.id)
	arg_42_0.islandSyncMgr:OnVisitorExit(arg_42_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_43_1, arg_43_2)
end

function var_0_0.OnShipChangeDress(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	arg_44_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
end

function var_0_0.OnStartPlant(arg_45_0, arg_45_1)
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

	local var_45_2 = var_45_0:GenHandPlantUnitBySlotData(arg_45_1.area_id, arg_45_1.formula_id)

	arg_45_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_45_2)
	arg_45_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_45_1)
end

function var_0_0.OnEndPlant(arg_46_0, arg_46_1)
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

	arg_46_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_46_1)

	local var_46_2 = var_46_0:GenHandPlantUnitBySlotData(arg_46_1.area_id)

	arg_46_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_46_2)
	arg_46_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_46_1)
end

function var_0_0.OnStartDelegation(arg_47_0, arg_47_1)
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

	local var_47_1

	for iter_47_2, iter_47_3 in ipairs(arg_47_0.sceneData.productSystems) do
		if iter_47_3.id == arg_47_1.build_id then
			var_47_1 = iter_47_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_47_1.build_id) then
		local var_47_2 = pg.island_production_slot[arg_47_1.area_id]

		for iter_47_4, iter_47_5 in ipairs(var_47_2.exclusion_slot) do
			local var_47_3 = var_47_1:GetUnitIdBySlotId(iter_47_5)
			local var_47_4 = var_47_1:GetUnitVOByUnitId(var_47_3)

			if var_47_4 then
				var_47_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_47_5 = {}

	if table.contains(IslandProductConst.havePerformPlace, arg_47_1.build_id) then
		local var_47_6 = var_47_1:GetDelegateUnitsByBuildIdAndSlotId(arg_47_1.build_id, arg_47_1.area_id, arg_47_1.formula_id)

		var_47_5.commissionSlotId = var_47_1:GetCommissionSlotId(arg_47_1.area_id)
		var_47_5.unitIds = {}

		for iter_47_6, iter_47_7 in ipairs(var_47_6) do
			table.insert(var_47_5.unitIds, iter_47_7.id)
		end

		for iter_47_8, iter_47_9 in ipairs(var_47_6) do
			arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_47_9)
		end
	end

	local var_47_7 = var_47_1:GetDelegateEffectsByCommissonId(arg_47_1.area_id)

	if var_47_7 then
		local var_47_8 = var_47_1:GenUnitByDelegateEffectId(var_47_7)

		if var_47_8 then
			arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_47_8)
		end
	end

	local var_47_9 = var_47_0:GetUnit(arg_47_1.ship_id, arg_47_1.area_id, true)

	if var_47_9 then
		arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_47_9)
	end

	arg_47_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_47_1, var_47_5)
end

function var_0_0.OnEndDelegation(arg_48_0, arg_48_1)
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

	arg_48_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_48_1)

	local var_48_1 = var_48_0:GetUnitShipIdBySlotId(arg_48_1.ship_id, arg_48_1.area_id)

	if var_48_1 then
		arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_48_1)
	end

	local var_48_2

	for iter_48_2, iter_48_3 in ipairs(arg_48_0.sceneData.productSystems) do
		if iter_48_3.id == arg_48_1.build_id then
			var_48_2 = iter_48_3

			break
		end
	end

	if table.contains(IslandProductConst.havePerformPlace, arg_48_1.build_id) then
		local var_48_3 = var_48_2:GetDelegatUnitsBySlotId(arg_48_1.area_id)

		for iter_48_4, iter_48_5 in ipairs(var_48_3) do
			arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATE_UNIT, iter_48_5)
		end
	end

	local var_48_4 = var_48_2:GetDelegateEffectsByCommissonId(arg_48_1.area_id)

	if var_48_4 then
		arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_48_4)
	end

	if arg_48_1.remainReward then
		return
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_48_1.build_id) then
		local var_48_5 = pg.island_production_slot[arg_48_1.area_id]

		for iter_48_6, iter_48_7 in ipairs(var_48_5.exclusion_slot) do
			local var_48_6 = var_48_2:GetUnitIdBySlotId(iter_48_7)

			arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_48_6)

			local var_48_7 = var_48_2:GenHandPlantUnitBySlotData(iter_48_7)

			arg_48_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_48_7)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_49_0, arg_49_1)
	local var_49_0

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.sceneData.systemList) do
		if isa(iter_49_1, IslandCharacterSystemVO) and iter_49_1.id == arg_49_1.build_id then
			var_49_0 = iter_49_1

			break
		end
	end

	if not var_49_0 then
		return
	end

	local var_49_1

	for iter_49_2, iter_49_3 in ipairs(arg_49_0.sceneData.productSystems) do
		if iter_49_3.id == arg_49_1.build_id then
			var_49_1 = iter_49_3

			break
		end
	end

	if arg_49_1.build_id == IslandProductConst.FarmlandPlaceId or arg_49_1.build_id == IslandProductConst.OrchardPlaceId or arg_49_1.build_id == IslandProductConst.GardenPlaceId then
		local var_49_2 = pg.island_production_slot[arg_49_1.area_id]

		for iter_49_4, iter_49_5 in ipairs(var_49_2.exclusion_slot) do
			local var_49_3 = var_49_1:GetUnitIdBySlotId(iter_49_5)

			arg_49_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_49_3)

			local var_49_4 = var_49_1:GenHandPlantUnitBySlotData(iter_49_5)

			arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_49_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_50_0, arg_50_1)
	local var_50_0

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.sceneData.productSystems) do
		if iter_50_1.id == IslandProductConst.FarmlandPlaceId then
			var_50_0 = iter_50_1

			break
		end
	end

	if not var_50_0 then
		return
	end

	arg_50_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_50_1.id)

	local var_50_1 = var_50_0:GetUnitVOByUnitId(arg_50_1.id)

	var_50_1.modelId = arg_50_1.modelId

	arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_50_1)
end

function var_0_0.OnStartHandCollect(arg_51_0, arg_51_1)
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

	local var_51_1 = var_51_0:GetUnitIdBySlotId(arg_51_1.area_id)

	arg_51_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_51_1)
	arg_51_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_51_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_52_0, arg_52_1)
	local var_52_0

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.productSystems) do
		if iter_52_1.id == arg_52_1.build_id then
			var_52_0 = iter_52_1

			break
		end
	end

	if not var_52_0 then
		return
	end

	local var_52_1 = var_52_0:GetUnitIdBySlotId(arg_52_1.slotId)

	arg_52_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_52_1)

	local var_52_2 = var_52_0:GenHandPlantUnitBySlotData(arg_52_1.slotId)

	arg_52_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_52_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.build_id
	local var_53_1

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.sceneData.productSystems) do
		if iter_53_1.id == var_53_0 then
			var_53_1 = iter_53_1

			break
		end
	end

	if not var_53_1 then
		return
	end

	local var_53_2 = var_53_1:GetPlaceModelId(false)

	arg_53_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_53_2)

	local var_53_3 = var_53_1:GetPlaceModelUnit(true)

	arg_53_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_53_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_54_0, arg_54_1)
	arg_54_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_54_1.unitId)
	arg_54_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_54_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_55_0, arg_55_1)
	local var_55_0 = IslandDataConvertor.GenWildGatherUnit(arg_55_1)

	arg_55_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_55_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_56_0, arg_56_1)
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

	local var_56_3 = var_56_2:InitHandCollectSlotBySlotId(var_56_0)

	if var_56_3 then
		arg_56_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_56_3)
	end
end

function var_0_0.OnCollectSlotUnitUpdate(arg_57_0, arg_57_1)
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

	local var_57_3 = var_57_2:GetUnitIdBySlotId(arg_57_1.slotId)

	if var_57_3 then
		arg_57_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_57_3)
		arg_57_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_57_3)
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1.slotId
	local var_58_1 = pg.island_production_slot[var_58_0].place
	local var_58_2

	for iter_58_0, iter_58_1 in ipairs(arg_58_0.sceneData.productSystems) do
		if iter_58_1.id == var_58_1 then
			var_58_2 = iter_58_1

			break
		end
	end

	if not var_58_2 then
		return
	end

	local var_58_3 = var_58_2:GetHandCollectSlotBySlotId(var_58_0)

	arg_58_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_58_3)
end

function var_0_0.OnSyncDataUpdate(arg_59_0, arg_59_1)
	arg_59_0.islandSyncMgr:HandleSyncData(arg_59_1)
end

function var_0_0.OnSyncObjUpdate(arg_60_0, arg_60_1)
	arg_60_0.islandSyncMgr:HandleSyncObj(arg_60_1)
end

function var_0_0.Update(arg_61_0)
	arg_61_0.playerInputManager:Update()
	arg_61_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_62_0)
	if arg_62_0.playerInputManager then
		arg_62_0.playerInputManager:Dispose()

		arg_62_0.playerInputManager = nil
	end

	if arg_62_0.islandSyncMgr then
		arg_62_0.islandSyncMgr:Dispose()

		arg_62_0.islandSyncMgr = nil
	end

	if arg_62_0.strollAllocator then
		arg_62_0.strollAllocator:Dispose()

		arg_62_0.strollAllocator = nil
	end

	if arg_62_0.visibilityAllocator then
		arg_62_0.visibilityAllocator:Dispose()

		arg_62_0.visibilityAllocator = nil
	end

	if arg_62_0.giftAllocator then
		arg_62_0.giftAllocator:Dispose()

		arg_62_0.giftAllocator = nil
	end

	if arg_62_0.timeDelayCreate then
		arg_62_0.timeDelayCreate:Dispose()

		arg_62_0.timeDelayCreate = nil
	end

	if arg_62_0.activityNpcAllocator then
		arg_62_0.activityNpcAllocator:Dispose()

		arg_62_0.activityNpcAllocator = nil
	end

	arg_62_0.__debouncers = nil
end

function var_0_0.OnAnimalInit(arg_63_0, arg_63_1)
	local var_63_0

	for iter_63_0, iter_63_1 in ipairs(arg_63_0.sceneData.productSystems) do
		if iter_63_1.id == IslandProductConst.PasturePlaceId then
			var_63_0 = iter_63_1

			break
		end
	end

	if not var_63_0 then
		return
	end

	local var_63_1 = arg_63_1.slotId

	for iter_63_2, iter_63_3 in ipairs(arg_63_1.aniList) do
		local var_63_2 = var_63_0:GenAnimalByAnialConfig(iter_63_3, var_63_1)

		arg_63_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_63_2)
	end
end

function var_0_0.OnSlotDelegateInit(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_1.slotId
	local var_64_1 = pg.island_production_slot[var_64_0].place
	local var_64_2

	for iter_64_0, iter_64_1 in ipairs(arg_64_0.sceneData.productSystems) do
		if iter_64_1.id == var_64_1 then
			var_64_2 = iter_64_1

			break
		end
	end

	if not var_64_2 then
		return
	end

	local var_64_3 = var_64_2:GetCommissionSlotId(var_64_0)
	local var_64_4 = pg.island_production_commission[var_64_3].unlockObjid

	if var_64_4 ~= 0 then
		arg_64_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_64_4)
	end
end

function var_0_0.IsPlayerInTimeline(arg_65_0)
	return arg_65_0.islandSyncMgr.player:InTimeline()
end

function var_0_0.InitSyncMgr(arg_66_0)
	arg_66_0.islandSyncMgr:Init(arg_66_0.sceneData.unitList)
end

function var_0_0.SetVisitorSyncData(arg_67_0, arg_67_1, arg_67_2)
	arg_67_0:NotifiyCore(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_67_1, arg_67_2)
end

function var_0_0.WorldObjectInterAction(arg_68_0, arg_68_1, arg_68_2, arg_68_3)
	arg_68_3 = arg_68_3 or 1

	local var_68_0 = _.detect(arg_68_0.sceneData.unitList, function(arg_69_0)
		return arg_69_0.id == arg_68_1
	end)

	if not var_68_0 or not var_68_0:Interactable() then
		return
	end

	local var_68_1 = var_68_0:GetEmptySlot()

	if not var_68_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_interact_point"))

		return
	end

	local function var_68_2()
		var_68_1:Lock(arg_68_2)
		arg_68_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_68_0, var_68_1, arg_68_3)
	end

	arg_68_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_68_1, var_68_1.id, arg_68_3, function(arg_71_0)
		if arg_71_0 then
			var_68_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_72_0, arg_72_1, arg_72_2, arg_72_3, arg_72_4)
	arg_72_3 = arg_72_3 or 1

	local var_72_0 = _.detect(arg_72_0.sceneData.unitList, function(arg_73_0)
		return arg_73_0.id == arg_72_1
	end)

	if not var_72_0 or not var_72_0:Interactable() then
		return
	end

	local var_72_1 = var_72_0:GetSlotById(arg_72_4)

	var_72_1:Lock(arg_72_2)
	arg_72_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_72_0, var_72_1, arg_72_3)
end

function var_0_0.WorldObjectInterActionEnd(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = _.detect(arg_74_0.sceneData.unitList, function(arg_75_0)
		return arg_75_0.id == arg_74_1
	end)

	if not var_74_0 or not var_74_0:Interactable() then
		return
	end

	local var_74_1 = var_74_0:GetUsingSlot(arg_74_2)

	local function var_74_2()
		local var_76_0 = Clone(var_74_1)

		var_74_1:Release()
		arg_74_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_74_0, var_76_0)
	end

	arg_74_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_74_1, var_74_1.id, function(arg_77_0)
		if arg_77_0 then
			var_74_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_78_0, arg_78_1, arg_78_2)
	local var_78_0 = _.detect(arg_78_0.sceneData.unitList, function(arg_79_0)
		return arg_79_0.id == arg_78_1
	end)

	if not var_78_0 or not var_78_0:Interactable() then
		return
	end

	local var_78_1 = var_78_0:GetUsingSlot(arg_78_2)
	local var_78_2 = Clone(var_78_1)

	var_78_1:Release()
	arg_78_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_78_0, var_78_2)
end

function var_0_0.WorldObjectInitStatus(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = _.detect(arg_80_0.sceneData.unitList, function(arg_81_0)
		return arg_81_0.id == arg_80_1
	end)

	warning("init", arg_80_1, arg_80_2, var_80_0)

	if not var_80_0 or not var_80_0:Interactable() then
		return
	end

	arg_80_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_80_0, arg_80_2)
end

function var_0_0.OnOpenRestaurant(arg_82_0, arg_82_1)
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

	local var_82_3 = var_82_2:GetUnits(var_82_1)

	for iter_82_2, iter_82_3 in ipairs(var_82_3) do
		arg_82_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_82_3)
	end

	arg_82_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_82_2)
end

function var_0_0.OnCloseRestaurant(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_1.restId
	local var_83_1 = arg_83_1.postList
	local var_83_2

	for iter_83_0, iter_83_1 in ipairs(arg_83_0.sceneData.systemList) do
		if isa(iter_83_1, IslandManageSystemVO) and iter_83_1.id == var_83_0 then
			var_83_2 = iter_83_1

			break
		end
	end

	if not var_83_2 then
		return
	end

	arg_83_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_83_2)

	local var_83_3 = var_83_2:GetUnits(var_83_1)

	for iter_83_2, iter_83_3 in ipairs(var_83_3) do
		arg_83_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_83_3.id)
	end
end

function var_0_0.OnSwitchMap(arg_84_0)
	if arg_84_0.islandSyncMgr and arg_84_0.islandSyncMgr:IsPlayerInTimeline() then
		arg_84_0:NotifiyCore(ISLAND_EVT.INIT_INTERACTION_OP_VIEW)
	end
end

return var_0_0

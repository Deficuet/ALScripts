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
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_8_0.OnPlayerAdd)
	arg_8_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_8_0.OnPlayerExit)
	arg_8_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_8_0.OnPlayerChangeDress)
	arg_8_0:RemoveIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_8_0.OnShipChangeDress)
	arg_8_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_8_0.OnSyncDataUpdate)
	arg_8_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_8_0.OnSyncObjUpdate)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, arg_8_0.OnCollectSlotUnitInit)
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
end

function var_0_0.OnSystemUnlock(arg_9_0, arg_9_1)
	arg_9_0:NotifiyCore(ISLAND_EVT.SYSTEM_UNLOCK, arg_9_1)
end

function var_0_0.OnActivityNpcAdd(arg_10_0, arg_10_1)
	arg_10_0.activityNpcAllocator:AddNpc(arg_10_1)
	arg_10_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcUpdate(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.activityNpcAllocator:DelNpc(arg_11_1)
	arg_11_0.activityNpcAllocator:AddNpc(arg_11_2)
	arg_11_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcDel(arg_12_0, arg_12_1)
	arg_12_0.activityNpcAllocator:DelNpc(arg_12_1)
	arg_12_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityUpdate(arg_13_0)
	arg_13_0.activityNpcAllocator:Flush()
end

function var_0_0.OnGenRecycleItem(arg_14_0, arg_14_1)
	local var_14_0 = IslandDataConvertor.GenDelayRecycleIslandUnit(arg_14_1)

	arg_14_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_14_0)
end

function var_0_0.OnAddFollower(arg_15_0, arg_15_1)
	local var_15_0 = #arg_15_0.sceneData.followUnits > 0
	local var_15_1 = arg_15_0:GetIsland():GetCharacterAgency():GetShipById(arg_15_1)
	local var_15_2 = var_15_1:GetModelUnit()
	local var_15_3 = arg_15_0:GetView():GetPlayerPosition()
	local var_15_4 = IslandFollowerUnitVO.New(var_15_1.id, arg_15_1, var_15_2, var_15_3, Vector3(0, 0, 0), not var_15_0)

	table.insert(arg_15_0.sceneData.followUnits, var_15_4)
	arg_15_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_15_4)

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.sceneData.strollUnits) do
		if var_15_1:getConfig("unit_id") == iter_15_1.config.unit_id then
			arg_15_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_STROLL, iter_15_1.id)
		end
	end

	arg_15_0:NotifiyCore(ISLAND_EVT.ADD_FOLLOWER)
end

function var_0_0.OnDelFollower(arg_16_0, arg_16_1)
	local var_16_0 = 0

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.sceneData.followUnits) do
		if iter_16_1.id == arg_16_1 then
			var_16_0 = iter_16_0

			break
		end
	end

	if var_16_0 <= 0 then
		return
	end

	local var_16_1 = table.remove(arg_16_0.sceneData.followUnits, var_16_0)

	arg_16_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_FOLLOW, var_16_1.id)

	if var_16_1:IsRandomizer() and #arg_16_0.sceneData.followUnits > 0 then
		local var_16_2 = arg_16_0.sceneData.followUnits[1]

		var_16_2:ActiveRandomizer()
		arg_16_0:NotifiyCore(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, var_16_2.id)
	end

	local var_16_3 = arg_16_0:GetIsland():GetCharacterAgency():GetShipById(arg_16_1)

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.sceneData.strollUnits) do
		if var_16_3:getConfig("unit_id") == iter_16_3.config.unit_id then
			arg_16_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_16_3)
		end
	end

	arg_16_0:NotifiyCore(ISLAND_EVT.DEL_FOLLOWER)
end

function var_0_0.OnResetNpcActionFeedback(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.sceneData.strollUnits) do
		if iter_17_1:ExistActionFeedback() then
			iter_17_1:ClearActionFeedback()
			arg_17_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_17_1)
		end
	end

	IslandDataConvertor.DistributeAward4StrollUnits(arg_17_0.sceneData.strollUnits, arg_17_0:GetIsland())
	arg_17_0:InitStrollUnitsAwards()
end

function var_0_0.OnNpcActionFeedBackChange(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.sceneData.strollUnits) do
		if iter_18_1.id == arg_18_1 and iter_18_1:ExistActionFeedback() then
			iter_18_1:ClearActionFeedback()
			arg_18_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_18_1)
		end
	end
end

function var_0_0.OnLinkCore(arg_19_0, arg_19_1, ...)
	arg_19_0:NotifiyCore(arg_19_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	arg_20_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_20_1, arg_20_2, arg_20_3)
end

function var_0_0.OnStartPathFinder(arg_21_0, arg_21_1)
	arg_21_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_21_1)
end

function var_0_0.OnEndPathFinder(arg_22_0)
	arg_22_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_23_0)
	arg_23_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_23_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_24_0)
	arg_24_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_24_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)
end

function var_0_0.OnStartStory(arg_25_0)
	arg_25_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_26_0, arg_26_1)
	arg_26_0:NotifiyCore(ISLAND_EVT.END_STORY)

	if arg_26_1 then
		arg_26_0.visibilityAllocator:Flush()
	end
end

function var_0_0.OnTaskAdd(arg_27_0)
	arg_27_0.visibilityAllocator:Flush()
	arg_27_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_27_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_28_0)
	arg_28_0.visibilityAllocator:Flush()
	arg_28_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_28_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnUpdateTask(arg_29_0)
	arg_29_0.visibilityAllocator:Flush()
	arg_29_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_29_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnPlayerAdd(arg_30_0, arg_30_1)
	local var_30_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_30_1.player, arg_30_0.mapId, arg_30_0:GetIsland().id)

	arg_30_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_30_0, function(arg_31_0)
		arg_30_0.islandSyncMgr:OnVisitorEnter(arg_30_1.player.id, arg_31_0)
	end)
end

function var_0_0.OnPlayerExit(arg_32_0, arg_32_1)
	arg_32_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_32_1.id)
	arg_32_0.islandSyncMgr:OnVisitorExit(arg_32_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_33_1, arg_33_2)
end

function var_0_0.OnShipChangeDress(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	arg_34_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
end

function var_0_0.OnStartPlant(arg_35_0, arg_35_1)
	local var_35_0

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.sceneData.productSystems) do
		if iter_35_1.id == arg_35_1.build_id then
			var_35_0 = iter_35_1

			break
		end
	end

	if not var_35_0 then
		return
	end

	local var_35_1 = var_35_0:GetUnitIdBySlotId(arg_35_1.area_id)

	arg_35_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_35_1)

	local var_35_2 = var_35_0:GenHandPlantUnitBySlotData(arg_35_1.area_id, arg_35_1.formula_id)

	arg_35_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_35_2)
	arg_35_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_35_1)
end

function var_0_0.OnEndPlant(arg_36_0, arg_36_1)
	local var_36_0

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.sceneData.productSystems) do
		if iter_36_1.id == arg_36_1.build_id then
			var_36_0 = iter_36_1

			break
		end
	end

	if not var_36_0 then
		return
	end

	local var_36_1 = var_36_0:GetUnitIdBySlotId(arg_36_1.area_id)

	arg_36_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_36_1)

	local var_36_2 = var_36_0:GenHandPlantUnitBySlotData(arg_36_1.area_id)

	arg_36_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_36_2)
	arg_36_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_36_1)
end

function var_0_0.OnStartDelegation(arg_37_0, arg_37_1)
	local var_37_0

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.sceneData.systemList) do
		if isa(iter_37_1, IslandCharacterSystemVO) and iter_37_1.id == arg_37_1.build_id then
			var_37_0 = iter_37_1

			break
		end
	end

	if not var_37_0 then
		return
	end

	local var_37_1

	for iter_37_2, iter_37_3 in ipairs(arg_37_0.sceneData.productSystems) do
		if iter_37_3.id == arg_37_1.build_id then
			var_37_1 = iter_37_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_37_1.build_id) then
		local var_37_2 = pg.island_production_slot[arg_37_1.area_id]

		for iter_37_4, iter_37_5 in ipairs(var_37_2.exclusion_slot) do
			local var_37_3 = var_37_1:GetUnitIdBySlotId(iter_37_5)
			local var_37_4 = var_37_1:GetUnitVOByUnitId(var_37_3)

			if var_37_4 then
				var_37_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_37_5 = var_37_0:GetUnit(arg_37_1.ship_id, arg_37_1.area_id, true)

	if var_37_5 then
		arg_37_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_37_5)
	end

	arg_37_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_37_1, var_37_1)
end

function var_0_0.OnEndDelegation(arg_38_0, arg_38_1)
	local var_38_0

	for iter_38_0, iter_38_1 in ipairs(arg_38_0.sceneData.systemList) do
		if isa(iter_38_1, IslandCharacterSystemVO) and iter_38_1.id == arg_38_1.build_id then
			var_38_0 = iter_38_1

			break
		end
	end

	if not var_38_0 then
		return
	end

	arg_38_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_38_1)

	local var_38_1 = var_38_0:GetUnitShipIdBySlotId(arg_38_1.ship_id, arg_38_1.area_id)

	if var_38_1 then
		arg_38_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_38_1)
	end

	if arg_38_1.remainReward then
		return
	end

	local var_38_2

	for iter_38_2, iter_38_3 in ipairs(arg_38_0.sceneData.productSystems) do
		if iter_38_3.id == arg_38_1.build_id then
			var_38_2 = iter_38_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_38_1.build_id) then
		local var_38_3 = pg.island_production_slot[arg_38_1.area_id]

		for iter_38_4, iter_38_5 in ipairs(var_38_3.exclusion_slot) do
			local var_38_4 = var_38_2:GetUnitIdBySlotId(iter_38_5)

			arg_38_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_38_4)

			local var_38_5 = var_38_2:GenHandPlantUnitBySlotData(iter_38_5)

			arg_38_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_38_5)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_39_0, arg_39_1)
	local var_39_0

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.sceneData.systemList) do
		if isa(iter_39_1, IslandCharacterSystemVO) and iter_39_1.id == arg_39_1.build_id then
			var_39_0 = iter_39_1

			break
		end
	end

	if not var_39_0 then
		return
	end

	local var_39_1

	for iter_39_2, iter_39_3 in ipairs(arg_39_0.sceneData.productSystems) do
		if iter_39_3.id == arg_39_1.build_id then
			var_39_1 = iter_39_3

			break
		end
	end

	if arg_39_1.build_id == IslandProductConst.FarmlandPlaceId then
		local var_39_2 = pg.island_production_slot[arg_39_1.area_id]

		for iter_39_4, iter_39_5 in ipairs(var_39_2.exclusion_slot) do
			local var_39_3 = var_39_1:GetUnitIdBySlotId(iter_39_5)

			arg_39_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_39_3)

			local var_39_4 = var_39_1:GenHandPlantUnitBySlotData(iter_39_5)

			arg_39_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_39_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_40_0, arg_40_1)
	local var_40_0

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.sceneData.productSystems) do
		if iter_40_1.id == IslandProductConst.FarmlandPlaceId then
			var_40_0 = iter_40_1

			break
		end
	end

	if not var_40_0 then
		return
	end

	arg_40_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_40_1.id)

	local var_40_1 = var_40_0:GetUnitVOByUnitId(arg_40_1.id)

	var_40_1.modelId = arg_40_1.modelId

	arg_40_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_40_1)
end

function var_0_0.OnStartHandCollect(arg_41_0, arg_41_1)
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

	arg_41_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_41_1)
	arg_41_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_41_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_42_0, arg_42_1)
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

	local var_42_1 = var_42_0:GetUnitIdBySlotId(arg_42_1.slotId)

	arg_42_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_42_1)

	local var_42_2 = var_42_0:GenHandPlantUnitBySlotData(arg_42_1.slotId)

	arg_42_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_42_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1.build_id
	local var_43_1

	for iter_43_0, iter_43_1 in ipairs(arg_43_0.sceneData.productSystems) do
		if iter_43_1.id == var_43_0 then
			var_43_1 = iter_43_1

			break
		end
	end

	if not var_43_1 then
		return
	end

	local var_43_2 = var_43_1:GetPlaceModelId(var_43_0)

	arg_43_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_43_2)

	local var_43_3 = var_43_1:GetPlaceModelId(var_43_0)

	arg_43_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_43_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_44_0, arg_44_1)
	arg_44_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_44_1.unitId)
	arg_44_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_44_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_45_0, arg_45_1)
	local var_45_0 = IslandDataConvertor.GenWildGatherUnit(arg_45_1)

	arg_45_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_45_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.slotId
	local var_46_1 = pg.island_production_slot[var_46_0].place
	local var_46_2

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.sceneData.productSystems) do
		if iter_46_1.id == var_46_1 then
			var_46_2 = iter_46_1

			break
		end
	end

	if not var_46_2 then
		return
	end

	local var_46_3 = var_46_2:InitHandCollectSlotBySlotId(var_46_0)

	if var_46_3 then
		if var_46_3.delayTime then
			arg_46_0.timeDelayCreate:DelayInitUnit(var_46_3)
		else
			arg_46_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_46_3)
		end
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_1.slotId
	local var_47_1 = pg.island_production_slot[var_47_0].place
	local var_47_2

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.sceneData.productSystems) do
		if iter_47_1.id == var_47_1 then
			var_47_2 = iter_47_1

			break
		end
	end

	if not var_47_2 then
		return
	end

	local var_47_3 = var_47_2:GetHandCollectSlotBySlotId(var_47_0)

	arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_47_3)
end

function var_0_0.OnSyncDataUpdate(arg_48_0, arg_48_1)
	arg_48_0.islandSyncMgr:HandleSyncData(arg_48_1)
end

function var_0_0.OnSyncObjUpdate(arg_49_0, arg_49_1)
	arg_49_0.islandSyncMgr:HandleSyncObj(arg_49_1)
end

function var_0_0.Update(arg_50_0)
	arg_50_0.playerInputManager:Update()
	arg_50_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_51_0)
	if arg_51_0.playerInputManager then
		arg_51_0.playerInputManager:Dispose()

		arg_51_0.playerInputManager = nil
	end

	if arg_51_0.islandSyncMgr then
		arg_51_0.islandSyncMgr:Dispose()

		arg_51_0.islandSyncMgr = nil
	end

	if arg_51_0.strollAllocator then
		arg_51_0.strollAllocator:Dispose()

		arg_51_0.strollAllocator = nil
	end

	if arg_51_0.visibilityAllocator then
		arg_51_0.visibilityAllocator:Dispose()

		arg_51_0.visibilityAllocator = nil
	end

	if arg_51_0.giftAllocator then
		arg_51_0.giftAllocator:Dispose()

		arg_51_0.giftAllocator = nil
	end

	if arg_51_0.timeDelayCreate then
		arg_51_0.timeDelayCreate:Dispose()

		arg_51_0.timeDelayCreate = nil
	end

	if arg_51_0.activityNpcAllocator then
		arg_51_0.activityNpcAllocator:Dispose()

		arg_51_0.activityNpcAllocator = nil
	end
end

function var_0_0.OnAnimalInit(arg_52_0, arg_52_1)
	local var_52_0

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.productSystems) do
		if iter_52_1.id == IslandProductConst.PasturePlaceId then
			var_52_0 = iter_52_1

			break
		end
	end

	if not var_52_0 then
		return
	end

	local var_52_1 = arg_52_1.slotId

	for iter_52_2, iter_52_3 in ipairs(arg_52_1.aniList) do
		local var_52_2 = var_52_0:GenAnimalByAnialConfig(iter_52_3, var_52_1)

		arg_52_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_52_2)
	end
end

function var_0_0.InitSyncMgr(arg_53_0)
	arg_53_0.islandSyncMgr:Init(arg_53_0.sceneData.unitList)
end

function var_0_0.SetVisitorSyncData(arg_54_0, arg_54_1, arg_54_2)
	arg_54_0:NotifiyCore(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_54_1, arg_54_2)
end

function var_0_0.WorldObjectInterAction(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	arg_55_3 = arg_55_3 or 1

	local var_55_0 = _.detect(arg_55_0.sceneData.unitList, function(arg_56_0)
		return arg_56_0.id == arg_55_1
	end)

	if not var_55_0 or not var_55_0:Interactable() then
		return
	end

	local var_55_1 = var_55_0:GetEmptySlot()

	if not var_55_1 then
		return
	end

	local function var_55_2()
		var_55_1:Lock(arg_55_2)
		arg_55_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_55_0, var_55_1, arg_55_3)
	end

	arg_55_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_55_1, var_55_1.id, arg_55_3, function(arg_58_0)
		if arg_58_0 then
			var_55_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	arg_59_3 = arg_59_3 or 1

	local var_59_0 = _.detect(arg_59_0.sceneData.unitList, function(arg_60_0)
		return arg_60_0.id == arg_59_1
	end)

	if not var_59_0 or not var_59_0:Interactable() then
		return
	end

	local var_59_1 = var_59_0:GetEmptySlot()

	if not var_59_1 then
		return
	end

	var_59_1:Lock(arg_59_2)
	arg_59_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_59_0, var_59_1, arg_59_3)
end

function var_0_0.WorldObjectInterActionEnd(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = _.detect(arg_61_0.sceneData.unitList, function(arg_62_0)
		return arg_62_0.id == arg_61_1
	end)

	if not var_61_0 or not var_61_0:Interactable() then
		return
	end

	local var_61_1 = var_61_0:GetUsingSlot(arg_61_2)

	local function var_61_2()
		local var_63_0 = Clone(var_61_1)

		var_61_1:Release()
		arg_61_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_61_0, var_63_0)
	end

	arg_61_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_61_1, var_61_1.id, function(arg_64_0)
		if arg_64_0 then
			var_61_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = _.detect(arg_65_0.sceneData.unitList, function(arg_66_0)
		return arg_66_0.id == arg_65_1
	end)

	if not var_65_0 or not var_65_0:Interactable() then
		return
	end

	local var_65_1 = var_65_0:GetUsingSlot(arg_65_2)
	local var_65_2 = Clone(var_65_1)

	var_65_1:Release()
	arg_65_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_65_0, var_65_2)
end

function var_0_0.WorldObjectInitStatus(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = _.detect(arg_67_0.sceneData.unitList, function(arg_68_0)
		return arg_68_0.id == arg_67_1
	end)

	warning("init", arg_67_1, arg_67_2, var_67_0)

	if not var_67_0 or not var_67_0:Interactable() then
		return
	end

	arg_67_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_67_0, arg_67_2)
end

function var_0_0.OnOpenRestaurant(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_1.restId
	local var_69_1 = arg_69_1.postList
	local var_69_2

	for iter_69_0, iter_69_1 in ipairs(arg_69_0.sceneData.systemList) do
		if isa(iter_69_1, IslandManageSystemVO) and iter_69_1.id == var_69_0 then
			var_69_2 = iter_69_1

			break
		end
	end

	if not var_69_2 then
		return
	end

	local var_69_3 = var_69_2:GetUnits(var_69_1)

	for iter_69_2, iter_69_3 in ipairs(var_69_3) do
		arg_69_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_69_3)
	end

	arg_69_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_69_2)
end

function var_0_0.OnCloseRestaurant(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_1.restId
	local var_70_1 = arg_70_1.postList
	local var_70_2

	for iter_70_0, iter_70_1 in ipairs(arg_70_0.sceneData.systemList) do
		if isa(iter_70_1, IslandManageSystemVO) and iter_70_1.id == var_70_0 then
			var_70_2 = iter_70_1

			break
		end
	end

	if not var_70_2 then
		return
	end

	arg_70_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_70_2)

	local var_70_3 = var_70_2:GetUnits(var_70_1)

	for iter_70_2, iter_70_3 in ipairs(var_70_3) do
		arg_70_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_70_3.id)
	end
end

return var_0_0

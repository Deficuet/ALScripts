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
		end
	end
end

function var_0_0.InitStrollUnitsAwards(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.sceneData.strollUnits) do
		if iter_7_1:ExistGreetingActionFeedback() then
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
	arg_9_0:AddIslandListener(IslandDressUpAgency.MORPH_PLAYER_DRESS, arg_9_0.OnPlayerMorphDress)
	arg_9_0:AddIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_9_0.OnPlayerChangeDress)
	arg_9_0:AddIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_9_0.OnShipChangeDress)
	arg_9_0:AddIslandListener(IslandCharacterAgency.SHIP_SKILL_STATE_CHANGE, arg_9_0.OnShipSkillStateChange)
	arg_9_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_9_0.OnSyncDataUpdate)
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
	arg_9_0:AddIslandListener(IslandInteractSyncAgency.OCCUPANCY_CHANGED, arg_9_0.OnOccupancyChanged)
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
	arg_10_0:RemoveIslandListener(IslandDressUpAgency.MORPH_PLAYER_DRESS, arg_10_0.OnPlayerMorphDress)
	arg_10_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_10_0.OnPlayerChangeDress)
	arg_10_0:RemoveIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_10_0.OnShipChangeDress)
	arg_10_0:RemoveIslandListener(IslandCharacterAgency.SHIP_SKILL_STATE_CHANGE, arg_10_0.OnShipSkillStateChange)
	arg_10_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_10_0.OnSyncDataUpdate)
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
	arg_10_0:RemoveIslandListener(IslandInteractSyncAgency.OCCUPANCY_CHANGED, arg_10_0.OnOccupancyChanged)
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

function var_0_0.OnOccupancyChanged(arg_12_0, arg_12_1)
	arg_12_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)

	if arg_12_0.islandSyncMgr then
		arg_12_0.islandSyncMgr:OnOccupancyChanged(arg_12_1)
	end
end

function var_0_0.OnResetSp(arg_13_0)
	local var_13_0 = arg_13_0.mapId
	local var_13_1 = pg.island_world_objects.get_id_list_by_mapId[var_13_0] or {}

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		local var_13_2 = pg.island_world_objects[iter_13_1]

		if var_13_2.unitId == 0 then
			spConfig = var_13_2

			break
		end
	end

	if not spConfig then
		return
	end

	local var_13_3 = BuildVector3(spConfig.param.position)
	local var_13_4 = BuildVector3(spConfig.param.rotation)
	local var_13_5 = getProxy(PlayerProxy):getRawData().id

	arg_13_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, var_13_5, IslandConst.UNIT_LIST_PLAYER, var_13_3)
	arg_13_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_ROT, var_13_5, IslandConst.UNIT_LIST_PLAYER, var_13_4)
end

function var_0_0.OnLockNpcRefresh(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.visibilityAllocator:LockNpc(arg_14_1, arg_14_2)
end

function var_0_0.OnReleaseNpcRefresh(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.visibilityAllocator:ReleaseNpc(arg_15_1, arg_15_2)
end

function var_0_0.OnSystemUnlock(arg_16_0, arg_16_1)
	arg_16_0:NotifiyCore(ISLAND_EVT.SYSTEM_UNLOCK, arg_16_1)
end

function var_0_0.OnActivityNpcAdd(arg_17_0, arg_17_1)
	arg_17_0.activityNpcAllocator:AddNpc(arg_17_1)
	arg_17_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcUpdate(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.activityNpcAllocator:DelNpc(arg_18_1)
	arg_18_0.activityNpcAllocator:AddNpc(arg_18_2)
	arg_18_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityNpcDel(arg_19_0, arg_19_1)
	arg_19_0.activityNpcAllocator:DelNpc(arg_19_1)
	arg_19_0.activityNpcAllocator:Flush()
end

function var_0_0.OnActivityUpdate(arg_20_0)
	arg_20_0.activityNpcAllocator:Flush()
end

function var_0_0.OnGenRecycleItem(arg_21_0, arg_21_1)
	local var_21_0 = IslandDataConvertor.GenDelayRecycleIslandUnit(arg_21_1)

	arg_21_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_21_0)
end

function var_0_0.OnAddFollower(arg_22_0, arg_22_1)
	local var_22_0 = #arg_22_0.sceneData.followUnits > 0
	local var_22_1 = arg_22_0:GetIsland():GetCharacterAgency():GetShipById(arg_22_1)
	local var_22_2 = var_22_1:GetModelUnit()
	local var_22_3 = arg_22_0:GetView():GetPlayerLastGroundedPosition()
	local var_22_4 = IslandFollowerUnitVO.New(var_22_1.id, arg_22_1, var_22_2, var_22_3, Vector3(0, 0, 0), not var_22_0)

	table.insert(arg_22_0.sceneData.followUnits, var_22_4)
	arg_22_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_22_4)

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.sceneData.strollUnits) do
		if var_22_1:getConfig("unit_id") == iter_22_1.config.unit_id then
			arg_22_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_STROLL, iter_22_1.id)
		end
	end

	arg_22_0:NotifiyCore(ISLAND_EVT.ADD_FOLLOWER, var_22_4.id)
end

function var_0_0.OnDelFollower(arg_23_0, arg_23_1)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.sceneData.followUnits) do
		if iter_23_1.id == arg_23_1 then
			var_23_0 = iter_23_0

			break
		end
	end

	if var_23_0 <= 0 then
		return
	end

	local var_23_1 = table.remove(arg_23_0.sceneData.followUnits, var_23_0)

	arg_23_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_FOLLOW, var_23_1.id)

	if var_23_1:IsRandomizer() and #arg_23_0.sceneData.followUnits > 0 then
		local var_23_2 = arg_23_0.sceneData.followUnits[1]

		var_23_2:ActiveRandomizer()
		arg_23_0:NotifiyCore(ISLAND_EVT.RESET_FOLLOW_RANDOMIZER, var_23_2.id)
	end

	local var_23_3 = arg_23_0:GetIsland():GetCharacterAgency():GetShipById(arg_23_1)

	for iter_23_2, iter_23_3 in ipairs(arg_23_0.sceneData.strollUnits) do
		if var_23_3:getConfig("unit_id") == iter_23_3.config.unit_id then
			arg_23_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_23_3)
		end
	end

	arg_23_0:NotifiyCore(ISLAND_EVT.DEL_FOLLOWER, var_23_1.id)
end

function var_0_0.OnResetNpcActionFeedback(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.sceneData.strollUnits) do
		if iter_24_1:ExistGreetingActionFeedback() then
			iter_24_1:ClearGreetingActionFeedback()
			arg_24_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_24_1)
		end
	end

	IslandDataConvertor.DistributeAward4StrollUnits(arg_24_0.sceneData.strollUnits, arg_24_0:GetIsland())
	arg_24_0:InitStrollUnitsAwards()
end

function var_0_0.OnNpcActionFeedBackChange(arg_25_0, arg_25_1)
	for iter_25_0, iter_25_1 in ipairs(arg_25_0.sceneData.strollUnits) do
		if iter_25_1.id == arg_25_1 and iter_25_1:ExistActionFeedback() then
			iter_25_1:ClearActionFeedback()
			arg_25_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, iter_25_1)
		end
	end
end

function var_0_0.OnShipSkillStateChange(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.sceneData.strollUnits) do
		if iter_26_1:IsSameShip(arg_26_1) then
			var_26_0 = iter_26_1

			break
		end
	end

	if var_26_0 then
		if not arg_26_2 then
			var_26_0:ClearSkillActionFeedback()
			arg_26_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, var_26_0)
		else
			local var_26_1 = arg_26_0:GetIsland()
			local var_26_2 = IslandDataConvertor.GetOwnActions(var_26_1)

			IslandDataConvertor.DistributeShipSkillAward4StrollUnits(arg_26_0.sceneData.strollUnits, var_26_1, var_26_2)
			arg_26_0:InitStrollUnitsAwards()
		end
	end
end

function var_0_0.OnLinkCore(arg_27_0, arg_27_1, ...)
	arg_27_0:NotifiyCore(arg_27_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	arg_28_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_28_1, arg_28_2, arg_28_3)
end

function var_0_0.OnStartPathFinder(arg_29_0, arg_29_1)
	arg_29_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_29_1)
end

function var_0_0.OnEndPathFinder(arg_30_0)
	arg_30_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_31_0)
	arg_31_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_31_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_32_0, arg_32_1)
	arg_32_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_32_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)

	if arg_32_1 then
		arg_32_0:OnUpdateTask()
	end
end

function var_0_0.OnStartStory(arg_33_0)
	arg_33_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_34_0, arg_34_1)
	arg_34_0:NotifiyCore(ISLAND_EVT.END_STORY)

	if arg_34_1 then
		arg_34_0.visibilityAllocator:Flush()
	end
end

function var_0_0.OnTaskAdd(arg_35_0)
	arg_35_0.visibilityAllocator:Flush()
	arg_35_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_35_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_36_0, arg_36_1)
	arg_36_0.visibilityAllocator:Flush()
	arg_36_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_36_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	arg_36_0:CheckFinishTask(arg_36_1, IslandTaskType.DAILY, "daily_task_follow_action")
	arg_36_0:CheckFinishTask(arg_36_1, IslandTaskType.WEEKLY, "weekly_task_follow_action")
end

local function var_0_1(arg_37_0)
	if #arg_37_0 == 0 then
		return nil
	end

	return arg_37_0[math.random(1, #arg_37_0)]
end

function var_0_0.CheckFinishTask(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	if IslandTask.New({
		id = arg_38_1,
		process_list = {}
	}):GetType() ~= arg_38_2 then
		return
	end

	local var_38_0 = pg.island_set[arg_38_3]

	if not var_38_0 then
		return
	end

	local var_38_1 = var_38_0 and (var_38_0.key_value_varchar or {}) or {}
	local var_38_2 = arg_38_0:GetSelfIsland():GetTaskAgency()
	local var_38_3 = var_38_2:GetTasks()

	for iter_38_0, iter_38_1 in ipairs(var_38_3) do
		if iter_38_1:GetType() == arg_38_2 then
			return
		end
	end

	local var_38_4 = false
	local var_38_5 = var_38_2:GetFinishedIds()

	for iter_38_2, iter_38_3 in ipairs(var_38_5) do
		if IslandTask.New({
			id = iter_38_3,
			process_list = {}
		}):GetType() == arg_38_2 then
			var_38_4 = true

			break
		end
	end

	if var_38_4 then
		arg_38_0:NotifiyCore(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, var_0_1(var_38_1))
	end
end

function var_0_0.OnUpdateTask(arg_39_0)
	arg_39_0:Debounce("RefreshTask", function()
		if not arg_39_0.visibilityAllocator then
			return
		end

		arg_39_0.visibilityAllocator:Flush()
		arg_39_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
		arg_39_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	end, 0.5, false)()
end

function var_0_0.Debounce(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	if not arg_41_0.__debouncers then
		arg_41_0.__debouncers = {}
	end

	if not arg_41_0.__debouncers[arg_41_1] then
		arg_41_0.__debouncers[arg_41_1] = debounce(arg_41_2, arg_41_3, arg_41_4)
	end

	return arg_41_0.__debouncers[arg_41_1]
end

function var_0_0.OnPlayerAdd(arg_42_0, arg_42_1)
	local var_42_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_42_1.player, arg_42_0.mapId, arg_42_0:GetIsland().id)

	arg_42_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_42_0, function(arg_43_0)
		arg_42_0.islandSyncMgr:OnVisitorUnitReady(arg_42_1.player.id)
	end)
end

function var_0_0.OnPlayerExit(arg_44_0, arg_44_1)
	arg_44_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_44_1.id)
	arg_44_0.islandSyncMgr:OnVisitorExit(arg_44_1.id)
end

function var_0_0.OnPlayerMorphDress(arg_45_0, ...)
	arg_45_0:NotifiyCore(ISLAND_EVT.MORPH_FORM_CHANGE, ...)
end

function var_0_0.OnPlayerChangeDress(arg_46_0, arg_46_1, arg_46_2)
	arg_46_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_46_1, arg_46_2)
end

function var_0_0.OnShipChangeDress(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	arg_47_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
end

function var_0_0.OnStartPlant(arg_48_0, arg_48_1)
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

	arg_48_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_48_1)

	local var_48_2 = var_48_0:GenHandPlantUnitBySlotData(arg_48_1.area_id, arg_48_1.formula_id)

	arg_48_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_48_2)
	arg_48_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_48_1)
end

function var_0_0.OnEndPlant(arg_49_0, arg_49_1)
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

	local var_49_1 = var_49_0:GetUnitIdBySlotId(arg_49_1.area_id)

	arg_49_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_49_1)

	local var_49_2 = var_49_0:GenHandPlantUnitBySlotData(arg_49_1.area_id)

	arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_49_2)
	arg_49_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_49_1)
end

function var_0_0.OnStartDelegation(arg_50_0, arg_50_1)
	local var_50_0

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.sceneData.systemList) do
		if isa(iter_50_1, IslandCharacterSystemVO) and iter_50_1.id == arg_50_1.build_id then
			var_50_0 = iter_50_1

			break
		end
	end

	if not var_50_0 then
		return
	end

	local var_50_1

	for iter_50_2, iter_50_3 in ipairs(arg_50_0.sceneData.productSystems) do
		if iter_50_3.id == arg_50_1.build_id then
			var_50_1 = iter_50_3

			break
		end
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_50_1.build_id) then
		local var_50_2 = pg.island_production_slot[arg_50_1.area_id]

		for iter_50_4, iter_50_5 in ipairs(var_50_2.exclusion_slot) do
			local var_50_3 = var_50_1:GetUnitIdBySlotId(iter_50_5)
			local var_50_4 = var_50_1:GetUnitVOByUnitId(var_50_3)

			if var_50_4 then
				var_50_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_50_5 = {}

	if table.contains(IslandProductConst.havePerformPlace, arg_50_1.build_id) then
		local var_50_6 = var_50_1:GetDelegateUnitsByBuildIdAndSlotId(arg_50_1.build_id, arg_50_1.area_id, arg_50_1.formula_id)

		var_50_5.commissionSlotId = var_50_1:GetCommissionSlotId(arg_50_1.area_id)
		var_50_5.unitIds = {}

		for iter_50_6, iter_50_7 in ipairs(var_50_6) do
			table.insert(var_50_5.unitIds, iter_50_7.id)
		end

		for iter_50_8, iter_50_9 in ipairs(var_50_6) do
			arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_50_9)
		end
	end

	local var_50_7 = var_50_1:GetDelegateEffectsByCommissonId(arg_50_1.area_id)

	if var_50_7 then
		local var_50_8 = var_50_1:GenUnitByDelegateEffectId(var_50_7)

		if var_50_8 then
			arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_50_8)
		end
	end

	local var_50_9 = var_50_0:GetUnit(arg_50_1.ship_id, arg_50_1.area_id, true)

	if var_50_9 then
		arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_50_9)
	end

	arg_50_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_50_1, var_50_5)
end

function var_0_0.OnEndDelegation(arg_51_0, arg_51_1)
	local var_51_0

	for iter_51_0, iter_51_1 in ipairs(arg_51_0.sceneData.systemList) do
		if isa(iter_51_1, IslandCharacterSystemVO) and iter_51_1.id == arg_51_1.build_id then
			var_51_0 = iter_51_1

			break
		end
	end

	if not var_51_0 then
		return
	end

	arg_51_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_51_1)

	local var_51_1 = var_51_0:GetUnitShipIdBySlotId(arg_51_1.ship_id, arg_51_1.area_id)

	if var_51_1 then
		arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_51_1)
	end

	local var_51_2

	for iter_51_2, iter_51_3 in ipairs(arg_51_0.sceneData.productSystems) do
		if iter_51_3.id == arg_51_1.build_id then
			var_51_2 = iter_51_3

			break
		end
	end

	if table.contains(IslandProductConst.havePerformPlace, arg_51_1.build_id) then
		local var_51_3 = var_51_2:GetDelegatUnitsBySlotId(arg_51_1.area_id)

		for iter_51_4, iter_51_5 in ipairs(var_51_3) do
			arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATE_UNIT, iter_51_5)
		end
	end

	local var_51_4 = var_51_2:GetDelegateEffectsByCommissonId(arg_51_1.area_id)

	if var_51_4 then
		arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_51_4)
	end

	if arg_51_1.remainReward then
		return
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_51_1.build_id) then
		local var_51_5 = pg.island_production_slot[arg_51_1.area_id]

		for iter_51_6, iter_51_7 in ipairs(var_51_5.exclusion_slot) do
			local var_51_6 = var_51_2:GetUnitIdBySlotId(iter_51_7)

			arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_51_6)

			local var_51_7 = var_51_2:GenHandPlantUnitBySlotData(iter_51_7)

			arg_51_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_51_7)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_52_0, arg_52_1)
	local var_52_0

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.systemList) do
		if isa(iter_52_1, IslandCharacterSystemVO) and iter_52_1.id == arg_52_1.build_id then
			var_52_0 = iter_52_1

			break
		end
	end

	if not var_52_0 then
		return
	end

	local var_52_1

	for iter_52_2, iter_52_3 in ipairs(arg_52_0.sceneData.productSystems) do
		if iter_52_3.id == arg_52_1.build_id then
			var_52_1 = iter_52_3

			break
		end
	end

	if arg_52_1.build_id == IslandProductConst.FarmlandPlaceId or arg_52_1.build_id == IslandProductConst.OrchardPlaceId or arg_52_1.build_id == IslandProductConst.GardenPlaceId then
		local var_52_2 = pg.island_production_slot[arg_52_1.area_id]

		for iter_52_4, iter_52_5 in ipairs(var_52_2.exclusion_slot) do
			local var_52_3 = var_52_1:GetUnitIdBySlotId(iter_52_5)

			arg_52_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_52_3)

			local var_52_4 = var_52_1:GenHandPlantUnitBySlotData(iter_52_5)

			arg_52_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_52_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_53_0, arg_53_1)
	local var_53_0

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.sceneData.productSystems) do
		if iter_53_1.id == IslandProductConst.FarmlandPlaceId then
			var_53_0 = iter_53_1

			break
		end
	end

	if not var_53_0 then
		return
	end

	arg_53_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_53_1.id)

	local var_53_1 = var_53_0:GetUnitVOByUnitId(arg_53_1.id)

	var_53_1.modelId = arg_53_1.modelId

	arg_53_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_53_1)
end

function var_0_0.OnStartHandCollect(arg_54_0, arg_54_1)
	local var_54_0

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.sceneData.productSystems) do
		if iter_54_1.id == arg_54_1.build_id then
			var_54_0 = iter_54_1

			break
		end
	end

	if not var_54_0 then
		return
	end

	local var_54_1 = var_54_0:GetUnitIdBySlotId(arg_54_1.area_id)

	arg_54_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_54_1)
	arg_54_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_54_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_55_0, arg_55_1)
	local var_55_0

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.sceneData.productSystems) do
		if iter_55_1.id == arg_55_1.build_id then
			var_55_0 = iter_55_1

			break
		end
	end

	if not var_55_0 then
		return
	end

	local var_55_1 = var_55_0:GetUnitIdBySlotId(arg_55_1.slotId)

	arg_55_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_55_1)

	local var_55_2 = var_55_0:GenHandPlantUnitBySlotData(arg_55_1.slotId)

	arg_55_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_55_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_1.build_id
	local var_56_1

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.sceneData.productSystems) do
		if iter_56_1.id == var_56_0 then
			var_56_1 = iter_56_1

			break
		end
	end

	if not var_56_1 then
		return
	end

	local var_56_2 = var_56_1:GetPlaceModelId(false)

	arg_56_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_56_2)

	local var_56_3 = var_56_1:GetPlaceModelUnit(true)

	arg_56_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_56_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_57_0, arg_57_1)
	arg_57_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_57_1.unitId)
	arg_57_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_57_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_58_0, arg_58_1)
	local var_58_0 = IslandDataConvertor.GenWildGatherUnit(arg_58_1)

	arg_58_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_58_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_1.slotId
	local var_59_1 = pg.island_production_slot[var_59_0].place
	local var_59_2

	for iter_59_0, iter_59_1 in ipairs(arg_59_0.sceneData.productSystems) do
		if iter_59_1.id == var_59_1 then
			var_59_2 = iter_59_1

			break
		end
	end

	if not var_59_2 then
		return
	end

	local var_59_3 = var_59_2:InitHandCollectSlotBySlotId(var_59_0)

	if var_59_3 then
		arg_59_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_59_3)
	end
end

function var_0_0.OnCollectSlotUnitUpdate(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1.slotId
	local var_60_1 = pg.island_production_slot[var_60_0].place
	local var_60_2

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.sceneData.productSystems) do
		if iter_60_1.id == var_60_1 then
			var_60_2 = iter_60_1

			break
		end
	end

	if not var_60_2 then
		return
	end

	local var_60_3 = var_60_2:GetUnitIdBySlotId(arg_60_1.slotId)

	if var_60_3 then
		arg_60_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_60_3)
		arg_60_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_60_3)
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_61_0, arg_61_1)
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

	local var_61_3 = var_61_2:GetHandCollectSlotBySlotId(var_61_0)

	arg_61_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_61_3)
end

function var_0_0.OnSyncDataUpdate(arg_62_0, arg_62_1)
	arg_62_0.islandSyncMgr:HandleSyncData(arg_62_1)
end

function var_0_0.Update(arg_63_0)
	arg_63_0.playerInputManager:Update()
	arg_63_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_64_0)
	if arg_64_0.playerInputManager then
		arg_64_0.playerInputManager:Dispose()

		arg_64_0.playerInputManager = nil
	end

	if arg_64_0.islandSyncMgr then
		arg_64_0.islandSyncMgr:Dispose()

		arg_64_0.islandSyncMgr = nil
	end

	if arg_64_0.strollAllocator then
		arg_64_0.strollAllocator:Dispose()

		arg_64_0.strollAllocator = nil
	end

	if arg_64_0.visibilityAllocator then
		arg_64_0.visibilityAllocator:Dispose()

		arg_64_0.visibilityAllocator = nil
	end

	if arg_64_0.giftAllocator then
		arg_64_0.giftAllocator:Dispose()

		arg_64_0.giftAllocator = nil
	end

	if arg_64_0.timeDelayCreate then
		arg_64_0.timeDelayCreate:Dispose()

		arg_64_0.timeDelayCreate = nil
	end

	if arg_64_0.activityNpcAllocator then
		arg_64_0.activityNpcAllocator:Dispose()

		arg_64_0.activityNpcAllocator = nil
	end

	arg_64_0.__debouncers = nil
end

function var_0_0.OnAnimalInit(arg_65_0, arg_65_1)
	local var_65_0

	for iter_65_0, iter_65_1 in ipairs(arg_65_0.sceneData.productSystems) do
		if iter_65_1.id == IslandProductConst.PasturePlaceId then
			var_65_0 = iter_65_1

			break
		end
	end

	if not var_65_0 then
		return
	end

	local var_65_1 = arg_65_1.slotId

	for iter_65_2, iter_65_3 in ipairs(arg_65_1.aniList) do
		local var_65_2 = var_65_0:GenAnimalByAnialConfig(iter_65_3, var_65_1)

		arg_65_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_65_2)
	end
end

function var_0_0.OnSlotDelegateInit(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_1.slotId
	local var_66_1 = pg.island_production_slot[var_66_0].place
	local var_66_2

	for iter_66_0, iter_66_1 in ipairs(arg_66_0.sceneData.productSystems) do
		if iter_66_1.id == var_66_1 then
			var_66_2 = iter_66_1

			break
		end
	end

	if not var_66_2 then
		return
	end

	local var_66_3 = var_66_2:GetCommissionSlotId(var_66_0)
	local var_66_4 = pg.island_production_commission[var_66_3].unlockObjid

	if var_66_4 ~= 0 then
		arg_66_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_66_4)
	end
end

function var_0_0.IsPlayerInTimeline(arg_67_0)
	return arg_67_0.island:GetInteractSyncAgency():IsLocalInteracting()
end

function var_0_0.InitSyncMgr(arg_68_0)
	arg_68_0.islandSyncMgr:Init(arg_68_0:GetCore().view.player)
end

function var_0_0.SetVisitorSyncData(arg_69_0, arg_69_1, arg_69_2)
	arg_69_0:NotifiyCore(ISLAND_EVT.SET_VISITOR_SYNC_DATA, arg_69_1, arg_69_2)
end

function var_0_0.WorldObjectInterAction(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	arg_70_3 = arg_70_3 or 1

	local var_70_0 = _.detect(arg_70_0.sceneData.unitList, function(arg_71_0)
		return arg_71_0.id == arg_70_1
	end)

	if not var_70_0 or not var_70_0:Interactable() then
		return
	end

	local var_70_1 = arg_70_0.island:GetInteractSyncAgency():GetFreeSlot(arg_70_1)

	if not var_70_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_interact_point"))

		return
	end

	arg_70_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_70_1, var_70_1, arg_70_3, function(arg_72_0)
		return
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_73_0, arg_73_1, arg_73_2, arg_73_3, arg_73_4)
	arg_73_3 = arg_73_3 or 1

	local var_73_0 = _.detect(arg_73_0.sceneData.unitList, function(arg_74_0)
		return arg_74_0.id == arg_73_1
	end)

	if not var_73_0 or not var_73_0:Interactable() then
		return
	end

	local var_73_1 = arg_73_0.island:GetInteractSyncAgency()

	arg_73_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_73_0, arg_73_4, arg_73_2, arg_73_3, var_73_1:AnySlotUsing(arg_73_1))
end

function var_0_0.WorldObjectInterActionEnd(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = _.detect(arg_75_0.sceneData.unitList, function(arg_76_0)
		return arg_76_0.id == arg_75_1
	end)

	if not var_75_0 or not var_75_0:Interactable() then
		return
	end

	arg_75_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_75_1, function(arg_77_0)
		return
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	local var_78_0 = _.detect(arg_78_0.sceneData.unitList, function(arg_79_0)
		return arg_79_0.id == arg_78_1
	end)

	if not var_78_0 or not var_78_0:Interactable() then
		return
	end

	local var_78_1 = arg_78_0.island:GetInteractSyncAgency()

	arg_78_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_78_0, arg_78_3, arg_78_2, not var_78_1:AnySlotUsing(arg_78_1))
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
	if arg_84_0.islandSyncMgr and arg_84_0:IsPlayerInTimeline() then
		arg_84_0:NotifiyCore(ISLAND_EVT.INIT_INTERACTION_OP_VIEW)
	end
end

return var_0_0

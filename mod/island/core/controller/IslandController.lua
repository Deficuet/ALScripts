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
	arg_10_0:RemoveIslandListener(IslandDressUpAgency.MORPH_PLAYER_DRESS, arg_10_0.OnPlayerMorphDress)
	arg_10_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_10_0.OnPlayerChangeDress)
	arg_10_0:RemoveIslandListener(IslandCharacterAgency.CHANGE_CHARACTER_DRESS, arg_10_0.OnShipChangeDress)
	arg_10_0:RemoveIslandListener(IslandCharacterAgency.SHIP_SKILL_STATE_CHANGE, arg_10_0.OnShipSkillStateChange)
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
	local var_21_3 = arg_21_0:GetView():GetPlayerLastGroundedPosition()
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
		if iter_23_1:ExistGreetingActionFeedback() then
			iter_23_1:ClearGreetingActionFeedback()
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

function var_0_0.OnShipSkillStateChange(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.sceneData.strollUnits) do
		if iter_25_1:IsSameShip(arg_25_1) then
			var_25_0 = iter_25_1

			break
		end
	end

	if var_25_0 then
		if not arg_25_2 then
			var_25_0:ClearSkillActionFeedback()
			arg_25_0:NotifiyCore(ISLAND_EVT.HIDE_NPC_ANIMATION_BUBBLE, var_25_0)
		else
			local var_25_1 = arg_25_0:GetIsland()
			local var_25_2 = IslandDataConvertor.GetOwnActions(var_25_1)

			IslandDataConvertor.DistributeShipSkillAward4StrollUnits(arg_25_0.sceneData.strollUnits, var_25_1, var_25_2)
			arg_25_0:InitStrollUnitsAwards()
		end
	end
end

function var_0_0.OnLinkCore(arg_26_0, arg_26_1, ...)
	arg_26_0:NotifiyCore(arg_26_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_27_1, arg_27_2, arg_27_3)
end

function var_0_0.OnStartPathFinder(arg_28_0, arg_28_1)
	arg_28_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_28_1)
end

function var_0_0.OnEndPathFinder(arg_29_0)
	arg_29_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_30_0)
	arg_30_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_30_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_31_0, arg_31_1)
	arg_31_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_31_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)

	if arg_31_1 then
		arg_31_0:OnUpdateTask()
	end
end

function var_0_0.OnStartStory(arg_32_0)
	arg_32_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_33_0, arg_33_1)
	arg_33_0:NotifiyCore(ISLAND_EVT.END_STORY)

	if arg_33_1 then
		arg_33_0.visibilityAllocator:Flush()
	end
end

function var_0_0.OnTaskAdd(arg_34_0)
	arg_34_0.visibilityAllocator:Flush()
	arg_34_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_34_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_35_0, arg_35_1)
	arg_35_0.visibilityAllocator:Flush()
	arg_35_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_35_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	arg_35_0:CheckFinishTask(arg_35_1, IslandTaskType.DAILY, "daily_task_follow_action")
	arg_35_0:CheckFinishTask(arg_35_1, IslandTaskType.WEEKLY, "weekly_task_follow_action")
end

local function var_0_1(arg_36_0)
	if #arg_36_0 == 0 then
		return nil
	end

	return arg_36_0[math.random(1, #arg_36_0)]
end

function var_0_0.CheckFinishTask(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if IslandTask.New({
		id = arg_37_1,
		process_list = {}
	}):GetType() ~= arg_37_2 then
		return
	end

	local var_37_0 = pg.island_set[arg_37_3]

	if not var_37_0 then
		return
	end

	local var_37_1 = var_37_0 and (var_37_0.key_value_varchar or {}) or {}
	local var_37_2 = arg_37_0:GetSelfIsland():GetTaskAgency()
	local var_37_3 = var_37_2:GetTasks()

	for iter_37_0, iter_37_1 in ipairs(var_37_3) do
		if iter_37_1:GetType() == arg_37_2 then
			return
		end
	end

	local var_37_4 = false
	local var_37_5 = var_37_2:GetFinishedIds()

	for iter_37_2, iter_37_3 in ipairs(var_37_5) do
		if IslandTask.New({
			id = iter_37_3,
			process_list = {}
		}):GetType() == arg_37_2 then
			var_37_4 = true

			break
		end
	end

	if var_37_4 then
		arg_37_0:NotifiyCore(ISLAND_EVT.ALL_DAILY_OR_WEEKLY_FINISH, var_0_1(var_37_1))
	end
end

function var_0_0.OnUpdateTask(arg_38_0)
	arg_38_0:Debounce("RefreshTask", function()
		if not arg_38_0.visibilityAllocator then
			return
		end

		arg_38_0.visibilityAllocator:Flush()
		arg_38_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
		arg_38_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
	end, 0.5, false)()
end

function var_0_0.Debounce(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	if not arg_40_0.__debouncers then
		arg_40_0.__debouncers = {}
	end

	if not arg_40_0.__debouncers[arg_40_1] then
		arg_40_0.__debouncers[arg_40_1] = debounce(arg_40_2, arg_40_3, arg_40_4)
	end

	return arg_40_0.__debouncers[arg_40_1]
end

function var_0_0.OnPlayerAdd(arg_41_0, arg_41_1)
	local var_41_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_41_1.player, arg_41_0.mapId, arg_41_0:GetIsland().id)

	arg_41_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_41_0, function(arg_42_0)
		arg_41_0.islandSyncMgr:OnVisitorEnter(arg_41_1.player.id, arg_42_0)
	end)
end

function var_0_0.OnPlayerExit(arg_43_0, arg_43_1)
	arg_43_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_PLAYER, arg_43_1.id)
	arg_43_0.islandSyncMgr:OnVisitorExit(arg_43_1.id)
end

function var_0_0.OnPlayerMorphDress(arg_44_0, ...)
	arg_44_0:NotifiyCore(ISLAND_EVT.MORPH_FORM_CHANGE, ...)
end

function var_0_0.OnPlayerChangeDress(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_45_1, arg_45_2)
end

function var_0_0.OnShipChangeDress(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	arg_46_0:NotifiyCore(ISLAND_EVT.CHANGE_CHARACTER_DRESS, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
end

function var_0_0.OnStartPlant(arg_47_0, arg_47_1)
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

	local var_47_1 = var_47_0:GetUnitIdBySlotId(arg_47_1.area_id)

	arg_47_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_47_1)

	local var_47_2 = var_47_0:GenHandPlantUnitBySlotData(arg_47_1.area_id, arg_47_1.formula_id)

	arg_47_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_47_2)
	arg_47_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_47_1)
end

function var_0_0.OnEndPlant(arg_48_0, arg_48_1)
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

	local var_48_2 = var_48_0:GenHandPlantUnitBySlotData(arg_48_1.area_id)

	arg_48_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_48_2)
	arg_48_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_48_1)
end

function var_0_0.OnStartDelegation(arg_49_0, arg_49_1)
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

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_49_1.build_id) then
		local var_49_2 = pg.island_production_slot[arg_49_1.area_id]

		for iter_49_4, iter_49_5 in ipairs(var_49_2.exclusion_slot) do
			local var_49_3 = var_49_1:GetUnitIdBySlotId(iter_49_5)
			local var_49_4 = var_49_1:GetUnitVOByUnitId(var_49_3)

			if var_49_4 then
				var_49_4:ChangeSlotType(IslandProductConst.ProductSlotType.RoleDelegation)
			end
		end
	end

	local var_49_5 = {}

	if table.contains(IslandProductConst.havePerformPlace, arg_49_1.build_id) then
		local var_49_6 = var_49_1:GetDelegateUnitsByBuildIdAndSlotId(arg_49_1.build_id, arg_49_1.area_id, arg_49_1.formula_id)

		var_49_5.commissionSlotId = var_49_1:GetCommissionSlotId(arg_49_1.area_id)
		var_49_5.unitIds = {}

		for iter_49_6, iter_49_7 in ipairs(var_49_6) do
			table.insert(var_49_5.unitIds, iter_49_7.id)
		end

		for iter_49_8, iter_49_9 in ipairs(var_49_6) do
			arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_49_9)
		end
	end

	local var_49_7 = var_49_1:GetDelegateEffectsByCommissonId(arg_49_1.area_id)

	if var_49_7 then
		local var_49_8 = var_49_1:GenUnitByDelegateEffectId(var_49_7)

		if var_49_8 then
			arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_49_8)
		end
	end

	local var_49_9 = var_49_0:GetUnit(arg_49_1.ship_id, arg_49_1.area_id, true)

	if var_49_9 then
		arg_49_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_49_9)
	end

	arg_49_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_49_1, var_49_5)
end

function var_0_0.OnEndDelegation(arg_50_0, arg_50_1)
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

	arg_50_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_50_1)

	local var_50_1 = var_50_0:GetUnitShipIdBySlotId(arg_50_1.ship_id, arg_50_1.area_id)

	if var_50_1 then
		arg_50_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_50_1)
	end

	local var_50_2

	for iter_50_2, iter_50_3 in ipairs(arg_50_0.sceneData.productSystems) do
		if iter_50_3.id == arg_50_1.build_id then
			var_50_2 = iter_50_3

			break
		end
	end

	if table.contains(IslandProductConst.havePerformPlace, arg_50_1.build_id) then
		local var_50_3 = var_50_2:GetDelegatUnitsBySlotId(arg_50_1.area_id)

		for iter_50_4, iter_50_5 in ipairs(var_50_3) do
			arg_50_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATE_UNIT, iter_50_5)
		end
	end

	local var_50_4 = var_50_2:GetDelegateEffectsByCommissonId(arg_50_1.area_id)

	if var_50_4 then
		arg_50_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_50_4)
	end

	if arg_50_1.remainReward then
		return
	end

	if table.contains(IslandProductConst.PlantPlaceIdLists, arg_50_1.build_id) then
		local var_50_5 = pg.island_production_slot[arg_50_1.area_id]

		for iter_50_6, iter_50_7 in ipairs(var_50_5.exclusion_slot) do
			local var_50_6 = var_50_2:GetUnitIdBySlotId(iter_50_7)

			arg_50_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_50_6)

			local var_50_7 = var_50_2:GenHandPlantUnitBySlotData(iter_50_7)

			arg_50_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_50_7)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_51_0, arg_51_1)
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

	local var_51_1

	for iter_51_2, iter_51_3 in ipairs(arg_51_0.sceneData.productSystems) do
		if iter_51_3.id == arg_51_1.build_id then
			var_51_1 = iter_51_3

			break
		end
	end

	if arg_51_1.build_id == IslandProductConst.FarmlandPlaceId or arg_51_1.build_id == IslandProductConst.OrchardPlaceId or arg_51_1.build_id == IslandProductConst.GardenPlaceId then
		local var_51_2 = pg.island_production_slot[arg_51_1.area_id]

		for iter_51_4, iter_51_5 in ipairs(var_51_2.exclusion_slot) do
			local var_51_3 = var_51_1:GetUnitIdBySlotId(iter_51_5)

			arg_51_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_51_3)

			local var_51_4 = var_51_1:GenHandPlantUnitBySlotData(iter_51_5)

			arg_51_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_51_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_52_0, arg_52_1)
	local var_52_0

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.productSystems) do
		if iter_52_1.id == IslandProductConst.FarmlandPlaceId then
			var_52_0 = iter_52_1

			break
		end
	end

	if not var_52_0 then
		return
	end

	arg_52_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_52_1.id)

	local var_52_1 = var_52_0:GetUnitVOByUnitId(arg_52_1.id)

	var_52_1.modelId = arg_52_1.modelId

	arg_52_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_52_1)
end

function var_0_0.OnStartHandCollect(arg_53_0, arg_53_1)
	local var_53_0

	for iter_53_0, iter_53_1 in ipairs(arg_53_0.sceneData.productSystems) do
		if iter_53_1.id == arg_53_1.build_id then
			var_53_0 = iter_53_1

			break
		end
	end

	if not var_53_0 then
		return
	end

	local var_53_1 = var_53_0:GetUnitIdBySlotId(arg_53_1.area_id)

	arg_53_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_53_1)
	arg_53_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_53_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_54_0, arg_54_1)
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

	local var_54_1 = var_54_0:GetUnitIdBySlotId(arg_54_1.slotId)

	arg_54_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_54_1)

	local var_54_2 = var_54_0:GenHandPlantUnitBySlotData(arg_54_1.slotId)

	arg_54_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_54_2)
end

function var_0_0.OnProductPlaceChangeUnit(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1.build_id
	local var_55_1

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.sceneData.productSystems) do
		if iter_55_1.id == var_55_0 then
			var_55_1 = iter_55_1

			break
		end
	end

	if not var_55_1 then
		return
	end

	local var_55_2 = var_55_1:GetPlaceModelId(false)

	arg_55_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_55_2)

	local var_55_3 = var_55_1:GetPlaceModelUnit(true)

	arg_55_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_55_3)
end

function var_0_0.OnRemoveWildGatherDone(arg_56_0, arg_56_1)
	arg_56_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_56_1.unitId)
	arg_56_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_56_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_57_0, arg_57_1)
	local var_57_0 = IslandDataConvertor.GenWildGatherUnit(arg_57_1)

	arg_57_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_57_0)
end

function var_0_0.OnCollectSlotUnitInit(arg_58_0, arg_58_1)
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

	local var_58_3 = var_58_2:InitHandCollectSlotBySlotId(var_58_0)

	if var_58_3 then
		arg_58_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_58_3)
	end
end

function var_0_0.OnCollectSlotUnitUpdate(arg_59_0, arg_59_1)
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

	local var_59_3 = var_59_2:GetUnitIdBySlotId(arg_59_1.slotId)

	if var_59_3 then
		arg_59_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HAND_COLLECT, var_59_3)
		arg_59_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_59_3)
	end
end

function var_0_0.OnCollectSloSlotUnitRemove(arg_60_0, arg_60_1)
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

	local var_60_3 = var_60_2:GetHandCollectSlotBySlotId(var_60_0)

	arg_60_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_60_3)
end

function var_0_0.OnSyncDataUpdate(arg_61_0, arg_61_1)
	arg_61_0.islandSyncMgr:HandleSyncData(arg_61_1)
end

function var_0_0.OnSyncObjUpdate(arg_62_0, arg_62_1)
	arg_62_0.islandSyncMgr:HandleSyncObj(arg_62_1)
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
	return arg_67_0.islandSyncMgr.player:InTimeline()
end

function var_0_0.InitSyncMgr(arg_68_0)
	arg_68_0.islandSyncMgr:Init(arg_68_0.sceneData.unitList)
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

	local var_70_1 = var_70_0:GetEmptySlot()

	if not var_70_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_no_interact_point"))

		return
	end

	local function var_70_2()
		var_70_1:Lock(arg_70_2)
		arg_70_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_70_0, var_70_1, arg_70_3)
	end

	arg_70_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_70_1, var_70_1.id, arg_70_3, function(arg_73_0)
		if arg_73_0 then
			var_70_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionSync(arg_74_0, arg_74_1, arg_74_2, arg_74_3, arg_74_4)
	arg_74_3 = arg_74_3 or 1

	local var_74_0 = _.detect(arg_74_0.sceneData.unitList, function(arg_75_0)
		return arg_75_0.id == arg_74_1
	end)

	if not var_74_0 or not var_74_0:Interactable() then
		return
	end

	local var_74_1 = var_74_0:GetSlotById(arg_74_4)

	var_74_1:Lock(arg_74_2)
	arg_74_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_74_0, var_74_1, arg_74_3)
end

function var_0_0.WorldObjectInterActionEnd(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = _.detect(arg_76_0.sceneData.unitList, function(arg_77_0)
		return arg_77_0.id == arg_76_1
	end)

	if not var_76_0 or not var_76_0:Interactable() then
		return
	end

	local var_76_1 = var_76_0:GetUsingSlot(arg_76_2)

	local function var_76_2()
		local var_78_0 = Clone(var_76_1)

		var_76_1:Release()
		arg_76_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_76_0, var_78_0)
	end

	arg_76_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_76_1, var_76_1.id, function(arg_79_0)
		if arg_79_0 then
			var_76_2()
		end
	end)
end

function var_0_0.WorldObjectInterActionEndSync(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = _.detect(arg_80_0.sceneData.unitList, function(arg_81_0)
		return arg_81_0.id == arg_80_1
	end)

	if not var_80_0 or not var_80_0:Interactable() then
		return
	end

	local var_80_1 = var_80_0:GetUsingSlot(arg_80_2)
	local var_80_2 = Clone(var_80_1)

	var_80_1:Release()
	arg_80_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_80_0, var_80_2)
end

function var_0_0.WorldObjectInitStatus(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = _.detect(arg_82_0.sceneData.unitList, function(arg_83_0)
		return arg_83_0.id == arg_82_1
	end)

	warning("init", arg_82_1, arg_82_2, var_82_0)

	if not var_82_0 or not var_82_0:Interactable() then
		return
	end

	arg_82_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_82_0, arg_82_2)
end

function var_0_0.OnOpenRestaurant(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1.restId
	local var_84_1 = arg_84_1.postList
	local var_84_2

	for iter_84_0, iter_84_1 in ipairs(arg_84_0.sceneData.systemList) do
		if isa(iter_84_1, IslandManageSystemVO) and iter_84_1.id == var_84_0 then
			var_84_2 = iter_84_1

			break
		end
	end

	if not var_84_2 then
		return
	end

	local var_84_3 = var_84_2:GetUnits(var_84_1)

	for iter_84_2, iter_84_3 in ipairs(var_84_3) do
		arg_84_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_84_3)
	end

	arg_84_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_84_2)
end

function var_0_0.OnCloseRestaurant(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_1.restId
	local var_85_1 = arg_85_1.postList
	local var_85_2

	for iter_85_0, iter_85_1 in ipairs(arg_85_0.sceneData.systemList) do
		if isa(iter_85_1, IslandManageSystemVO) and iter_85_1.id == var_85_0 then
			var_85_2 = iter_85_1

			break
		end
	end

	if not var_85_2 then
		return
	end

	arg_85_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_85_2)

	local var_85_3 = var_85_2:GetUnits(var_85_1)

	for iter_85_2, iter_85_3 in ipairs(var_85_3) do
		arg_85_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_85_3.id)
	end
end

function var_0_0.OnSwitchMap(arg_86_0)
	if arg_86_0.islandSyncMgr and arg_86_0.islandSyncMgr:IsPlayerInTimeline() then
		arg_86_0:NotifiyCore(ISLAND_EVT.INIT_INTERACTION_OP_VIEW)
	end
end

return var_0_0

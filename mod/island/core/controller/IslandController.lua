local var_0_0 = class("IslandController", import(".IslandBaseController"))

function var_0_0.Init(arg_1_0)
	arg_1_0.sceneData = IslandDataConvertor.Island2SceneData(arg_1_0.island)
	arg_1_0.mapId = arg_1_0.sceneData.mapId
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0.strollAllocator = IslandStrollAllocator.New(arg_2_0)
	arg_2_0.visibilityAllocator = IslandVisibilityAllocator.New(arg_2_0)
	arg_2_0.giftAllocator = IslandGiftAllocator.New(arg_2_0)
	arg_2_0.playerInputManager = PlayerInputManager.New(arg_2_0)
	arg_2_0.islandSyncMgr = IslandSyncMgr.New(arg_2_0)

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.sceneData.unitList) do
		if arg_2_0.visibilityAllocator:IsVisible(iter_2_1.id) then
			arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_1)
		end
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.sceneData.giftUnits) do
		if arg_2_0.giftAllocator:IsVisible(iter_2_2) then
			arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_3)
		end
	end

	for iter_2_4, iter_2_5 in ipairs(arg_2_0.sceneData.systemList) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_SYSTEM, iter_2_5)
	end

	for iter_2_6, iter_2_7 in ipairs(arg_2_0.sceneData.systemUnits) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_7)
	end

	for iter_2_8, iter_2_9 in ipairs(arg_2_0.sceneData.strollUnits) do
		local var_2_0, var_2_1 = arg_2_0.strollAllocator:Allocator(iter_2_9:GetDefaultPathId(arg_2_0.mapId))

		iter_2_9:SetPath(var_2_0, var_2_1)
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_9)
	end
end

function var_0_0.ResetPlayerPosition(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0.sceneData.unitList) do
		if iter_3_1:IsPlayer() then
			arg_3_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, iter_3_1.id, iter_3_1.position)
		end
	end
end

function var_0_0.OnCoreInitFinish(arg_4_0)
	arg_4_0:NotifiyCore(ISLAND_EVT.INIT_FINISH, arg_4_0.sceneData.camreaZoomData)
	arg_4_0:NotifiyIsland(ISLAND_EX_EVT.INIT_FINISH)
	arg_4_0.playerInputManager:Init()
	arg_4_0:InitSyncMgr()
end

function var_0_0.InitSyncMgr(arg_5_0)
	arg_5_0.islandSyncMgr:Init(arg_5_0.sceneData.unitList)
end

function var_0_0.GetMapID(arg_6_0)
	return arg_6_0.mapId
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_7_0.OnPlayerAdd)
	arg_7_0:AddIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_7_0.OnPlayerExit)
	arg_7_0:AddIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_7_0.OnPlayerChangeDress)
	arg_7_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_7_0.OnSyncDataUpdate)
	arg_7_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_7_0.OnSyncObjUpdate)
	arg_7_0:AddIslandListener(IslandBuildingAgency.SlOT_UNIT_INIT, arg_7_0.OnInitSlotUnit)
	arg_7_0:AddIslandListener(IslandBuildingAgency.SLOT_UNIT_REMOVE, arg_7_0.OnRemoveSlotUnit)
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
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_ADD, arg_8_0.OnPlayerAdd)
	arg_8_0:RemoveIslandListener(IslandVisitorAgency.VISITOR_EXIT, arg_8_0.OnPlayerExit)
	arg_8_0:RemoveIslandListener(IslandDressUpAgency.CHANGE_PLAYER_DRESS, arg_8_0.OnPlayerChangeDress)
	arg_8_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_8_0.OnSyncDataUpdate)
	arg_8_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_8_0.OnSyncObjUpdate)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.SlOT_UNIT_INIT, arg_8_0.OnInitSlotUnit)
	arg_8_0:RemoveIslandListener(IslandBuildingAgency.SLOT_UNIT_REMOVE, arg_8_0.OnRemoveSlotUnit)
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
end

function var_0_0.OnLinkCore(arg_9_0, arg_9_1, ...)
	arg_9_0:NotifiyCore(arg_9_1, ...)
end

function var_0_0.OnActiveOrDisableUnit(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	arg_10_0:NotifiyCore(ISLAND_EVT.ACTIVE_OR_DISACTIVE_UNIT, arg_10_1, arg_10_2, arg_10_3)
end

function var_0_0.OnStartPathFinder(arg_11_0, arg_11_1)
	arg_11_0:NotifiyCore(ISLAND_EVT.GEN_PATH_FINDER, arg_11_1)
end

function var_0_0.OnEndPathFinder(arg_12_0)
	arg_12_0.visibilityAllocator:Flush()
end

function var_0_0.OnStartPerformance(arg_13_0)
	arg_13_0:NotifiyCore(ISLAND_EVT.START_STORY)
	arg_13_0:NotifiyCore(ISLAND_EVT.START_PERFORMANCE)
end

function var_0_0.OnEndPerformance(arg_14_0)
	arg_14_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_14_0:NotifiyCore(ISLAND_EVT.END_PERFORMANCE)
end

function var_0_0.OnStartStory(arg_15_0)
	arg_15_0:NotifiyCore(ISLAND_EVT.START_STORY)
end

function var_0_0.OnEndStory(arg_16_0)
	arg_16_0:NotifiyCore(ISLAND_EVT.END_STORY)
	arg_16_0.visibilityAllocator:Flush()
end

function var_0_0.OnTaskAdd(arg_17_0)
	arg_17_0.visibilityAllocator:Flush()
	arg_17_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_17_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnFinishTask(arg_18_0)
	arg_18_0.visibilityAllocator:Flush()
	arg_18_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_18_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnUpdateTask(arg_19_0)
	arg_19_0.visibilityAllocator:Flush()
	arg_19_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_19_0:NotifiyCore(ISLAND_EVT.REFRESH_TASK_HUD_INFO)
end

function var_0_0.OnPlayerAdd(arg_20_0, arg_20_1)
	local var_20_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_20_1.player, arg_20_0.mapId)

	arg_20_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_20_0, function(arg_21_0)
		arg_20_0.islandSyncMgr:OnVisitorEnter(arg_20_1.player.id, arg_21_0)
	end)
end

function var_0_0.OnPlayerExit(arg_22_0, arg_22_1)
	arg_22_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_22_1.id)
	arg_22_0.islandSyncMgr:OnVisitorExit(arg_22_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_23_1, arg_23_2)
end

function var_0_0.OnStartPlant(arg_24_0, arg_24_1)
	local var_24_0

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.sceneData.productSystems) do
		if iter_24_1.id == arg_24_1.build_id then
			var_24_0 = iter_24_1

			break
		end
	end

	if not var_24_0 then
		return
	end

	local var_24_1 = var_24_0:GetUnitIdBySlotId(arg_24_1.area_id)

	arg_24_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_24_1)

	local var_24_2 = var_24_0:GenHandPlantUnitBySlotData(arg_24_1.area_id, arg_24_1.formula_id)

	arg_24_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_24_2)
	arg_24_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_24_1)
end

function var_0_0.OnStartHandCollect(arg_25_0, arg_25_1)
	local var_25_0

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.sceneData.productSystems) do
		if iter_25_1.id == arg_25_1.build_id then
			var_25_0 = iter_25_1

			break
		end
	end

	if not var_25_0 then
		return
	end

	local var_25_1 = var_25_0:GetUnitIdBySlotId(arg_25_1.area_id)

	arg_25_0:NotifiyCore(ISLAND_EVT.UPDATE_UNIT_HP, var_25_1)
	arg_25_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_25_1)
end

function var_0_0.OnEndPlant(arg_26_0, arg_26_1)
	local var_26_0

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.sceneData.productSystems) do
		if iter_26_1.id == arg_26_1.build_id then
			var_26_0 = iter_26_1

			break
		end
	end

	if not var_26_0 then
		return
	end

	local var_26_1 = var_26_0:GetUnitIdBySlotId(arg_26_1.area_id)

	arg_26_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_26_1)

	local var_26_2 = var_26_0:GenHandPlantUnitBySlotData(arg_26_1.area_id)

	arg_26_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_26_2)
	arg_26_0:NotifiyCore(ISLAND_EVT.UPDATE_HUD, var_26_1)
end

function var_0_0.OnHandPlantSlotChangeUnit(arg_27_0, arg_27_1)
	local var_27_0

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.sceneData.productSystems) do
		if iter_27_1.id == arg_27_1.build_id then
			var_27_0 = iter_27_1

			break
		end
	end

	if not var_27_0 then
		return
	end

	local var_27_1 = var_27_0:GetUnitIdBySlotId(arg_27_1.slotId)

	arg_27_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_27_1)

	local var_27_2 = var_27_0:GenHandPlantUnitBySlotData(arg_27_1.slotId)

	arg_27_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_27_2)
end

function var_0_0.OnRemoveWildGatherDone(arg_28_0, arg_28_1)
	arg_28_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_28_1.unitId)
	arg_28_0:NotifiyCore(ISLAND_EVT.LEAVE_UNIT, {
		id = arg_28_1.unitId
	})
end

function var_0_0.OnAddWildGatherDone(arg_29_0, arg_29_1)
	arg_29_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, IslandConst.UNIT_LIST_OBJ, arg_29_1.unitId)
end

function var_0_0.OnInitSlotUnit(arg_30_0, arg_30_1)
	assert(arg_30_1.unitId and arg_30_1.modelId)

	local var_30_0

	for iter_30_0, iter_30_1 in ipairs(arg_30_0.sceneData.productSystems) do
		if iter_30_1.id == arg_30_1.build_id then
			var_30_0 = iter_30_1

			break
		end
	end

	if not var_30_0 then
		return
	end

	local var_30_1 = pg.island_world_objects[arg_30_1.unitId] or {}
	local var_30_2 = {
		unitId = arg_30_1.modelId,
		typ = arg_30_1.unitType,
		formula_id = arg_30_1.fammulaId,
		slotId = arg_30_1.slotId,
		slotType = IslandProductSystemVO.SlotType.HandCollect
	}
	local var_30_3 = var_30_0:ProductSlotObj2IslandUnit(var_30_1, var_30_2)

	if var_30_3 then
		arg_30_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_30_3)
	end
end

function var_0_0.OnRemoveSlotUnit(arg_31_0, arg_31_1)
	assert(arg_31_1.unitId)
	arg_31_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_31_1.unitId)
end

function var_0_0.OnSyncDataUpdate(arg_32_0, arg_32_1)
	arg_32_0.islandSyncMgr:HandleSyncData(arg_32_1)
end

function var_0_0.OnSyncObjUpdate(arg_33_0, arg_33_1)
	arg_33_0.islandSyncMgr:HandleSyncObj(arg_33_1)
end

function var_0_0.Update(arg_34_0)
	arg_34_0.playerInputManager:Update()
	arg_34_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_35_0)
	if arg_35_0.playerInputManager then
		arg_35_0.playerInputManager:Dispose()

		arg_35_0.playerInputManager = nil
	end

	if arg_35_0.islandSyncMgr then
		arg_35_0.islandSyncMgr:Dispose()

		arg_35_0.islandSyncMgr = nil
	end

	if arg_35_0.strollAllocator then
		arg_35_0.strollAllocator:Dispose()

		arg_35_0.strollAllocator = nil
	end

	if arg_35_0.visibilityAllocator then
		arg_35_0.visibilityAllocator:Dispose()

		arg_35_0.visibilityAllocator = nil
	end

	if arg_35_0.giftAllocator then
		arg_35_0.giftAllocator:Dispose()

		arg_35_0.giftAllocator = nil
	end
end

function var_0_0.OnStartDelegation(arg_36_0, arg_36_1)
	local var_36_0

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.sceneData.systemList) do
		if isa(iter_36_1, IslandCharacterSystemVO) and iter_36_1.id == arg_36_1.build_id then
			var_36_0 = iter_36_1

			break
		end
	end

	if not var_36_0 then
		return
	end

	local var_36_1

	for iter_36_2, iter_36_3 in ipairs(arg_36_0.sceneData.productSystems) do
		if iter_36_3.id == arg_36_1.build_id then
			var_36_1 = iter_36_3

			break
		end
	end

	if arg_36_1.build_id == IslandProductSystemVO.FarmlandPlaceId then
		local var_36_2 = pg.island_production_slot[arg_36_1.area_id]

		for iter_36_4, iter_36_5 in ipairs(var_36_2.exclusion_slot) do
			local var_36_3 = var_36_1:GetUnitIdBySlotId(iter_36_5)
			local var_36_4 = var_36_1:GetUnitVOByUnitId(var_36_3)

			if var_36_4 then
				var_36_4:ChangeSlotType(IslandProductSystemVO.SlotType.RoleDelegation)
			end
		end
	end

	local var_36_5 = var_36_0:GetUnit(arg_36_1.ship_id, arg_36_1.area_id, true)

	if var_36_5 then
		arg_36_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_36_5)
	end

	arg_36_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_36_1, var_36_1)
end

function var_0_0.OnEndDelegation(arg_37_0, arg_37_1)
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

	arg_37_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_37_1)

	local var_37_1 = var_37_0:GetUnit(arg_37_1.ship_id, arg_37_1.area_id, true)

	if var_37_1 then
		arg_37_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_DELEGATION, var_37_1.id)
	end

	if arg_37_1.remainReward then
		return
	end

	local var_37_2

	for iter_37_2, iter_37_3 in ipairs(arg_37_0.sceneData.productSystems) do
		if iter_37_3.id == arg_37_1.build_id then
			var_37_2 = iter_37_3

			break
		end
	end

	if arg_37_1.build_id == IslandProductSystemVO.FarmlandPlaceId then
		local var_37_3 = pg.island_production_slot[arg_37_1.area_id]

		for iter_37_4, iter_37_5 in ipairs(var_37_3.exclusion_slot) do
			local var_37_4 = var_37_2:GetUnitIdBySlotId(iter_37_5)

			arg_37_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_37_4)

			local var_37_5 = var_37_2:GenHandPlantUnitBySlotData(iter_37_5)

			arg_37_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_37_5)
		end
	end
end

function var_0_0.OnGetAllDelegationAward(arg_38_0, arg_38_1)
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

	local var_38_1

	for iter_38_2, iter_38_3 in ipairs(arg_38_0.sceneData.productSystems) do
		if iter_38_3.id == arg_38_1.build_id then
			var_38_1 = iter_38_3

			break
		end
	end

	if arg_38_1.build_id == IslandProductSystemVO.FarmlandPlaceId then
		local var_38_2 = pg.island_production_slot[arg_38_1.area_id]

		for iter_38_4, iter_38_5 in ipairs(var_38_2.exclusion_slot) do
			local var_38_3 = var_38_1:GetUnitIdBySlotId(iter_38_5)

			arg_38_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, var_38_3)

			local var_38_4 = var_38_1:GenHandPlantUnitBySlotData(iter_38_5)

			arg_38_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_38_4)
		end
	end
end

function var_0_0.OnChangeSlotModel(arg_39_0, arg_39_1)
	local var_39_0

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.sceneData.productSystems) do
		if iter_39_1.id == IslandProductSystemVO.FarmlandPlaceId then
			var_39_0 = iter_39_1

			break
		end
	end

	if not var_39_0 then
		return
	end

	arg_39_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_OBJ, arg_39_1.id)

	local var_39_1 = var_39_0:GetUnitVOByUnitId(arg_39_1.id)

	var_39_1.modelId = arg_39_1.modelId

	arg_39_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_39_1)
end

function var_0_0.OnAnimalInit(arg_40_0, arg_40_1)
	local var_40_0

	for iter_40_0, iter_40_1 in ipairs(arg_40_0.sceneData.productSystems) do
		if iter_40_1.id == IslandProductSystemVO.PasturePlaceId then
			var_40_0 = iter_40_1

			break
		end
	end

	if not var_40_0 then
		return
	end

	local var_40_1 = arg_40_1.slotId

	for iter_40_2, iter_40_3 in ipairs(arg_40_1.aniList) do
		local var_40_2 = var_40_0:GenAnimalByAnialConfig(iter_40_3, var_40_1)

		arg_40_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_40_2)
	end
end

function var_0_0.WorldObjectInterAction(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	arg_41_3 = arg_41_3 or 1

	local var_41_0 = _.detect(arg_41_0.sceneData.unitList, function(arg_42_0)
		return arg_42_0.id == arg_41_1
	end)

	if not var_41_0 or not var_41_0:Interactable() then
		return
	end

	local var_41_1 = var_41_0:GetEmptySlot()

	if not var_41_1 then
		return
	end

	local function var_41_2()
		var_41_1:Lock(arg_41_2)
		arg_41_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_START_INTERACTION, var_41_0, var_41_1, arg_41_3)
	end

	if arg_41_4 then
		var_41_2()
	else
		arg_41_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_41_1, var_41_1.id, arg_41_3, function(arg_44_0)
			if arg_44_0 then
				var_41_2()
			end
		end)
	end
end

function var_0_0.WorldObjectInterActionEnd(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = _.detect(arg_45_0.sceneData.unitList, function(arg_46_0)
		return arg_46_0.id == arg_45_1
	end)

	if not var_45_0 or not var_45_0:Interactable() then
		return
	end

	local var_45_1 = var_45_0:GetUsingSlot(arg_45_2)

	if not var_45_1 then
		return
	end

	local function var_45_2()
		local var_47_0 = Clone(var_45_1)

		var_45_1:Release()
		arg_45_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_END_INTERACTION, var_45_0, var_47_0)
	end

	if arg_45_3 then
		var_45_2()
	else
		arg_45_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_UNIT_STATIC, arg_45_1, var_45_1.id, function(arg_48_0)
			if arg_48_0 then
				var_45_2()
			end
		end)
	end
end

function var_0_0.WorldObjectInitStatus(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = _.detect(arg_49_0.sceneData.unitList, function(arg_50_0)
		return arg_50_0.id == arg_49_1
	end)

	warning("init", arg_49_1, arg_49_2, var_49_0)

	if not var_49_0 or not var_49_0:Interactable() then
		return
	end

	arg_49_0:NotifiyCore(ISLAND_EVT.WORLD_OBJECT_INIT_STATUS, var_49_0, arg_49_2)
end

function var_0_0.OnOpenRestaurant(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.restId
	local var_51_1 = arg_51_1.postList
	local var_51_2

	for iter_51_0, iter_51_1 in ipairs(arg_51_0.sceneData.systemList) do
		if isa(iter_51_1, IslandManageSystemVO) and iter_51_1.id == var_51_0 then
			var_51_2 = iter_51_1

			break
		end
	end

	if not var_51_2 then
		return
	end

	local var_51_3 = var_51_2:GetUnits(var_51_1)

	for iter_51_2, iter_51_3 in ipairs(var_51_3) do
		arg_51_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_51_3)
	end

	arg_51_0:NotifiyCore(ISLAND_EVT.START_MANAGE, var_51_2)
end

function var_0_0.OnCloseRestaurant(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.restId
	local var_52_1 = arg_52_1.postList
	local var_52_2

	for iter_52_0, iter_52_1 in ipairs(arg_52_0.sceneData.systemList) do
		if isa(iter_52_1, IslandManageSystemVO) and iter_52_1.id == var_52_0 then
			var_52_2 = iter_52_1

			break
		end
	end

	if not var_52_2 then
		return
	end

	arg_52_0:NotifiyCore(ISLAND_EVT.END_MANAGE, var_52_2)

	local var_52_3 = var_52_2:GetUnits(var_52_1)

	for iter_52_2, iter_52_3 in ipairs(var_52_3) do
		arg_52_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, IslandConst.UNIT_LIST_MANAGE, iter_52_3.id)
	end
end

return var_0_0

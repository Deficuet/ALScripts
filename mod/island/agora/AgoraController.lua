local var_0_0 = class("AgoraController", import("Mod.Island.Core.controller.IslandController"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)

	local var_1_0, var_1_1 = arg_1_0:CreateAgora(arg_1_0.island)

	arg_1_0.agora = var_1_0
	arg_1_0.placedData = var_1_1
	arg_1_0.isEidting = false
	arg_1_0.selectedData = nil
	arg_1_0.editCdTime = 0
	arg_1_0.toUpdateTileList = {}
	arg_1_0.dataComparator = AgoraDataComparator.New(arg_1_0.agora)
	arg_1_0.reloading = false
	arg_1_0.isCleanLayerMode = false
end

function var_0_0.GetDefaultFoundation(arg_2_0)
	local var_2_0 = pg.island_set.island_pre_placement.key_value_varchar

	if var_2_0[1] then
		local var_2_1 = var_2_0[1][1]
		local var_2_2 = Vector2(var_2_0[1][2][1], var_2_0[1][2][2])
		local var_2_3 = AgoraCalc.GetUniqueId(var_2_1, 1)
		local var_2_4 = AgoraFurniture.New({
			id = var_2_3,
			configId = var_2_1
		})

		var_2_4:UpdatePosition(var_2_2)

		return var_2_4
	end

	return nil
end

function var_0_0.GetDefaultBuilding(arg_3_0)
	local var_3_0 = pg.island_set.island_default_building.key_value_varchar

	if var_3_0[1] then
		local var_3_1 = var_3_0[1]
		local var_3_2 = AgoraCalc.WorldPosition2MapPosition(BuildVector3(var_3_0[2]))
		local var_3_3 = AgoraCalc.GetUniqueId(var_3_1, 1)
		local var_3_4 = AgoraFurniture.New({
			id = var_3_3,
			configId = var_3_1
		})

		var_3_4:UpdatePosition(var_3_2)

		return var_3_4
	end

	return nil
end

function var_0_0.Update(arg_4_0)
	var_0_0.super.Update(arg_4_0)
	arg_4_0:CheckReloadFinish()
end

function var_0_0.CheckReloadFinish(arg_5_0)
	if not arg_5_0.reloading then
		return
	end

	if arg_5_0:GetView():IsLoaded() then
		arg_5_0:NotifiyAgora(ISLAND_AGORA_EVT.RELOADING_FINISH)

		arg_5_0.reloading = false
	end
end

function var_0_0.SetUp(arg_6_0)
	var_0_0.super.SetUp(arg_6_0)
	arg_6_0:NotifiyAgora(ISLAND_AGORA_EVT.START_LOAD_ITEMS)
	arg_6_0:NotifiyAgora(ISLAND_AGORA_EVT.MAP_SIZE_UPDATE, arg_6_0.agora:GetSize())

	local var_6_0 = arg_6_0.placedData.foundation or arg_6_0:GetDefaultFoundation()

	if var_6_0 then
		arg_6_0:PlaceItem(var_6_0.id, var_6_0:GetPosition(), Vector3.zero)
	end

	local var_6_1 = arg_6_0.placedData.building or arg_6_0:GetDefaultBuilding()

	if var_6_1 then
		arg_6_0:PlaceItem(var_6_1.id, var_6_1:GetPosition(), Vector3.zero)
	end

	local var_6_2 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0.placedData.placedlist) do
		table.insert(var_6_2, function(arg_7_0)
			arg_6_0:PlaceItem(iter_6_1.id, iter_6_1:GetPosition(), iter_6_1:GetRotation())

			if iter_6_0 % 3 == 0 then
				onNextTick(arg_7_0)
			else
				arg_7_0()
			end
		end)
	end

	seriesAsync(var_6_2, function()
		arg_6_0:NotifiyAgora(ISLAND_AGORA_EVT.END_LOAD_ITEMS, var_6_1:GetPosition())
	end)
end

function var_0_0.OnCoreInitFinish(arg_9_0)
	arg_9_0:PaveLayers(arg_9_0.placedData.placedFloor, arg_9_0.placedData.placedTile)
	var_0_0.super.OnCoreInitFinish(arg_9_0)
end

function var_0_0.InitSyncMgr(arg_10_0)
	arg_10_0.islandSyncMgr:Init(arg_10_0.sceneData.unitList, arg_10_0.agora:GetPlacedlist())
end

function var_0_0.PaveLayers(arg_11_0, arg_11_1, arg_11_2)
	for iter_11_0, iter_11_1 in pairs(arg_11_1) do
		arg_11_0:PaveFloorLayer(iter_11_1.id, iter_11_1:GetShapeId(), iter_11_1:GetPosition())
	end

	for iter_11_2, iter_11_3 in pairs(arg_11_2) do
		arg_11_0:PaveTileLayer(iter_11_3.id, iter_11_3:GetShapeId(), iter_11_3:GetPosition())
	end
end

function var_0_0.GetAgora(arg_12_0)
	return arg_12_0.agora
end

function var_0_0.CanEnterEditMode(arg_13_0)
	return pg.TimeMgr.GetInstance():GetServerTime() >= arg_13_0.editCdTime
end

function var_0_0.AnySelected(arg_14_0)
	return arg_14_0.selectedData ~= nil
end

function var_0_0.NotifiyAgora(arg_15_0, arg_15_1, ...)
	arg_15_0.agora:DispatchEvent(arg_15_1, ...)
end

function var_0_0.CheckChange(arg_16_0)
	if arg_16_0:AnySelected() then
		arg_16_0:UnSelectedItem()
	end

	local var_16_0, var_16_1 = arg_16_0.dataComparator:AnyChanged()

	return var_16_0
end

function var_0_0.EnterEditMode(arg_17_0)
	if not arg_17_0:CanEnterEditMode() then
		arg_17_0:NotifiyAgora(ISLAND_AGORA_EVT.ENTER_EDIT_FAILED)

		return
	end

	arg_17_0.isEidting = true

	arg_17_0.dataComparator:TakeSample()
	arg_17_0:NotifiyAgora(ISLAND_AGORA_EVT.ENTER_EDIT)
	arg_17_0:NotifiyIsland(ISLAND_EX_EVT.ENTER_EDIT_AGORA)
end

function var_0_0.ExitEditMode(arg_18_0)
	arg_18_0.isEidting = false

	arg_18_0.dataComparator:Abort()
	arg_18_0:NotifiyAgora(ISLAND_AGORA_EVT.EXIT_EDIT)
	arg_18_0:NotifiyIsland(ISLAND_EX_EVT.EXIT_EDIT_AGORA)
end

function var_0_0.SaveAndExit(arg_19_0)
	arg_19_0:Save(true)
	arg_19_0:ExitEditMode()
end

function var_0_0.Save(arg_20_0, arg_20_1)
	if not arg_20_1 and not arg_20_0:CanEnterEditMode() then
		return
	end

	if arg_20_0:AnySelected() then
		arg_20_0:UnSelectedItem()
	end

	local var_20_0, var_20_1, var_20_2 = arg_20_0.agora:SerializePlacementData()

	arg_20_0:NotifiyMeditor(IslandMediator.SAVE_AGORA, var_20_0, var_20_1, var_20_2)
	arg_20_0.dataComparator:TakeSample()

	local var_20_3 = pg.island_set.island_build_save_time.key_value_int

	arg_20_0.editCdTime = pg.TimeMgr.GetInstance():GetServerTime() + var_20_3

	arg_20_0:NotifiyAgora(ISLAND_AGORA_EVT.SAVE)
end

function var_0_0.SaveTheme(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_0:AnySelected() then
		arg_21_0:UnSelectedItem()
	end

	local var_21_0, var_21_1, var_21_2 = arg_21_0.agora:SerializePlacementData()

	if #var_21_0 <= 0 and #var_21_1 <= 0 and #var_21_2 <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_deco_empty"))

		return
	end

	arg_21_0:NotifiyMeditor(IslandMediator.SAVE_AGORA_THEME, {
		id = arg_21_1,
		name = arg_21_2,
		updateList = var_21_0,
		floorList = var_21_1,
		tileList = var_21_2
	})
end

function var_0_0.ApplyTheme(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_2 and arg_22_0.agora:GetSystemTheme(arg_22_1) or arg_22_0.agora:GetTheme(arg_22_1)

	if not var_22_0 then
		return
	end

	arg_22_0:ClearAll()
	arg_22_0:NotifiyAgora(ISLAND_AGORA_EVT.START_LOAD_ITEMS)

	local var_22_1 = {}
	local var_22_2 = var_22_0:GetPlacedData()

	for iter_22_0, iter_22_1 in ipairs(var_22_2) do
		table.insert(var_22_1, function(arg_23_0)
			arg_22_0:PlaceItem(iter_22_1.id, iter_22_1:GetPosition(), iter_22_1:GetRotation())

			if iter_22_0 % 3 == 0 then
				onNextTick(arg_23_0)
			else
				arg_23_0()
			end
		end)
	end

	table.insert(var_22_1, function(arg_24_0)
		onNextTick(arg_24_0)
	end)

	local var_22_3 = var_22_0:GetFloorData()

	for iter_22_2, iter_22_3 in ipairs(var_22_3) do
		arg_22_0:PaveFloorLayer(iter_22_3.id, iter_22_3.shapeId, iter_22_3:GetPosition())
	end

	table.insert(var_22_1, function(arg_25_0)
		onNextTick(arg_25_0)
	end)

	local var_22_4 = var_22_0:GetTileData()

	for iter_22_4, iter_22_5 in ipairs(var_22_4) do
		arg_22_0:PaveTileLayer(iter_22_5.id, iter_22_5.shapeId, iter_22_5:GetPosition())
	end

	seriesAsync(var_22_1, function()
		arg_22_0:NotifiyAgora(ISLAND_AGORA_EVT.END_LOAD_ITEMS)
	end)
end

function var_0_0.DeleteTheme(arg_27_0, arg_27_1)
	arg_27_0:NotifiyMeditor(IslandMediator.DEL_AGORA_THEME, arg_27_1)
end

function var_0_0.ClearAll(arg_28_0)
	if arg_28_0:AnySelected() then
		arg_28_0:UnPlaceItem(arg_28_0.selectedData.id)

		arg_28_0.selectedData = nil
	end

	arg_28_0:ClearPlaced(false)
	arg_28_0:ClearLayers()
end

function var_0_0.ClearPlaced(arg_29_0, arg_29_1)
	if arg_29_1 then
		for iter_29_0, iter_29_1 in pairs(arg_29_0.agora:GetPlacedlist()) do
			arg_29_0:UnPlaceItem(iter_29_1.id)
		end
	else
		for iter_29_2, iter_29_3 in pairs(arg_29_0.agora:GetPlacedlist()) do
			if iter_29_3:CanOp() then
				arg_29_0:UnPlaceItem(iter_29_3.id)
			end
		end
	end
end

function var_0_0.ClearFloorLayer(arg_30_0)
	for iter_30_0, iter_30_1 in pairs(arg_30_0.agora:GetFloorLayer()) do
		for iter_30_2, iter_30_3 in pairs(iter_30_1) do
			if not iter_30_3:IsEmpty() then
				arg_30_0:UnPaveFloorLayer(iter_30_3:GetPosition())
			end
		end
	end
end

function var_0_0.ClearTileLayer(arg_31_0)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.agora:GetTileLayer()) do
		for iter_31_2, iter_31_3 in pairs(iter_31_1) do
			if not iter_31_3:IsEmpty() then
				arg_31_0:UnPaveTileLayer(iter_31_3:GetPosition())
			end
		end
	end
end

function var_0_0.ClearLayers(arg_32_0)
	arg_32_0:ClearFloorLayer()
	arg_32_0:ClearTileLayer()
end

function var_0_0.Revert(arg_33_0)
	local var_33_0, var_33_1 = arg_33_0.dataComparator:AnyChanged()

	if not var_33_0 then
		return
	end

	local var_33_2, var_33_3, var_33_4 = arg_33_0.dataComparator:GetSample()

	if bit.band(var_33_1, AgoraDataComparator.CHANGE_TYPE_PLACED) > 0 then
		arg_33_0:ClearPlaced(true)

		for iter_33_0, iter_33_1 in pairs(var_33_2) do
			arg_33_0:PlaceItem(iter_33_1.id, iter_33_1:GetPosition(), iter_33_1:GetRotation())
		end
	end

	if bit.band(var_33_1, AgoraDataComparator.CHANGE_TYPE_FLOOR) > 0 then
		arg_33_0:ClearFloorLayer()

		for iter_33_2, iter_33_3 in pairs(var_33_3) do
			for iter_33_4, iter_33_5 in pairs(iter_33_3) do
				if not iter_33_5:IsEmpty() then
					arg_33_0:PaveFloorLayer(iter_33_5.id, iter_33_5:GetShapeId(), iter_33_5:GetPosition())
				end
			end
		end
	end

	if bit.band(var_33_1, AgoraDataComparator.CHANGE_TYPE_TILE) > 0 then
		arg_33_0:ClearTileLayer()

		for iter_33_6, iter_33_7 in pairs(var_33_4) do
			for iter_33_8, iter_33_9 in pairs(iter_33_7) do
				if not iter_33_9:IsEmpty() then
					arg_33_0:PaveTileLayer(iter_33_9.id, iter_33_9:GetShapeId(), iter_33_9:GetPosition())
				end
			end
		end
	end
end

function var_0_0.RevertAndExit(arg_34_0)
	arg_34_0:Revert()
	arg_34_0:ExitEditMode()
end

function var_0_0.Upgrade(arg_35_0)
	arg_35_0:NotifiyMeditor(IslandMediator.UPGRADE_AGORA)
end

function var_0_0.TrySelectItemById(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0.agora:GetPlacedItem(arg_36_1)

	arg_36_0:_TrySelectItem(var_36_0)
end

function var_0_0.TrySelectItem(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0.agora:GetAnyMapItemInPosition(arg_37_1)

	arg_37_0:_TrySelectItem(var_37_0)
end

function var_0_0._TrySelectItem(arg_38_0, arg_38_1)
	if not arg_38_1 then
		return
	end

	if not arg_38_1:CanSelect() then
		return
	end

	if arg_38_0:AnySelected() then
		arg_38_0:UnSelectedItem()
	end

	arg_38_0:SelectItem(arg_38_1)
end

function var_0_0.SelectItem(arg_39_0, arg_39_1)
	arg_39_0.selectedData = {
		id = arg_39_1.id,
		position = arg_39_1:GetPosition(),
		dir = arg_39_1:GetRotation()
	}

	arg_39_0.agora:RemoveItem(arg_39_1)

	local var_39_0 = arg_39_1:CanOp()

	arg_39_0:NotifiyAgora(ISLAND_AGORA_EVT.SELECTED_ITEM, arg_39_0.selectedData.id, var_39_0)
end

function var_0_0.ConfirmSelectedItem(arg_40_0)
	if not arg_40_0:AnySelected() then
		return
	end

	local var_40_0 = arg_40_0.agora:GetPlaceableItem(arg_40_0.selectedData.id)

	if not arg_40_0.agora:IsEmptyArea(var_40_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_pos_unavailability"))

		return
	end

	local var_40_1 = arg_40_0.selectedData.id

	arg_40_0:UnSelectedItem()
	arg_40_0:NotifiyAgora(ISLAND_AGORA_EVT.CONFIRM_SELECTED_ITEM, var_40_1)
end

function var_0_0.UnSelectedItem(arg_41_0)
	if not arg_41_0:AnySelected() then
		return
	end

	local var_41_0 = arg_41_0.selectedData.id

	arg_41_0:NotifiyAgora(ISLAND_AGORA_EVT.ITEM_CLEAR_OCCUPIED, var_41_0)

	local var_41_1 = arg_41_0.agora:GetPlaceableItem(var_41_0)

	if not arg_41_0.agora:IsEmptyArea(var_41_1) then
		local var_41_2 = arg_41_0.selectedData.position
		local var_41_3 = arg_41_0.selectedData.dir

		var_41_1:UpdatePosition(var_41_2)
		var_41_1:UpdateRotation(var_41_3)
	end

	local var_41_4 = var_41_1:CanOp()

	arg_41_0.agora:AddItem(var_41_1)

	arg_41_0.selectedData = nil

	arg_41_0:NotifiyAgora(ISLAND_AGORA_EVT.UNSELECTED_ITEM, var_41_0, var_41_4)
end

function var_0_0.BeginDragItem(arg_42_0)
	if not arg_42_0:AnySelected() then
		return
	end

	local var_42_0 = arg_42_0.agora:GetPlaceableItem(arg_42_0.selectedData.id)
end

function var_0_0.DragItem(arg_43_0, arg_43_1)
	if not arg_43_0:AnySelected() then
		return
	end

	local var_43_0 = arg_43_0.agora:GetPlaceableItem(arg_43_0.selectedData.id)

	var_43_0:UpdatePosition(arg_43_0.agora:ClampRange(arg_43_1.x, arg_43_1.y, var_43_0))

	local var_43_1 = var_43_0:GetArea()
	local var_43_2 = arg_43_0.agora:IsEmptyArea(var_43_0)

	arg_43_0:NotifiyAgora(ISLAND_AGORA_EVT.DRAG_ITEM, arg_43_0.selectedData.id, var_43_2)

	local var_43_3 = arg_43_0.agora:GetItemInArea(var_43_0:GetMapType(), var_43_1)

	if var_43_3 then
		arg_43_0:NotifiyAgora(ISLAND_AGORA_EVT.ITEM_OCCUPIED, var_43_3.id)
	else
		arg_43_0:NotifiyAgora(ISLAND_AGORA_EVT.ITEM_CLEAR_OCCUPIED, var_43_0.id)
	end
end

function var_0_0.EndDragItem(arg_44_0, arg_44_1)
	arg_44_0:DragItem(arg_44_1)
end

function var_0_0.RotationItem(arg_45_0)
	if not arg_45_0:AnySelected() then
		return
	end

	arg_45_0.agora:GetPlaceableItem(arg_45_0.selectedData.id):Rotation()
end

function var_0_0.InterAction(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = 1
	local var_46_1 = arg_46_0.agora:GetPlacedItem(arg_46_1)

	if not var_46_1 then
		return
	end

	local var_46_2 = var_46_1:GetEmptySlot()

	if not var_46_2 then
		return
	end

	local function var_46_3()
		var_46_2:Lock(arg_46_2)
		arg_46_0:NotifiyAgora(ISLAND_AGORA_EVT.START_INTERACTION, var_46_1, var_46_2, var_46_0)
	end

	if arg_46_3 then
		var_46_3()
	else
		arg_46_0.islandSyncMgr:TryControlUnit(IslandConst.SYNC_TYPE_AGORA, arg_46_1, var_46_2.id, var_46_0, function(arg_48_0)
			if arg_48_0 then
				var_46_3()
			end
		end)
	end
end

function var_0_0.InterActionEnd(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = arg_49_0.agora:GetPlacedItem(arg_49_1)

	if not var_49_0 then
		return
	end

	local var_49_1 = var_49_0:GetUsingSlot(arg_49_2)

	if not var_49_1 then
		return
	end

	local function var_49_2()
		local var_50_0 = Clone(var_49_1)

		var_49_1:Release()
		arg_49_0:NotifiyAgora(ISLAND_AGORA_EVT.END_INTERACTION, var_49_0, var_50_0)

		local var_50_1 = arg_49_0.agora:GetPlaceableItem(arg_49_1).position
		local var_50_2 = arg_49_0.agora:FindEmptyArea4Item(var_50_1, AgoraPlaceableItem.New({}))

		if var_50_2 then
			arg_49_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, arg_49_2, AgoraCalc.MapPosition2WorldPosition(var_50_2))
		end
	end

	if arg_49_3 then
		var_49_2()
	else
		arg_49_0.islandSyncMgr:EndControlUnit(IslandConst.SYNC_TYPE_AGORA, arg_49_1, var_49_1.id, function(arg_51_0)
			if arg_51_0 then
				var_49_2()
			end
		end)
	end
end

function var_0_0.PlaceItemRandonPosition(arg_52_0, arg_52_1)
	if arg_52_0.agora:IsMaxCapacity() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("island_agora_max_capacity"))

		return
	end

	local var_52_0 = AgoraCalc.GetCenterMapPos()

	if not var_52_0 then
		return
	end

	if arg_52_0:AnySelected() then
		arg_52_0:UnSelectedItem()
	end

	local var_52_1 = arg_52_0.agora:GetPlaceableItem(arg_52_1)

	var_52_1:Clear()

	local var_52_2 = arg_52_0.agora:FindEmptyArea4Item(var_52_0, var_52_1)

	if not var_52_2 then
		return
	end

	arg_52_0:PlaceItem(arg_52_1, var_52_2, Vector3.zero)
	arg_52_0:SelectItem(var_52_1)
end

function var_0_0.PlaceItem(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
	arg_53_0.agora:PlaceItem(arg_53_1, arg_53_2, arg_53_3)
end

function var_0_0.RemovePlaceItem(arg_54_0, arg_54_1)
	arg_54_0:UnPlaceItem(arg_54_1)
	arg_54_0:NotifiyAgora(ISLAND_AGORA_EVT.UNPLACE_ITEM)
end

function var_0_0.UnPlaceItem(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_1 or arg_55_0.selectedData and arg_55_0.selectedData.id

	if not var_55_0 then
		return
	end

	local var_55_1 = arg_55_0.agora:GetPlaceableItem(var_55_0)

	if arg_55_0:AnySelected() and arg_55_0.selectedData.id == var_55_0 then
		arg_55_0:UnSelectedItem()
	end

	if not var_55_1:CanOp() and not arg_55_2 then
		return
	end

	arg_55_0.agora:UnPlaceItem(var_55_0)
end

function var_0_0.ReplaceBuilding(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0.agora:GetBuilding()
	local var_56_1 = Vector2.zero

	if var_56_0 then
		var_56_1 = var_56_0:GetPosition()

		arg_56_0:UnPlaceItem(var_56_0.id, true)
	end

	arg_56_0:PlaceItem(arg_56_1, var_56_1, Vector3.zero)
end

function var_0_0.ReplaceFoundation(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0.agora:GetFoundation()
	local var_57_1 = Vector2.zero

	if var_57_0 then
		var_57_1 = var_57_0:GetPosition()

		arg_57_0:UnPlaceItem(var_57_0.id, true)
	end

	arg_57_0:PlaceItem(arg_57_1, var_57_1, Vector3.zero)
end

function var_0_0.SelectedPaveItem(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_0:AnySelected() then
		arg_58_0:UnSelectedItem()
	end

	arg_58_0.toUpdateTileList = {}
	arg_58_0.selectedPaveItemId = arg_58_1
	arg_58_0.paveItemShapeId = arg_58_2
	arg_58_0.isCleanLayerMode = false
end

function var_0_0.UnSelectedPaveItem(arg_59_0)
	arg_59_0.toUpdateTileList = {}
	arg_59_0.selectedPaveItemId = nil
	arg_59_0.paveItemShapeId = nil
	arg_59_0.isCleanLayerMode = false
end

function var_0_0.ChangeSelectedShape(arg_60_0, arg_60_1)
	if not arg_60_0.selectedPaveItemId then
		return
	end

	arg_60_0.paveItemShapeId = arg_60_1
end

function var_0_0.ChangePaveMode(arg_61_0, arg_61_1)
	arg_61_0.isCleanLayerMode = arg_61_1
end

function var_0_0.OpLayer(arg_62_0, arg_62_1)
	if not arg_62_0.selectedPaveItemId then
		return
	end

	local var_62_0 = arg_62_0.agora:GetPlaceableItem(arg_62_0.selectedPaveItemId)

	if not var_62_0 then
		return
	end

	if not arg_62_0.agora:InRange(arg_62_1.x, arg_62_1.y) then
		return
	end

	if not var_62_0:IsOptionalShapeType() then
		return
	end

	if arg_62_0.isCleanLayerMode then
		arg_62_0:UnPaveLayer(var_62_0, arg_62_1)
	else
		arg_62_0:PaveLayer(var_62_0, arg_62_1)
	end
end

function var_0_0.PaveLayer(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = arg_63_1.id
	local var_63_1 = arg_63_0.paveItemShapeId

	arg_63_0:RecordLayer(arg_63_1, arg_63_2)

	if arg_63_1:IsFloor() then
		arg_63_0:PaveFloorLayer(var_63_0, var_63_1, arg_63_2)
	elseif arg_63_1:IsTile() then
		arg_63_0:PaveTileLayer(var_63_0, var_63_1, arg_63_2)
	end
end

function var_0_0.RecordLayer(arg_64_0, arg_64_1, arg_64_2)
	if not arg_64_0.toUpdateTileList[arg_64_2.x] or not arg_64_0.toUpdateTileList[arg_64_2.x][arg_64_2.y] then
		local var_64_0

		if arg_64_1:IsFloor() then
			var_64_0 = arg_64_0.agora:GetFloorCell(arg_64_2)
		elseif arg_64_1:IsTile() then
			var_64_0 = arg_64_0.agora:GetTileCell(arg_64_2)
		end

		if var_64_0 then
			if not arg_64_0.toUpdateTileList[arg_64_2.x] then
				arg_64_0.toUpdateTileList[arg_64_2.x] = {}
			end

			arg_64_0.toUpdateTileList[arg_64_2.x][arg_64_2.y] = var_64_0:GetShapeId()
		end
	end
end

function var_0_0.UnPaveLayer(arg_65_0, arg_65_1, arg_65_2)
	if arg_65_1:IsFloor() and not arg_65_0.agora:HasFloorCell(arg_65_2) or arg_65_1:IsTile() and not arg_65_0.agora:HasTileCell(arg_65_2) then
		return
	end

	arg_65_0:RecordLayer(arg_65_1, arg_65_2)

	if arg_65_1:IsFloor() then
		arg_65_0:UnPaveFloorLayer(arg_65_2)
	elseif arg_65_1:IsTile() then
		arg_65_0:UnPaveTileLayer(arg_65_2)
	end
end

function var_0_0.PaveFloorLayer(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	arg_66_0.agora:PlaceFloor(arg_66_1, arg_66_2, arg_66_3)
end

function var_0_0.PaveTileLayer(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	arg_67_0.agora:PlaceTile(arg_67_1, arg_67_2, arg_67_3)
end

function var_0_0.RevertPaveLayer(arg_68_0)
	local function var_68_0(arg_69_0, arg_69_1, arg_69_2, arg_69_3)
		if arg_69_0 then
			arg_68_0:UnPaveFloorLayer(arg_69_2)

			return
		end

		arg_68_0:PaveFloorLayer(arg_69_1, arg_69_3, arg_69_2)
	end

	local function var_68_1(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
		if arg_70_0 then
			arg_68_0:UnPaveTileLayer(arg_70_2)

			return
		end

		arg_68_0:PaveTileLayer(arg_70_1, arg_70_3, arg_70_2)
	end

	local var_68_2 = arg_68_0.agora:GetPlaceableItem(arg_68_0.selectedPaveItemId)

	if not var_68_2 then
		return
	end

	local var_68_3 = var_68_2.id

	for iter_68_0, iter_68_1 in pairs(arg_68_0.toUpdateTileList) do
		for iter_68_2, iter_68_3 in pairs(iter_68_1) do
			local var_68_4 = Vector2(iter_68_0, iter_68_2)
			local var_68_5 = iter_68_3 < 0

			if var_68_2:IsFloor() then
				var_68_0(var_68_5, var_68_3, var_68_4, iter_68_3)
			elseif var_68_2:IsTile() then
				var_68_1(var_68_5, var_68_3, var_68_4, iter_68_3)
			end
		end
	end

	arg_68_0.toUpdateTileList = {}
end

function var_0_0.UnPaveFloorLayer(arg_71_0, arg_71_1)
	arg_71_0.agora:UnPlaceFloor(arg_71_1)
end

function var_0_0.UnPaveTileLayer(arg_72_0, arg_72_1)
	arg_72_0.agora:UnPlaceTile(arg_72_1)
end

function var_0_0.AddListeners(arg_73_0)
	var_0_0.super.AddListeners(arg_73_0)
	arg_73_0:AddIslandListener(IslandAgoraAgency.AGORA_UPGRADE, arg_73_0.OnAgoraUpdate)
	arg_73_0:AddIslandListener(IslandSignInAgency.GIFT_CNT_UPDATE, arg_73_0.OnSignInGiftCntUpdate)
	arg_73_0:AddIslandListener(IslandSignInAgency.SIGN_CNT_UPDATE, arg_73_0.OnSignCntUpdate)
	arg_73_0:AddIslandListener(IslandAgoraAgency.ADD_THEME, arg_73_0.OnThemeAdded)
	arg_73_0:AddIslandListener(IslandAgoraAgency.DEL_THEME, arg_73_0.OnThemeDeleted)
	arg_73_0:AddIslandListener(IslandAgoraAgency.PLACEMENT_UPDATE, arg_73_0.OnPlacementUpdate)
	arg_73_0:AddIslandListener(IslandAgoraAgency.ADD_FURNITURE, arg_73_0.OnFurnitureAdded)
end

function var_0_0.RemoveListeners(arg_74_0)
	var_0_0.super.RemoveListeners(arg_74_0)
	arg_74_0:RemoveIslandListener(IslandAgoraAgency.AGORA_UPGRADE, arg_74_0.OnAgoraUpdate)
	arg_74_0:RemoveIslandListener(IslandSignInAgency.GIFT_CNT_UPDATE, arg_74_0.OnSignInGiftCntUpdate)
	arg_74_0:RemoveIslandListener(IslandSignInAgency.SIGN_CNT_UPDATE, arg_74_0.OnSignCntUpdate)
	arg_74_0:RemoveIslandListener(IslandAgoraAgency.ADD_THEME, arg_74_0.OnThemeAdded)
	arg_74_0:RemoveIslandListener(IslandAgoraAgency.DEL_THEME, arg_74_0.OnThemeDeleted)
	arg_74_0:RemoveIslandListener(IslandAgoraAgency.PLACEMENT_UPDATE, arg_74_0.OnPlacementUpdate)
	arg_74_0:RemoveIslandListener(IslandAgoraAgency.ADD_FURNITURE, arg_74_0.OnFurnitureAdded)
end

function var_0_0.OnFurnitureAdded(arg_75_0, arg_75_1)
	for iter_75_0 = 1, arg_75_1.count do
		local var_75_0 = AgoraCalc.GetUniqueId(arg_75_1.id, iter_75_0)
		local var_75_1 = AgoraFurniture.New({
			id = var_75_0,
			configId = arg_75_1.id
		})

		arg_75_0.agora:AddPlaceable(var_75_1)
	end
end

function var_0_0.OnPlacementUpdate(arg_76_0, arg_76_1)
	arg_76_0.islandSyncMgr:OnClearAgora()

	local var_76_0 = AgoraTheme.New(arg_76_1, arg_76_0.agora.placeableList)
	local var_76_1, var_76_2, var_76_3 = var_76_0:GetSeparatedPlacedData()
	local var_76_4 = arg_76_0.agora:GetFoundation()

	if var_76_2 and var_76_4.id ~= var_76_2.id then
		arg_76_0:ReplaceFoundation(var_76_2.id)
	end

	local var_76_5 = arg_76_0.agora:GetBuilding()

	if var_76_3 and var_76_5.id ~= var_76_3.id then
		arg_76_0:ReplaceBuilding(var_76_3.id)
	end

	local var_76_6 = arg_76_0.agora:GetPlacedListWithoutFoundationAndBuilding()
	local var_76_7, var_76_8, var_76_9 = AgoraCalc.GetChangePlacementList(var_76_1, var_76_6)

	for iter_76_0, iter_76_1 in ipairs(var_76_8) do
		arg_76_0.agora:UnPlaceItem(iter_76_1.id)
	end

	for iter_76_2, iter_76_3 in ipairs(var_76_9) do
		arg_76_0.agora:PlaceItem(iter_76_3.id, iter_76_3:GetPosition(), iter_76_3:GetRotation())
	end

	for iter_76_4, iter_76_5 in ipairs(var_76_7) do
		arg_76_0.agora:UnPlaceItem(iter_76_5.id)
		arg_76_0.agora:PlaceItem(iter_76_5.id, iter_76_5:GetPosition(), iter_76_5:GetRotation())
	end

	arg_76_0:ClearLayers()

	local var_76_10 = var_76_0:GetFloorData()
	local var_76_11 = var_76_0:GetTileData()

	arg_76_0:PaveLayers(var_76_10, var_76_11)

	arg_76_0.reloading = true

	arg_76_0:NotifiyAgora(ISLAND_AGORA_EVT.RELOADING)

	if (#var_76_9 > 0 or #var_76_7 > 0) and not arg_76_0:IsSelfIsland() then
		arg_76_0:ResetPlayerPosition()
	end

	arg_76_0.islandSyncMgr:InitAgora(arg_76_0.agora:GetPlacedlist())
end

function var_0_0.OnThemeAdded(arg_77_0, arg_77_1)
	local var_77_0 = AgoraTheme.New(arg_77_1, arg_77_0.agora.placeableList)

	arg_77_0.agora:AddTheme(var_77_0)
end

function var_0_0.OnThemeDeleted(arg_78_0, arg_78_1)
	arg_78_0.agora:DeleteTheme(arg_78_1)
end

function var_0_0.OnSignCntUpdate(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_0:GetIsland():GetSignInAgency()

	arg_79_0:NotifiyCore(ISLAND_EVT.REFRESH_INTERACTION)
	arg_79_0:NotifiyAgora(ISLAND_AGORA_EVT.SIGN_IN_CNT_UPDATE, arg_79_1)
end

function var_0_0.OnSignInGiftCntUpdate(arg_80_0, arg_80_1)
	arg_80_0.giftAllocator:Flush()
end

function var_0_0.OnAgoraUpdate(arg_81_0, arg_81_1, arg_81_2)
	local var_81_0 = IslandConst.AGORA_LEVEL_2_SIZE[arg_81_1]

	arg_81_0.agora:UpdateSize(Vector2(var_81_0, var_81_0))
	arg_81_0.agora:UpdateCapacity(arg_81_2)
end

function var_0_0.CreateAgora(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1:GetAgoraAgency()
	local var_82_1 = {}

	for iter_82_0, iter_82_1 in ipairs(var_82_0:GetFurnitures()) do
		for iter_82_2 = 1, iter_82_1.count do
			local var_82_2 = AgoraCalc.GetUniqueId(iter_82_1.id, iter_82_2)
			local var_82_3 = AgoraFurniture.New({
				id = var_82_2,
				configId = iter_82_1.id
			})

			var_82_1[var_82_3.id] = var_82_3
		end
	end

	local var_82_4 = AgoraTheme.New(var_82_0:GetPlacedData(), var_82_1)
	local var_82_5, var_82_6, var_82_7 = var_82_4:GetSeparatedPlacedData()
	local var_82_8 = var_82_4:GetFloorData()
	local var_82_9 = var_82_4:GetTileData()
	local var_82_10 = {}

	for iter_82_3, iter_82_4 in ipairs(var_82_0:GetThemes()) do
		local var_82_11 = AgoraTheme.New(iter_82_4, var_82_1)

		table.insert(var_82_10, var_82_11)
	end

	local var_82_12 = {}

	for iter_82_5, iter_82_6 in ipairs(var_82_0:GetSystemThemes()) do
		local var_82_13 = AgoraSystemTheme.New(iter_82_6)

		table.insert(var_82_12, var_82_13)
	end

	local var_82_14 = var_82_0:GetLevel()
	local var_82_15 = math.clamp(var_82_14, 1, #IslandConst.AGORA_LEVEL_2_SIZE)
	local var_82_16 = IslandConst.AGORA_LEVEL_2_SIZE[var_82_15]
	local var_82_17 = var_82_0:GetCapacity()

	return Agora.New({
		size = Vector2(var_82_16, var_82_16),
		placeableList = var_82_1,
		capacity = var_82_17,
		themes = var_82_10,
		systemThemes = var_82_12
	}), {
		placedlist = var_82_5,
		foundation = var_82_6,
		building = var_82_7,
		placedFloor = var_82_8,
		placedTile = var_82_9
	}
end

return var_0_0

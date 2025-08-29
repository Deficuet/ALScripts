local var_0_0 = class("Agora", import(".AgoraPlaceableArea"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1.size)

	arg_1_0.placeableList = arg_1_1.placeableList
	arg_1_0.themes = arg_1_1.themes
	arg_1_0.systemThemes = arg_1_1.systemThemes
	arg_1_0.capacity = arg_1_1.capacity
	arg_1_0.maxCustomThemeCnt = pg.island_set.build_self_theme_num.key_value_int
end

function var_0_0.GetSystemThemes(arg_2_0)
	return arg_2_0.systemThemes
end

function var_0_0.GetSystemTheme(arg_3_0, arg_3_1)
	return _.detect(arg_3_0.systemThemes, function(arg_4_0)
		return arg_4_0.id == arg_3_1
	end)
end

function var_0_0.GetMaxCustomThemeCnt(arg_5_0)
	return arg_5_0.maxCustomThemeCnt
end

function var_0_0.GetThemes(arg_6_0)
	return arg_6_0.themes
end

function var_0_0.AddTheme(arg_7_0, arg_7_1)
	table.insert(arg_7_0.themes, arg_7_1)
	arg_7_0:DispatchEvent(ISLAND_AGORA_EVT.THEME_UPDATE)
end

function var_0_0.DeleteTheme(arg_8_0, arg_8_1)
	local var_8_0 = _.detect(arg_8_0.themes, function(arg_9_0)
		return arg_9_0.id == arg_8_1
	end)

	if var_8_0 then
		table.removebyvalue(arg_8_0.themes, var_8_0)
		arg_8_0:DispatchEvent(ISLAND_AGORA_EVT.THEME_UPDATE)
	end
end

function var_0_0.GetTheme(arg_10_0, arg_10_1)
	return _.detect(arg_10_0.themes, function(arg_11_0)
		return arg_11_0.id == arg_10_1
	end)
end

function var_0_0.GetUseableThemeId(arg_12_0)
	local function var_12_0(arg_13_0)
		for iter_13_0, iter_13_1 in ipairs(arg_12_0.themes) do
			if iter_13_1.id == arg_13_0 then
				return true
			end
		end

		return false
	end

	for iter_12_0 = 1, arg_12_0.maxCustomThemeCnt do
		if not var_12_0(iter_12_0) then
			return iter_12_0
		end
	end

	return nil
end

function var_0_0.UpdateCapacity(arg_14_0, arg_14_1)
	arg_14_0.capacity = arg_14_1
end

function var_0_0.GetMaxCapacity(arg_15_0)
	return arg_15_0.capacity
end

function var_0_0.GetCapacity(arg_16_0)
	local var_16_0 = 0

	for iter_16_0, iter_16_1 in pairs(arg_16_0.placedlist) do
		var_16_0 = var_16_0 + iter_16_1:GetCost()
	end

	return var_16_0
end

function var_0_0.IsMaxCapacity(arg_17_0)
	return arg_17_0:GetCapacity() >= arg_17_0:GetMaxCapacity()
end

function var_0_0.AddPlaceable(arg_18_0, arg_18_1)
	if arg_18_0.placeableList[arg_18_1.id] then
		return
	end

	arg_18_0.placeableList[arg_18_1.id] = arg_18_1
end

function var_0_0.AddPlaceableList(arg_19_0, arg_19_1)
	arg_19_0.placeableList[arg_19_1.id] = arg_19_1
end

function var_0_0.GetPlaceableList(arg_20_0)
	return arg_20_0.placeableList
end

function var_0_0.GetPlaceableItem(arg_21_0, arg_21_1)
	return arg_21_0.placeableList[arg_21_1]
end

function var_0_0.PlaceItem(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = arg_22_0.placeableList[arg_22_1]

	var_22_0:UpdatePosition(arg_22_2)
	var_22_0:UpdateRotation(arg_22_3)
	arg_22_0:AddItem(var_22_0)
	arg_22_0:DispatchEvent(ISLAND_AGORA_EVT.GEN_ITEM, var_22_0)
end

function var_0_0.UnPlaceItem(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.placeableList[arg_23_1]

	arg_23_0:RemoveItem(var_23_0)
	arg_23_0:DispatchEvent(ISLAND_AGORA_EVT.REMOVE_ITEM, var_23_0)
end

function var_0_0.GetBuilding(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.placedlist) do
		if iter_24_1:IsBuildingType() then
			return iter_24_1
		end
	end

	return nil
end

function var_0_0.GetFoundation(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.placedlist) do
		if iter_25_1:IsFoundationType() then
			return iter_25_1
		end
	end

	return nil
end

function var_0_0.GetPlacedListWithoutFoundationAndBuilding(arg_26_0)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.placedlist) do
		if iter_26_1:IsBuildingType() or iter_26_1:IsFoundationType() then
			-- block empty
		else
			table.insert(var_26_0, iter_26_1)
		end
	end

	return var_26_0
end

function var_0_0.HasTileCell(arg_27_0, arg_27_1)
	return not arg_27_0:GetTileCell(arg_27_1):IsEmpty()
end

function var_0_0.IsSameTile(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	return arg_28_0:GetTileCell(arg_28_3):IsSameValue(arg_28_1, arg_28_2)
end

function var_0_0.PlaceTile(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	if arg_29_0:IsSameTile(arg_29_1, arg_29_2, arg_29_3) then
		return
	end

	arg_29_0:FillTileLayer(arg_29_1, arg_29_2, arg_29_3)

	local var_29_0 = arg_29_0:GetTileCell(arg_29_3)

	arg_29_0:DispatchEvent(ISLAND_AGORA_EVT.FILL_TILE_CELL, var_29_0)
end

function var_0_0.UnPlaceTile(arg_30_0, arg_30_1)
	if not arg_30_0:HasTileCell(arg_30_1) then
		return
	end

	arg_30_0:ClearTileLayer(arg_30_1)
	arg_30_0:DispatchEvent(ISLAND_AGORA_EVT.CLEAR_TILE_CELL, arg_30_1)
end

function var_0_0.HasFloorCell(arg_31_0, arg_31_1)
	return not arg_31_0:GetFloorCell(arg_31_1):IsEmpty()
end

function var_0_0.IsSameFloor(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	return arg_32_0:GetFloorCell(arg_32_3):IsSameValue(arg_32_1, arg_32_2)
end

function var_0_0.PlaceFloor(arg_33_0, arg_33_1, arg_33_2, arg_33_3)
	if arg_33_0:IsSameFloor(arg_33_1, arg_33_2, arg_33_3) then
		return
	end

	arg_33_0:FillFloorLayer(arg_33_1, arg_33_2, arg_33_3)

	local var_33_0 = arg_33_0:GetFloorCell(arg_33_3)

	arg_33_0:DispatchEvent(ISLAND_AGORA_EVT.FILL_FLOOR_CELL, var_33_0)
end

function var_0_0.UnPlaceFloor(arg_34_0, arg_34_1)
	if not arg_34_0:HasFloorCell(arg_34_1) then
		return
	end

	arg_34_0:ClearFloorLayer(arg_34_1)
	arg_34_0:DispatchEvent(ISLAND_AGORA_EVT.CLEAR_FLOOR_CELL, arg_34_1)
end

function var_0_0.GetPlacedInfoList(arg_35_0)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in pairs(arg_35_0.placedlist) do
		table.insert(var_35_0, {
			count = 1,
			icon = iter_35_1:GetIcon(),
			name = iter_35_1:GetName(),
			capacity = iter_35_1:GetCost()
		})
	end

	return var_35_0
end

return var_0_0

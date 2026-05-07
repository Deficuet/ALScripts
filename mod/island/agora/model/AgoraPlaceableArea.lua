local var_0_0 = class("AgoraPlaceableArea", import("...IslandDispatcher"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.size = arg_1_1
	arg_1_0.placedlist = {}
	arg_1_0.maps = {
		[IslandConst.AGORA_MAP_TYPE_COMMON] = AgoraMap.New(arg_1_1),
		[IslandConst.AGORA_MAP_TYPE_NEWTILE] = AgoraMap.New(arg_1_1),
		[IslandConst.AGORA_MAP_TYPE_BUILDING] = AgoraBuildingMap.New()
	}
	arg_1_0.floorLayer = arg_1_0:GenLayer()
	arg_1_0.tileLayer = arg_1_0:GenLayer()
end

function var_0_0.GetFloorLayer(arg_2_0)
	return arg_2_0.floorLayer
end

function var_0_0.GetTileLayer(arg_3_0)
	return arg_3_0.tileLayer
end

function var_0_0.GetFloorCell(arg_4_0, arg_4_1)
	return arg_4_0.floorLayer[arg_4_1.x][arg_4_1.y]
end

function var_0_0.GetTileCell(arg_5_0, arg_5_1)
	return arg_5_0.tileLayer[arg_5_1.x][arg_5_1.y]
end

function var_0_0.GenLayer(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = IslandConst.AGORA_LEVEL_2_SIZE[#IslandConst.AGORA_LEVEL_2_SIZE]
	local var_6_2 = AgoraCalc.GetArea(Vector2.zero, Vector2(var_6_1, var_6_1))

	for iter_6_0, iter_6_1 in ipairs(var_6_2) do
		local var_6_3 = iter_6_1.x
		local var_6_4 = iter_6_1.y

		if not var_6_0[var_6_3] then
			var_6_0[var_6_3] = {}
		end

		var_6_0[var_6_3][var_6_4] = AgoraLayerCell.New(Vector2(var_6_3, var_6_4))
	end

	return var_6_0
end

function var_0_0.FillFloorLayer(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = (arg_7_0.floorLayer[arg_7_3.x] or {})[arg_7_3.y]

	if not var_7_0 then
		return
	end

	var_7_0:Fill(arg_7_1, arg_7_2)
end

function var_0_0.ClearFloorLayer(arg_8_0, arg_8_1)
	local var_8_0 = (arg_8_0.floorLayer[arg_8_1.x] or {})[arg_8_1.y]

	if not var_8_0 then
		return
	end

	var_8_0:Clear()
end

function var_0_0.FillTileLayer(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = (arg_9_0.tileLayer[arg_9_3.x] or {})[arg_9_3.y]

	if not var_9_0 then
		return
	end

	var_9_0:Fill(arg_9_1, arg_9_2)
end

function var_0_0.ClearTileLayer(arg_10_0, arg_10_1)
	local var_10_0 = (arg_10_0.tileLayer[arg_10_1.x] or {})[arg_10_1.y]

	if not var_10_0 then
		return
	end

	var_10_0:Clear()
end

function var_0_0.UpdateSize(arg_11_0, arg_11_1)
	arg_11_0.size = arg_11_1

	for iter_11_0, iter_11_1 in pairs(arg_11_0.maps) do
		iter_11_1:UpdateSize(arg_11_1)
	end

	arg_11_0:DispatchEvent(ISLAND_AGORA_EVT.MAP_SIZE_UPDATE, arg_11_0.size)
end

function var_0_0.GetSize(arg_12_0)
	return arg_12_0.size
end

function var_0_0.GetRangeCoord(arg_13_0)
	return (AgoraCalc.GetSizeCoord(arg_13_0.size))
end

function var_0_0.InRange(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0:GetRangeCoord()

	return arg_14_1 >= var_14_0.x and arg_14_1 <= var_14_0.z and arg_14_2 <= var_14_0.y and arg_14_2 >= var_14_0.w
end

function var_0_0._InRange(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	return arg_15_2 >= arg_15_1.x and arg_15_2 <= arg_15_1.z and arg_15_3 <= arg_15_1.y and arg_15_3 >= arg_15_1.w
end

function var_0_0.ClampRange(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_3:GetSizeWithRotation()
	local var_16_1 = AgoraCalc.GetSizeCoord(var_16_0)
	local var_16_2 = arg_16_0:GetRangeCoord()
	local var_16_3 = var_16_2.x - var_16_1.x
	local var_16_4 = var_16_2.z - var_16_1.z
	local var_16_5 = var_16_2.w - var_16_1.w
	local var_16_6 = var_16_2.y - var_16_1.y

	arg_16_1 = Mathf.Clamp(arg_16_1, var_16_3, var_16_4)
	arg_16_2 = Mathf.Clamp(arg_16_2, var_16_5, var_16_6)

	return Vector2(arg_16_1, arg_16_2)
end

function var_0_0._ClampRange(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_0:_InRange(arg_17_1, arg_17_2.x, arg_17_2.y) then
		return arg_17_2
	end

	local var_17_0 = Mathf.Clamp(arg_17_2.x, arg_17_1.x, arg_17_1.z)
	local var_17_1 = Mathf.Clamp(arg_17_2.y, arg_17_1.y, arg_17_1.w)

	return Vector2(var_17_0, var_17_1)
end

function var_0_0.IsUsing(arg_18_0, arg_18_1)
	return arg_18_0.placedlist[arg_18_1] ~= nil
end

function var_0_0.GetPlacedlist(arg_19_0)
	return arg_19_0.placedlist
end

function var_0_0.GetPlacedItem(arg_20_0, arg_20_1)
	return arg_20_0.placedlist[arg_20_1]
end

function var_0_0.GetMap(arg_21_0, arg_21_1)
	return arg_21_0.maps[arg_21_1:GetMapType()]
end

function var_0_0.AddItem(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1:GetArea()
	local var_22_1 = arg_22_0:GetMap(arg_22_1)

	for iter_22_0, iter_22_1 in ipairs(var_22_0) do
		var_22_1:UpdateMapState(iter_22_1.x, iter_22_1.y, false)
	end

	arg_22_0.placedlist[arg_22_1.id] = arg_22_1
end

function var_0_0.RemoveItem(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1:GetArea()
	local var_23_1 = arg_23_0:GetMap(arg_23_1)

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		var_23_1:UpdateMapState(iter_23_1.x, iter_23_1.y, true)
	end

	arg_23_0.placedlist[arg_23_1.id] = nil
end

function var_0_0.IsEmptyArea(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:GetArea()
	local var_24_1 = arg_24_0:GetMap(arg_24_1)
	local var_24_2 = arg_24_0:GetRangeCoord()

	return _.all(var_24_0, function(arg_25_0)
		return arg_24_0:_InRange(var_24_2, arg_25_0.x, arg_25_0.y) and var_24_1:GetMapState(arg_25_0.x, arg_25_0.y) == true
	end)
end

function var_0_0.IsEmptyAreaInPoint(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_1:GenAreaByPosition(arg_26_2)
	local var_26_1 = arg_26_0:GetMap(arg_26_1)
	local var_26_2 = arg_26_0:GetRangeCoord()

	return _.all(var_26_0, function(arg_27_0)
		return arg_26_0:_InRange(var_26_2, arg_27_0.x, arg_27_0.y) and var_26_1:GetMapState(arg_27_0.x, arg_27_0.y) == true
	end)
end

function var_0_0.IsEmptyPoint(arg_28_0, arg_28_1, arg_28_2)
	return arg_28_0:GetMap(arg_28_1):IsEmptyPoint(arg_28_2)
end

function var_0_0.GetItemInArea(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_0.maps[arg_29_1]
	local var_29_1 = _.detect(arg_29_2, function(arg_30_0)
		return var_29_0:GetMapState(arg_30_0.x, arg_30_0.y) == false
	end)

	if var_29_1 then
		local var_29_2 = arg_29_0:GetItemInPosition(arg_29_1, var_29_1)

		if var_29_2 then
			return var_29_2
		end
	end

	return nil
end

function var_0_0.GetAnyMapItemInPosition(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.maps) do
		local var_31_0 = arg_31_0:GetItemInPosition(iter_31_0, arg_31_1)

		if var_31_0 then
			return var_31_0
		end
	end

	return nil
end

function var_0_0.GetItemInPosition(arg_32_0, arg_32_1, arg_32_2)
	if not arg_32_0:InRange(arg_32_2.x, arg_32_2.y) then
		return nil
	end

	if arg_32_0.maps[arg_32_1]:GetMapState(arg_32_2.x, arg_32_2.y) == false then
		return arg_32_0:FindItemInPosition(arg_32_1, arg_32_2)
	end

	return nil
end

function var_0_0.FindItemInPosition(arg_33_0, arg_33_1, arg_33_2)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.placedlist) do
		if iter_33_1:GetMapType() == arg_33_1 then
			local var_33_0 = iter_33_1:GetArea()

			for iter_33_2, iter_33_3 in ipairs(var_33_0) do
				if iter_33_3 == arg_33_2 then
					return iter_33_1
				end
			end
		end
	end

	return nil
end

function var_0_0.FindEmptyArea4Item(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0:GetRangeCoord()
	local var_34_1 = AgoraCalc.GetSizeCoord(arg_34_2:GetSizeWithRotation())
	local var_34_2 = var_34_0.x - var_34_1.x
	local var_34_3 = var_34_0.z - var_34_1.z
	local var_34_4 = var_34_0.w - var_34_1.w
	local var_34_5 = var_34_0.y - var_34_1.y

	if var_34_3 < var_34_2 or var_34_5 < var_34_4 then
		return nil
	end

	local var_34_6 = Mathf.Clamp(arg_34_1.x, var_34_2, var_34_3)
	local var_34_7 = Mathf.Clamp(arg_34_1.y, var_34_4, var_34_5)
	local var_34_8 = arg_34_0:GetMap(arg_34_2)
	local var_34_9 = math.max(math.abs(var_34_6 - var_34_2) + math.abs(var_34_7 - var_34_4), math.abs(var_34_6 - var_34_2) + math.abs(var_34_7 - var_34_5), math.abs(var_34_6 - var_34_3) + math.abs(var_34_7 - var_34_4), math.abs(var_34_6 - var_34_3) + math.abs(var_34_7 - var_34_5))

	local function var_34_10(arg_35_0, arg_35_1)
		if arg_35_0 < var_34_2 or arg_35_0 > var_34_3 or arg_35_1 < var_34_4 or arg_35_1 > var_34_5 then
			return false
		end

		return _.all(arg_34_2:GenAreaByPosition(Vector2(arg_35_0, arg_35_1)), function(arg_36_0)
			return arg_34_0:_InRange(var_34_0, arg_36_0.x, arg_36_0.y) and var_34_8:GetMapState(arg_36_0.x, arg_36_0.y) == true
		end)
	end

	for iter_34_0 = 0, var_34_9 do
		for iter_34_1 = -iter_34_0, iter_34_0 do
			local var_34_11 = iter_34_0 - math.abs(iter_34_1)
			local var_34_12 = var_34_6 + iter_34_1

			if var_34_10(var_34_12, var_34_7 + var_34_11) then
				return Vector2(var_34_12, var_34_7 + var_34_11)
			end

			if var_34_11 ~= 0 and var_34_10(var_34_12, var_34_7 - var_34_11) then
				return Vector2(var_34_12, var_34_7 - var_34_11)
			end
		end
	end

	return nil
end

function var_0_0.SerializePlacementData(arg_37_0)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_0:GetPlacedlist()) do
		table.insert(var_37_0, iter_37_1:ToPlacementData())
	end

	local var_37_1 = {}

	for iter_37_2, iter_37_3 in pairs(arg_37_0:GetFloorLayer()) do
		for iter_37_4, iter_37_5 in pairs(iter_37_3) do
			if not iter_37_5:IsEmpty() then
				table.insert(var_37_1, iter_37_5:ToPlacementData())
			end
		end
	end

	local var_37_2 = {}

	for iter_37_6, iter_37_7 in pairs(arg_37_0:GetTileLayer()) do
		for iter_37_8, iter_37_9 in pairs(iter_37_7) do
			if not iter_37_9:IsEmpty() then
				table.insert(var_37_2, iter_37_9:ToPlacementData())
			end
		end
	end

	return var_37_0, var_37_1, var_37_2
end

function var_0_0.ToString(arg_38_0)
	local var_38_0, var_38_1, var_38_2 = arg_38_0:SerializePlacementData()
	local var_38_3 = AgoraCalc.EncodeLayer(var_38_1)
	local var_38_4 = AgoraCalc.EncodeLayer(var_38_2)
	local var_38_5 = _.map(var_38_0, function(arg_39_0)
		return string.format("\t\t\t{id = %s,x = %s,y = %s,dir = %s,configId = %s},", arg_39_0.id, arg_39_0.x, arg_39_0.y, arg_39_0.dir, arg_39_0.configId)
	end)
	local var_38_6 = _.map(var_38_3, function(arg_40_0)
		return "\t\t\t" .. tostring(arg_40_0)
	end)
	local var_38_7 = _.map(var_38_4, function(arg_41_0)
		return "\t\t\t" .. tostring(arg_41_0)
	end)
	local var_38_8 = {}

	table.insert(var_38_8, "return {")
	table.insert(var_38_8, "\tid = 0,")
	table.insert(var_38_8, "\tname = '',")
	table.insert(var_38_8, "\tplaced_data = {")
	table.insert(var_38_8, "\t\tplaced_list = {")
	table.insert(var_38_8, table.concat(var_38_5, "\n"))
	table.insert(var_38_8, "\t\t},")
	table.insert(var_38_8, "\t\tfloor_data = {")
	table.insert(var_38_8, table.concat(var_38_6, ",\n"))
	table.insert(var_38_8, "\t\t},")
	table.insert(var_38_8, "\t\ttile_data = {")
	table.insert(var_38_8, table.concat(var_38_7, ",\n"))
	table.insert(var_38_8, "\t\t},")
	table.insert(var_38_8, "\t}")
	table.insert(var_38_8, "}")

	return table.concat(var_38_8, "\n")
end

return var_0_0

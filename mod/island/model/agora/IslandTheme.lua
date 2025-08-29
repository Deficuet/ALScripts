local var_0_0 = class("IslandTheme")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id or -1
	arg_1_0.name = arg_1_1.name or ""
	arg_1_0.placedList = {}
	arg_1_0.floorLayer = {}
	arg_1_0.tileLayer = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.placed_data.placed_list or {}) do
		table.insert(arg_1_0.placedList, {
			id = iter_1_1.id,
			position = Vector2(iter_1_1.x, iter_1_1.y),
			rotation = Vector3(0, iter_1_1.dir * 90, 0),
			configId = iter_1_1.configId
		})
	end

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.placed_data.floor_data or {}) do
		local var_1_0, var_1_1, var_1_2, var_1_3 = AgoraCalc.DecodeLayer(iter_1_3)

		table.insert(arg_1_0.floorLayer, {
			position = Vector2(var_1_2, var_1_3),
			id = var_1_0,
			shapeId = var_1_1
		})
	end

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.placed_data.tile_data or {}) do
		local var_1_4, var_1_5, var_1_6, var_1_7 = AgoraCalc.DecodeLayer(iter_1_5)

		table.insert(arg_1_0.tileLayer, {
			position = Vector2(var_1_6, var_1_7),
			id = var_1_4,
			shapeId = var_1_5
		})
	end
end

function var_0_0.GetID(arg_2_0)
	return arg_2_0.id
end

function var_0_0.SetName(arg_3_0, arg_3_1)
	arg_3_0.name = arg_3_1
end

function var_0_0.GetName(arg_4_0)
	return arg_4_0.name
end

function var_0_0.GetPlacedList(arg_5_0)
	return arg_5_0.placedList
end

function var_0_0.GetFloorLayer(arg_6_0)
	return arg_6_0.floorLayer
end

function var_0_0.GetTileLayer(arg_7_0)
	return arg_7_0.tileLayer
end

return var_0_0

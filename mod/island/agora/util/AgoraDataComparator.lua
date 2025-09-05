local var_0_0 = class("AgoraDataComparator")

var_0_0.CHANGE_TYPE_PLACED = 2
var_0_0.CHANGE_TYPE_FLOOR = 4
var_0_0.CHANGE_TYPE_TILE = 8

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.agora = arg_1_1
	arg_1_0.isTake = false
	arg_1_0.allCode = IndexConst.BitAll({
		var_0_0.CHANGE_TYPE_PLACED,
		var_0_0.CHANGE_TYPE_FLOOR,
		var_0_0.CHANGE_TYPE_TILE
	})
end

function var_0_0.TakeSample(arg_2_0)
	arg_2_0.placedData = Clone(arg_2_0.agora:GetPlacedlist())
	arg_2_0.floorData = Clone(arg_2_0.agora:GetFloorLayer())
	arg_2_0.tileData = Clone(arg_2_0.agora:GetTileLayer())
	arg_2_0.isTake = true
end

function var_0_0.GetSample(arg_3_0)
	return arg_3_0.placedData, arg_3_0.floorData, arg_3_0.tileData
end

function var_0_0.AnyChanged(arg_4_0)
	if not arg_4_0.isTake then
		return false
	end

	local var_4_0 = arg_4_0.agora:GetPlacedlist()
	local var_4_1 = arg_4_0.agora:GetFloorLayer()
	local var_4_2 = arg_4_0.agora:GetTileLayer()
	local var_4_3 = 0

	if arg_4_0:ComparePlacedData(var_4_0, arg_4_0.placedData) then
		var_4_3 = bit.bor(var_4_3, var_0_0.CHANGE_TYPE_PLACED)
	end

	if arg_4_0:CompareLayer(var_4_1, arg_4_0.floorData) then
		var_4_3 = bit.bor(var_4_3, var_0_0.CHANGE_TYPE_FLOOR)
	end

	if arg_4_0:CompareLayer(var_4_2, arg_4_0.tileData) then
		var_4_3 = bit.bor(var_4_3, var_0_0.CHANGE_TYPE_TILE)
	end

	return bit.band(var_4_3, arg_4_0.allCode) > 0, var_4_3
end

function var_0_0.ComparePlacedData(arg_5_0, arg_5_1, arg_5_2)
	if table.getCount(arg_5_1) ~= table.getCount(arg_5_2) then
		return true
	end

	for iter_5_0, iter_5_1 in pairs(arg_5_2) do
		local var_5_0 = arg_5_1[iter_5_0]

		if not var_5_0 or not var_5_0:IsSame(iter_5_1) then
			return true
		end
	end

	for iter_5_2, iter_5_3 in pairs(arg_5_1) do
		local var_5_1 = arg_5_2[iter_5_2]

		if not var_5_1 or not var_5_1:IsSame(iter_5_3) then
			return true
		end
	end

	return false
end

function var_0_0.CompareLayer(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		for iter_6_2, iter_6_3 in pairs(iter_6_1) do
			local var_6_0 = arg_6_2[iter_6_0][iter_6_2]

			if not var_6_0 or not var_6_0:IsSame(iter_6_3) then
				return true
			end
		end
	end

	return false
end

function var_0_0.Abort(arg_7_0)
	arg_7_0.placedData = nil
	arg_7_0.floorData = nil
	arg_7_0.tileData = nil
	arg_7_0.isTake = false
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0:Abort()
end

return var_0_0

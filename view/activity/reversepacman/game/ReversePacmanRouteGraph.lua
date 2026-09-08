local var_0_0 = class("ReversePacmanRouteGraph")
local var_0_1 = {
	ReversePacmanConst.DIR.UP,
	ReversePacmanConst.DIR.RIGHT,
	ReversePacmanConst.DIR.DOWN,
	ReversePacmanConst.DIR.LEFT
}

local function var_0_2(arg_1_0, arg_1_1)
	return arg_1_0 .. "_" .. arg_1_1
end

local function var_0_3(arg_2_0)
	if arg_2_0 == ReversePacmanConst.DIR.UP then
		return ReversePacmanConst.DIR.DOWN
	end

	if arg_2_0 == ReversePacmanConst.DIR.RIGHT then
		return ReversePacmanConst.DIR.LEFT
	end

	if arg_2_0 == ReversePacmanConst.DIR.DOWN then
		return ReversePacmanConst.DIR.UP
	end

	if arg_2_0 == ReversePacmanConst.DIR.LEFT then
		return ReversePacmanConst.DIR.RIGHT
	end

	return nil
end

function var_0_0.Ctor(arg_3_0)
	arg_3_0.nodes = {}
	arg_3_0.nodeByPos = {}
end

function var_0_0.Build(arg_4_0, arg_4_1)
	arg_4_0.nodes = {}
	arg_4_0.nodeByPos = {}
	arg_4_0.blockedNodeIds = {}
	arg_4_0._distCache = {}
	arg_4_0._distCacheOrder = {}
	arg_4_0.map = arg_4_1
	arg_4_0.grid = arg_4_1.grid or {}
	arg_4_0.width = arg_4_1.width or 0
	arg_4_0.height = arg_4_1.height or 0
	arg_4_0.cellSize = ReversePacmanConst.GRID_SIZE
	arg_4_0.mapSize = {
		x = arg_4_0.width * arg_4_0.cellSize.x,
		y = arg_4_0.height * arg_4_0.cellSize.y
	}

	local var_4_0 = 0

	for iter_4_0 = 1, arg_4_0.height do
		for iter_4_1 = 1, arg_4_0.width do
			local var_4_1 = arg_4_0.grid[iter_4_0] and arg_4_0.grid[iter_4_0][iter_4_1] or ReversePacmanConst.GRID.BLOCK

			if var_4_1 ~= ReversePacmanConst.GRID.BLOCK then
				var_4_0 = var_4_0 + 1

				local var_4_2 = {
					degree = 0,
					id = var_4_0,
					x = iter_4_1,
					y = iter_4_0,
					cell = var_4_1,
					neighbors = {},
					dirs = {},
					pos = arg_4_0:GetLocalPosInMap(iter_4_1, iter_4_0),
					tag = ReversePacmanConst.TAG.ISOLATED
				}

				arg_4_0.nodes[var_4_0] = var_4_2
				arg_4_0.nodeByPos[var_0_2(iter_4_1, iter_4_0)] = var_4_2
			end
		end
	end

	for iter_4_2, iter_4_3 in ipairs(arg_4_0.nodes) do
		arg_4_0:_RebuildNodeAdjacency(iter_4_3)
	end

	return arg_4_0
end

function var_0_0._RebuildNodeAdjacency(arg_5_0, arg_5_1)
	arg_5_1.neighbors = {}
	arg_5_1.dirs = {}

	if not arg_5_0.blockedNodeIds[arg_5_1.id] then
		for iter_5_0, iter_5_1 in ipairs(var_0_1) do
			local var_5_0 = ReversePacmanConst.DIR_VECTORS[iter_5_1]
			local var_5_1 = arg_5_0.nodeByPos[var_0_2(arg_5_1.x + var_5_0.x, arg_5_1.y + var_5_0.y)]

			if var_5_1 and not arg_5_0.blockedNodeIds[var_5_1.id] then
				arg_5_1.neighbors[#arg_5_1.neighbors + 1] = var_5_1.id
				arg_5_1.dirs[var_5_1.id] = iter_5_1
			end
		end
	end

	arg_5_1.degree = #arg_5_1.neighbors
	arg_5_1.tag = arg_5_0:ResolveTag(arg_5_1)
end

function var_0_0._RefreshTopology(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.nodes) do
		arg_6_0:_RebuildNodeAdjacency(iter_6_1)
	end
end

function var_0_0.ResolveTag(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1.degree or 0

	if var_7_0 <= 0 then
		return ReversePacmanConst.TAG.ISOLATED
	end

	if var_7_0 == 1 then
		return ReversePacmanConst.TAG.DEAD_END
	end

	if var_7_0 == 2 then
		local var_7_1 = arg_7_1.neighbors[1]
		local var_7_2 = arg_7_1.neighbors[2]
		local var_7_3 = arg_7_1.dirs[var_7_1]
		local var_7_4 = arg_7_1.dirs[var_7_2]

		if var_7_3 and var_7_4 and var_0_3(var_7_3) == var_7_4 then
			return ReversePacmanConst.TAG.CORRIDOR
		end

		return ReversePacmanConst.TAG.CORNER
	end

	return ReversePacmanConst.TAG.JUNCTION
end

function var_0_0.AddBlockNode(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0:GetNodeByPos(arg_8_1, arg_8_2)

	if var_8_0 then
		arg_8_0.blockedNodeIds[var_8_0.id] = true

		arg_8_0:_RefreshTopology()

		arg_8_0._distCache = {}
		arg_8_0._distCacheOrder = {}
	end
end

function var_0_0.RemoveBlockNode(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0:GetNodeByPos(arg_9_1, arg_9_2)

	if var_9_0 then
		arg_9_0.blockedNodeIds[var_9_0.id] = nil

		arg_9_0:_RefreshTopology()

		arg_9_0._distCache = {}
		arg_9_0._distCacheOrder = {}
	end
end

function var_0_0.IsBuffBlock(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0:GetNodeByPos(arg_10_1, arg_10_2)

	return var_10_0 ~= nil and arg_10_0.blockedNodeIds[var_10_0.id] == true
end

function var_0_0.IsBuffBlockById(arg_11_0, arg_11_1)
	return arg_11_1 ~= nil and arg_11_0.blockedNodeIds[arg_11_1] == true
end

function var_0_0.GetNodeById(arg_12_0, arg_12_1)
	return arg_12_0.nodes[arg_12_1]
end

function var_0_0.GetMapSize(arg_13_0)
	return arg_13_0.mapSize
end

function var_0_0.GetCellSize(arg_14_0)
	return arg_14_0.cellSize
end

function var_0_0.GetNodeByPos(arg_15_0, arg_15_1, arg_15_2)
	return arg_15_0.nodeByPos[var_0_2(arg_15_1, arg_15_2)]
end

function var_0_0.GetNeighbors(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.nodes[arg_16_1]

	if not var_16_0 then
		return {}
	end

	return var_16_0.neighbors
end

function var_0_0.GetDirection(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.nodes[arg_17_1]

	if not var_17_0 then
		return nil
	end

	return var_17_0.dirs[arg_17_2]
end

function var_0_0.GetDistanceField(arg_18_0, arg_18_1)
	arg_18_0._distCache = arg_18_0._distCache or {}
	arg_18_0._distCacheOrder = arg_18_0._distCacheOrder or {}

	local var_18_0 = arg_18_0._distCache[arg_18_1]

	if var_18_0 then
		for iter_18_0, iter_18_1 in ipairs(arg_18_0._distCacheOrder) do
			if iter_18_1 == arg_18_1 then
				table.remove(arg_18_0._distCacheOrder, iter_18_0)

				break
			end
		end

		arg_18_0._distCacheOrder[#arg_18_0._distCacheOrder + 1] = arg_18_1

		return var_18_0
	end

	local var_18_1 = {}

	if not arg_18_0.nodes[arg_18_1] then
		return var_18_1
	end

	var_18_1[arg_18_1] = 0

	local var_18_2 = {
		arg_18_1
	}
	local var_18_3 = 1

	while var_18_2[var_18_3] do
		local var_18_4 = var_18_2[var_18_3]

		var_18_3 = var_18_3 + 1

		local var_18_5 = var_18_1[var_18_4]
		local var_18_6 = arg_18_0.nodes[var_18_4]

		for iter_18_2, iter_18_3 in ipairs(var_18_6.neighbors) do
			if var_18_1[iter_18_3] == nil then
				var_18_1[iter_18_3] = var_18_5 + 1
				var_18_2[#var_18_2 + 1] = iter_18_3
			end
		end
	end

	arg_18_0._distCache[arg_18_1] = var_18_1
	arg_18_0._distCacheOrder[#arg_18_0._distCacheOrder + 1] = arg_18_1

	if 64 < #arg_18_0._distCacheOrder then
		local var_18_7 = table.remove(arg_18_0._distCacheOrder, 1)

		if var_18_7 then
			arg_18_0._distCache[var_18_7] = nil
		end
	end

	return var_18_1
end

function var_0_0.GetDistanceById(arg_19_0, arg_19_1, arg_19_2)
	if not arg_19_1 or not arg_19_2 then
		return nil
	end

	return arg_19_0:GetDistanceField(arg_19_2)[arg_19_1]
end

function var_0_0.IsReachable(arg_20_0, arg_20_1, arg_20_2)
	return arg_20_0:GetDistanceById(arg_20_1, arg_20_2) ~= nil
end

function var_0_0.FindPath(arg_21_0, arg_21_1, arg_21_2)
	if arg_21_1 == arg_21_2 then
		return {
			arg_21_1
		}
	end

	local var_21_0 = arg_21_0.nodes[arg_21_1]
	local var_21_1 = arg_21_0.nodes[arg_21_2]

	if not var_21_0 or not var_21_1 then
		return nil
	end

	local var_21_2 = {
		arg_21_1
	}
	local var_21_3 = 1
	local var_21_4 = {
		[arg_21_1] = true
	}
	local var_21_5 = {}

	while var_21_2[var_21_3] do
		local var_21_6 = var_21_2[var_21_3]

		var_21_3 = var_21_3 + 1

		local var_21_7 = arg_21_0.nodes[var_21_6]

		for iter_21_0, iter_21_1 in ipairs(var_21_7.neighbors) do
			if not var_21_4[iter_21_1] then
				var_21_4[iter_21_1] = true
				var_21_5[iter_21_1] = var_21_6

				if iter_21_1 == arg_21_2 then
					local var_21_8 = 0
					local var_21_9 = arg_21_2

					while var_21_9 do
						var_21_8 = var_21_8 + 1

						if var_21_9 == arg_21_1 then
							break
						end

						var_21_9 = var_21_5[var_21_9]
					end

					local var_21_10 = {}
					local var_21_11 = arg_21_2

					for iter_21_2 = var_21_8, 1, -1 do
						var_21_10[iter_21_2] = var_21_11
						var_21_11 = var_21_5[var_21_11]
					end

					return var_21_10
				end

				var_21_2[#var_21_2 + 1] = iter_21_1
			end
		end
	end

	return nil
end

function var_0_0.GetManhattanDisById(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.nodes[arg_22_1]
	local var_22_1 = arg_22_0.nodes[arg_22_2]

	return arg_22_0:GetManhattanDisByNode(var_22_0, var_22_1)
end

function var_0_0.GetManhattanDisByNode(arg_23_0, arg_23_1, arg_23_2)
	return math.abs(arg_23_1.x - arg_23_2.x) + math.abs(arg_23_1.y - arg_23_2.y)
end

function var_0_0.IsWalkable(arg_24_0, arg_24_1, arg_24_2)
	return arg_24_0:GetNodeByPos(arg_24_1, arg_24_2) ~= nil
end

function var_0_0.GetLocalPosInMap(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = (arg_25_1 - 1) * arg_25_0.cellSize.x - arg_25_0.mapSize.x / 2 + arg_25_0.cellSize.x / 2
	local var_25_1 = arg_25_0.mapSize.y / 2 - (arg_25_2 - 1) * arg_25_0.cellSize.y - arg_25_0.cellSize.y / 2

	return {
		x = var_25_0,
		y = var_25_1
	}
end

function var_0_0.GetNodeIdByLocalPos(arg_26_0, arg_26_1)
	local var_26_0 = math.floor((arg_26_1.x + arg_26_0.mapSize.x / 2) / arg_26_0.cellSize.x) + 1
	local var_26_1 = math.floor((arg_26_0.mapSize.y / 2 - arg_26_1.y) / arg_26_0.cellSize.y) + 1

	if var_26_0 < 1 or var_26_0 > arg_26_0.width or var_26_1 < 1 or var_26_1 > arg_26_0.height then
		return nil
	end

	local var_26_2 = arg_26_0.nodeByPos[var_0_2(var_26_0, var_26_1)]

	return var_26_2 and var_26_2.id or nil
end

function var_0_0.GetCellByLocalPos(arg_27_0, arg_27_1)
	local var_27_0 = math.floor((arg_27_1.x + arg_27_0.mapSize.x / 2) / arg_27_0.cellSize.x) + 1
	local var_27_1 = math.floor((arg_27_0.mapSize.y / 2 - arg_27_1.y) / arg_27_0.cellSize.y) + 1

	if var_27_0 < 1 or var_27_0 > arg_27_0.width or var_27_1 < 1 or var_27_1 > arg_27_0.height then
		return nil
	end

	return {
		x = var_27_0,
		y = var_27_1
	}
end

return var_0_0

local var_0_0 = class("ReversePacmanMapControl")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.binder = arg_1_1
	arg_1_0._tf = arg_1_2
	arg_1_0._tpls = arg_1_0._tf:Find("tpls")
	arg_1_0.container = arg_1_0._tf:Find("map/grids")
	arg_1_0.buffContainer = arg_1_0._tf:Find("map/buffs")
	arg_1_0.routeGraph = ReversePacmanRouteGraph.New()
end

function var_0_0.SetUp(arg_2_0, arg_2_1)
	local var_2_0 = pg.activity_chasing_level[arg_2_1].map_json
	local var_2_1 = require("view.activity.ReversePacman.Maps." .. var_2_0)

	arg_2_0.mapId = var_2_1.id
	arg_2_0.duration = var_2_1.duration
	arg_2_0.skillSlotCount = var_2_1.skillSlotCount
	arg_2_0.ratingThresholds = var_2_1.ratingThresholds
	arg_2_0.width = var_2_1.width
	arg_2_0.height = var_2_1.height
	arg_2_0.grids = var_2_1.grid
	arg_2_0.tags = var_2_1.tags
	arg_2_0.spawnPoints = var_2_1.spawnPoints
	arg_2_0.deployPoints = var_2_1.deployPoints
	arg_2_0.canPickBuffs = {}

	arg_2_0.routeGraph:Build(var_2_1)
	arg_2_0:BuildMapUI()
	arg_2_0:AddListener()
end

function var_0_0.BuildMapUI(arg_3_0, arg_3_1)
	removeAllChildren(arg_3_0.container)

	arg_3_0.gridViews = {}

	setSizeDelta(arg_3_0.container, arg_3_0.routeGraph:GetMapSize())

	for iter_3_0 = 1, arg_3_0.height do
		for iter_3_1 = 1, arg_3_0.width do
			local var_3_0 = arg_3_0:IsWalkable(iter_3_1, iter_3_0) and arg_3_0._tpls:Find("grid_road") or arg_3_0._tpls:Find("grid_block")
			local var_3_1 = cloneTplTo(var_3_0, arg_3_0.container, iter_3_1 .. "_" .. iter_3_0)

			arg_3_0.gridViews[#arg_3_0.gridViews + 1] = var_3_1

			setLocalPosition(var_3_1, arg_3_0:GetLocalPosInMap(iter_3_1, iter_3_0))
		end
	end
end

function var_0_0.AddListener(arg_4_0)
	arg_4_0.binder:bind(ReversePacmanConst.EVENT.CAST, function(arg_5_0, arg_5_1)
		arg_4_0:AddBuffGrid(arg_5_1.buffId, arg_5_1.cell)
	end)
	arg_4_0.binder:bind(ReversePacmanConst.EVENT.PICK, function(arg_6_0, arg_6_1)
		arg_4_0:RemoveBuffGrid(arg_6_1.buff)
	end)
end

function var_0_0.AddBuffGrid(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0._tpls:Find("buff_" .. arg_7_1)
	local var_7_1 = cloneTplTo(var_7_0, arg_7_0.buffContainer, arg_7_2.x .. "_" .. arg_7_2.y)
	local var_7_2 = arg_7_0:GetLocalPosInMap(arg_7_2.x, arg_7_2.y)

	setLocalPosition(var_7_1, var_7_2)

	if arg_7_1 == ReversePacmanConst.BUFF.BLOCK then
		arg_7_0.routeGraph:AddBlockNode(arg_7_2.x, arg_7_2.y)
		arg_7_0.binder:emit(ReversePacmanConst.EVENT.GRAPH_CHANGED, {
			cell = arg_7_2
		})
	else
		table.insert(arg_7_0.canPickBuffs, {
			id = arg_7_1,
			cell = arg_7_2,
			x = var_7_2.x,
			y = var_7_2.y,
			tf = var_7_1
		})
	end
end

function var_0_0.RemoveBuffGrid(arg_8_0, arg_8_1)
	setActive(arg_8_1.tf, false)
	table.removebyvalue(arg_8_0.canPickBuffs, arg_8_1)
end

function var_0_0.GetCanPickBuffs(arg_9_0)
	return arg_9_0.canPickBuffs
end

function var_0_0.GetTag(arg_10_0, arg_10_1, arg_10_2)
	return arg_10_0.tags[arg_10_2] and arg_10_0.tags[arg_10_2][arg_10_1] or ""
end

function var_0_0.IsWalkable(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_0.grids[arg_11_2] and arg_11_0.grids[arg_11_2][arg_11_1] or nil

	return var_11_0 ~= nil and var_11_0 ~= ReversePacmanConst.GRID.BLOCK and not arg_11_0.routeGraph:IsBuffBlock(arg_11_1, arg_11_2)
end

function var_0_0.GetDuration(arg_12_0)
	return arg_12_0.duration
end

function var_0_0.GetSpawnPoints(arg_13_0)
	return arg_13_0.spawnPoints
end

function var_0_0.GetDeployPoints(arg_14_0)
	return arg_14_0.deployPoints
end

function var_0_0.GetRatingThresholds(arg_15_0)
	return arg_15_0.ratingThresholds
end

function var_0_0.GetRouteGraph(arg_16_0)
	return arg_16_0.routeGraph
end

function var_0_0.GetLocalPosInMap(arg_17_0, arg_17_1, arg_17_2)
	return arg_17_0.routeGraph:GetLocalPosInMap(arg_17_1, arg_17_2)
end

function var_0_0.GetNodeIdByPos(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.routeGraph:GetNodeByPos(arg_18_1, arg_18_2)

	return var_18_0 and var_18_0.id or nil
end

function var_0_0.GetNodeIdByLocalPos(arg_19_0, arg_19_1)
	return arg_19_0.routeGraph:GetNodeIdByLocalPos(arg_19_1)
end

function var_0_0.GetCellByLocalPos(arg_20_0, arg_20_1)
	return arg_20_0.routeGraph:GetCellByLocalPos(arg_20_1)
end

function var_0_0.GetCenterCell(arg_21_0)
	return {
		x = math.ceil(arg_21_0.width / 2),
		y = math.ceil(arg_21_0.height / 2)
	}
end

function var_0_0.Update(arg_22_0, arg_22_1)
	return
end

function var_0_0.Dispose(arg_23_0)
	return
end

return var_0_0

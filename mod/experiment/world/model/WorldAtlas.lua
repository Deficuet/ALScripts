local var_0_0 = class("WorldAtlas", import("...BaseEntity"))

var_0_0.Fields = {
	config = "table",
	sairenEntranceList = "table",
	replaceDic = "table",
	achEntranceList = "table",
	costMapDic = "table",
	mapDic = "table",
	nShopGoodsDic = "table",
	transportDic = "table",
	pressingMapList = "table",
	activeEntranceId = "number",
	portEntranceList = "table",
	activeMapId = "number",
	delegatedMapDic = "table",
	taskMarkDic = "table",
	pressingUnlcokCount = "number",
	world = "table",
	markPortDic = "table",
	treasureMarkDic = "table",
	id = "number",
	entranceDic = "table",
	areaEntranceList = "table",
	mapEntrance = "table"
}
var_0_0.EventUpdateProgress = "WorldAtlas.EventUpdateProgress"
var_0_0.EventUpdateActiveEntrance = "WorldAtlas.EventUpdateActiveEntrance"
var_0_0.EventUpdateActiveMap = "WorldAtlas.EventUpdateActiveMap"
var_0_0.EventAddPressingMap = "WorldAtlas.EventAddPressingMap"
var_0_0.EventAddPressingEntrance = "WorldAtlas.EventAddPressingEntrance"
var_0_0.EventUpdatePortMark = "WorldAtlas.EventUpdatePortMark"
var_0_0.EventUpdateNGoodsCount = "WorldAtlas.EventUpdateNGoodsCount"
var_0_0.ScaleShrink = 1
var_0_0.ScaleFull = 2
var_0_0.ScaleExpand = 3
var_0_0.ScaleHalf = 4
var_0_0.Scales = {
	var_0_0.ScaleShrink,
	var_0_0.ScaleHalf,
	var_0_0.ScaleFull
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.id = arg_1_1

	assert(pg.world_expedition_data_by_map[arg_1_0.id], "world_expedition_data_by_map missing: " .. arg_1_0.id)

	arg_1_0.config = pg.world_expedition_data_by_map[arg_1_0.id]

	arg_1_0:BuildEntranceDic()
end

function var_0_0.Build(arg_2_0)
	arg_2_0.entranceDic = {}
	arg_2_0.mapDic = {}
	arg_2_0.taskMarkDic = {}
	arg_2_0.treasureMarkDic = {}
	arg_2_0.sairenEntranceList = {}
	arg_2_0.costMapDic = {}
	arg_2_0.delegatedMapDic = {}
	arg_2_0.pressingMapList = {}
	arg_2_0.transportDic = {}
	arg_2_0.markPortDic = {}
end

function var_0_0.Dispose(arg_3_0)
	WPool:ReturnMap(arg_3_0.entranceDic)
	WPool:ReturnMap(arg_3_0.mapDic)
	arg_3_0:Clear()
end

function var_0_0.NewEntrance(arg_4_0, arg_4_1)
	local var_4_0 = WPool:Get(WorldEntrance)

	var_4_0:Setup(arg_4_1, arg_4_0)

	arg_4_0.entranceDic[arg_4_1] = var_4_0

	return var_4_0
end

function var_0_0.NewMap(arg_5_0, arg_5_1)
	local var_5_0 = WPool:Get(WorldMap)

	var_5_0:Setup(arg_5_1)

	arg_5_0.mapDic[arg_5_1] = var_5_0

	return var_5_0
end

function var_0_0.BuildEntranceDic(arg_6_0)
	local var_6_0 = {
		{
			field = "stage_chapter",
			name = "step"
		},
		{
			field = "task_chapter",
			name = "task"
		},
		{
			field = "teasure_chapter",
			name = "treasure"
		}
	}

	arg_6_0.mapEntrance = {}
	arg_6_0.areaEntranceList = {}
	arg_6_0.portEntranceList = {}
	arg_6_0.achEntranceList = {}
	arg_6_0.replaceDic = {
		step = {},
		task = {},
		treasure = {},
		open = {
			{},
			{}
		}
	}

	_.each(pg.world_chapter_colormask.all, function(arg_7_0)
		local var_7_0 = pg.world_chapter_colormask[arg_7_0]

		if var_7_0.world ~= arg_6_0.id then
			return
		end

		local var_7_1 = arg_6_0:NewEntrance(arg_7_0)
		local var_7_2 = var_7_1:GetAreaId()

		arg_6_0.areaEntranceList[var_7_2] = arg_6_0.areaEntranceList[var_7_2] or {}

		table.insert(arg_6_0.areaEntranceList[var_7_2], arg_7_0)

		if var_7_1:HasPort() then
			local var_7_3 = var_7_1:GetPortId()

			arg_6_0.portEntranceList[var_7_3] = arg_6_0.portEntranceList[var_7_3] or {}

			table.insert(arg_6_0.portEntranceList[var_7_3], arg_7_0)
		end

		for iter_7_0, iter_7_1 in ipairs(var_6_0) do
			for iter_7_2, iter_7_3 in ipairs(var_7_1.config[iter_7_1.field]) do
				if iter_7_1.name == "step" then
					for iter_7_4 = iter_7_3[1], iter_7_3[2] do
						arg_6_0.replaceDic[iter_7_1.name][iter_7_4] = arg_6_0.replaceDic[iter_7_1.name][iter_7_4] or {}
						arg_6_0.replaceDic[iter_7_1.name][iter_7_4][arg_7_0] = var_7_1
					end
				else
					arg_6_0.replaceDic[iter_7_1.name][iter_7_3[1]] = arg_6_0.replaceDic[iter_7_1.name][iter_7_3[1]] or {}
					arg_6_0.replaceDic[iter_7_1.name][iter_7_3[1]][arg_7_0] = var_7_1
				end
			end
		end

		if #var_7_1.config.normal_target > 0 or #var_7_1.config.cryptic_target > 0 then
			table.insert(arg_6_0.achEntranceList, var_7_1)
		end

		local var_7_4 = var_7_0.chapter
		local var_7_5 = arg_6_0:NewMap(var_7_4)

		arg_6_0.mapEntrance[var_7_4] = var_7_1
		arg_6_0.replaceDic.open[1][var_7_5.config.open_stage[1]] = arg_6_0.replaceDic.open[1][var_7_5.config.open_stage[1]] or {}
		arg_6_0.replaceDic.open[1][var_7_5.config.open_stage[1]][arg_7_0] = 1
		arg_6_0.replaceDic.open[2][var_7_5.config.open_stage[2]] = arg_6_0.replaceDic.open[2][var_7_5.config.open_stage[2]] or {}
		arg_6_0.replaceDic.open[2][var_7_5.config.open_stage[2]][arg_7_0] = 1
	end)
end

function var_0_0.GetEntrance(arg_8_0, arg_8_1)
	return arg_8_0.entranceDic[arg_8_1]
end

function var_0_0.SetActiveEntrance(arg_9_0, arg_9_1)
	if arg_9_0.activeEntranceId ~= arg_9_1.id then
		arg_9_0.activeEntranceId = arg_9_1.id

		arg_9_0:DispatchEvent(var_0_0.EventUpdateActiveEntrance, arg_9_1)
	end
end

function var_0_0.GetActiveEntrance(arg_10_0)
	return arg_10_0.activeEntranceId and arg_10_0:GetEntrance(arg_10_0.activeEntranceId)
end

function var_0_0.GetMap(arg_11_0, arg_11_1)
	if not arg_11_0.mapDic[arg_11_1] then
		arg_11_0:NewMap(arg_11_1)
	end

	return arg_11_0.mapDic[arg_11_1]
end

function var_0_0.SetActiveMap(arg_12_0, arg_12_1)
	if arg_12_0.activeMapId ~= arg_12_1.id then
		arg_12_0.activeMapId = arg_12_1.id

		arg_12_0:DispatchEvent(var_0_0.EventUpdateActiveMap, arg_12_1)
	end
end

function var_0_0.GetActiveMap(arg_13_0)
	return arg_13_0.activeMapId and arg_13_0:GetMap(arg_13_0.activeMapId)
end

function var_0_0.GetDiscoverRate(arg_14_0)
	return 0
end

function var_0_0.CheckMapActive(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:GetMap(arg_15_1)

	assert(var_15_0, "map not exist: " .. arg_15_1)

	return var_15_0.active or _.any(_.values(arg_15_0:GetPartMaps(arg_15_1)), function(arg_16_0)
		return arg_16_0.active
	end)
end

function var_0_0.GetAtlasPixelSize(arg_17_0)
	return Vector2(arg_17_0.config.size[1], arg_17_0.config.size[2])
end

function var_0_0.GetAchEntranceList(arg_18_0)
	return arg_18_0.achEntranceList
end

function var_0_0.GetOpenEntranceDic(arg_19_0, arg_19_1)
	return arg_19_0.replaceDic.open[nowWorld():GetRealm()][arg_19_1] or {}
end

function var_0_0.GetStepDic(arg_20_0, arg_20_1)
	return arg_20_0.replaceDic.step[arg_20_1] or {}
end

function var_0_0.GetTaskDic(arg_21_0, arg_21_1)
	return arg_21_0.replaceDic.task[arg_21_1] or {}
end

function var_0_0.GetTreasureDic(arg_22_0, arg_22_1)
	return arg_22_0.replaceDic.treasure[arg_22_1] or {}
end

function var_0_0.UpdateProgress(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {}

	for iter_23_0 = arg_23_1 + 1, arg_23_2 do
		for iter_23_1 in pairs(arg_23_0:GetOpenEntranceDic(iter_23_0)) do
			var_23_0[iter_23_1] = 1
		end
	end

	arg_23_0:DispatchEvent(var_0_0.EventUpdateProgress, var_23_0)

	local var_23_1 = {}

	for iter_23_2 in pairs(arg_23_0:GetStepDic(arg_23_2)) do
		var_23_1[iter_23_2] = 1
	end

	for iter_23_3 in pairs(arg_23_0:GetStepDic(arg_23_1)) do
		var_23_1[iter_23_3] = (var_23_1[iter_23_3] or 0) - 1
	end

	for iter_23_4, iter_23_5 in pairs(var_23_1) do
		if iter_23_5 ~= 0 then
			arg_23_0.entranceDic[iter_23_4]:UpdateDisplayMarks("step", iter_23_5 > 0)
		end
	end
end

function var_0_0.UpdateTask(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:isAlive()
	local var_24_1 = (var_24_0 and 1 or 0) - (arg_24_0.taskMarkDic[arg_24_1.id] and 1 or 0)

	arg_24_0.taskMarkDic[arg_24_1.id] = var_24_0

	if var_24_1 == 0 then
		return
	end

	local var_24_2 = false

	for iter_24_0 in pairs(arg_24_0:GetTaskDic(arg_24_1.id)) do
		var_24_2 = true

		if arg_24_1.config.type == 0 then
			arg_24_0.entranceDic[iter_24_0]:UpdateDisplayMarks("task_main", var_24_1 > 0)
		elseif arg_24_1.config.type == 6 then
			arg_24_0.entranceDic[iter_24_0]:UpdateDisplayMarks("task_collecktion", var_24_1 > 0)
		else
			arg_24_0.entranceDic[iter_24_0]:UpdateDisplayMarks("task", var_24_1 > 0)
		end
	end

	local var_24_3 = arg_24_1:GetFollowingEntrance()

	if var_24_3 and not var_24_2 then
		if arg_24_1.config.type == 0 then
			arg_24_0.entranceDic[var_24_3]:UpdateDisplayMarks("task_following_main", var_24_1 > 0)
		elseif arg_24_1.config.type == 7 then
			arg_24_0.entranceDic[var_24_3]:UpdateDisplayMarks("task_following_boss", var_24_1 > 0)
		else
			arg_24_0.entranceDic[var_24_3]:UpdateDisplayMarks("task_following", var_24_1 > 0)
		end
	end
end

function var_0_0.UpdateTreasure(arg_25_0, arg_25_1)
	local var_25_0 = nowWorld()
	local var_25_1 = var_25_0:GetInventoryProxy():GetItemCount(arg_25_1)
	local var_25_2 = (var_25_1 > 0 and 1 or 0) - (arg_25_0.treasureMarkDic[arg_25_1] and 1 or 0)

	arg_25_0.treasureMarkDic[arg_25_1] = var_25_1 > 0

	if var_25_2 ~= 0 then
		local var_25_3 = var_25_0:FindTreasureEntrance(arg_25_1)

		if pg.world_item_data_template[arg_25_1].usage_arg[1] == 1 then
			var_25_3:UpdateDisplayMarks("treasure_sairen", var_25_2 > 0)
		else
			var_25_3:UpdateDisplayMarks("treasure", var_25_2 > 0)
		end
	end
end

function var_0_0.SetDelegatedMarkList(arg_26_0, arg_26_1)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.delegatedMapDic) do
		arg_26_0:GetMap(iter_26_0):UpdateDeteagtedMark(false)
	end

	arg_26_0.delegatedMapDic = {}

	for iter_26_2, iter_26_3 in ipairs(arg_26_1) do
		arg_26_0.delegatedMapDic[iter_26_3] = true

		arg_26_0:GetMap(iter_26_3):UpdateDeteagtedMark(true)
	end
end

function var_0_0.SetPressingMarkList(arg_27_0, arg_27_1)
	_.each(arg_27_0.pressingMapList, function(arg_28_0)
		arg_27_0:GetMap(arg_28_0):UpdatePressingMark(false)
	end)

	local var_27_0 = 0

	arg_27_0.pressingMapList = arg_27_1

	_.each(arg_27_0.pressingMapList, function(arg_29_0)
		arg_27_0:GetMap(arg_29_0):UpdatePressingMark(true)

		local var_29_0 = arg_27_0.mapEntrance[arg_29_0]

		if var_29_0 and not var_29_0:HasPort() then
			var_27_0 = var_27_0 + 1
		end
	end)

	arg_27_0.pressingUnlcokCount = var_27_0

	arg_27_0:BuildTransportDic()
end

function var_0_0.BuildTransportDic(arg_30_0)
	arg_30_0.transportDic = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0.entranceDic) do
		if iter_30_1:IsPressing() then
			arg_30_0.transportDic[iter_30_0] = true

			for iter_30_2 in pairs(iter_30_1.transportDic) do
				arg_30_0.transportDic[iter_30_2] = true
			end
		end
	end

	if nowWorld():IsReseted() then
		arg_30_0:AddPortTransportDic()
	end
end

function var_0_0.AddPortTransportDic(arg_31_0)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.portEntranceList) do
		for iter_31_2, iter_31_3 in ipairs(iter_31_1) do
			arg_31_0.transportDic[iter_31_3] = true
		end
	end
end

function var_0_0.MarkMapTransport(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.mapEntrance[arg_32_1]

	if var_32_0 then
		arg_32_0.transportDic[var_32_0.id] = true
	end
end

function var_0_0.AddDelegatedMap(arg_33_0, arg_33_1)
	assert(not arg_33_0.delegatedMapDic[arg_33_1], "already delegated map: " .. arg_33_1)

	arg_33_0.delegatedMapDic[arg_33_1] = true
	arg_33_0.costMapDic[arg_33_1] = true

	local var_33_0 = arg_33_0:GetMap(arg_33_1)

	var_33_0:UpdateDeteagtedMark(true)

	var_33_0.isCost = true

	arg_33_0:AddPressingMap(arg_33_1)
end

function var_0_0.AddPressingMap(arg_34_0, arg_34_1)
	if _.any(arg_34_0.pressingMapList, function(arg_35_0)
		return arg_35_0 == arg_34_1
	end) then
		return
	else
		arg_34_0:GetMap(arg_34_1):UpdatePressingMark(true)
		table.insert(arg_34_0.pressingMapList, arg_34_1)

		local var_34_0 = arg_34_0.mapEntrance[arg_34_1]

		if var_34_0 then
			local var_34_1 = {}

			arg_34_0.transportDic[var_34_0.id] = true
			var_34_1[var_34_0.id] = true

			for iter_34_0 in pairs(var_34_0.transportDic) do
				if not arg_34_0.transportDic[iter_34_0] then
					arg_34_0.transportDic[iter_34_0] = true
					var_34_1[iter_34_0] = true
				end
			end

			arg_34_0:DispatchEvent(var_0_0.EventAddPressingEntrance, var_34_1)

			if not var_34_0:HasPort() then
				arg_34_0.pressingUnlcokCount = arg_34_0.pressingUnlcokCount + 1

				arg_34_0:UpdateUnlockCountPortMark()
			end
		end

		arg_34_0:DispatchEvent(var_0_0.EventAddPressingMap, arg_34_1)
	end
end

function var_0_0.GetPressingUnlockCount(arg_36_0)
	return arg_36_0.pressingUnlcokCount
end

function var_0_0.GetPressingUnlockRecordCount(arg_37_0, arg_37_1)
	local var_37_0 = getProxy(PlayerProxy):getRawData().id
	local var_37_1 = nowWorld().activateCount

	return PlayerPrefs.GetInt(string.format("world_new_shop_unlock_count_in_port_%d_%d_%d", var_37_0, var_37_1, arg_37_1), -1)
end

function var_0_0.SetPressingUnlockRecordCount(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = getProxy(PlayerProxy):getRawData().id
	local var_38_1 = nowWorld().activateCount

	return PlayerPrefs.SetInt(string.format("world_new_shop_unlock_count_in_port_%d_%d_%d", var_38_0, var_38_1, arg_38_1), arg_38_2)
end

function var_0_0.SetSairenEntranceList(arg_39_0, arg_39_1)
	_.each(arg_39_0.sairenEntranceList, function(arg_40_0)
		local var_40_0 = arg_39_0:GetEntrance(arg_40_0)

		var_40_0:UpdateSairenMark(false)
		var_40_0:UpdateDisplayMarks("sairen", false)
	end)

	arg_39_0.sairenEntranceList = arg_39_1

	_.each(arg_39_0.sairenEntranceList, function(arg_41_0)
		local var_41_0 = arg_39_0:GetEntrance(arg_41_0)

		var_41_0:UpdateSairenMark(true)
		var_41_0:UpdateDisplayMarks("sairen", true)
	end)
end

function var_0_0.RemoveSairenEntrance(arg_42_0, arg_42_1)
	local var_42_0 = table.indexof(arg_42_0.sairenEntranceList, arg_42_1.id)

	if var_42_0 then
		table.remove(arg_42_0.sairenEntranceList, var_42_0)
		arg_42_1:UpdateSairenMark(false)
		arg_42_1:UpdateDisplayMarks("sairen", false)
	end
end

function var_0_0.SetCostMapList(arg_43_0, arg_43_1)
	for iter_43_0, iter_43_1 in pairs(arg_43_0.costMapDic) do
		arg_43_0:GetMap(iter_43_0).isCost = false
	end

	arg_43_0.costMapDic = {}

	_.each(arg_43_1, function(arg_44_0)
		arg_43_0.costMapDic[arg_44_0.random_id] = true
		arg_43_0:GetMap(arg_44_0.random_id).isCost = true
	end)
end

function var_0_0.UpdateCostMap(arg_45_0, arg_45_1, arg_45_2)
	if not arg_45_0.costMapDic[arg_45_1] and arg_45_2 then
		nowWorld():ClearAllFleetDefeatEnemies()
	end

	arg_45_0.costMapDic[arg_45_1] = arg_45_2
end

function var_0_0.SetPortMarkList(arg_46_0, arg_46_1, arg_46_2)
	arg_46_0.markPortDic.goods = {}

	for iter_46_0, iter_46_1 in ipairs(arg_46_1) do
		arg_46_0.markPortDic.goods[iter_46_1] = true
	end

	arg_46_0.markPortDic.new = {}

	for iter_46_2, iter_46_3 in ipairs(arg_46_2) do
		arg_46_0.markPortDic.new[iter_46_3] = true
	end
end

function var_0_0.UpdatePortMark(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	if not arg_47_0.portEntranceList[arg_47_1] then
		return
	end

	local var_47_0

	if arg_47_2 ~= nil and tobool(arg_47_0.markPortDic.goods[arg_47_1]) ~= arg_47_2 then
		arg_47_0.markPortDic.goods[arg_47_1] = arg_47_2
		var_47_0 = var_47_0 or {}

		for iter_47_0, iter_47_1 in ipairs(arg_47_0.portEntranceList[arg_47_1]) do
			var_47_0[iter_47_1] = true
		end
	end

	if arg_47_3 ~= nil and tobool(arg_47_0.markPortDic.new[arg_47_1]) ~= arg_47_3 then
		arg_47_0.markPortDic.new[arg_47_1] = arg_47_3
		var_47_0 = var_47_0 or {}

		for iter_47_2, iter_47_3 in ipairs(arg_47_0.portEntranceList[arg_47_1]) do
			var_47_0[iter_47_3] = true
		end
	end

	if var_47_0 and not nowWorld():UsePortNShop() then
		arg_47_0:DispatchEvent(var_0_0.EventUpdatePortMark, var_47_0)
	end
end

function var_0_0.InitPortMarkNShopList(arg_48_0)
	local var_48_0 = arg_48_0:GetPressingUnlockCount()

	arg_48_0.markPortDic.newGoods = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.nShopGoodsDic) do
		local var_48_1 = Goods.Create({
			id = iter_48_0,
			count = iter_48_1
		}, Goods.TYPE_WORLD_NSHOP)
		local var_48_2 = var_48_1:getConfig("port_id")
		local var_48_3 = var_48_1:getConfig("unlock_num")
		local var_48_4 = arg_48_0:GetPressingUnlockRecordCount(var_48_2)

		if var_48_1:canPurchase() and var_48_4 < var_48_3 and var_48_3 <= var_48_0 then
			arg_48_0.markPortDic.newGoods[var_48_2] = true
		end
	end
end

function var_0_0.UpdateUnlockCountPortMark(arg_49_0)
	if not nowWorld():UsePortNShop() then
		return
	end

	local var_49_0 = arg_49_0.markPortDic.newGoods

	arg_49_0:InitPortMarkNShopList()

	for iter_49_0, iter_49_1 in ipairs(underscore.keys(arg_49_0.portEntranceList)) do
		if tobool(var_49_0[iter_49_1]) ~= tobool(arg_49_0.markPortDic.newGoods[iter_49_1]) then
			local var_49_1 = {}

			for iter_49_2, iter_49_3 in ipairs(arg_49_0.portEntranceList[iter_49_1]) do
				var_49_1[iter_49_3] = true
			end
		end
	end

	if changeDic then
		arg_49_0:DispatchEvent(var_0_0.EventUpdatePortMark, changeDic)
	end
end

function var_0_0.UpdatePortMarkNShop(arg_50_0, arg_50_1, arg_50_2)
	if not arg_50_0.portEntranceList[arg_50_1] then
		return
	end

	if tobool(arg_50_0.markPortDic.newGoods[arg_50_1]) ~= arg_50_2 then
		arg_50_0.markPortDic.newGoods[arg_50_1] = arg_50_2

		if nowWorld():UsePortNShop() then
			local var_50_0 = {}

			for iter_50_0, iter_50_1 in ipairs(arg_50_0.portEntranceList[arg_50_1]) do
				var_50_0[iter_50_1] = true
			end

			arg_50_0:DispatchEvent(var_0_0.EventUpdatePortMark, var_50_0)
		end
	end
end

function var_0_0.GetAnyPortMarkNShop(arg_51_0)
	for iter_51_0, iter_51_1 in pairs(arg_51_0.markPortDic.newGoods) do
		if iter_51_1 then
			return true
		end
	end

	return false
end

function var_0_0.InitWorldNShopGoods(arg_52_0, arg_52_1)
	arg_52_0.nShopGoodsDic = {}

	for iter_52_0, iter_52_1 in ipairs(pg.world_newshop_data.all) do
		arg_52_0.nShopGoodsDic[iter_52_1] = 0
	end

	for iter_52_2, iter_52_3 in ipairs(arg_52_1) do
		assert(arg_52_0.nShopGoodsDic[iter_52_3.goods_id], "without this good in id " .. iter_52_3.goods_id)

		arg_52_0.nShopGoodsDic[iter_52_3.goods_id] = arg_52_0.nShopGoodsDic[iter_52_3.goods_id] + iter_52_3.count
	end
end

function var_0_0.UpdateNShopGoodsCount(arg_53_0, arg_53_1, arg_53_2)
	assert(arg_53_0.nShopGoodsDic[arg_53_1], "without this goods:" .. arg_53_1)

	if arg_53_2 ~= 0 then
		arg_53_0.nShopGoodsDic[arg_53_1] = arg_53_0.nShopGoodsDic[arg_53_1] + arg_53_2

		arg_53_0:DispatchEvent(var_0_0.EventUpdateNGoodsCount, arg_53_1, arg_53_0.nShopGoodsDic[arg_53_1])
	end
end

function var_0_0.GetEntrancePortInfo(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0:GetEntrance(arg_54_1)
	local var_54_1 = var_54_0:GetPortId()

	if nowWorld():UsePortNShop() then
		return arg_54_0.transportDic[var_54_0.id], arg_54_0.markPortDic.newGoods[var_54_1], arg_54_0.markPortDic.newGoods[var_54_1]
	else
		return arg_54_0.transportDic[var_54_0.id], arg_54_0.markPortDic.goods[var_54_1], arg_54_0.markPortDic.new[var_54_1]
	end
end

return var_0_0

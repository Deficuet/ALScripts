local var_0_0 = class("IslandCollectSlot", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:InitCfgData()

	arg_1_0.placeId = arg_1_1

	arg_1_0:UpdateData(arg_1_2)
end

function var_0_0.InitCfgData(arg_2_0)
	arg_2_0.cfgMap = {}

	for iter_2_0, iter_2_1 in ipairs(pg.island_production_mining.all) do
		local var_2_0 = pg.island_production_mining[iter_2_1]

		if not arg_2_0.cfgMap[var_2_0.slotId] then
			arg_2_0.cfgMap[var_2_0.slotId] = var_2_0.objId
		end
	end
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.island_production_slot
end

function var_0_0.UpdateData(arg_4_0, arg_4_1)
	arg_4_0.configId = arg_4_1.id
	arg_4_0.pos = arg_4_1.pos
	arg_4_0.get_num = arg_4_1.get_num
	arg_4_0.refresh_time = arg_4_1.refresh_time

	local var_4_0 = pg.island_set.mining_recovery_time.key_value_varchar
	local var_4_1 = pg.island_set.mission_gather_point.key_value_varchar

	arg_4_0.type = 1

	for iter_4_0, iter_4_1 in ipairs(var_4_1) do
		if arg_4_0.configId == iter_4_1[1] then
			arg_4_0.type = 2
			arg_4_0.pos = iter_4_1[2]
		end
	end

	if arg_4_0.type == 1 then
		for iter_4_2, iter_4_3 in ipairs(var_4_0) do
			if iter_4_3[1] == arg_4_0.configId then
				arg_4_0.cd = iter_4_3[2]
				arg_4_0.maxTimes = iter_4_3[3]
			end
		end
	end
end

function var_0_0.UpdateCollectData(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = getProxy(IslandProxy):GetIsland()

	if arg_5_2 == 2 then
		var_5_0:DispatchEvent(IslandBuildingAgency.SLOT_UNIT_REMOVE, {
			unitId = arg_5_0.pos
		})

		return
	end

	if arg_5_0.placeId == 401 and arg_5_1.pos ~= arg_5_0.pos then
		var_5_0:DispatchEvent(IslandBuildingAgency.SLOT_UNIT_REMOVE, {
			unitId = arg_5_0.pos
		})

		arg_5_0.needTimeToLoadModel = true
	end

	arg_5_0:UpdateData(arg_5_1)
end

function var_0_0.StartColloct(arg_6_0)
	pg.m02:sendNotification(GAME.ISLAND_START_COLLECT, {
		build_id = arg_6_0.placeId,
		area_id = arg_6_0.configId
	})
end

function var_0_0.GetCanCollectTime(arg_7_0)
	if arg_7_0.type == 2 then
		return 1
	end

	local var_7_0 = math.floor((pg.TimeMgr.GetInstance():GetServerTime() - arg_7_0.refresh_time) / arg_7_0.cd)

	return math.min(arg_7_0.maxTimes, var_7_0 - arg_7_0.get_num + arg_7_0.maxTimes)
end

function var_0_0.GetCollectMaxTime(arg_8_0)
	if arg_8_0.type == 2 then
		return 1
	end

	return arg_8_0.maxTimes
end

function var_0_0.UpdatePerSecond(arg_9_0)
	if not arg_9_0.needTimeToLoadModel then
		return
	end

	if arg_9_0:GetCanCollectTime() >= 1 then
		local var_9_0 = getProxy(IslandProxy):GetIsland()
		local var_9_1 = arg_9_0.placeId == 401 and arg_9_0.pos or arg_9_0.cfgMap[arg_9_0.configId]
		local var_9_2 = pg.island_production_slot[arg_9_0.configId].formula[1]
		local var_9_3 = pg.island_formula[var_9_2].unitid[1][2]

		var_9_0:DispatchEvent(IslandBuildingAgency.SlOT_UNIT_INIT, {
			build_id = arg_9_0.placeId,
			unitId = var_9_1,
			modelId = var_9_3,
			unitType = IslandConst.UNIT_TYPE_ITEM_HANDLE_COLLECT,
			fammulaId = var_9_2,
			slotId = arg_9_0.configId
		})

		arg_9_0.needTimeToLoadModel = false
	end
end

function var_0_0.SetNeedLoadModel(arg_10_0)
	arg_10_0.needTimeToLoadModel = true
end

return var_0_0

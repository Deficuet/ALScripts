local var_0_0 = class("IslandCollectSlotPlace", import("model.vo.BaseVO"))

var_0_0.slotType = {
	Normal = 1,
	Task = 2
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.placeId = arg_1_1
	arg_1_0.get_num = arg_1_2.get_num
	arg_1_0.refresh_time = arg_1_2.refresh_time
	arg_1_0.recoverQueue = {}
	arg_1_0.collectionSlotData = {}

	local var_1_0 = pg.island_set.mission_gather_point.key_value_varchar

	arg_1_0.taskPointDic = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		arg_1_0.taskPointDic[iter_1_1[1]] = true
	end

	for iter_1_2, iter_1_3 in ipairs(arg_1_2.collect_list or {}) do
		local var_1_1 = arg_1_0.taskPointDic[iter_1_3.id] and 2 or 1

		if var_1_1 == var_0_0.slotType.Normal then
			table.insert(arg_1_0.recoverQueue, iter_1_3.id)
		end

		arg_1_0.collectionSlotData[iter_1_3.id] = IslandCollectSlotNew.New(arg_1_0, iter_1_3, var_1_1)
	end

	local var_1_2 = pg.island_set.collection_point_recovery_time.key_value_varchar

	for iter_1_4, iter_1_5 in ipairs(var_1_2) do
		if iter_1_5[1] == arg_1_0.placeId then
			arg_1_0.cd = iter_1_5[2]
		end
	end
end

function var_0_0.GetCollectSlotDatasDic(arg_2_0)
	return arg_2_0.collectionSlotData
end

function var_0_0.GetRecoverQueue(arg_3_0)
	return arg_3_0.recoverQueue
end

function var_0_0.GetRecoverTime(arg_4_0)
	return (math.floor(math.max(pg.TimeMgr.GetInstance():GetServerTime() - arg_4_0.refresh_time, 0) / arg_4_0:GetRecoverCD()))
end

function var_0_0.GetCanCollectTime(arg_5_0)
	local var_5_0 = arg_5_0:GetRecoverTime()

	return math.min(#arg_5_0.recoverQueue, var_5_0 - arg_5_0.get_num + #arg_5_0.recoverQueue)
end

function var_0_0.GetInRecoverTimeBySlotId(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.recoverQueue) do
		if iter_6_1 == arg_6_1 then
			return iter_6_0
		end
	end
end

function var_0_0.GetNextRecoverTimes(arg_7_0, arg_7_1)
	return arg_7_0.refresh_time + (arg_7_0:GetRecoverTime() + arg_7_1) * arg_7_0:GetRecoverCD()
end

function var_0_0.GetRecoverCD(arg_8_0)
	return arg_8_0.cd
end

function var_0_0.UpdateCollectRefreshtTime(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_1 ~= arg_9_0.refresh_time then
		arg_9_0.get_num = 1
	elseif arg_9_2 == var_0_0.slotType.Normal then
		arg_9_0.get_num = arg_9_0.get_num + 1
	end

	arg_9_0.refresh_time = arg_9_1
end

function var_0_0.UpdateCollectDataBySlotId(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1.id
	local var_10_1 = arg_10_0.collectionSlotData[var_10_0]

	if not var_10_1 then
		return
	end

	if arg_10_2 == var_0_0.slotType.Task then
		var_10_1:UpdateCollectData(arg_10_1, arg_10_2)

		arg_10_0.collectionSlotData[var_10_0] = nil
	else
		arg_10_0:RefreshRecoverQueue(var_10_0)
		var_10_1:UpdateCollectData(arg_10_1, arg_10_2)
	end
end

function var_0_0.RefreshRecoverQueue(arg_11_0, arg_11_1)
	local var_11_0 = -1

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.recoverQueue) do
		if iter_11_1 == arg_11_1 then
			var_11_0 = iter_11_0
		end
	end

	if var_11_0 ~= -1 then
		table.remove(arg_11_0.recoverQueue, var_11_0)
	end

	table.insert(arg_11_0.recoverQueue, arg_11_1)
end

function var_0_0.GetCollectSlotData(arg_12_0, arg_12_1)
	return arg_12_0.collectionSlotData[arg_12_1]
end

function var_0_0.InitHandSlotData(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1.id

	if arg_13_0.collectionSlotData[var_13_0] then
		warning("已经存在当前槽位的信息了")

		return
	end

	local var_13_1 = arg_13_0.taskPointDic[var_13_0] and var_0_0.slotType.Task or var_0_0.slotType.Normal

	if var_13_1 == var_0_0.slotType.Normal then
		table.insert(arg_13_0.recoverQueue, 1, var_13_0)
	end

	local var_13_2 = IslandCollectSlotNew.New(arg_13_0.configId, arg_13_1, var_13_1)

	arg_13_0.collectionSlotData[arg_13_1.id] = var_13_2

	getProxy(IslandProxy):GetIsland():DispatchEvent(IslandBuildingAgency.COLLECT_SlOT_UNIT_INIT, {
		slotId = arg_13_1.id
	})
end

return var_0_0

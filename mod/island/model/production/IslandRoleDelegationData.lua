local var_0_0 = class("IslandRoleDelegationData")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0:UpdateData(arg_1_1)
end

function var_0_0.UpdateData(arg_2_0, arg_2_1)
	arg_2_0.ship_id = arg_2_1.ship_id
	arg_2_0.max_times = arg_2_1.max_times
	arg_2_0.get_times = arg_2_1.get_times
	arg_2_0.formula_id = arg_2_1.formula_id
	arg_2_0.start_time = arg_2_1.start_time

	arg_2_0:SetCostList(arg_2_1.cost_time_list)

	arg_2_0.once_cost_power = arg_2_1.once_cost_power
	arg_2_0.speed_time = arg_2_1.speed_time or 0

	arg_2_0:SetIsSend(false)
end

function var_0_0.ResetGetTimes(arg_3_0, arg_3_1)
	arg_3_0.get_times = arg_3_0.get_times + arg_3_1
end

function var_0_0.AddCostList(arg_4_0, arg_4_1)
	local var_4_0 = #arg_4_0.cost_time_list
	local var_4_1 = var_4_0 == 0 and 0 or arg_4_0.cost_time_list[var_4_0]
	local var_4_2 = 0

	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		table.insert(arg_4_0.cost_time_list, iter_4_1)

		arg_4_0.cost_Alltime_list[var_4_0 + iter_4_0] = iter_4_1 + var_4_1 + var_4_2
		var_4_2 = iter_4_1 + var_4_2
	end

	arg_4_0.end_time = arg_4_0.end_time + var_4_2
	arg_4_0.allTime = arg_4_0.allTime + var_4_2
end

function var_0_0.SetCostList(arg_5_0, arg_5_1)
	arg_5_0.cost_time_list = arg_5_1
	arg_5_0.cost_Alltime_list = {}

	local var_5_0 = 0

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.cost_time_list) do
		arg_5_0.cost_Alltime_list[iter_5_0] = iter_5_1 + var_5_0
		var_5_0 = var_5_0 + iter_5_1
	end

	arg_5_0.end_time = arg_5_0.start_time

	for iter_5_2, iter_5_3 in ipairs(arg_5_0.cost_time_list) do
		arg_5_0.end_time = arg_5_0.end_time + iter_5_3
	end

	arg_5_0.allTime = arg_5_0.end_time - arg_5_0.start_time
end

function var_0_0.AddSpeedTime(arg_6_0, arg_6_1)
	arg_6_0.speed_time = arg_6_0.speed_time + arg_6_1
end

function var_0_0.isEnd(arg_7_0)
	return arg_7_0.end_time > 0 and pg.TimeMgr.GetInstance():GetServerTime() >= arg_7_0.end_time + 1
end

function var_0_0.GetFinishTime(arg_8_0)
	return arg_8_0.end_time
end

function var_0_0.GetAllTime(arg_9_0)
	return arg_9_0.allTime
end

function var_0_0.isSend(arg_10_0)
	return arg_10_0.issend
end

function var_0_0.SetIsSend(arg_11_0, arg_11_1)
	arg_11_0.issend = arg_11_1
end

function var_0_0.InCurrentTime(arg_12_0)
	local var_12_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_12_0.start_time

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.cost_Alltime_list) do
		if var_12_0 <= iter_12_1 then
			return iter_12_0
		end
	end

	return #arg_12_0.cost_Alltime_list
end

function var_0_0.GetCountByTimestamp(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1 - arg_13_0.start_time

	for iter_13_0 = #arg_13_0.cost_Alltime_list, 1, -1 do
		if var_13_0 >= arg_13_0.cost_Alltime_list[iter_13_0] then
			return iter_13_0
		end
	end

	return 0
end

function var_0_0.InCurrentTimeStart(arg_14_0, arg_14_1)
	local var_14_0 = 0
	local var_14_1 = arg_14_1 - 1

	for iter_14_0 = 1, var_14_1 do
		var_14_0 = var_14_0 + arg_14_0.cost_time_list[iter_14_0]
	end

	return var_14_0 + arg_14_0.start_time
end

function var_0_0.CurrentTimeNeed(arg_15_0, arg_15_1)
	return arg_15_0.cost_time_list[arg_15_1]
end

function var_0_0.CheckDelegationIsEnd(arg_16_0)
	if not arg_16_0:isSend() and arg_16_0:isEnd() then
		return true
	end
end

function var_0_0.CanRewardTimes(arg_17_0)
	return arg_17_0:InCurrentTime() - 1 - arg_17_0.get_times
end

function var_0_0.LastTimes(arg_18_0)
	return #arg_18_0.cost_time_list - (arg_18_0:InCurrentTime() - 1)
end

return var_0_0

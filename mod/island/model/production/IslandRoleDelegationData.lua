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
	arg_2_0.cost_time_list = arg_2_1.cost_time_list
	arg_2_0.end_time = arg_2_0.start_time

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.cost_time_list) do
		arg_2_0.end_time = arg_2_0.end_time + iter_2_1
	end

	arg_2_0.cost_Alltime_list = {}

	local var_2_0 = 0

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.cost_time_list) do
		arg_2_0.cost_Alltime_list[iter_2_2] = iter_2_3 + var_2_0
		var_2_0 = var_2_0 + iter_2_3
	end

	arg_2_0.once_cost_power = arg_2_1.once_cost_power
	arg_2_0.item_times = arg_2_1.item_times or 0
	arg_2_0.allTime = arg_2_0.end_time - arg_2_0.start_time

	arg_2_0:SetIsSend(false)
end

function var_0_0.ResetGetTimes(arg_3_0, arg_3_1)
	arg_3_0.get_times = arg_3_0.get_times + arg_3_1
end

function var_0_0.ResetItem_times(arg_4_0, arg_4_1)
	arg_4_0.item_times = arg_4_1
end

function var_0_0.isEnd(arg_5_0)
	return arg_5_0.end_time > 0 and pg.TimeMgr.GetInstance():GetServerTime() + arg_5_0.item_times >= arg_5_0.end_time + 1
end

function var_0_0.GetFinishTime(arg_6_0)
	return arg_6_0.end_time - arg_6_0.item_times
end

function var_0_0.GetAllTime(arg_7_0)
	return arg_7_0.allTime
end

function var_0_0.isSend(arg_8_0)
	return arg_8_0.issend
end

function var_0_0.SetIsSend(arg_9_0, arg_9_1)
	arg_9_0.issend = arg_9_1
end

function var_0_0.InCurrentTime(arg_10_0)
	local var_10_0 = pg.TimeMgr.GetInstance():GetServerTime() + arg_10_0.item_times - arg_10_0.start_time

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.cost_Alltime_list) do
		if var_10_0 <= iter_10_1 then
			return iter_10_0
		end
	end

	return #arg_10_0.cost_Alltime_list
end

function var_0_0.InCurrentTimeStart(arg_11_0, arg_11_1)
	local var_11_0 = 0
	local var_11_1 = arg_11_1 - 1

	for iter_11_0 = 1, var_11_1 do
		var_11_0 = var_11_0 + arg_11_0.cost_time_list[iter_11_0]
	end

	return var_11_0 + arg_11_0.start_time
end

function var_0_0.CurrentTimeNeed(arg_12_0, arg_12_1)
	return arg_12_0.cost_time_list[arg_12_1]
end

function var_0_0.CheckDelegationIsEnd(arg_13_0)
	if not arg_13_0:isSend() and arg_13_0:isEnd() then
		return true
	end
end

function var_0_0.CanRewardTimes(arg_14_0)
	return arg_14_0:InCurrentTime() - 1 - arg_14_0.get_times
end

return var_0_0

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

	arg_2_0.extraList = arg_2_1.times_extra or {}
	arg_2_0.once_cost_power = arg_2_1.once_cost_power
	arg_2_0.speed_time = arg_2_1.speed_time or 0

	arg_2_0:SetIsSend(false)
end

function var_0_0.ResetGetTimes(arg_3_0, arg_3_1)
	arg_3_0.get_times = arg_3_0.get_times + arg_3_1
end

function var_0_0.AddExtraList(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		table.insert(arg_4_0.extraList, iter_4_1)
	end
end

function var_0_0.GetExtraMainProduct(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.extraList) do
		if iter_5_1.num == arg_5_1 then
			return iter_5_1.main_extra
		end
	end

	return 0
end

function var_0_0.GetExtraExtraProduct(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.extraList) do
		if iter_6_1.num == arg_6_1 then
			return iter_6_1.other_extra
		end
	end

	return 0
end

function var_0_0.GetExtraExtraCost(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.extraList) do
		if iter_7_1.num == arg_7_1 then
			return iter_7_1.cost_extra
		end
	end

	return 0
end

function var_0_0.AddCostList(arg_8_0, arg_8_1)
	local var_8_0 = #arg_8_0.cost_time_list
	local var_8_1 = var_8_0 == 0 and 0 or arg_8_0.cost_time_list[var_8_0]
	local var_8_2 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		table.insert(arg_8_0.cost_time_list, iter_8_1)

		arg_8_0.cost_Alltime_list[var_8_0 + iter_8_0] = iter_8_1 + var_8_1 + var_8_2
		var_8_2 = iter_8_1 + var_8_2
	end

	arg_8_0.end_time = arg_8_0.end_time + var_8_2
	arg_8_0.allTime = arg_8_0.allTime + var_8_2
end

function var_0_0.SetCostList(arg_9_0, arg_9_1)
	arg_9_0.cost_time_list = arg_9_1
	arg_9_0.cost_Alltime_list = {}

	local var_9_0 = 0

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.cost_time_list) do
		arg_9_0.cost_Alltime_list[iter_9_0] = iter_9_1 + var_9_0
		var_9_0 = var_9_0 + iter_9_1
	end

	arg_9_0.end_time = arg_9_0.start_time

	for iter_9_2, iter_9_3 in ipairs(arg_9_0.cost_time_list) do
		arg_9_0.end_time = arg_9_0.end_time + iter_9_3
	end

	arg_9_0.allTime = arg_9_0.end_time - arg_9_0.start_time
end

function var_0_0.AddSpeedTime(arg_10_0, arg_10_1)
	arg_10_0.speed_time = arg_10_0.speed_time + arg_10_1
end

function var_0_0.isEnd(arg_11_0)
	return arg_11_0.end_time > 0 and pg.TimeMgr.GetInstance():GetServerTime() >= arg_11_0.end_time + 1
end

function var_0_0.GetFinishTime(arg_12_0)
	return arg_12_0.end_time
end

function var_0_0.GetAllTime(arg_13_0)
	return arg_13_0.allTime
end

function var_0_0.isSend(arg_14_0)
	return arg_14_0.issend
end

function var_0_0.SetIsSend(arg_15_0, arg_15_1)
	arg_15_0.issend = arg_15_1
end

function var_0_0.InCurrentTime(arg_16_0)
	local var_16_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_16_0.start_time

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.cost_Alltime_list) do
		if var_16_0 <= iter_16_1 then
			return iter_16_0
		end
	end

	return #arg_16_0.cost_Alltime_list
end

function var_0_0.GetCountByTimestamp(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1 - arg_17_0.start_time

	for iter_17_0 = #arg_17_0.cost_Alltime_list, 1, -1 do
		if var_17_0 >= arg_17_0.cost_Alltime_list[iter_17_0] then
			return iter_17_0
		end
	end

	return 0
end

function var_0_0.InCurrentTimeStart(arg_18_0, arg_18_1)
	local var_18_0 = 0
	local var_18_1 = arg_18_1 - 1

	for iter_18_0 = 1, var_18_1 do
		var_18_0 = var_18_0 + arg_18_0.cost_time_list[iter_18_0]
	end

	return var_18_0 + arg_18_0.start_time
end

function var_0_0.CurrentTimeNeed(arg_19_0, arg_19_1)
	return arg_19_0.cost_time_list[arg_19_1]
end

function var_0_0.CheckDelegationIsEnd(arg_20_0)
	if not arg_20_0:isSend() and arg_20_0:isEnd() then
		return true
	end
end

function var_0_0.CanRewardTimes(arg_21_0)
	return arg_21_0:InCurrentTime() - 1 - arg_21_0.get_times
end

function var_0_0.GetCurrentCanRewardExtraMainNum(arg_22_0)
	local var_22_0 = arg_22_0:InCurrentTime() - 1
	local var_22_1 = arg_22_0.get_times + 1
	local var_22_2 = 0

	for iter_22_0 = var_22_0, var_22_1, -1 do
		var_22_2 = var_22_2 + arg_22_0:GetExtraMainProduct(iter_22_0)
	end

	return var_22_2
end

function var_0_0.GetReturnExtraNum(arg_23_0, arg_23_1)
	local var_23_0 = #arg_23_0.cost_time_list - arg_23_1
	local var_23_1 = 0

	for iter_23_0 = #arg_23_0.cost_time_list, var_23_0, -1 do
		var_23_1 = var_23_1 + arg_23_0:GetExtraExtraCost(iter_23_0)
	end

	return var_23_1
end

function var_0_0.LastTimes(arg_24_0)
	return #arg_24_0.cost_time_list - (arg_24_0:InCurrentTime() - 1)
end

return var_0_0

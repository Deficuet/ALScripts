local var_0_0 = class("IslandTicketAgency", import(".IslandBaseAgency"))

var_0_0.REMIND_TIP_KEY = "IslandTicketAgency.REMIND_TIP_KEY"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.data = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.speed_tickets) do
		local var_1_0 = iter_1_1.key.speed_id
		local var_1_1 = iter_1_1.key.end_time
		local var_1_2 = iter_1_1.num

		if not arg_1_0.data[var_1_0] then
			arg_1_0.data[var_1_0] = {}
		end

		arg_1_0.data[var_1_0][var_1_1] = IslandTicket.New(var_1_0, var_1_1, var_1_2)
	end

	arg_1_0.localTipKey = var_0_0.REMIND_TIP_KEY .. "_" .. getProxy(PlayerProxy):getRawData().id
end

function var_0_0.AddTicket(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if not arg_2_0.data[arg_2_1] then
		arg_2_0.data[arg_2_1] = {}
	end

	if arg_2_0.data[arg_2_1][arg_2_2] then
		arg_2_0.data[arg_2_1][arg_2_2]:AddCount(arg_2_3)
	else
		arg_2_0.data[arg_2_1][arg_2_2] = IslandTicket.New(arg_2_1, arg_2_2, arg_2_3)
	end
end

function var_0_0.ReduceTicket(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not arg_3_0.data[arg_3_1] then
		return
	end

	local var_3_0 = arg_3_0.data[arg_3_1][arg_3_2]

	if not var_3_0 then
		return
	end

	if arg_3_3 > var_3_0:GetCount() then
		return
	end

	var_3_0:ReduceCount(arg_3_3)

	if var_3_0:IsEmpty() then
		arg_3_0:RemoveTicket(arg_3_1, arg_3_2)
	else
		arg_3_0.data[arg_3_1][arg_3_2] = var_3_0
	end
end

function var_0_0.RemoveTicket(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.data[arg_4_1][arg_4_2] = nil
end

function var_0_0.GetAllTicketList(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.data) do
		for iter_5_2, iter_5_3 in pairs(iter_5_1) do
			table.insert(var_5_0, iter_5_3)
		end
	end

	return var_5_0
end

function var_0_0.GetTicketData(arg_6_0)
	return arg_6_0.data
end

function var_0_0.GetTikcetListById(arg_7_0, arg_7_1)
	if not arg_7_0.data[arg_7_1] then
		return {}
	end

	return underscore.values(arg_7_0.data[arg_7_1])
end

function var_0_0.GetExpiredTickets(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.data) do
		for iter_8_2, iter_8_3 in pairs(iter_8_1) do
			if iter_8_3:IsExpired() then
				table.insert(var_8_0, iter_8_3)
			end
		end
	end

	return var_8_0
end

function var_0_0.GetExpireRemindTickets(arg_9_0)
	local var_9_0 = {}

	if PlayerPrefs.GetInt(arg_9_0.localTipKey .. "_" .. GetZeroTime()) == 1 then
		return var_9_0
	end

	for iter_9_0, iter_9_1 in pairs(arg_9_0.data) do
		for iter_9_2, iter_9_3 in pairs(iter_9_1) do
			if iter_9_3:WillExpire() then
				table.insert(var_9_0, iter_9_3)
			end
		end
	end

	return var_9_0
end

function var_0_0.SetRemindFlag(arg_10_0)
	PlayerPrefs.SetInt(arg_10_0.localTipKey .. "_" .. GetZeroTime(), 1)
	PlayerPrefs.Save()
end

return var_0_0

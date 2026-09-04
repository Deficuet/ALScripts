local var_0_0 = class("ChapterAutoProxy", import("model.proxy.NetProxy"))

var_0_0.FINISH_UPDATE = "ChapterAutoProxy.FINISH_UPDATE"
var_0_0.TYPE = {
	SLG = 1
}

function var_0_0.register(arg_1_0)
	arg_1_0:on(13001, function(arg_2_0)
		arg_1_0.recordData = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.chapter_auto_record_list) do
			local var_2_0 = iter_2_1.type

			if not arg_1_0.recordData[var_2_0] then
				arg_1_0.recordData[var_2_0] = {}
			end

			arg_1_0.recordData[var_2_0][iter_2_1.id] = var_0_0.GetFixTime(var_2_0, iter_2_1.id, iter_2_1.seconds)
		end

		arg_1_0.ticketData = {}

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.chapter_auto_ticket_list) do
			local var_2_1 = iter_2_3.type

			if not arg_1_0.ticketData[var_2_1] then
				arg_1_0.ticketData[var_2_1] = {}
			end

			arg_1_0.ticketData[var_2_1][iter_2_3.time] = ChapterAutoTicket.New(iter_2_3)
		end

		arg_1_0:SetCommissionList(arg_2_0.chapter_auto_battle_list)

		arg_1_0.oil = arg_2_0.oil
		arg_1_0.dailyCostTime = arg_2_0.time_acc
		arg_1_0.dailyExtraTime = arg_2_0.extra_time_max
	end)
	arg_1_0:ClearEventIds()
end

function var_0_0.UpdateRecord(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not arg_3_0.recordData[arg_3_1] then
		arg_3_0.recordData[arg_3_1] = {}
	end

	local var_3_0 = arg_3_0.recordData[arg_3_1][arg_3_2] or 0
	local var_3_1 = var_0_0.GetFixTime(arg_3_1, arg_3_2, arg_3_3)

	arg_3_0.recordData[arg_3_1][arg_3_2] = var_3_0 == 0 and var_3_1 or math.min(var_3_0, var_3_1)
end

function var_0_0.GetRecord(arg_4_0, arg_4_1, arg_4_2)
	if not arg_4_0.recordData[arg_4_1] then
		return 0
	end

	return arg_4_0.recordData[arg_4_1][arg_4_2] or 0
end

function var_0_0.GetOil(arg_5_0)
	return arg_5_0.oil
end

function var_0_0.ReduceOil(arg_6_0, arg_6_1)
	arg_6_0.oil = math.max(0, arg_6_0.oil - arg_6_1)
end

function var_0_0.IncreaseOil(arg_7_0, arg_7_1)
	arg_7_0.oil = arg_7_0.oil + arg_7_1
end

function var_0_0.GetMaxTime(arg_8_0)
	return pg.gameset.auto_battle_time_limit.key_value + arg_8_0.dailyExtraTime
end

function var_0_0.GetRemainTime(arg_9_0)
	return arg_9_0:GetMaxTime() - arg_9_0.dailyCostTime
end

function var_0_0.AddCostTime(arg_10_0, arg_10_1)
	arg_10_0.dailyCostTime = arg_10_0.dailyCostTime + arg_10_1
end

function var_0_0.ReduceCostTime(arg_11_0, arg_11_1)
	arg_11_0.dailyCostTime = math.max(0, arg_11_0.dailyCostTime - arg_11_1)
end

function var_0_0.AddDailyExtraTime(arg_12_0, arg_12_1)
	arg_12_0.dailyExtraTime = arg_12_0.dailyExtraTime + arg_12_1
end

function var_0_0.ResetDailyData(arg_13_0)
	arg_13_0.dailyCostTime = 0
	arg_13_0.dailyExtraTime = 0
end

function var_0_0.GetTicketListByType(arg_14_0, arg_14_1)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0.ticketData[arg_14_1] or {}) do
		if not iter_14_1:IsExpired() then
			table.insert(var_14_0, iter_14_1)
		end
	end

	return var_14_0
end

function var_0_0.GetValidTicketCntByType(arg_15_0, arg_15_1)
	local var_15_0 = 0

	for iter_15_0, iter_15_1 in pairs(arg_15_0.ticketData[arg_15_1] or {}) do
		if not iter_15_1:IsExpired() then
			var_15_0 = var_15_0 + iter_15_1:GetCount()
		end
	end

	return var_15_0
end

function var_0_0.ReduceTicketByType(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in pairs(arg_16_0.ticketData[arg_16_1] or {}) do
		if not iter_16_1:IsExpired() then
			table.insert(var_16_1, iter_16_1.expireTime)
		end
	end

	table.sort(var_16_1)

	for iter_16_2, iter_16_3 in ipairs(var_16_1) do
		local var_16_2 = arg_16_0.ticketData[arg_16_1][iter_16_3]

		if not var_16_2:IsExpired() then
			local var_16_3 = var_16_2:GetCount()

			if var_16_0 <= var_16_3 then
				var_16_2:ReduceCount(var_16_0)

				if var_16_3 == var_16_0 then
					arg_16_0.ticketData[arg_16_1][iter_16_3] = nil
				end

				break
			else
				arg_16_0.ticketData[arg_16_1][iter_16_3] = nil
				var_16_0 = var_16_0 - var_16_3
			end
		end
	end
end

function var_0_0.AddTickets(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in ipairs(arg_17_1) do
		local var_17_0 = iter_17_1.type

		if not arg_17_0.ticketData[var_17_0] then
			arg_17_0.ticketData[var_17_0] = {}
		end

		if arg_17_0.ticketData[var_17_0][iter_17_1.time] then
			arg_17_0.ticketData[var_17_0][iter_17_1.time]:IncreaseCount(iter_17_1.num)
		else
			arg_17_0.ticketData[var_17_0][iter_17_1.time] = ChapterAutoTicket.New(iter_17_1)
		end
	end
end

function var_0_0.AddTicketByItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = ChapterAutoTicket.CreateByItem(arg_18_1, arg_18_2)

	if not arg_18_0.ticketData[arg_18_1] then
		arg_18_0.ticketData[arg_18_1] = {}
	end

	if arg_18_0.ticketData[arg_18_1][var_18_0.id] then
		arg_18_0.ticketData[arg_18_1][var_18_0.id]:IncreaseCount(var_18_0:GetCount())
	else
		arg_18_0.ticketData[arg_18_1][var_18_0.id] = var_18_0
	end
end

function var_0_0.GetWillExpireTicketCnt(arg_19_0)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in pairs(arg_19_0.ticketData) do
		for iter_19_2, iter_19_3 in pairs(iter_19_1) do
			if iter_19_3:WillExpire() then
				var_19_0 = var_19_0 + iter_19_3:GetCount()
			end
		end
	end

	return var_19_0
end

function var_0_0.SortCommissionList(arg_20_0)
	table.sort(arg_20_0.commissionList, CompareFuncs({
		function(arg_21_0)
			return arg_21_0:GetFinishTime()
		end,
		function(arg_22_0)
			return -arg_22_0.id
		end
	}))
end

function var_0_0.GetFinishedCnt(arg_23_0)
	local var_23_0 = 0
	local var_23_1 = 0

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.commissionList) do
		if iter_23_1:IsFinished() then
			var_23_0 = var_23_0 + 1

			if iter_23_1:UsedTicket() then
				var_23_1 = var_23_1 + 1
			end
		end
	end

	return var_23_0, var_23_1
end

function var_0_0.GetCntInfo(arg_24_0)
	return arg_24_0.finishedCnt, #arg_24_0.commissionList
end

function var_0_0.ClearCommissionList(arg_25_0)
	arg_25_0.commissionList = {}
end

function var_0_0.SetCommissionList(arg_26_0, arg_26_1)
	arg_26_0.commissionList = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_1) do
		table.insert(arg_26_0.commissionList, ChapterAutoCommission.New(iter_26_1))
	end

	arg_26_0:SortCommissionList()

	arg_26_0.finishedCnt = arg_26_0:GetFinishedCnt()
end

function var_0_0.GetCommissionList(arg_27_0)
	return arg_27_0.commissionList
end

function var_0_0.GetFinishAllCommissionTime(arg_28_0)
	if #arg_28_0.commissionList == 0 then
		return 0
	end

	return arg_28_0.commissionList[#arg_28_0.commissionList]:GetFinishTime()
end

function var_0_0.IsShowTip(arg_29_0)
	if arg_29_0.finishedCnt > 0 then
		return true
	end

	if arg_29_0:GetWillExpireTicketCnt() > 0 then
		return true
	end

	return false
end

function var_0_0.timeCall(arg_30_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_31_0)
			arg_30_0:UpdatePerSecond()
		end,
		[ProxyRegister.DayCall] = function(arg_32_0)
			arg_30_0:UpdatePerDay()
		end
	}
end

function var_0_0.UpdatePerSecond(arg_33_0)
	local var_33_0 = arg_33_0:GetFinishedCnt()

	if var_33_0 ~= arg_33_0.finishedCnt then
		arg_33_0.finishedCnt = var_33_0

		arg_33_0:sendNotification(var_0_0.FINISH_UPDATE)
	end
end

function var_0_0.UpdatePerDay(arg_34_0)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.ticketData) do
		for iter_34_2, iter_34_3 in ipairs(iter_34_1) do
			if iter_34_3:IsExpired() then
				arg_34_0.ticketData[iter_34_3.id] = nil
			end
		end
	end

	arg_34_0:ResetDailyData()
end

function var_0_0.GetSkipBatchBuildFlag(arg_35_0)
	return arg_35_0.skipBatchFlag or false
end

function var_0_0.SetSkipBatchBuildFlag(arg_36_0, arg_36_1)
	arg_36_0.skipBatchFlag = arg_36_1
end

function var_0_0.SetRecordEventFlag(arg_37_0, arg_37_1)
	arg_37_0.recordEventFlag = arg_37_1
end

function var_0_0.RecordNewEventIds(arg_38_0, arg_38_1)
	if arg_38_0.recordEventFlag then
		arg_38_0.newEventIds = table.mergeArray(arg_38_0.newEventIds, arg_38_1)
	end
end

function var_0_0.GetNewEventIds(arg_39_0)
	return arg_39_0.newEventIds
end

function var_0_0.ClearEventIds(arg_40_0, arg_40_1)
	arg_40_0.newEventIds = {}
end

function var_0_0.remove(arg_41_0)
	return
end

function var_0_0.GetFixTime(arg_42_0, arg_42_1, arg_42_2)
	return switch(arg_42_0, {
		[var_0_0.TYPE.SLG] = function()
			local var_43_0 = pg.chapter_auto_statistics[arg_42_1]

			if not var_43_0 then
				return arg_42_2
			end

			return math.floor(arg_42_2 * var_43_0.time_rate) + var_43_0.time_correction
		end
	}, function()
		return arg_42_2
	end)
end

function var_0_0.IsSystemOpen()
	return AutoBotCommand.autoBotSatisfied()
end

return var_0_0

local var_0_0 = class("ChapterAutoCommission", import("model.vo.BaseVO"))

var_0_0.EXP_BOOK_ID = 16501

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.type = arg_1_1.type
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.finishTime = arg_1_1.time
	arg_1_0.ticketTime = arg_1_1.ticket_time
	arg_1_0.costTime = arg_1_1.seconds
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.chapter_auto_statistics
end

function var_0_0.GetFinishTime(arg_3_0)
	return arg_3_0.finishTime
end

function var_0_0.IsFinished(arg_4_0)
	return pg.TimeMgr.GetInstance():GetServerTime() >= arg_4_0:GetFinishTime()
end

function var_0_0.GetTicketTime(arg_5_0)
	return arg_5_0.ticketTime
end

function var_0_0.UsedTicket(arg_6_0)
	return arg_6_0:GetTicketTime() > 0
end

function var_0_0.GetCostTime(arg_7_0)
	return arg_7_0.costTime
end

function var_0_0.GetClassExpAward(arg_8_0)
	return arg_8_0:getConfig("base_class_exp") or 0
end

function var_0_0.GetExpBookAward(arg_9_0)
	return arg_9_0:getConfig("drop_expbook") or 0
end

function var_0_0.GetOnceOil(arg_10_0, arg_10_1)
	return switch(arg_10_0, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			return pg.chapter_auto_statistics[arg_10_1].oil_limit
		end
	}, function()
		assert(false, "invalid chapter auto type: " .. tostring(arg_10_0))
	end)
end

return var_0_0

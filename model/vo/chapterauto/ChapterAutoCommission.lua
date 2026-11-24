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
	return switch(arg_2_0.type, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			return pg.chapter_auto_statistics
		end,
		[ChapterAutoProxy.TYPE.WORLD] = function()
			return pg.world_auto_statistics
		end,
		[ChapterAutoProxy.TYPE.BOSS] = function()
			return pg.expedition_auto_statistics
		end,
		[ChapterAutoProxy.TYPE.RUSH] = function()
			return pg.activity_series_enemy_auto
		end
	}, function()
		assert(false, "invalid chapter auto type: " .. tostring(arg_2_0.type))
	end)
end

function var_0_0.GetOccupiedName(arg_8_0)
	return switch(arg_8_0.type, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			return pg.chapter_template[arg_8_0.id].name
		end,
		[ChapterAutoProxy.TYPE.WORLD] = function()
			return ""
		end,
		[ChapterAutoProxy.TYPE.BOSS] = function()
			return arg_8_0:getConfig("auto_expedition_name")
		end,
		[ChapterAutoProxy.TYPE.RUSH] = function()
			return pg.activity_series_enemy[arg_8_0.id].name
		end
	}, function()
		assert(false, "invalid chapter auto type: " .. tostring(arg_8_0.type))
	end)
end

function var_0_0.GetType(arg_14_0)
	return arg_14_0.type
end

function var_0_0.GetID(arg_15_0)
	return arg_15_0.id
end

function var_0_0.GetFinishTime(arg_16_0)
	return arg_16_0.finishTime
end

function var_0_0.GetStartTime(arg_17_0)
	return arg_17_0.finishTime - arg_17_0.costTime
end

function var_0_0.IsFinished(arg_18_0)
	return pg.TimeMgr.GetInstance():GetServerTime() >= arg_18_0:GetFinishTime()
end

function var_0_0.GetTicketTime(arg_19_0)
	return arg_19_0.ticketTime
end

function var_0_0.UsedTicket(arg_20_0)
	return arg_20_0:GetTicketTime() > 0
end

function var_0_0.GetCostTime(arg_21_0)
	return arg_21_0.costTime
end

function var_0_0.GetClassExpAward(arg_22_0)
	return arg_22_0:getConfig("base_class_exp") or 0
end

function var_0_0.GetExpBookAward(arg_23_0)
	return arg_23_0:getConfig("drop_expbook") or 0
end

function var_0_0.GetOnceOil(arg_24_0)
	return arg_24_0:getConfig("oil_limit") or 0
end

function var_0_0.GetOnceOil(arg_25_0, arg_25_1)
	return switch(arg_25_0, {
		[ChapterAutoProxy.TYPE.SLG] = function()
			return pg.chapter_auto_statistics[arg_25_1].oil_limit
		end,
		[ChapterAutoProxy.TYPE.WORLD] = function()
			return pg.world_auto_statistics[arg_25_1].oil_limit
		end,
		[ChapterAutoProxy.TYPE.BOSS] = function()
			return pg.expedition_auto_statistics[arg_25_1].oil_limit
		end,
		[ChapterAutoProxy.TYPE.RUSH] = function()
			return pg.activity_series_enemy_auto[arg_25_1].oil_limit
		end
	}, function()
		assert(false, "invalid chapter auto type: " .. tostring(arg_25_0))
	end)
end

return var_0_0

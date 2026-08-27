local var_0_0 = class("ChapterAutoTicket")

var_0_0.TYPE = {
	MAIN = 1,
	WORLD = 2,
	TIME = 3
}
var_0_0.FOREVER_TIME = 4294967295

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.time
	arg_1_0.type = arg_1_1.type
	arg_1_0.count = arg_1_1.num
	arg_1_0.expireTime = arg_1_0.id
end

function var_0_0.GetRemainTime(arg_2_0)
	return arg_2_0.expireTime - pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.IsForever(arg_3_0)
	return arg_3_0.expireTime == var_0_0.FOREVER_TIME
end

function var_0_0.IsExpired(arg_4_0)
	return arg_4_0:GetRemainTime() < 0
end

function var_0_0.WillExpire(arg_5_0)
	local var_5_0 = arg_5_0:GetRemainTime()

	return var_5_0 > 0 and var_5_0 < 86400 * pg.gameset.auto_battle_ticket_warning_time.key_value
end

function var_0_0.GetCount(arg_6_0)
	return arg_6_0.count
end

function var_0_0.IncreaseCount(arg_7_0, arg_7_1)
	arg_7_0.count = arg_7_0.count + arg_7_1
end

function var_0_0.ReduceCount(arg_8_0, arg_8_1)
	arg_8_0.count = math.max(0, arg_8_0.count - arg_8_1)
end

function var_0_0.CreateByItem(arg_9_0, arg_9_1)
	return var_0_0.New({
		type = arg_9_0,
		time = var_0_0.GetExpireTimeByArg(arg_9_1:getConfig("drop_arg")),
		num = arg_9_1.count
	})
end

function var_0_0.GetExpireTimeByArg(arg_10_0)
	if type(arg_10_0) ~= "table" then
		return var_0_0.FOREVER_TIME
	end

	if #arg_10_0 == 0 then
		return var_0_0.FOREVER_TIME
	end

	local var_10_0 = arg_10_0[1]
	local var_10_1 = arg_10_0[2]

	if type(var_10_0) == "table" then
		return pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_10_0)
	end

	if type(var_10_0) == "string" then
		local var_10_2 = pg.TimeMgr.GetInstance()

		return switch(var_10_0, {
			always = function()
				return var_0_0.FOREVER_TIME
			end,
			day = function()
				return var_10_2:GetTimeToNextTime() + var_10_1 * 86400
			end,
			week = function()
				return var_10_2:GetNextWeekTime(1, 0, 0, 0) + var_10_1 * 604800
			end,
			month = function()
				local var_14_0 = var_10_2:STimeDescS(var_10_2:GetServerTime(), "*t")
				local var_14_1 = var_14_0.month + var_10_1 + 1
				local var_14_2 = var_14_0.year + math.floor((var_14_1 - 1) / 12)
				local var_14_3 = (var_14_1 - 1) % 12 + 1

				return var_10_2:Table2ServerTime({
					sec = 0,
					min = 0,
					hour = 0,
					day = 1,
					year = var_14_2,
					month = var_14_3
				})
			end,
			year = function()
				local var_15_0 = tonumber(var_10_2:STimeDescS(var_10_2:GetServerTime(), "%Y")) + var_10_1 + 1

				return var_10_2:Table2ServerTime({
					min = 0,
					month = 1,
					hour = 0,
					sec = 0,
					day = 1,
					year = var_15_0
				})
			end
		}, function()
			return var_0_0.FOREVER_TIME
		end)
	end

	return var_0_0.FOREVER_TIME
end

return var_0_0

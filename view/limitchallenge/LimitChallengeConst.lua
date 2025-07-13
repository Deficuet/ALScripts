LimitChallengeConst = {}

local var_0_0 = LimitChallengeConst

var_0_0.OPEN_PRE_COMBAT_LAYER = "OPEN_PRE_COMBAT_LAYER"
var_0_0.REQ_CHALLENGE_INFO = "LimitChallengeConst.REQ_CHALLENGE_INFO"
var_0_0.REQ_CHALLENGE_INFO_DONE = "LimitChallengeConst.REQ_CHALLENGE_INFO_DONE"
var_0_0.GET_CHALLENGE_AWARD = "LimitChallengeConst.GET_CHALLENGE_AWARD"
var_0_0.GET_CHALLENGE_AWARD_DONE = "LimitChallengeConst.GET_CHALLENGE_AWARD_DONE"
var_0_0.UPDATE_PASS_TIME = "LimitChallengeConst.UPDATE_PASS_TIME"

function var_0_0.RequestInfo()
	if pg.constellation_challenge_month and #pg.constellation_challenge_month.all > 0 and LimitChallengeConst.GetCurMonthConfig() then
		pg.m02:sendNotification(LimitChallengeConst.REQ_CHALLENGE_INFO)
	end
end

function var_0_0.GetNextMonthTS()
	local var_2_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_2_1 = pg.TimeMgr.GetInstance():STimeDescS(var_2_0, "%Y")
	local var_2_2 = pg.TimeMgr.GetInstance():STimeDescS(var_2_0, "%m")
	local var_2_3 = tonumber(var_2_1)
	local var_2_4 = tonumber(var_2_2)

	print("------------", tostring(var_2_3), tostring(var_2_4))

	local var_2_5 = var_2_4 + 1

	if var_2_5 > 12 then
		var_2_5 = 1
		var_2_3 = var_2_3 + 1
	end

	return pg.TimeMgr.GetInstance():Table2ServerTime({
		sec = 0,
		min = 0,
		hour = 0,
		day = 1,
		year = var_2_3,
		month = var_2_5
	})
end

function var_0_0.GetCurMonth()
	local var_3_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_3_1 = pg.TimeMgr.GetInstance():STimeDescS(var_3_0, "%m")

	return (tonumber(var_3_1))
end

function var_0_0.GetCurMonthConfig()
	local var_4_0 = var_0_0.GetCurMonth()

	return pg.constellation_challenge_month[var_4_0]
end

function var_0_0.GetChallengeIDByLevel(arg_5_0)
	return LimitChallengeConst.GetCurMonthConfig().stage[arg_5_0]
end

function var_0_0.GetStageIDByLevel(arg_6_0)
	local var_6_0 = var_0_0.GetChallengeIDByLevel(arg_6_0)

	return pg.expedition_constellation_challenge_template[var_6_0].dungeon_id
end

function var_0_0.GetChallengeIDByStageID(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(pg.expedition_constellation_challenge_template.all) do
		local var_7_0 = pg.expedition_constellation_challenge_template[iter_7_1]

		if arg_7_0 == var_7_0.dungeon_id then
			return var_7_0.id
		end
	end
end

function var_0_0.IsOpen()
	local var_8_0 = getProxy(PlayerProxy):getRawData().level
	local var_8_1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_8_0, "LimitChallengeMediator")
	local var_8_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_8_0, "ChallengeMainMediator")

	return var_8_1 and var_8_2
end

function var_0_0.IsInAct()
	local var_9_0 = pg.constellation_challenge_month and #pg.constellation_challenge_month.all > 0 and LimitChallengeConst.GetCurMonthConfig()
	local var_9_1 = checkExist(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE), {
		"isEnd"
	}) == false

	return LOCK_LIMIT_CHALLENGE and var_9_1 or var_9_0
end

var_0_0.RedPointKey = "LimitChallengeMonth"

function var_0_0.SetRedPointMonth()
	PlayerPrefs.SetInt(var_0_0.RedPointKey, var_0_0.GetCurMonth())
end

function var_0_0.GetRedPointMonth()
	return PlayerPrefs.GetInt(var_0_0.RedPointKey, 0)
end

function var_0_0.IsShowRedPoint()
	if LOCK_LIMIT_CHALLENGE then
		return false
	end

	if not var_0_0.IsOpen() then
		return false
	end

	if not var_0_0.IsInAct() then
		return false
	end

	if var_0_0.GetRedPointMonth() == var_0_0.GetCurMonth() then
		return false
	else
		local var_12_0 = getProxy(LimitChallengeProxy)
		local var_12_1 = var_0_0.GetCurMonthConfig().stage

		for iter_12_0, iter_12_1 in ipairs(var_12_1) do
			if not var_12_0:isAwardedByChallengeID(iter_12_1) then
				return true
			end
		end

		return false
	end
end

return var_0_0

pg = pg or {}

local var_0_0 = pg

var_0_0.TimeMgr = singletonClass("TimeMgr")

local var_0_1 = var_0_0.TimeMgr

var_0_1._Timer = nil
var_0_1._BattleTimer = nil
var_0_1._sAnchorTime = 0
var_0_1._AnchorDelta = 0
var_0_1._serverUnitydelta = 0
var_0_1._isdstClient = false

local var_0_2 = 3600
local var_0_3 = 86400
local var_0_4 = 604800

function var_0_1.Ctor(arg_1_0)
	arg_1_0._battleTimerList = {}
end

function var_0_1.Init(arg_2_0)
	print("initializing time manager...")

	arg_2_0._Timer = TimeUtil.NewUnityTimer()

	UpdateBeat:Add(arg_2_0.Update, arg_2_0)
	UpdateBeat:Add(arg_2_0.BattleUpdate, arg_2_0)
end

function var_0_1.Update(arg_3_0)
	arg_3_0._Timer:Schedule()
end

function var_0_1.BattleUpdate(arg_4_0)
	if arg_4_0._stopCombatTime > 0 then
		arg_4_0._cobTime = arg_4_0._stopCombatTime - arg_4_0._waitTime
	else
		arg_4_0._cobTime = Time.time - arg_4_0._waitTime
	end
end

function var_0_1.AddTimer(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	return arg_5_0._Timer:SetTimer(arg_5_1, arg_5_2 * 1000, arg_5_3 * 1000, arg_5_4)
end

function var_0_1.RemoveTimer(arg_6_0, arg_6_1)
	if arg_6_1 == nil or arg_6_1 == 0 then
		return
	end

	arg_6_0._Timer:DeleteTimer(arg_6_1)
end

var_0_1._waitTime = 0
var_0_1._stopCombatTime = 0
var_0_1._cobTime = 0

function var_0_1.GetCombatTime(arg_7_0)
	return arg_7_0._cobTime
end

function var_0_1.ResetCombatTime(arg_8_0)
	arg_8_0._waitTime = 0
	arg_8_0._cobTime = Time.time
end

function var_0_1.GetCombatDeltaTime()
	return Time.fixedDeltaTime
end

function var_0_1.PauseBattleTimer(arg_10_0)
	arg_10_0._stopCombatTime = Time.time

	for iter_10_0, iter_10_1 in pairs(arg_10_0._battleTimerList) do
		iter_10_0:Pause()
	end
end

function var_0_1.ResumeBattleTimer(arg_11_0)
	arg_11_0._waitTime = arg_11_0._waitTime + Time.time - arg_11_0._stopCombatTime
	arg_11_0._stopCombatTime = 0

	for iter_11_0, iter_11_1 in pairs(arg_11_0._battleTimerList) do
		iter_11_0:Resume()
	end
end

function var_0_1.AddBattleTimer(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4, arg_12_5, arg_12_6)
	arg_12_2 = arg_12_2 or -1
	arg_12_5 = arg_12_5 or false
	arg_12_6 = arg_12_6 or false

	local var_12_0 = Timer.New(arg_12_4, arg_12_3, arg_12_2, arg_12_5)

	arg_12_0._battleTimerList[var_12_0] = true

	if not arg_12_6 then
		var_12_0:Start()
	end

	if arg_12_0._stopCombatTime ~= 0 then
		var_12_0:Pause()
	end

	return var_12_0
end

function var_0_1.ScaleBattleTimer(arg_13_0, arg_13_1)
	Time.timeScale = arg_13_1
end

function var_0_1.RemoveBattleTimer(arg_14_0, arg_14_1)
	if arg_14_1 then
		arg_14_0._battleTimerList[arg_14_1] = nil

		arg_14_1:Stop()
	end
end

function var_0_1.RemoveAllBattleTimer(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0._battleTimerList) do
		iter_15_0:Stop()
	end

	arg_15_0._battleTimerList = {}
end

function var_0_1.RealtimeSinceStartup(arg_16_0)
	return math.floor(Time.realtimeSinceStartup)
end

function var_0_1.SetServerTime(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0:_SetServerTime_(arg_17_1, arg_17_2, arg_17_0:RealtimeSinceStartup())
end

function var_0_1._SetServerTime_(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if PLATFORM_CODE == PLATFORM_US then
		SERVER_DAYLIGHT_SAVEING_TIME = false
	end

	arg_18_0._isdstClient = os.date("*t").isdst
	arg_18_0._serverUnitydelta = arg_18_1 - arg_18_3
	arg_18_0._sAnchorTime = arg_18_2 - (SERVER_DAYLIGHT_SAVEING_TIME and 3600 or 0)
	arg_18_0._AnchorDelta = arg_18_2 - os.time({
		year = 2020,
		month = 11,
		hour = 0,
		min = 0,
		sec = 0,
		day = 23,
		isdst = false
	})
end

function var_0_1.GetServerTime(arg_19_0)
	return arg_19_0:RealtimeSinceStartup() + arg_19_0._serverUnitydelta
end

function var_0_1.GetServerTimeMs(arg_20_0)
	return math.ceil((Time.realtimeSinceStartup + arg_20_0._serverUnitydelta) * 1000)
end

function var_0_1.GetServerWeek(arg_21_0)
	local var_21_0 = arg_21_0:GetServerTime()

	return arg_21_0:GetServerTimestampWeek(var_21_0)
end

function var_0_1.GetServerOverWeek(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1 - (arg_22_0:GetServerTimestampWeek(arg_22_1) - 1) * 86400

	return (math.ceil((arg_22_0:GetServerTime() - var_22_0) / 604800))
end

function var_0_1.GetServerTimestampWeek(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_1 - arg_23_0._sAnchorTime

	return math.ceil((var_23_0 % var_0_4 + 1) / var_0_3)
end

function var_0_1.GetServerHour(arg_24_0)
	local var_24_0 = arg_24_0:GetServerTime() - arg_24_0._sAnchorTime

	return math.floor(var_24_0 % var_0_3 / var_0_2)
end

function var_0_1.Table2ServerTime(arg_25_0, arg_25_1)
	arg_25_1.isdst = arg_25_0._isdstClient

	if arg_25_0._isdstClient ~= SERVER_DAYLIGHT_SAVEING_TIME then
		if SERVER_DAYLIGHT_SAVEING_TIME then
			return arg_25_0._AnchorDelta + os.time(arg_25_1) - var_0_2
		else
			return arg_25_0._AnchorDelta + os.time(arg_25_1) + var_0_2
		end
	else
		return arg_25_0._AnchorDelta + os.time(arg_25_1)
	end
end

function var_0_1.CTimeDescC(arg_26_0, arg_26_1, arg_26_2)
	arg_26_2 = arg_26_2 or "%Y%m%d%H%M%S"

	return os.date(arg_26_2, arg_26_1)
end

function var_0_1.STimeDescC(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_2 = arg_27_2 or "%Y/%m/%d %H:%M:%S"

	if arg_27_3 then
		return os.date(arg_27_2, arg_27_1 + os.time() - arg_27_0:GetServerTime())
	else
		return os.date(arg_27_2, arg_27_1)
	end
end

function var_0_1.STimeDescS(arg_28_0, arg_28_1, arg_28_2)
	arg_28_2 = arg_28_2 or "%Y/%m/%d %H:%M:%S"

	local var_28_0 = 0

	if arg_28_0._isdstClient ~= SERVER_DAYLIGHT_SAVEING_TIME then
		var_28_0 = SERVER_DAYLIGHT_SAVEING_TIME and 3600 or -3600
	end

	return os.date(arg_28_2, arg_28_1 - arg_28_0._AnchorDelta + var_28_0)
end

function var_0_1.CurrentSTimeDesc(arg_29_0, arg_29_1, arg_29_2)
	if arg_29_2 then
		return arg_29_0:STimeDescS(arg_29_0:GetServerTime(), arg_29_1)
	else
		return arg_29_0:STimeDescC(arg_29_0:GetServerTime(), arg_29_1)
	end
end

function var_0_1.ChieseDescTime(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = "%Y/%m/%d"
	local var_30_1

	if arg_30_2 then
		var_30_1 = os.date(var_30_0, arg_30_1)
	else
		var_30_1 = os.date(var_30_0, arg_30_1 + os.time() - arg_30_0:GetServerTime())
	end

	local var_30_2 = split(var_30_1, "/")

	return NumberToChinese(var_30_2[1], false) .. "年" .. NumberToChinese(var_30_2[2], true) .. "月" .. NumberToChinese(var_30_2[3], true) .. "日"
end

function var_0_1.GetTimeToNextTime(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	arg_31_1 = arg_31_1 or arg_31_0:GetServerTime()
	arg_31_2 = arg_31_2 or var_0_3
	arg_31_3 = arg_31_3 or 0

	local var_31_0 = arg_31_1 - (arg_31_0._sAnchorTime + arg_31_3)

	return math.floor(var_31_0 / arg_31_2 + 1) * arg_31_2 + arg_31_0._sAnchorTime + arg_31_3
end

function var_0_1.GetNextTime(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4)
	return arg_32_0:GetTimeToNextTime(nil, arg_32_4, arg_32_1 * var_0_2 + arg_32_2 * 60 + arg_32_3)
end

function var_0_1.GetNextTimeByTimeStamp(arg_33_0, arg_33_1)
	return arg_33_0:GetTimeToNextTime(arg_33_1) - var_0_3
end

function var_0_1.GetNextWeekTime(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	return arg_34_0:GetNextTime((arg_34_1 - 1) * 24 + arg_34_2, arg_34_3, arg_34_4, var_0_4)
end

function var_0_1.ParseTime(arg_35_0, arg_35_1)
	local var_35_0 = tonumber(arg_35_1)
	local var_35_1 = var_35_0 % 100
	local var_35_2 = var_35_0 / 100
	local var_35_3 = var_35_2 % 100
	local var_35_4 = var_35_2 / 100
	local var_35_5 = var_35_4 % 100
	local var_35_6 = var_35_4 / 100
	local var_35_7 = var_35_6 % 100
	local var_35_8 = var_35_6 / 100
	local var_35_9 = var_35_8 % 100
	local var_35_10 = var_35_8 / 100

	return arg_35_0:Table2ServerTime({
		year = var_35_10,
		month = var_35_9,
		day = var_35_7,
		hour = var_35_5,
		min = var_35_3,
		sec = var_35_1
	})
end

function var_0_1.ParseTimeEx(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_2 == nil then
		arg_36_2 = "(%d+)%-(%d+)%-(%d+)%s(%d+)%:(%d+)%:(%d+)"
	end

	local var_36_0, var_36_1, var_36_2, var_36_3, var_36_4, var_36_5 = arg_36_1:match(arg_36_2)

	return arg_36_0:Table2ServerTime({
		year = var_36_0,
		month = var_36_1,
		day = var_36_2,
		hour = var_36_3,
		min = var_36_4,
		sec = var_36_5
	})
end

function var_0_1.parseTimeFromConfig(arg_37_0, arg_37_1)
	return arg_37_0:Table2ServerTime({
		year = arg_37_1[1][1],
		month = arg_37_1[1][2],
		day = arg_37_1[1][3],
		hour = arg_37_1[2][1],
		min = arg_37_1[2][2],
		sec = arg_37_1[2][3]
	})
end

function var_0_1.DescDateFromConfig(arg_38_0, arg_38_1, arg_38_2)
	arg_38_2 = arg_38_2 or "%d.%02d.%02d"

	return string.format(arg_38_2, arg_38_1[1][1], arg_38_1[1][2], arg_38_1[1][3])
end

function var_0_1.DescCDTime(arg_39_0, arg_39_1)
	local var_39_0 = math.floor(arg_39_1 / 3600)

	arg_39_1 = arg_39_1 % 3600

	local var_39_1 = math.floor(arg_39_1 / 60)

	arg_39_1 = arg_39_1 % 60

	return string.format("%02d:%02d:%02d", var_39_0, var_39_1, arg_39_1)
end

function var_0_1.DescCDTimeForMinute(arg_40_0, arg_40_1)
	local var_40_0 = math.floor(arg_40_1 / 3600)

	arg_40_1 = arg_40_1 % 3600

	local var_40_1 = math.floor(arg_40_1 / 60)

	arg_40_1 = arg_40_1 % 60

	return string.format("%02d:%02d", var_40_1, arg_40_1)
end

function var_0_1.parseTimeFrom(arg_41_0, arg_41_1)
	local var_41_0 = math.floor(arg_41_1 / var_0_3)
	local var_41_1 = math.fmod(math.floor(arg_41_1 / 3600), 24)
	local var_41_2 = math.fmod(math.floor(arg_41_1 / 60), 60)
	local var_41_3 = math.fmod(arg_41_1, 60)

	return var_41_0, var_41_1, var_41_2, var_41_3
end

function var_0_1.DiffDay(arg_42_0, arg_42_1, arg_42_2)
	return math.floor((arg_42_2 - arg_42_0._sAnchorTime) / var_0_3) - math.floor((arg_42_1 - arg_42_0._sAnchorTime) / var_0_3)
end

function var_0_1.IsSameDay(arg_43_0, arg_43_1, arg_43_2)
	return math.floor((arg_43_1 - arg_43_0._sAnchorTime) / var_0_3) == math.floor((arg_43_2 - arg_43_0._sAnchorTime) / var_0_3)
end

function var_0_1.IsSameWeek(arg_44_0, arg_44_1, arg_44_2)
	return math.floor((arg_44_1 - arg_44_0._sAnchorTime) / var_0_4) == math.floor((arg_44_2 - arg_44_0._sAnchorTime) / var_0_4)
end

function var_0_1.IsPassTimeByZero(arg_45_0, arg_45_1, arg_45_2)
	return arg_45_2 < math.fmod(arg_45_1 - arg_45_0._sAnchorTime, var_0_3)
end

function var_0_1.CalcMonthDays(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = 30

	if arg_46_2 == 2 then
		var_46_0 = (arg_46_1 % 4 == 0 and arg_46_1 % 100 ~= 0 or arg_46_1 % 400 == 0) and 29 or 28
	elseif _.include({
		1,
		3,
		5,
		7,
		8,
		10,
		12
	}, arg_46_2) then
		var_46_0 = 31
	end

	return var_46_0
end

function var_0_1.inPeriod(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_1 and type(arg_47_1) == "string" then
		return arg_47_1 == "always"
	end

	if not arg_47_1 or not arg_47_2 then
		return true
	end

	local function var_47_0(arg_48_0)
		return arg_48_0[1] * var_0_2 + arg_48_0[2] * 60 + arg_48_0[3]
	end

	local var_47_1 = (arg_47_0:GetServerTime() - arg_47_0._sAnchorTime) % var_0_3
	local var_47_2 = var_47_0(arg_47_1)
	local var_47_3 = var_47_0(arg_47_2)

	return var_47_2 <= var_47_1 and var_47_1 <= var_47_3
end

function var_0_1.inTime(arg_49_0, arg_49_1, arg_49_2)
	if not arg_49_1 then
		return true
	end

	if type(arg_49_1) == "string" then
		return arg_49_1 == "always"
	end

	if type(arg_49_1[1]) == "string" then
		arg_49_1 = {
			arg_49_1[2],
			arg_49_1[3]
		}
	end

	local function var_49_0(arg_50_0)
		return {
			year = arg_50_0[1][1],
			month = arg_50_0[1][2],
			day = arg_50_0[1][3],
			hour = arg_50_0[2][1],
			min = arg_50_0[2][2],
			sec = arg_50_0[2][3]
		}
	end

	local var_49_1

	if #arg_49_1 > 0 then
		var_49_1 = var_49_0(arg_49_1[1] or {
			{
				2000,
				1,
				1
			},
			{
				0,
				0,
				0
			}
		})
	end

	local var_49_2

	if #arg_49_1 > 1 then
		var_49_2 = var_49_0(arg_49_1[2] or {
			{
				2000,
				1,
				1
			},
			{
				0,
				0,
				0
			}
		})
	end

	local var_49_3

	if var_49_1 and var_49_2 then
		local var_49_4 = arg_49_2 or arg_49_0:GetServerTime()
		local var_49_5 = arg_49_0:Table2ServerTime(var_49_1)
		local var_49_6 = arg_49_0:Table2ServerTime(var_49_2)

		if var_49_4 < var_49_5 then
			return false, var_49_1
		end

		if var_49_6 < var_49_4 then
			return false, nil
		end

		var_49_3 = var_49_2
	end

	return true, var_49_3
end

function var_0_1.passTime(arg_51_0, arg_51_1)
	if not arg_51_1 then
		return true
	end

	local var_51_0 = (function(arg_52_0)
		local var_52_0 = {}

		var_52_0.year, var_52_0.month, var_52_0.day = unpack(arg_52_0[1])
		var_52_0.hour, var_52_0.min, var_52_0.sec = unpack(arg_52_0[2])

		return var_52_0
	end)(arg_51_1 or {
		{
			2000,
			1,
			1
		},
		{
			0,
			0,
			0
		}
	})

	if var_51_0 then
		return arg_51_0:GetServerTime() > arg_51_0:Table2ServerTime(var_51_0)
	end

	return true
end

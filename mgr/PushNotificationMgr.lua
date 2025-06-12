pg = pg or {}

local var_0_0 = pg

var_0_0.PushNotificationMgr = singletonClass("PushNotificationMgr")

local var_0_1 = var_0_0.PushNotificationMgr

var_0_1.PUSH_TYPE_EVENT = 1
var_0_1.PUSH_TYPE_GOLD = 2
var_0_1.PUSH_TYPE_OIL = 3
var_0_1.PUSH_TYPE_BACKYARD = 4
var_0_1.PUSH_TYPE_SCHOOL = 5
var_0_1.PUSH_TYPE_CLASS = 6
var_0_1.PUSH_TYPE_TECHNOLOGY = 7
var_0_1.PUSH_TYPE_BLUEPRINT = 8
var_0_1.PUSH_TYPE_COMMANDER = 9
var_0_1.PUSH_TYPE_GUILD_MISSION_FORMATION = 10

local var_0_2 = {}
local var_0_3 = false

function var_0_1.Init(arg_1_0)
	var_0_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_0_0.push_data_template) do
		local var_1_0 = PlayerPrefs.GetInt("push_setting_" .. iter_1_1.id)

		var_0_2[iter_1_1.id] = var_1_0 == 0
	end

	var_0_3 = PlayerPrefs.GetInt("setting_ship_name") == 1
end

function var_0_1.Reset(arg_2_0)
	var_0_2 = {}

	for iter_2_0, iter_2_1 in ipairs(var_0_0.push_data_template) do
		PlayerPrefs.SetInt("push_setting_" .. iter_2_1.id, 0)

		var_0_2[iter_2_1.id] = true
	end

	PlayerPrefs.SetInt("setting_ship_name", 0)

	var_0_3 = false
end

function var_0_1.setSwitch(arg_3_0, arg_3_1, arg_3_2)
	if not var_0_0.push_data_template[arg_3_1] then
		return
	end

	var_0_2[arg_3_1] = arg_3_2

	PlayerPrefs.SetInt("push_setting_" .. arg_3_1, arg_3_2 and 0 or 1)
end

function var_0_1.setSwitchShipName(arg_4_0, arg_4_1)
	var_0_3 = arg_4_1

	PlayerPrefs.SetInt("setting_ship_name", arg_4_1 and 1 or 0)
end

function var_0_1.isEnabled(arg_5_0, arg_5_1)
	return var_0_2[arg_5_1]
end

function var_0_1.isEnableShipName(arg_6_0)
	return var_0_3
end

local var_0_4 = {}

function var_0_1.Push(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = arg_7_3 - var_0_0.TimeMgr.GetInstance():GetServerTime()
	local var_7_1 = os.time() + var_7_0

	arg_7_0:log(arg_7_1, arg_7_2, var_7_1)

	local var_7_2 = {
		title = arg_7_1,
		content = arg_7_2,
		offsetSecond = var_7_0
	}

	table.insert(var_0_4, var_7_2)
end

function var_0_1.PushCache(arg_8_0)
	for iter_8_0, iter_8_1 in ipairs(var_0_4) do
		local var_8_0 = iter_8_0
		local var_8_1 = iter_8_1.title
		local var_8_2 = iter_8_1.content
		local var_8_3 = iter_8_1.offsetSecond * 1000

		YSNormalTool.NotificationTool.ScheduleNotification(var_8_0, var_8_1, var_8_2, var_8_3, "ys_icon_notification")
	end
end

function var_0_1.cancelAll(arg_9_0)
	originalPrint("取消通知")
	YSNormalTool.NotificationTool.CancelAllNotification()

	var_0_4 = {}
end

function var_0_1.PushAll(arg_10_0)
	local var_10_0 = getProxy(PlayerProxy)

	if var_10_0 and var_10_0:getInited() then
		if not PUSH_NOTIFICATION_TEST_TAG then
			arg_10_0:cancelAll()
		end

		if var_0_2[var_0_1.PUSH_TYPE_EVENT] then
			arg_10_0:PushEvent()
		end

		if var_0_2[var_0_1.PUSH_TYPE_GOLD] then
			arg_10_0:PushGold()
		end

		if var_0_2[var_0_1.PUSH_TYPE_OIL] then
			arg_10_0:PushOil()
		end

		if var_0_2[var_0_1.PUSH_TYPE_BACKYARD] then
			arg_10_0:PushBackyard()
		end

		if var_0_2[var_0_1.PUSH_TYPE_SCHOOL] then
			arg_10_0:PushSchool()
		end

		if var_0_2[var_0_1.PUSH_TYPE_TECHNOLOGY] then
			arg_10_0:PushTechnlogy()
		end

		if var_0_2[var_0_1.PUSH_TYPE_BLUEPRINT] then
			arg_10_0:PushBluePrint()
		end

		if var_0_2[var_0_1.PUSH_TYPE_COMMANDER] then
			arg_10_0:PushCommander()
		end

		if var_0_2[var_0_1.PUSH_TYPE_GUILD_MISSION_FORMATION] then
			arg_10_0:PushGuildMissionFormation()
		end

		arg_10_0:PushCache()
	end
end

function var_0_1.PushEvent(arg_11_0)
	local var_11_0 = getProxy(EventProxy):getActiveEvents()
	local var_11_1 = var_0_0.push_data_template[arg_11_0.PUSH_TYPE_EVENT]

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		local var_11_2 = string.gsub(var_11_1.content, "$1", iter_11_1.template.title)

		arg_11_0:Push(var_11_1.title, var_11_2, iter_11_1.finishTime)
	end
end

function var_0_1.PushGold(arg_12_0)
	local var_12_0 = getProxy(NavalAcademyProxy):GetGoldVO()
	local var_12_1 = var_12_0:bindConfigTable()
	local var_12_2 = var_12_0:GetLevel()
	local var_12_3 = var_12_1[var_12_2].store
	local var_12_4 = var_12_1[var_12_2].production
	local var_12_5 = var_12_1[var_12_2].hour_time
	local var_12_6 = getProxy(PlayerProxy).data
	local var_12_7 = var_12_6.resUpdateTm
	local var_12_8 = var_12_6.goldField

	if var_12_8 < var_12_3 then
		local var_12_9 = var_12_7 + (var_12_3 - var_12_8) / var_12_4 * 60 * 60 / 3

		if var_12_9 > var_0_0.TimeMgr.GetInstance():GetServerTime() then
			local var_12_10 = var_0_0.push_data_template[arg_12_0.PUSH_TYPE_GOLD]

			arg_12_0:Push(var_12_10.title, var_12_10.content, var_12_9)
		end
	end
end

function var_0_1.PushOil(arg_13_0)
	local var_13_0 = getProxy(NavalAcademyProxy):GetOilVO()
	local var_13_1 = var_13_0:bindConfigTable()
	local var_13_2 = var_13_0:GetLevel()
	local var_13_3 = var_13_1[var_13_2].store
	local var_13_4 = var_13_1[var_13_2].production
	local var_13_5 = var_13_1[var_13_2].hour_time
	local var_13_6 = getProxy(PlayerProxy).data
	local var_13_7 = var_13_6.resUpdateTm
	local var_13_8 = var_13_6.oilField

	if var_13_8 < var_13_3 then
		local var_13_9 = var_13_7 + (var_13_3 - var_13_8) / var_13_4 * 60 * 60 / 3

		if var_13_9 > var_0_0.TimeMgr.GetInstance():GetServerTime() then
			local var_13_10 = var_0_0.push_data_template[arg_13_0.PUSH_TYPE_OIL]

			arg_13_0:Push(var_13_10.title, var_13_10.content, var_13_9)
		end
	end
end

function var_0_1.PushBackyard(arg_14_0)
	local var_14_0 = getProxy(DormProxy):getRawData():getFoodLeftTime()

	if var_14_0 > var_0_0.TimeMgr.GetInstance():GetServerTime() then
		local var_14_1 = var_0_0.push_data_template[arg_14_0.PUSH_TYPE_BACKYARD]

		arg_14_0:Push(var_14_1.title, var_14_1.content, var_14_0)
	end
end

function var_0_1.PushSchool(arg_15_0)
	local var_15_0 = getProxy(NavalAcademyProxy):getStudents()
	local var_15_1 = var_0_0.push_data_template[arg_15_0.PUSH_TYPE_SCHOOL]
	local var_15_2 = getProxy(BayProxy):getData()

	for iter_15_0, iter_15_1 in ipairs(var_15_0) do
		if iter_15_1.finishTime > var_0_0.TimeMgr.GetInstance():GetServerTime() then
			local var_15_3 = var_15_2[iter_15_1.shipId]
			local var_15_4 = iter_15_1:getSkillId(var_15_3)
			local var_15_5 = var_15_3.skills[var_15_4]
			local var_15_6 = var_15_3:getName()
			local var_15_7 = getSkillName(iter_15_1:getSkillId(var_15_3))
			local var_15_8 = string.gsub(var_15_1.content, "$1", var_15_6)
			local var_15_9 = string.gsub(var_15_8, "$2", var_15_7)

			arg_15_0:Push(var_15_1.title, var_15_9, iter_15_1.finishTime)
		end
	end
end

function var_0_1.PushTechnlogy(arg_16_0)
	local var_16_0 = var_0_0.push_data_template[var_0_1.PUSH_TYPE_TECHNOLOGY]
	local var_16_1 = getProxy(TechnologyProxy)

	if var_16_0 and var_16_1 then
		local var_16_2 = var_16_1:getPlanningTechnologys()

		if #var_16_2 > 0 and not var_16_2[#var_16_2]:isFinish() then
			arg_16_0:Push(var_16_0.title, var_16_0.content, var_16_2[#var_16_2].time)
		end
	end
end

function var_0_1.PushBluePrint(arg_17_0)
	local var_17_0 = var_0_0.push_data_template[var_0_1.PUSH_TYPE_BLUEPRINT]
	local var_17_1 = getProxy(TechnologyProxy)
	local var_17_2 = getProxy(TaskProxy)

	if var_17_0 and var_17_1 and var_17_2 then
		local var_17_3 = var_17_1:getBuildingBluePrint()

		if var_17_3 then
			local var_17_4 = var_17_3:getTaskIds()

			for iter_17_0, iter_17_1 in ipairs(var_17_4) do
				local var_17_5 = var_17_3:getTaskOpenTimeStamp(iter_17_1)

				if var_17_5 > var_0_0.TimeMgr.GetInstance():GetServerTime() then
					local var_17_6 = var_17_2:getTaskById(iter_17_1) or var_17_2:getFinishTaskById(iter_17_1)
					local var_17_7 = var_17_2:isFinishPrevTasks(iter_17_1)

					if not var_17_6 and var_17_7 then
						local var_17_8 = var_17_3:getShipVO()
						local var_17_9 = string.gsub(var_17_0.content, "$1", var_17_8:getConfig("name"))

						arg_17_0:Push(var_17_0.title, var_17_9, var_17_5)
					end
				end
			end
		end
	end
end

function var_0_1.PushCommander(arg_18_0)
	local var_18_0 = var_0_0.push_data_template[var_0_1.PUSH_TYPE_COMMANDER]
	local var_18_1 = getProxy(CommanderProxy)

	if var_18_0 and var_18_1 then
		local var_18_2 = var_18_1:getBoxes()

		for iter_18_0, iter_18_1 in pairs(var_18_2) do
			if iter_18_1:getState() == CommanderBox.STATE_STARTING then
				local var_18_3 = var_18_0.content

				arg_18_0:Push(var_18_0.title, var_18_3, iter_18_1.finishTime)

				break
			end
		end
	end
end

function var_0_1.PushGuildMissionFormation(arg_19_0)
	local var_19_0 = getProxy(GuildProxy):getRawData()

	if not var_19_0 then
		return
	end

	local var_19_1 = var_19_0:GetActiveEvent()

	if not var_19_1 or var_19_1 and not var_19_1:IsParticipant() then
		return
	end

	local var_19_2 = var_19_1:GetUnlockMission()

	if not var_19_2 then
		return
	end

	local var_19_3 = var_19_2:GetNextFormationTime()

	if var_19_3 <= var_0_0.TimeMgr.GetInstance():GetServerTime() then
		return
	end

	local var_19_4 = var_0_0.push_data_template[var_0_1.PUSH_TYPE_GUILD_MISSION_FORMATION]

	arg_19_0:Push(var_19_4.title, var_19_4.content, var_19_3)
end

function var_0_1.log(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_3 - os.time()
	local var_20_1 = var_0_0.TimeMgr.GetInstance():CTimeDescC(arg_20_3)

	originalPrint(var_20_1, "-", arg_20_1, " - ", arg_20_2, " - ", var_20_0, "s后推送")
end

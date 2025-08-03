local var_0_0 = class("ActivityProxy", import(".NetProxy"))

var_0_0.ACTIVITY_ADDED = "ActivityProxy ACTIVITY_ADDED"
var_0_0.ACTIVITY_UPDATED = "ActivityProxy ACTIVITY_UPDATED"
var_0_0.ACTIVITY_DELETED = "ActivityProxy ACTIVITY_DELETED"
var_0_0.ACTIVITY_END = "ActivityProxy ACTIVITY_END"
var_0_0.ACTIVITY_OPERATION_DONE = "ActivityProxy ACTIVITY_OPERATION_DONE"
var_0_0.ACTIVITY_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOW_AWARDS"
var_0_0.ACTIVITY_SHOP_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOP_SHOW_AWARDS"
var_0_0.ACTIVITY_SHOW_BB_RESULT = "ActivityProxy ACTIVITY_SHOW_BB_RESULT"
var_0_0.ACTIVITY_LOTTERY_SHOW_AWARDS = "ActivityProxy ACTIVITY_LOTTERY_SHOW_AWARDS"
var_0_0.ACTIVITY_HITMONSTER_SHOW_AWARDS = "ActivityProxy ACTIVITY_HITMONSTER_SHOW_AWARDS"
var_0_0.ACTIVITY_SHOW_REFLUX_AWARDS = "ActivityProxy ACTIVITY_SHOW_REFLUX_AWARDS"
var_0_0.ACTIVITY_OPERATION_ERRO = "ActivityProxy ACTIVITY_OPERATION_ERRO"
var_0_0.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT = "ActivityProxy ACTIVITY_SHOW_LOTTERY_AWARD_RESULT"
var_0_0.ACTIVITY_SHOW_RED_PACKET_AWARDS = "ActivityProxy ACTIVITY_SHOW_RED_PACKET_AWARDS"
var_0_0.ACTIVITY_SHOW_SHAKE_BEADS_RESULT = "ActivityProxy ACTIVITY_SHOW_SHAKE_BEADS_RESULT"
var_0_0.ACTIVITY_EXCHANGE_RESOURCES = "ActivityProxy ACTIVITY_EXCHANGE_RESOURCES"
var_0_0.ACTIVITY_PT_ID = 110

function var_0_0.register(arg_1_0)
	arg_1_0:on(11200, function(arg_2_0)
		arg_1_0.data = {}
		arg_1_0.params = {}
		arg_1_0.hxList = {}
		arg_1_0.stopList = {}

		if arg_2_0.hx_list then
			for iter_2_0, iter_2_1 in ipairs(arg_2_0.hx_list) do
				table.insert(arg_1_0.hxList, iter_2_1)
			end
		end

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.activity_list) do
			if not pg.activity_template[iter_2_3.id] then
				Debugger.LogError("活动acvitity_template不存在: " .. iter_2_3.id)
			else
				local var_2_0 = Activity.Create(iter_2_3)
				local var_2_1 = var_2_0:getConfig("type")

				if var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
					if var_2_0:checkBattleTimeInBossAct() then
						arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
					end
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_CHALLENGE then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_PARAMETER then
					arg_1_0:addActivityParameter(var_2_0)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE then
					arg_1_0:CheckDailyEventRequest(var_2_0)
				end

				arg_1_0.data[iter_2_3.id] = var_2_0
			end
		end

		local var_2_2 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE)

		if var_2_2 and not var_2_2:isEnd() then
			arg_1_0:sendNotification(GAME.CHALLENGE2_INFO, {})
		end

		local var_2_3 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR)

		if var_2_3 and not var_2_3:isEnd() and var_2_3.data1 == 0 then
			arg_1_0:monitorTaskList(var_2_3)
		end

		local var_2_4 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

		if var_2_4 and not var_2_4:isEnd() then
			local var_2_5 = arg_1_0.data[var_2_4.id]

			arg_1_0:InitActivityBossData(var_2_5)
		end

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inElite")
		;(function()
			local var_3_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

			if not var_3_0 then
				return
			end

			arg_1_0:sendNotification(GAME.REQUEST_ATELIER, var_3_0.id)
		end)()

		local var_2_6 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT)

		if var_2_6 and not var_2_6:isEnd() then
			getProxy(EventProxy):CheckAddActivityEvent()
		end

		BuffHelper.GetAllBuff()
	end)
	arg_1_0:on(11201, function(arg_4_0)
		local var_4_0 = Activity.Create(arg_4_0.activity_info)

		assert(var_4_0.id, "should exist activity")

		local var_4_1 = var_4_0:getConfig("type")

		if var_4_1 == ActivityConst.ACTIVITY_TYPE_PARAMETER then
			arg_1_0:addActivityParameter(var_4_0)
		end

		if not arg_1_0.data[var_4_0.id] then
			arg_1_0:addActivity(var_4_0)
		else
			arg_1_0:updateActivity(var_4_0)
		end

		if var_4_1 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			arg_1_0:InitActtivityFleet(var_4_0, arg_4_0.activity_info)
			arg_1_0:InitActivityBossData(var_4_0)
		end

		arg_1_0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
			activity = var_4_0
		})
	end)
	arg_1_0:on(40009, function(arg_5_0)
		local var_5_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)
		local var_5_1

		if var_5_0 then
			var_5_1 = var_5_0:GetSeriesData()
		end

		local var_5_2 = BossRushSettlementCommand.ConcludeEXP(arg_5_0, var_5_0, var_5_1 and var_5_1:GetBattleStatistics())

		;(function()
			arg_1_0:GetBossRushRuntime(var_5_0.id).settlementData = var_5_2
		end)()
	end)
	arg_1_0:on(24100, function(arg_7_0)
		(function()
			local var_8_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK)

			if not var_8_0 then
				return
			end

			var_8_0:Record(arg_7_0.score)
			arg_1_0:updateActivity(var_8_0)
		end)()

		local var_7_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)

		if not var_7_0 then
			return
		end

		local var_7_1 = var_7_0:GetSeriesData()

		if not var_7_1 then
			return
		end

		var_7_1:AddEXScore(arg_7_0)
		arg_1_0:updateActivity(var_7_0)
	end)
	arg_1_0:on(11028, function(arg_9_0)
		print("接受到问卷状态", arg_9_0.result)

		if arg_9_0.result == 0 then
			arg_1_0:setSurveyState(arg_9_0.result)
		elseif arg_9_0.result > 0 then
			arg_1_0:setSurveyState(arg_9_0.result)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_9_0.result))
		end
	end)
	arg_1_0:on(26033, function(arg_10_0)
		local var_10_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

		if not var_10_0 then
			return
		end

		local var_10_1 = arg_10_0.point
		local var_10_2 = var_10_0:UpdateHighestScore(var_10_1)

		arg_1_0:GetActivityBossRuntime(var_10_0.id).spScore = {
			score = var_10_1,
			new = var_10_2
		}

		arg_1_0:updateActivity(var_10_0)
	end)

	arg_1_0.requestTime = {}
	arg_1_0.extraDatas = {}
end

function var_0_0.remove(arg_11_0)
	BuffHelper.ClearAllCache()
end

function var_0_0.timeCall(arg_12_0)
	return {
		[ProxyRegister.DayCall] = function(arg_13_0)
			for iter_13_0, iter_13_1 in pairs(arg_12_0.data) do
				if not iter_13_1:isEnd() then
					switch(iter_13_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = function()
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_REFLUX] = function()
							iter_13_1.data1KeyValueList = {
								{}
							}
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function()
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BB] = function()
							iter_13_1.data2 = 0
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
							iter_13_1.data2 = 0
							iter_13_1.autoActionForbidden = false

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
							local var_21_0 = iter_13_1:GetUsedBonus()

							table.Foreach(var_21_0, function(arg_22_0, arg_22_1)
								var_21_0[arg_22_0] = 0
							end)
							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
							local var_23_0 = iter_13_1:GetDailyCounts()

							table.Foreach(var_23_0, function(arg_24_0, arg_24_1)
								var_23_0[arg_24_0] = 0
							end)
							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function()
							arg_12_0:sendNotification(GAME.ACT_MANUAL_SIGN, {
								activity_id = iter_13_1.id,
								cmd = ManualSignActivity.OP_SIGN
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
							local var_27_0 = iter_13_1:getConfig("config_id")
							local var_27_1 = pg.activity_event_turning[var_27_0]

							if var_27_1.total_num <= iter_13_1.data3 then
								return
							end

							local var_27_2 = var_27_1.task_table[iter_13_1.data4]

							if not var_27_2 then
								return
							end

							local var_27_3 = getProxy(TaskProxy)

							for iter_27_0, iter_27_1 in ipairs(var_27_2) do
								if (var_27_3:getTaskById(iter_27_1) or var_27_3:getFinishTaskById(iter_27_1)):getTaskStatus() ~= 2 then
									return
								end
							end

							arg_12_0:sendNotification(GAME.ACTIVITY_OPERATION, {
								cmd = 2,
								activity_id = iter_13_1.id
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function()
							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_CHALLENGE] = function()
							arg_12_0:sendNotification(GAME.CHALLENGE2_INFO, {})
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
							local var_30_0 = iter_13_1.data1KeyValueList[1]
							local var_30_1 = pg.activity_event_worldboss[iter_13_1:getConfig("config_id")]

							if var_30_1 then
								for iter_30_0, iter_30_1 in ipairs(var_30_1.normal_expedition_drop_num or {}) do
									for iter_30_2, iter_30_3 in ipairs(iter_30_1[1]) do
										var_30_0[iter_30_3] = iter_30_1[2] or 0
									end
								end
							end

							arg_12_0:updateActivity(iter_13_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_RANDOM_DAILY_TASK] = function()
							local var_31_0 = pg.TimeMgr.GetInstance():GetServerTime()

							if pg.TimeMgr.GetInstance():IsSameDay(iter_13_1.data1, var_31_0) then
								return
							end

							pg.m02:sendNotification(GAME.ACT_RANDOM_DAILY_TASK, {
								activity_id = iter_13_1.id,
								cmd = ActivityConst.RANDOM_DAILY_TASK_OP_RANDOM
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = function()
							arg_12_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
								actId = iter_13_1.id
							})
						end
					})
				end
			end
		end,
		[ProxyRegister.SecondCall] = function(arg_33_0)
			for iter_33_0, iter_33_1 in pairs(arg_12_0.data) do
				if not iter_33_1:isEnd() then
					switch(iter_33_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_TOWN] = function()
							iter_33_1:UpdateTime()
						end
					})
				end
			end

			if not arg_12_0.stopList then
				return
			end

			local var_33_0 = pg.TimeMgr.GetInstance():GetServerTime()

			while #arg_12_0.stopList > 0 and var_33_0 >= arg_12_0.stopList[1][1] do
				local var_33_1, var_33_2 = unpack(table.remove(arg_12_0.stopList, 1))

				if arg_12_0.data[var_33_2]:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
					getProxy(MilitaryExerciseProxy):setSeasonOver()
				end

				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
				arg_12_0:sendNotification(var_0_0.ACTIVITY_END, var_33_2)
			end
		end
	}
end

function var_0_0.getAliveActivityByType(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.data) do
		if iter_35_1:getConfig("type") == arg_35_1 and not iter_35_1:isEnd() then
			return iter_35_1
		end
	end
end

function var_0_0.getActivityByType(arg_36_0, arg_36_1)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.data) do
		if iter_36_1:getConfig("type") == arg_36_1 then
			return iter_36_1
		end
	end
end

function var_0_0.getActivitiesByType(arg_37_0, arg_37_1)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_0.data) do
		if iter_37_1:getConfig("type") == arg_37_1 then
			table.insert(var_37_0, iter_37_1)
		end
	end

	return var_37_0
end

function var_0_0.getActivitiesByTypes(arg_38_0, arg_38_1)
	local var_38_0 = {}

	for iter_38_0, iter_38_1 in pairs(arg_38_0.data) do
		if table.contains(arg_38_1, iter_38_1:getConfig("type")) then
			table.insert(var_38_0, iter_38_1)
		end
	end

	return var_38_0
end

function var_0_0.getMilitaryExerciseActivity(arg_39_0)
	local var_39_0

	for iter_39_0, iter_39_1 in pairs(arg_39_0.data) do
		if iter_39_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			var_39_0 = iter_39_1

			break
		end
	end

	return Clone(var_39_0)
end

function var_0_0.getPanelActivities(arg_40_0)
	local function var_40_0(arg_41_0)
		local var_41_0 = arg_41_0:getConfig("type")
		local var_41_1 = arg_41_0:isShow() and not arg_41_0:isAfterShow() and arg_41_0:isCorePage("")

		if var_41_1 then
			if var_41_0 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				var_41_1 = arg_41_0.data2 == 0
			elseif var_41_0 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				var_41_1 = arg_41_0.data1 < 7 or not arg_41_0.achieved
			end
		end

		return var_41_1 and not arg_41_0:isEnd()
	end

	local var_40_1 = {}

	for iter_40_0, iter_40_1 in pairs(arg_40_0.data) do
		if var_40_0(iter_40_1) then
			table.insert(var_40_1, iter_40_1)
		end
	end

	table.sort(var_40_1, CompareFuncs({
		function(arg_42_0)
			return -arg_42_0:getConfig("login_pop")
		end,
		function(arg_43_0)
			return arg_43_0.id
		end
	}))

	return var_40_1
end

function var_0_0.getCorePanelActivity(arg_44_0, arg_44_1)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in pairs(arg_44_0.data) do
		if iter_44_1:isShow() and iter_44_1:isCorePage(arg_44_1) then
			table.insert(var_44_0, iter_44_1)
		end
	end

	table.sort(var_44_0, CompareFuncs({
		function(arg_45_0)
			return -arg_45_0:getConfig("login_pop")
		end,
		function(arg_46_0)
			return arg_46_0.id
		end
	}))

	return var_44_0
end

function var_0_0.checkHxActivity(arg_47_0, arg_47_1)
	if arg_47_0.hxList and #arg_47_0.hxList > 0 then
		for iter_47_0 = 1, #arg_47_0.hxList do
			if arg_47_0.hxList[iter_47_0] == arg_47_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_48_0)
	return _(pg.activity_banner.all):chain():map(function(arg_49_0)
		return pg.activity_banner[arg_49_0]
	end):filter(function(arg_50_0)
		return pg.TimeMgr.GetInstance():inTime(arg_50_0.time) and arg_50_0.type ~= GAMEUI_BANNER_9 and arg_50_0.type ~= GAMEUI_BANNER_11 and arg_50_0.type ~= GAMEUI_BANNER_10 and arg_50_0.type ~= GAMEUI_BANNER_12 and arg_50_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_51_0, arg_51_1)
	local var_51_0 = pg.activity_banner.get_id_list_by_type[arg_51_1]

	if not var_51_0 then
		return nil
	end

	for iter_51_0, iter_51_1 in ipairs(var_51_0) do
		local var_51_1 = pg.activity_banner[iter_51_1]

		if pg.TimeMgr.GetInstance():inTime(var_51_1.time) then
			return var_51_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_52_0)
	return _.map(pg.activity_banner_notice.all, function(arg_53_0)
		return pg.activity_banner_notice[arg_53_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_54_0)
	local var_54_0
	local var_54_1 = pg.TimeMgr.GetInstance()
	local var_54_2 = var_54_1:GetServerTime()

	for iter_54_0, iter_54_1 in ipairs(arg_54_0:getPanelActivities()) do
		if not iter_54_1.autoActionForbidden then
			local var_54_3 = iter_54_1:getConfig("type")

			if var_54_3 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_54_4 = iter_54_1:getConfig("config_id")
				local var_54_5 = pg.activity_7_day_sign[var_54_4].front_drops

				if iter_54_1.data1 < #var_54_5 and not var_54_1:IsSameDay(var_54_2, iter_54_1.data2) and var_54_2 > iter_54_1.data2 then
					var_54_0 = iter_54_1

					break
				end
			elseif var_54_3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_54_6 = getProxy(ChapterProxy)

				if iter_54_1.data1 < 7 and not var_54_1:IsSameDay(var_54_2, iter_54_1.data2) or iter_54_1.data1 == 7 and not iter_54_1.achieved and var_54_6:isClear(204) then
					var_54_0 = iter_54_1

					break
				end
			elseif var_54_3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_54_7 = pg.TimeMgr.GetInstance():STimeDescS(var_54_2, "*t")

				iter_54_1:setSpecialData("reMonthSignDay", nil)

				if var_54_7.year ~= iter_54_1.data1 or var_54_7.month ~= iter_54_1.data2 then
					iter_54_1.data1 = var_54_7.year
					iter_54_1.data2 = var_54_7.month
					iter_54_1.data1_list = {}
					var_54_0 = iter_54_1

					break
				elseif not table.contains(iter_54_1.data1_list, var_54_7.day) then
					var_54_0 = iter_54_1

					break
				elseif var_54_7.day > #iter_54_1.data1_list and pg.activity_month_sign[iter_54_1.data2].resign_count > iter_54_1.data3 then
					for iter_54_2 = var_54_7.day, 1, -1 do
						if not table.contains(iter_54_1.data1_list, iter_54_2) then
							iter_54_1:setSpecialData("reMonthSignDay", iter_54_2)

							break
						end
					end

					var_54_0 = iter_54_1
				end
			elseif iter_54_1.id == ActivityConst.SHADOW_PLAY_ID and iter_54_1.clientData1 == 0 then
				local var_54_8 = iter_54_1:getConfig("config_data")[1]
				local var_54_9 = getProxy(TaskProxy)
				local var_54_10 = var_54_9:getTaskById(var_54_8) or var_54_9:getFinishTaskById(var_54_8)

				if var_54_10 and not var_54_10:isReceive() then
					var_54_0 = iter_54_1

					break
				end
			end
		end
	end

	if not var_54_0 then
		for iter_54_3, iter_54_4 in pairs(arg_54_0.data) do
			if not iter_54_4:isShow() and iter_54_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_54_11 = iter_54_4:getConfig("config_id")
				local var_54_12 = pg.activity_7_day_sign[var_54_11].front_drops

				if iter_54_4.data1 < #var_54_12 and not var_54_1:IsSameDay(var_54_2, iter_54_4.data2) and var_54_2 > iter_54_4.data2 then
					var_54_0 = iter_54_4

					break
				end
			end
		end
	end

	return var_54_0
end

function var_0_0.findRefluxAutoActivity(arg_55_0)
	local var_55_0 = arg_55_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_55_0 and not var_55_0:isEnd() and not var_55_0.autoActionForbidden then
		local var_55_1 = pg.TimeMgr.GetInstance()

		if var_55_0.data1_list[2] < #pg.return_sign_template.all and not var_55_1:IsSameDay(var_55_1:GetServerTime(), var_55_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_56_0)
	local var_56_0 = arg_56_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_56_0 and not var_56_0:isEnd() then
		local var_56_1 = pg.return_pt_template

		for iter_56_0 = #var_56_1.all, 1, -1 do
			local var_56_2 = var_56_1.all[iter_56_0]
			local var_56_3 = var_56_1[var_56_2]

			if var_56_0.data3 >= var_56_3.pt_require and var_56_2 > var_56_0.data4 then
				return true
			end
		end

		local var_56_4 = getProxy(TaskProxy)
		local var_56_5 = _(var_56_0:getConfig("config_data")[7]):chain():map(function(arg_57_0)
			return arg_57_0[2]
		end):flatten():map(function(arg_58_0)
			return var_56_4:getTaskById(arg_58_0) or var_56_4:getFinishTaskById(arg_58_0) or false
		end):filter(function(arg_59_0)
			return not not arg_59_0
		end):value()

		if _.any(var_56_5, function(arg_60_0)
			return arg_60_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_61_0, arg_61_1)
	return Clone(arg_61_0.data[arg_61_1])
end

function var_0_0.RawGetActivityById(arg_62_0, arg_62_1)
	return arg_62_0.data[arg_62_1]
end

function var_0_0.updateActivity(arg_63_0, arg_63_1)
	assert(arg_63_0.data[arg_63_1.id], "activity should exist" .. arg_63_1.id)
	assert(isa(arg_63_1, Activity), "activity should instance of Activity")

	if arg_63_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_63_0 = pg.battlepass_event_pt[arg_63_1.id].target

		if arg_63_0.data[arg_63_1.id].data1 < var_63_0[#var_63_0] and arg_63_1.data1 - arg_63_0.data[arg_63_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_63_1.id].pt,
				ptCount = arg_63_1.data1 - arg_63_0.data[arg_63_1.id].data1
			})
		end
	end

	arg_63_0.data[arg_63_1.id] = arg_63_1

	arg_63_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_63_1:clone())
	arg_63_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_63_1.id
	})
	BuffHelper.GenBuffsForActivity(arg_63_1)
end

function var_0_0.addActivity(arg_64_0, arg_64_1)
	assert(arg_64_0.data[arg_64_1.id] == nil, "activity already exist" .. arg_64_1.id)
	assert(isa(arg_64_1, Activity), "activity should instance of Activity")

	arg_64_0.data[arg_64_1.id] = arg_64_1

	arg_64_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_64_1:clone())

	if arg_64_1.stopTime > 0 then
		table.insert(arg_64_0.stopList, {
			arg_64_1.stopTime,
			arg_64_1.id
		})
		table.sort(arg_64_0.stopList, CompareFuncs({
			function(arg_65_0)
				return arg_65_0[1]
			end
		}))
	end
end

function var_0_0.deleteActivityById(arg_66_0, arg_66_1)
	assert(arg_66_0.data[arg_66_1], "activity should exist" .. arg_66_1)

	arg_66_0.data[arg_66_1] = nil

	arg_66_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_66_1)

	local var_66_0 = table.getIndex(arg_66_0.stopList, function(arg_67_0)
		return arg_67_0[2] == arg_66_1
	end)

	if var_66_0 then
		table.remove(arg_66_0.stopList, var_66_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_68_0, arg_68_1)
	return arg_68_0.data[arg_68_1] and not arg_68_0.data[arg_68_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_69_0, arg_69_1)
	local var_69_0 = false
	local var_69_1 = arg_69_0:getActivitiesByType(arg_69_1)

	for iter_69_0, iter_69_1 in ipairs(var_69_1) do
		if iter_69_1:readyToAchieve() then
			var_69_0 = true

			break
		end
	end

	return var_69_0
end

function var_0_0.getBuildActivityCfgByID(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	})

	for iter_70_0, iter_70_1 in ipairs(var_70_0) do
		if not iter_70_1:isEnd() then
			local var_70_1 = iter_70_1:getConfig("config_client")

			if var_70_1 and var_70_1.id == arg_70_1 then
				return var_70_1
			end
		end
	end

	return nil
end

function var_0_0.getNoneActBuildActivityCfgByID(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
	})

	for iter_71_0, iter_71_1 in ipairs(var_71_0) do
		if not iter_71_1:isEnd() then
			local var_71_1 = iter_71_1:getConfig("config_client")

			if var_71_1 and var_71_1.id == arg_71_1 then
				return var_71_1
			end
		end
	end

	return nil
end

function var_0_0.getBuffShipList(arg_72_0)
	local var_72_0 = {}
	local var_72_1 = arg_72_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_72_1, function(arg_73_0)
		if arg_73_0 and not arg_73_0:isEnd() then
			local var_73_0 = arg_73_0:getConfig("config_id")
			local var_73_1 = pg.activity_expup_ship[var_73_0]

			if not var_73_1 then
				return
			end

			local var_73_2 = var_73_1.expup

			for iter_73_0, iter_73_1 in pairs(var_73_2) do
				var_72_0[iter_73_1[1]] = iter_73_1[2]
			end
		end
	end)

	return var_72_0
end

function var_0_0.getVirtualItemNumber(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_74_0 and not var_74_0:isEnd() then
		return var_74_0.data1KeyValueList[1][arg_74_1] and var_74_0.data1KeyValueList[1][arg_74_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_75_0, "vbagType invalid")

	if var_75_0 and not var_75_0:isEnd() then
		var_75_0.data1KeyValueList[1][arg_75_1] = var_75_0.data1KeyValueList[1][arg_75_1] - arg_75_2
	end

	arg_75_0:updateActivity(var_75_0)
end

function var_0_0.addVitemById(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = arg_76_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) or arg_76_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA)

	assert(var_76_0, "vbagType invalid")

	if var_76_0 and not var_76_0:isEnd() then
		if not var_76_0.data1KeyValueList[1][arg_76_1] then
			var_76_0.data1KeyValueList[1][arg_76_1] = 0
		end

		var_76_0.data1KeyValueList[1][arg_76_1] = var_76_0.data1KeyValueList[1][arg_76_1] + arg_76_2
	end

	arg_76_0:updateActivity(var_76_0)

	local var_76_1 = Item.getConfigData(arg_76_1).link_id

	if var_76_1 ~= 0 then
		local var_76_2 = arg_76_0:getActivityById(var_76_1)

		if var_76_2 and not var_76_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_76_2, arg_76_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_77_0, arg_77_1)
	if arg_77_1 and not arg_77_1:isEnd() and arg_77_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_77_0 = arg_77_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_77_0) then
			arg_77_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_77_1.id
			})
		end
	end
end

function var_0_0.InitActtivityFleet(arg_78_0, arg_78_1, arg_78_2)
	getProxy(FleetProxy):addActivityFleet(arg_78_1, arg_78_2.group_list)
end

function var_0_0.InitActivityBossData(arg_79_0, arg_79_1)
	local var_79_0 = pg.activity_event_worldboss[arg_79_1:getConfig("config_id")]

	if not var_79_0 then
		return
	end

	local var_79_1 = arg_79_1.data1KeyValueList

	for iter_79_0, iter_79_1 in pairs(var_79_0.normal_expedition_drop_num or {}) do
		for iter_79_2, iter_79_3 in pairs(iter_79_1[1]) do
			local var_79_2 = iter_79_1[2]
			local var_79_3 = var_79_1[1][iter_79_3] or 0

			var_79_1[1][iter_79_3] = math.max(var_79_2 - var_79_3, 0)
			var_79_1[2][iter_79_3] = var_79_1[2][iter_79_3] or 0
		end
	end
end

function var_0_0.RegisterRequestTime(arg_80_0, arg_80_1, arg_80_2)
	if not arg_80_1 or arg_80_1 <= 0 then
		return
	end

	arg_80_0.requestTime[arg_80_1] = arg_80_2
end

function var_0_0.addActivityParameter(arg_81_0, arg_81_1)
	local var_81_0 = arg_81_1:getConfig("config_data")
	local var_81_1 = arg_81_1.stopTime

	for iter_81_0, iter_81_1 in ipairs(var_81_0) do
		arg_81_0.params[iter_81_1[1]] = {
			iter_81_1[2],
			var_81_1
		}
	end
end

function var_0_0.getActivityParameter(arg_82_0, arg_82_1)
	if arg_82_0.params[arg_82_1] then
		local var_82_0, var_82_1 = unpack(arg_82_0.params[arg_82_1])

		if not (var_82_1 > 0) or not (var_82_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_82_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_83_0, arg_83_1)
	for iter_83_0, iter_83_1 in ipairs(arg_83_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_83_1 and not iter_83_1:isEnd() and iter_83_1.data1 > 0 and iter_83_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_83_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_83_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_83_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_84_0, arg_84_1)
	for iter_84_0, iter_84_1 in ipairs(arg_84_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_84_1:getConfig("config_data"), function(arg_85_0)
			return arg_85_0 == arg_84_1
		end) then
			return iter_84_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_86_0, arg_86_1)
	if arg_86_1:IsActivity() then
		return arg_86_0:getActivityById(arg_86_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_87_0)
	local var_87_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function(arg_88_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_89_0)
			return arg_89_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function(arg_90_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function(arg_91_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function(arg_92_0)
			return true
		end
	}
	local var_87_1 = {}

	for iter_87_0, iter_87_1 in pairs(arg_87_0.data) do
		if switch(iter_87_1:getConfig("type"), var_87_0, function(arg_93_0)
			return false
		end) and not iter_87_1:isEnd() and tobool(iter_87_1:getConfig("config_client").entrance_bg) then
			table.insert(var_87_1, iter_87_1)
		end
	end

	table.sort(var_87_1, CompareFuncs({
		function(arg_94_0)
			return arg_94_0:getConfig("config_client").order or 1
		end,
		function(arg_95_0)
			return -arg_95_0.id
		end
	}))

	return var_87_1
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_96_0)
	local var_96_0 = arg_96_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_96_0 or var_96_0:isEnd() then
		return false
	end

	local var_96_1 = var_96_0:GetSlots()

	for iter_96_0, iter_96_1 in pairs(var_96_1) do
		if iter_96_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = arg_97_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_97_0 or var_97_0:isEnd() then
		return false
	end

	local var_97_1 = var_97_0:GetItems()[arg_97_1]

	return var_97_1 and arg_97_2 <= var_97_1.count
end

function var_0_0.InitContinuousTime(arg_98_0, arg_98_1)
	arg_98_0.continuousOpeartionTime = arg_98_1
	arg_98_0.continuousOpeartionTotalTime = arg_98_1
end

function var_0_0.UseContinuousTime(arg_99_0)
	if not arg_99_0.continuousOpeartionTime then
		return
	end

	arg_99_0.continuousOpeartionTime = arg_99_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_100_0)
	return arg_100_0.continuousOpeartionTime, arg_100_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_101_0, arg_101_1)
	arg_101_0.bossrushAwards = arg_101_0.bossrushAwards or {}

	table.insertto(arg_101_0.bossrushAwards, arg_101_1)
end

function var_0_0.PopBossRushAwards(arg_102_0)
	local var_102_0 = arg_102_0.bossrushAwards or {}

	arg_102_0.bossrushAwards = nil

	return var_102_0
end

function var_0_0.GetBossRushRuntime(arg_103_0, arg_103_1)
	if not arg_103_0.extraDatas[arg_103_1] then
		arg_103_0.extraDatas[arg_103_1] = {
			record = 0
		}
	end

	return arg_103_0.extraDatas[arg_103_1]
end

function var_0_0.GetActivityBossRuntime(arg_104_0, arg_104_1)
	if not arg_104_0.extraDatas[arg_104_1] then
		arg_104_0.extraDatas[arg_104_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_104_0.extraDatas[arg_104_1]
end

function var_0_0.GetTaskActivities(arg_105_0)
	local var_105_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_106_0, arg_106_1)
		if not isa(arg_106_1, ITaskActivity) then
			return
		end

		table.insertto(var_105_0, arg_105_0:getActivitiesByType(arg_106_0))
	end)

	return var_105_0
end

function var_0_0.setSurveyState(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_107_0 and not var_107_0:isEnd() then
		arg_107_0.surveyState = arg_107_1
	end
end

function var_0_0.isSurveyDone(arg_108_0)
	local var_108_0 = arg_108_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_108_0 and not var_108_0:isEnd() then
		return arg_108_0.surveyState and arg_108_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_109_0)
	local var_109_0 = arg_109_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_109_0 and not var_109_0:isEnd() then
		local var_109_1 = var_109_0:getConfig("config_data")
		local var_109_2 = var_109_1[1]
		local var_109_3 = var_109_1[2]

		if var_109_2 == 1 then
			local var_109_4 = var_109_3 <= getProxy(PlayerProxy):getData().level
			local var_109_5 = var_109_0:getConfig("config_id")

			return var_109_4, var_109_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_110_0, arg_110_1)
	local var_110_0 = table.Find(arg_110_0.data, function(arg_111_0, arg_111_1)
		if arg_111_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_111_1:getDataConfig("link_id") == arg_110_1
	end)

	return var_110_0 and var_110_0.id
end

function var_0_0.CheckDailyEventRequest(arg_112_0, arg_112_1)
	if arg_112_1:CheckDailyEventRequest() then
		arg_112_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_112_1.id
		})
	end
end

return var_0_0

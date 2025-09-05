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

				if var_2_0.stopTime > 0 then
					table.insert(arg_1_0.stopList, {
						var_2_0.stopTime,
						var_2_0.id
					})
					table.sort(arg_1_0.stopList, CompareFuncs({
						function(arg_3_0)
							return arg_3_0[1]
						end
					}))
				end
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
			local var_4_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

			if not var_4_0 then
				return
			end

			arg_1_0:sendNotification(GAME.REQUEST_ATELIER, var_4_0.id)
		end)()

		local var_2_6 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT)

		if var_2_6 and not var_2_6:isEnd() then
			getProxy(EventProxy):CheckAddActivityEvent()
		end

		BuffHelper.GetAllBuff()
	end)
	arg_1_0:on(11201, function(arg_5_0)
		local var_5_0 = Activity.Create(arg_5_0.activity_info)

		assert(var_5_0.id, "should exist activity")

		local var_5_1 = var_5_0:getConfig("type")

		if var_5_1 == ActivityConst.ACTIVITY_TYPE_PARAMETER then
			arg_1_0:addActivityParameter(var_5_0)
		end

		if not arg_1_0.data[var_5_0.id] then
			arg_1_0:addActivity(var_5_0)
		else
			arg_1_0:updateActivity(var_5_0)
		end

		if var_5_1 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			arg_1_0:InitActtivityFleet(var_5_0, arg_5_0.activity_info)
			arg_1_0:InitActivityBossData(var_5_0)
		end

		arg_1_0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
			activity = var_5_0
		})
	end)
	arg_1_0:on(40009, function(arg_6_0)
		local var_6_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)
		local var_6_1

		if var_6_0 then
			var_6_1 = var_6_0:GetSeriesData()
		end

		local var_6_2 = BossRushSettlementCommand.ConcludeEXP(arg_6_0, var_6_0, var_6_1 and var_6_1:GetBattleStatistics())

		;(function()
			arg_1_0:GetBossRushRuntime(var_6_0.id).settlementData = var_6_2
		end)()
	end)
	arg_1_0:on(24100, function(arg_8_0)
		(function()
			local var_9_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK)

			if not var_9_0 then
				return
			end

			var_9_0:Record(arg_8_0.score)
			arg_1_0:updateActivity(var_9_0)
		end)()

		local var_8_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)

		if not var_8_0 then
			return
		end

		local var_8_1 = var_8_0:GetSeriesData()

		if not var_8_1 then
			return
		end

		var_8_1:AddEXScore(arg_8_0)
		arg_1_0:updateActivity(var_8_0)
	end)
	arg_1_0:on(11028, function(arg_10_0)
		print("接受到问卷状态", arg_10_0.result)

		if arg_10_0.result == 0 then
			arg_1_0:setSurveyState(arg_10_0.result)
		elseif arg_10_0.result > 0 then
			arg_1_0:setSurveyState(arg_10_0.result)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_10_0.result))
		end
	end)
	arg_1_0:on(26033, function(arg_11_0)
		local var_11_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

		if not var_11_0 then
			return
		end

		local var_11_1 = arg_11_0.point
		local var_11_2 = var_11_0:UpdateHighestScore(var_11_1)

		arg_1_0:GetActivityBossRuntime(var_11_0.id).spScore = {
			score = var_11_1,
			new = var_11_2
		}

		arg_1_0:updateActivity(var_11_0)
	end)

	arg_1_0.requestTime = {}
	arg_1_0.extraDatas = {}
end

function var_0_0.remove(arg_12_0)
	BuffHelper.ClearAllCache()
end

function var_0_0.timeCall(arg_13_0)
	return {
		[ProxyRegister.DayCall] = function(arg_14_0)
			for iter_14_0, iter_14_1 in pairs(arg_13_0.data) do
				if not iter_14_1:isEnd() then
					switch(iter_14_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = function()
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_REFLUX] = function()
							iter_14_1.data1KeyValueList = {
								{}
							}
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function()
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BB] = function()
							iter_14_1.data2 = 0
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
							iter_14_1.data2 = 0
							iter_14_1.autoActionForbidden = false

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
							local var_22_0 = iter_14_1:GetUsedBonus()

							table.Foreach(var_22_0, function(arg_23_0, arg_23_1)
								var_22_0[arg_23_0] = 0
							end)
							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
							local var_24_0 = iter_14_1:GetDailyCounts()

							table.Foreach(var_24_0, function(arg_25_0, arg_25_1)
								var_24_0[arg_25_0] = 0
							end)
							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function()
							arg_13_0:sendNotification(GAME.ACT_MANUAL_SIGN, {
								activity_id = iter_14_1.id,
								cmd = ManualSignActivity.OP_SIGN
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
							local var_28_0 = iter_14_1:getConfig("config_id")
							local var_28_1 = pg.activity_event_turning[var_28_0]

							if var_28_1.total_num <= iter_14_1.data3 then
								return
							end

							local var_28_2 = var_28_1.task_table[iter_14_1.data4]

							if not var_28_2 then
								return
							end

							local var_28_3 = getProxy(TaskProxy)

							for iter_28_0, iter_28_1 in ipairs(var_28_2) do
								if (var_28_3:getTaskById(iter_28_1) or var_28_3:getFinishTaskById(iter_28_1)):getTaskStatus() ~= 2 then
									return
								end
							end

							arg_13_0:sendNotification(GAME.ACTIVITY_OPERATION, {
								cmd = 2,
								activity_id = iter_14_1.id
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function()
							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_CHALLENGE] = function()
							arg_13_0:sendNotification(GAME.CHALLENGE2_INFO, {})
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
							local var_31_0 = iter_14_1.data1KeyValueList[1]
							local var_31_1 = pg.activity_event_worldboss[iter_14_1:getConfig("config_id")]

							if var_31_1 then
								for iter_31_0, iter_31_1 in ipairs(var_31_1.normal_expedition_drop_num or {}) do
									for iter_31_2, iter_31_3 in ipairs(iter_31_1[1]) do
										var_31_0[iter_31_3] = iter_31_1[2] or 0
									end
								end
							end

							arg_13_0:updateActivity(iter_14_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_RANDOM_DAILY_TASK] = function()
							local var_32_0 = pg.TimeMgr.GetInstance():GetServerTime()

							if pg.TimeMgr.GetInstance():IsSameDay(iter_14_1.data1, var_32_0) then
								return
							end

							pg.m02:sendNotification(GAME.ACT_RANDOM_DAILY_TASK, {
								activity_id = iter_14_1.id,
								cmd = ActivityConst.RANDOM_DAILY_TASK_OP_RANDOM
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = function()
							arg_13_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
								actId = iter_14_1.id
							})
						end
					})
				end
			end
		end,
		[ProxyRegister.SecondCall] = function(arg_34_0)
			for iter_34_0, iter_34_1 in pairs(arg_13_0.data) do
				if not iter_34_1:isEnd() then
					switch(iter_34_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_TOWN] = function()
							iter_34_1:UpdateTime()
						end
					})
				end
			end

			if not arg_13_0.stopList then
				return
			end

			local var_34_0 = pg.TimeMgr.GetInstance():GetServerTime()

			while #arg_13_0.stopList > 0 and var_34_0 >= arg_13_0.stopList[1][1] do
				local var_34_1, var_34_2 = unpack(table.remove(arg_13_0.stopList, 1))

				if arg_13_0.data[var_34_2]:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
					getProxy(MilitaryExerciseProxy):setSeasonOver()
				end

				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
				arg_13_0:sendNotification(var_0_0.ACTIVITY_END, var_34_2)
			end
		end
	}
end

function var_0_0.getAliveActivityByType(arg_36_0, arg_36_1)
	for iter_36_0, iter_36_1 in pairs(arg_36_0.data) do
		if iter_36_1:getConfig("type") == arg_36_1 and not iter_36_1:isEnd() then
			return iter_36_1
		end
	end
end

function var_0_0.getActivityByType(arg_37_0, arg_37_1)
	for iter_37_0, iter_37_1 in pairs(arg_37_0.data) do
		if iter_37_1:getConfig("type") == arg_37_1 then
			return iter_37_1
		end
	end
end

function var_0_0.getActivitiesByType(arg_38_0, arg_38_1)
	local var_38_0 = {}

	for iter_38_0, iter_38_1 in pairs(arg_38_0.data) do
		if iter_38_1:getConfig("type") == arg_38_1 then
			table.insert(var_38_0, iter_38_1)
		end
	end

	return var_38_0
end

function var_0_0.getActivitiesByTypes(arg_39_0, arg_39_1)
	local var_39_0 = {}

	for iter_39_0, iter_39_1 in pairs(arg_39_0.data) do
		if table.contains(arg_39_1, iter_39_1:getConfig("type")) then
			table.insert(var_39_0, iter_39_1)
		end
	end

	return var_39_0
end

function var_0_0.getMilitaryExerciseActivity(arg_40_0)
	local var_40_0

	for iter_40_0, iter_40_1 in pairs(arg_40_0.data) do
		if iter_40_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			var_40_0 = iter_40_1

			break
		end
	end

	return Clone(var_40_0)
end

function var_0_0.getPanelActivities(arg_41_0)
	local function var_41_0(arg_42_0)
		local var_42_0 = arg_42_0:getConfig("type")
		local var_42_1 = arg_42_0:isShow() and not arg_42_0:isAfterShow() and arg_42_0:isCorePage("")

		if var_42_1 then
			if var_42_0 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				var_42_1 = arg_42_0.data2 == 0
			elseif var_42_0 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				var_42_1 = arg_42_0.data1 < 7 or not arg_42_0.achieved
			end
		end

		return var_42_1 and not arg_42_0:isEnd()
	end

	local var_41_1 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0.data) do
		if var_41_0(iter_41_1) then
			table.insert(var_41_1, iter_41_1)
		end
	end

	table.sort(var_41_1, CompareFuncs({
		function(arg_43_0)
			return -arg_43_0:getConfig("login_pop")
		end,
		function(arg_44_0)
			return arg_44_0.id
		end
	}))

	return var_41_1
end

function var_0_0.getCorePanelActivity(arg_45_0, arg_45_1)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in pairs(arg_45_0.data) do
		if iter_45_1:isShow() and iter_45_1:isCorePage(arg_45_1) then
			table.insert(var_45_0, iter_45_1)
		end
	end

	table.sort(var_45_0, CompareFuncs({
		function(arg_46_0)
			return -arg_46_0:getConfig("login_pop")
		end,
		function(arg_47_0)
			return arg_47_0.id
		end
	}))

	return var_45_0
end

function var_0_0.checkHxActivity(arg_48_0, arg_48_1)
	if arg_48_0.hxList and #arg_48_0.hxList > 0 then
		for iter_48_0 = 1, #arg_48_0.hxList do
			if arg_48_0.hxList[iter_48_0] == arg_48_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_49_0)
	return _(pg.activity_banner.all):chain():map(function(arg_50_0)
		return pg.activity_banner[arg_50_0]
	end):filter(function(arg_51_0)
		return pg.TimeMgr.GetInstance():inTime(arg_51_0.time) and arg_51_0.type ~= GAMEUI_BANNER_9 and arg_51_0.type ~= GAMEUI_BANNER_11 and arg_51_0.type ~= GAMEUI_BANNER_10 and arg_51_0.type ~= GAMEUI_BANNER_12 and arg_51_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_52_0, arg_52_1)
	local var_52_0 = pg.activity_banner.get_id_list_by_type[arg_52_1]

	if not var_52_0 then
		return nil
	end

	for iter_52_0, iter_52_1 in ipairs(var_52_0) do
		local var_52_1 = pg.activity_banner[iter_52_1]

		if pg.TimeMgr.GetInstance():inTime(var_52_1.time) then
			return var_52_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_53_0)
	return _.map(pg.activity_banner_notice.all, function(arg_54_0)
		return pg.activity_banner_notice[arg_54_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_55_0)
	local var_55_0
	local var_55_1 = pg.TimeMgr.GetInstance()
	local var_55_2 = var_55_1:GetServerTime()

	for iter_55_0, iter_55_1 in ipairs(arg_55_0:getPanelActivities()) do
		if not iter_55_1.autoActionForbidden then
			local var_55_3 = iter_55_1:getConfig("type")

			if var_55_3 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_55_4 = iter_55_1:getConfig("config_id")
				local var_55_5 = pg.activity_7_day_sign[var_55_4].front_drops

				if iter_55_1.data1 < #var_55_5 and not var_55_1:IsSameDay(var_55_2, iter_55_1.data2) and var_55_2 > iter_55_1.data2 then
					var_55_0 = iter_55_1

					break
				end
			elseif var_55_3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_55_6 = getProxy(ChapterProxy)

				if iter_55_1.data1 < 7 and not var_55_1:IsSameDay(var_55_2, iter_55_1.data2) or iter_55_1.data1 == 7 and not iter_55_1.achieved and var_55_6:isClear(204) then
					var_55_0 = iter_55_1

					break
				end
			elseif var_55_3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_55_7 = pg.TimeMgr.GetInstance():STimeDescS(var_55_2, "*t")

				iter_55_1:setSpecialData("reMonthSignDay", nil)

				if var_55_7.year ~= iter_55_1.data1 or var_55_7.month ~= iter_55_1.data2 then
					iter_55_1.data1 = var_55_7.year
					iter_55_1.data2 = var_55_7.month
					iter_55_1.data1_list = {}
					var_55_0 = iter_55_1

					break
				elseif not table.contains(iter_55_1.data1_list, var_55_7.day) then
					var_55_0 = iter_55_1

					break
				elseif var_55_7.day > #iter_55_1.data1_list and pg.activity_month_sign[iter_55_1.data2].resign_count > iter_55_1.data3 then
					for iter_55_2 = var_55_7.day, 1, -1 do
						if not table.contains(iter_55_1.data1_list, iter_55_2) then
							iter_55_1:setSpecialData("reMonthSignDay", iter_55_2)

							break
						end
					end

					var_55_0 = iter_55_1
				end
			elseif iter_55_1.id == ActivityConst.SHADOW_PLAY_ID and iter_55_1.clientData1 == 0 then
				local var_55_8 = iter_55_1:getConfig("config_data")[1]
				local var_55_9 = getProxy(TaskProxy)
				local var_55_10 = var_55_9:getTaskById(var_55_8) or var_55_9:getFinishTaskById(var_55_8)

				if var_55_10 and not var_55_10:isReceive() then
					var_55_0 = iter_55_1

					break
				end
			end
		end
	end

	if not var_55_0 then
		for iter_55_3, iter_55_4 in pairs(arg_55_0.data) do
			if not iter_55_4:isShow() and iter_55_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_55_11 = iter_55_4:getConfig("config_id")
				local var_55_12 = pg.activity_7_day_sign[var_55_11].front_drops

				if iter_55_4.data1 < #var_55_12 and not var_55_1:IsSameDay(var_55_2, iter_55_4.data2) and var_55_2 > iter_55_4.data2 then
					var_55_0 = iter_55_4

					break
				end
			end
		end
	end

	return var_55_0
end

function var_0_0.findRefluxAutoActivity(arg_56_0)
	local var_56_0 = arg_56_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_56_0 and not var_56_0:isEnd() and not var_56_0.autoActionForbidden then
		local var_56_1 = pg.TimeMgr.GetInstance()

		if var_56_0.data1_list[2] < #pg.return_sign_template.all and not var_56_1:IsSameDay(var_56_1:GetServerTime(), var_56_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_57_0)
	local var_57_0 = arg_57_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_57_0 and not var_57_0:isEnd() then
		local var_57_1 = pg.return_pt_template

		for iter_57_0 = #var_57_1.all, 1, -1 do
			local var_57_2 = var_57_1.all[iter_57_0]
			local var_57_3 = var_57_1[var_57_2]

			if var_57_0.data3 >= var_57_3.pt_require and var_57_2 > var_57_0.data4 then
				return true
			end
		end

		local var_57_4 = getProxy(TaskProxy)
		local var_57_5 = _(var_57_0:getConfig("config_data")[7]):chain():map(function(arg_58_0)
			return arg_58_0[2]
		end):flatten():map(function(arg_59_0)
			return var_57_4:getTaskById(arg_59_0) or var_57_4:getFinishTaskById(arg_59_0) or false
		end):filter(function(arg_60_0)
			return not not arg_60_0
		end):value()

		if _.any(var_57_5, function(arg_61_0)
			return arg_61_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_62_0, arg_62_1)
	return Clone(arg_62_0.data[arg_62_1])
end

function var_0_0.RawGetActivityById(arg_63_0, arg_63_1)
	return arg_63_0.data[arg_63_1]
end

function var_0_0.updateActivity(arg_64_0, arg_64_1)
	assert(arg_64_0.data[arg_64_1.id], "activity should exist" .. arg_64_1.id)
	assert(isa(arg_64_1, Activity), "activity should instance of Activity")

	if arg_64_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_64_0 = pg.battlepass_event_pt[arg_64_1.id].target

		if arg_64_0.data[arg_64_1.id].data1 < var_64_0[#var_64_0] and arg_64_1.data1 - arg_64_0.data[arg_64_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_64_1.id].pt,
				ptCount = arg_64_1.data1 - arg_64_0.data[arg_64_1.id].data1
			})
		end
	end

	arg_64_0.data[arg_64_1.id] = arg_64_1

	arg_64_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_64_1:clone())
	arg_64_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_64_1.id
	})
	BuffHelper.GenBuffsForActivity(arg_64_1)
end

function var_0_0.addActivity(arg_65_0, arg_65_1)
	assert(arg_65_0.data[arg_65_1.id] == nil, "activity already exist" .. arg_65_1.id)
	assert(isa(arg_65_1, Activity), "activity should instance of Activity")

	arg_65_0.data[arg_65_1.id] = arg_65_1

	arg_65_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_65_1:clone())

	if arg_65_1.stopTime > 0 then
		table.insert(arg_65_0.stopList, {
			arg_65_1.stopTime,
			arg_65_1.id
		})
		table.sort(arg_65_0.stopList, CompareFuncs({
			function(arg_66_0)
				return arg_66_0[1]
			end
		}))
	end
end

function var_0_0.deleteActivityById(arg_67_0, arg_67_1)
	assert(arg_67_0.data[arg_67_1], "activity should exist" .. arg_67_1)

	arg_67_0.data[arg_67_1] = nil

	arg_67_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_67_1)

	local var_67_0 = table.getIndex(arg_67_0.stopList, function(arg_68_0)
		return arg_68_0[2] == arg_67_1
	end)

	if var_67_0 then
		table.remove(arg_67_0.stopList, var_67_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_69_0, arg_69_1)
	return arg_69_0.data[arg_69_1] and not arg_69_0.data[arg_69_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_70_0, arg_70_1)
	local var_70_0 = false
	local var_70_1 = arg_70_0:getActivitiesByType(arg_70_1)

	for iter_70_0, iter_70_1 in ipairs(var_70_1) do
		if iter_70_1:readyToAchieve() then
			var_70_0 = true

			break
		end
	end

	return var_70_0
end

function var_0_0.getBuildActivityCfgByID(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
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

function var_0_0.getNoneActBuildActivityCfgByID(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
	})

	for iter_72_0, iter_72_1 in ipairs(var_72_0) do
		if not iter_72_1:isEnd() then
			local var_72_1 = iter_72_1:getConfig("config_client")

			if var_72_1 and var_72_1.id == arg_72_1 then
				return var_72_1
			end
		end
	end

	return nil
end

function var_0_0.getBuffShipList(arg_73_0)
	local var_73_0 = {}
	local var_73_1 = arg_73_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_73_1, function(arg_74_0)
		if arg_74_0 and not arg_74_0:isEnd() then
			local var_74_0 = arg_74_0:getConfig("config_id")
			local var_74_1 = pg.activity_expup_ship[var_74_0]

			if not var_74_1 then
				return
			end

			local var_74_2 = var_74_1.expup

			for iter_74_0, iter_74_1 in pairs(var_74_2) do
				var_73_0[iter_74_1[1]] = iter_74_1[2]
			end
		end
	end)

	return var_73_0
end

function var_0_0.getVirtualItemNumber(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_75_0 and not var_75_0:isEnd() then
		return var_75_0.data1KeyValueList[1][arg_75_1] and var_75_0.data1KeyValueList[1][arg_75_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_76_0, arg_76_1, arg_76_2)
	local var_76_0 = arg_76_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_76_0, "vbagType invalid")

	if var_76_0 and not var_76_0:isEnd() then
		var_76_0.data1KeyValueList[1][arg_76_1] = var_76_0.data1KeyValueList[1][arg_76_1] - arg_76_2
	end

	arg_76_0:updateActivity(var_76_0)
end

function var_0_0.addVitemById(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0 = arg_77_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) or arg_77_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA)

	assert(var_77_0, "vbagType invalid")

	if var_77_0 and not var_77_0:isEnd() then
		if not var_77_0.data1KeyValueList[1][arg_77_1] then
			var_77_0.data1KeyValueList[1][arg_77_1] = 0
		end

		var_77_0.data1KeyValueList[1][arg_77_1] = var_77_0.data1KeyValueList[1][arg_77_1] + arg_77_2
	end

	arg_77_0:updateActivity(var_77_0)

	local var_77_1 = Item.getConfigData(arg_77_1).link_id

	if var_77_1 ~= 0 then
		local var_77_2 = arg_77_0:getActivityById(var_77_1)

		if var_77_2 and not var_77_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_77_2, arg_77_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_78_0, arg_78_1)
	if arg_78_1 and not arg_78_1:isEnd() and arg_78_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_78_0 = arg_78_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_78_0) then
			arg_78_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_78_1.id
			})
		end
	end
end

function var_0_0.InitActtivityFleet(arg_79_0, arg_79_1, arg_79_2)
	getProxy(FleetProxy):addActivityFleet(arg_79_1, arg_79_2.group_list)
end

function var_0_0.InitActivityBossData(arg_80_0, arg_80_1)
	local var_80_0 = pg.activity_event_worldboss[arg_80_1:getConfig("config_id")]

	if not var_80_0 then
		return
	end

	local var_80_1 = arg_80_1.data1KeyValueList

	for iter_80_0, iter_80_1 in pairs(var_80_0.normal_expedition_drop_num or {}) do
		for iter_80_2, iter_80_3 in pairs(iter_80_1[1]) do
			local var_80_2 = iter_80_1[2]
			local var_80_3 = var_80_1[1][iter_80_3] or 0

			var_80_1[1][iter_80_3] = math.max(var_80_2 - var_80_3, 0)
			var_80_1[2][iter_80_3] = var_80_1[2][iter_80_3] or 0
		end
	end
end

function var_0_0.RegisterRequestTime(arg_81_0, arg_81_1, arg_81_2)
	if not arg_81_1 or arg_81_1 <= 0 then
		return
	end

	arg_81_0.requestTime[arg_81_1] = arg_81_2
end

function var_0_0.addActivityParameter(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1:getConfig("config_data")
	local var_82_1 = arg_82_1.stopTime

	for iter_82_0, iter_82_1 in ipairs(var_82_0) do
		arg_82_0.params[iter_82_1[1]] = {
			iter_82_1[2],
			var_82_1
		}
	end
end

function var_0_0.getActivityParameter(arg_83_0, arg_83_1)
	if arg_83_0.params[arg_83_1] then
		local var_83_0, var_83_1 = unpack(arg_83_0.params[arg_83_1])

		if not (var_83_1 > 0) or not (var_83_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_83_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_84_0, arg_84_1)
	for iter_84_0, iter_84_1 in ipairs(arg_84_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_84_1 and not iter_84_1:isEnd() and iter_84_1.data1 > 0 and iter_84_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_84_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_84_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_84_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_85_0, arg_85_1)
	for iter_85_0, iter_85_1 in ipairs(arg_85_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_85_1:getConfig("config_data"), function(arg_86_0)
			return arg_86_0 == arg_85_1
		end) then
			return iter_85_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_87_0, arg_87_1)
	if arg_87_1:IsActivity() then
		return arg_87_0:getActivityById(arg_87_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_88_0)
	local var_88_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function(arg_89_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_90_0)
			return arg_90_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function(arg_91_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function(arg_92_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function(arg_93_0)
			return true
		end
	}
	local var_88_1 = {}

	for iter_88_0, iter_88_1 in pairs(arg_88_0.data) do
		if switch(iter_88_1:getConfig("type"), var_88_0, function(arg_94_0)
			return false
		end) and not iter_88_1:isEnd() and tobool(iter_88_1:getConfig("config_client").entrance_bg) then
			table.insert(var_88_1, iter_88_1)
		end
	end

	table.sort(var_88_1, CompareFuncs({
		function(arg_95_0)
			return arg_95_0:getConfig("config_client").order or 1
		end,
		function(arg_96_0)
			return -arg_96_0.id
		end
	}))

	return var_88_1
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_97_0)
	local var_97_0 = arg_97_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_97_0 or var_97_0:isEnd() then
		return false
	end

	local var_97_1 = var_97_0:GetSlots()

	for iter_97_0, iter_97_1 in pairs(var_97_1) do
		if iter_97_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0 = arg_98_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_98_0 or var_98_0:isEnd() then
		return false
	end

	local var_98_1 = var_98_0:GetItems()[arg_98_1]

	return var_98_1 and arg_98_2 <= var_98_1.count
end

function var_0_0.InitContinuousTime(arg_99_0, arg_99_1)
	arg_99_0.continuousOpeartionTime = arg_99_1
	arg_99_0.continuousOpeartionTotalTime = arg_99_1
end

function var_0_0.UseContinuousTime(arg_100_0)
	if not arg_100_0.continuousOpeartionTime then
		return
	end

	arg_100_0.continuousOpeartionTime = arg_100_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_101_0)
	return arg_101_0.continuousOpeartionTime, arg_101_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_102_0, arg_102_1)
	arg_102_0.bossrushAwards = arg_102_0.bossrushAwards or {}

	table.insertto(arg_102_0.bossrushAwards, arg_102_1)
end

function var_0_0.PopBossRushAwards(arg_103_0)
	local var_103_0 = arg_103_0.bossrushAwards or {}

	arg_103_0.bossrushAwards = nil

	return var_103_0
end

function var_0_0.GetBossRushRuntime(arg_104_0, arg_104_1)
	if not arg_104_0.extraDatas[arg_104_1] then
		arg_104_0.extraDatas[arg_104_1] = {
			record = 0
		}
	end

	return arg_104_0.extraDatas[arg_104_1]
end

function var_0_0.GetActivityBossRuntime(arg_105_0, arg_105_1)
	if not arg_105_0.extraDatas[arg_105_1] then
		arg_105_0.extraDatas[arg_105_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_105_0.extraDatas[arg_105_1]
end

function var_0_0.GetTaskActivities(arg_106_0)
	local var_106_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_107_0, arg_107_1)
		if not isa(arg_107_1, ITaskActivity) then
			return
		end

		table.insertto(var_106_0, arg_106_0:getActivitiesByType(arg_107_0))
	end)

	return var_106_0
end

function var_0_0.setSurveyState(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_108_0 and not var_108_0:isEnd() then
		arg_108_0.surveyState = arg_108_1
	end
end

function var_0_0.isSurveyDone(arg_109_0)
	local var_109_0 = arg_109_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_109_0 and not var_109_0:isEnd() then
		return arg_109_0.surveyState and arg_109_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_110_0)
	local var_110_0 = arg_110_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_110_0 and not var_110_0:isEnd() then
		local var_110_1 = var_110_0:getConfig("config_data")
		local var_110_2 = var_110_1[1]
		local var_110_3 = var_110_1[2]

		if var_110_2 == 1 then
			local var_110_4 = var_110_3 <= getProxy(PlayerProxy):getData().level
			local var_110_5 = var_110_0:getConfig("config_id")

			return var_110_4, var_110_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_111_0, arg_111_1)
	local var_111_0 = table.Find(arg_111_0.data, function(arg_112_0, arg_112_1)
		if arg_112_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_112_1:getDataConfig("link_id") == arg_111_1
	end)

	return var_111_0 and var_111_0.id
end

function var_0_0.CheckDailyEventRequest(arg_113_0, arg_113_1)
	if arg_113_1:CheckDailyEventRequest() then
		arg_113_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_113_1.id
		})
	end
end

return var_0_0

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
		arg_1_0.buffActs = {}
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
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BUFF then
					table.insert(arg_1_0.buffActs, var_2_0.id)
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

		arg_1_0:refreshActivityBuffs()

		for iter_2_4, iter_2_5 in pairs(arg_1_0.data) do
			arg_1_0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
				isInit = true,
				activity = iter_2_5
			})
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

function var_0_0.timeCall(arg_11_0)
	return {
		[ProxyRegister.DayCall] = function(arg_12_0)
			for iter_12_0, iter_12_1 in pairs(arg_11_0.data) do
				if not iter_12_1:isEnd() then
					switch(iter_12_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_REFLUX] = function()
							iter_12_1.data1KeyValueList = {
								{}
							}
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BB] = function()
							iter_12_1.data2 = 0
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
							iter_12_1.data2 = 0
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
							local var_20_0 = iter_12_1:GetUsedBonus()

							table.Foreach(var_20_0, function(arg_21_0, arg_21_1)
								var_20_0[arg_21_0] = 0
							end)
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
							local var_22_0 = iter_12_1:GetDailyCounts()

							table.Foreach(var_22_0, function(arg_23_0, arg_23_1)
								var_22_0[arg_23_0] = 0
							end)
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function()
							arg_11_0:sendNotification(GAME.ACT_MANUAL_SIGN, {
								activity_id = iter_12_1.id,
								cmd = ManualSignActivity.OP_SIGN
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
							local var_26_0 = iter_12_1:getConfig("config_id")
							local var_26_1 = pg.activity_event_turning[var_26_0]

							if var_26_1.total_num <= iter_12_1.data3 then
								return
							end

							local var_26_2 = var_26_1.task_table[iter_12_1.data4]

							if not var_26_2 then
								return
							end

							local var_26_3 = getProxy(TaskProxy)

							for iter_26_0, iter_26_1 in ipairs(var_26_2) do
								if (var_26_3:getTaskById(iter_26_1) or var_26_3:getFinishTaskById(iter_26_1)):getTaskStatus() ~= 2 then
									return
								end
							end

							arg_11_0:sendNotification(GAME.ACTIVITY_OPERATION, {
								cmd = 2,
								activity_id = iter_12_1.id
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function()
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_CHALLENGE] = function()
							arg_11_0:sendNotification(GAME.CHALLENGE2_INFO, {})
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
							local var_29_0 = iter_12_1.data1KeyValueList[1]
							local var_29_1 = pg.activity_event_worldboss[iter_12_1:getConfig("config_id")]

							if var_29_1 then
								for iter_29_0, iter_29_1 in ipairs(var_29_1.normal_expedition_drop_num or {}) do
									for iter_29_2, iter_29_3 in ipairs(iter_29_1[1]) do
										var_29_0[iter_29_3] = iter_29_1[2] or 0
									end
								end
							end

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_RANDOM_DAILY_TASK] = function()
							local var_30_0 = pg.TimeMgr.GetInstance():GetServerTime()

							if pg.TimeMgr.GetInstance():IsSameDay(iter_12_1.data1, var_30_0) then
								return
							end

							pg.m02:sendNotification(GAME.ACT_RANDOM_DAILY_TASK, {
								activity_id = iter_12_1.id,
								cmd = ActivityConst.RANDOM_DAILY_TASK_OP_RANDOM
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = function()
							arg_11_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
								actId = iter_12_1.id
							})
						end
					})
				end
			end
		end,
		[ProxyRegister.SecondCall] = function(arg_32_0)
			for iter_32_0, iter_32_1 in pairs(arg_11_0.data) do
				if not iter_32_1:isEnd() then
					switch(iter_32_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_TOWN] = function()
							iter_32_1:UpdateTime()
						end
					})
				end
			end

			if not arg_11_0.stopList then
				return
			end

			local var_32_0 = pg.TimeMgr.GetInstance():GetServerTime()

			while #arg_11_0.stopList > 0 and var_32_0 >= arg_11_0.stopList[1][1] do
				local var_32_1, var_32_2 = unpack(table.remove(arg_11_0.stopList, 1))

				if arg_11_0.data[var_32_2]:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
					getProxy(MilitaryExerciseProxy):setSeasonOver()
				end

				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
				arg_11_0:sendNotification(var_0_0.ACTIVITY_END, var_32_2)
			end
		end
	}
end

function var_0_0.getAliveActivityByType(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.data) do
		if iter_34_1:getConfig("type") == arg_34_1 and not iter_34_1:isEnd() then
			return iter_34_1
		end
	end
end

function var_0_0.getActivityByType(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.data) do
		if iter_35_1:getConfig("type") == arg_35_1 then
			return iter_35_1
		end
	end
end

function var_0_0.getActivitiesByType(arg_36_0, arg_36_1)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in pairs(arg_36_0.data) do
		if iter_36_1:getConfig("type") == arg_36_1 then
			table.insert(var_36_0, iter_36_1)
		end
	end

	return var_36_0
end

function var_0_0.getActivitiesByTypes(arg_37_0, arg_37_1)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_0.data) do
		if table.contains(arg_37_1, iter_37_1:getConfig("type")) then
			table.insert(var_37_0, iter_37_1)
		end
	end

	return var_37_0
end

function var_0_0.getMilitaryExerciseActivity(arg_38_0)
	local var_38_0

	for iter_38_0, iter_38_1 in pairs(arg_38_0.data) do
		if iter_38_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			var_38_0 = iter_38_1

			break
		end
	end

	return Clone(var_38_0)
end

function var_0_0.getPanelActivities(arg_39_0)
	local function var_39_0(arg_40_0)
		local var_40_0 = arg_40_0:getConfig("type")
		local var_40_1 = arg_40_0:isShow() and not arg_40_0:isAfterShow() and arg_40_0:isCorePage("")

		if var_40_1 then
			if var_40_0 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				var_40_1 = arg_40_0.data2 == 0
			elseif var_40_0 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				var_40_1 = arg_40_0.data1 < 7 or not arg_40_0.achieved
			end
		end

		return var_40_1 and not arg_40_0:isEnd()
	end

	local var_39_1 = {}

	for iter_39_0, iter_39_1 in pairs(arg_39_0.data) do
		if var_39_0(iter_39_1) then
			table.insert(var_39_1, iter_39_1)
		end
	end

	table.sort(var_39_1, CompareFuncs({
		function(arg_41_0)
			return -arg_41_0:getConfig("login_pop")
		end,
		function(arg_42_0)
			return arg_42_0.id
		end
	}))

	return var_39_1
end

function var_0_0.getCorePanelActivity(arg_43_0, arg_43_1)
	local var_43_0 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0.data) do
		if iter_43_1:isShow() and iter_43_1:isCorePage(arg_43_1) then
			table.insert(var_43_0, iter_43_1)
		end
	end

	table.sort(var_43_0, CompareFuncs({
		function(arg_44_0)
			return -arg_44_0:getConfig("login_pop")
		end,
		function(arg_45_0)
			return arg_45_0.id
		end
	}))

	return var_43_0
end

function var_0_0.checkHxActivity(arg_46_0, arg_46_1)
	if arg_46_0.hxList and #arg_46_0.hxList > 0 then
		for iter_46_0 = 1, #arg_46_0.hxList do
			if arg_46_0.hxList[iter_46_0] == arg_46_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_47_0)
	return _(pg.activity_banner.all):chain():map(function(arg_48_0)
		return pg.activity_banner[arg_48_0]
	end):filter(function(arg_49_0)
		return pg.TimeMgr.GetInstance():inTime(arg_49_0.time) and arg_49_0.type ~= GAMEUI_BANNER_9 and arg_49_0.type ~= GAMEUI_BANNER_11 and arg_49_0.type ~= GAMEUI_BANNER_10 and arg_49_0.type ~= GAMEUI_BANNER_12 and arg_49_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_50_0, arg_50_1)
	local var_50_0 = pg.activity_banner.get_id_list_by_type[arg_50_1]

	if not var_50_0 then
		return nil
	end

	for iter_50_0, iter_50_1 in ipairs(var_50_0) do
		local var_50_1 = pg.activity_banner[iter_50_1]

		if pg.TimeMgr.GetInstance():inTime(var_50_1.time) then
			return var_50_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_51_0)
	return _.map(pg.activity_banner_notice.all, function(arg_52_0)
		return pg.activity_banner_notice[arg_52_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_53_0)
	local var_53_0
	local var_53_1 = pg.TimeMgr.GetInstance()
	local var_53_2 = var_53_1:GetServerTime()

	for iter_53_0, iter_53_1 in ipairs(arg_53_0:getPanelActivities()) do
		if not iter_53_1.autoActionForbidden then
			local var_53_3 = iter_53_1:getConfig("type")

			if var_53_3 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_53_4 = iter_53_1:getConfig("config_id")
				local var_53_5 = pg.activity_7_day_sign[var_53_4].front_drops

				if iter_53_1.data1 < #var_53_5 and not var_53_1:IsSameDay(var_53_2, iter_53_1.data2) and var_53_2 > iter_53_1.data2 then
					var_53_0 = iter_53_1

					break
				end
			elseif var_53_3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_53_6 = getProxy(ChapterProxy)

				if iter_53_1.data1 < 7 and not var_53_1:IsSameDay(var_53_2, iter_53_1.data2) or iter_53_1.data1 == 7 and not iter_53_1.achieved and var_53_6:isClear(204) then
					var_53_0 = iter_53_1

					break
				end
			elseif var_53_3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_53_7 = pg.TimeMgr.GetInstance():STimeDescS(var_53_2, "*t")

				iter_53_1:setSpecialData("reMonthSignDay", nil)

				if var_53_7.year ~= iter_53_1.data1 or var_53_7.month ~= iter_53_1.data2 then
					iter_53_1.data1 = var_53_7.year
					iter_53_1.data2 = var_53_7.month
					iter_53_1.data1_list = {}
					var_53_0 = iter_53_1

					break
				elseif not table.contains(iter_53_1.data1_list, var_53_7.day) then
					var_53_0 = iter_53_1

					break
				elseif var_53_7.day > #iter_53_1.data1_list and pg.activity_month_sign[iter_53_1.data2].resign_count > iter_53_1.data3 then
					for iter_53_2 = var_53_7.day, 1, -1 do
						if not table.contains(iter_53_1.data1_list, iter_53_2) then
							iter_53_1:setSpecialData("reMonthSignDay", iter_53_2)

							break
						end
					end

					var_53_0 = iter_53_1
				end
			elseif iter_53_1.id == ActivityConst.SHADOW_PLAY_ID and iter_53_1.clientData1 == 0 then
				local var_53_8 = iter_53_1:getConfig("config_data")[1]
				local var_53_9 = getProxy(TaskProxy)
				local var_53_10 = var_53_9:getTaskById(var_53_8) or var_53_9:getFinishTaskById(var_53_8)

				if var_53_10 and not var_53_10:isReceive() then
					var_53_0 = iter_53_1

					break
				end
			end
		end
	end

	if not var_53_0 then
		for iter_53_3, iter_53_4 in pairs(arg_53_0.data) do
			if not iter_53_4:isShow() and iter_53_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_53_11 = iter_53_4:getConfig("config_id")
				local var_53_12 = pg.activity_7_day_sign[var_53_11].front_drops

				if iter_53_4.data1 < #var_53_12 and not var_53_1:IsSameDay(var_53_2, iter_53_4.data2) and var_53_2 > iter_53_4.data2 then
					var_53_0 = iter_53_4

					break
				end
			end
		end
	end

	return var_53_0
end

function var_0_0.findRefluxAutoActivity(arg_54_0)
	local var_54_0 = arg_54_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_54_0 and not var_54_0:isEnd() and not var_54_0.autoActionForbidden then
		local var_54_1 = pg.TimeMgr.GetInstance()

		if var_54_0.data1_list[2] < #pg.return_sign_template.all and not var_54_1:IsSameDay(var_54_1:GetServerTime(), var_54_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_55_0)
	local var_55_0 = arg_55_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_55_0 and not var_55_0:isEnd() then
		local var_55_1 = pg.return_pt_template

		for iter_55_0 = #var_55_1.all, 1, -1 do
			local var_55_2 = var_55_1.all[iter_55_0]
			local var_55_3 = var_55_1[var_55_2]

			if var_55_0.data3 >= var_55_3.pt_require and var_55_2 > var_55_0.data4 then
				return true
			end
		end

		local var_55_4 = getProxy(TaskProxy)
		local var_55_5 = _(var_55_0:getConfig("config_data")[7]):chain():map(function(arg_56_0)
			return arg_56_0[2]
		end):flatten():map(function(arg_57_0)
			return var_55_4:getTaskById(arg_57_0) or var_55_4:getFinishTaskById(arg_57_0) or false
		end):filter(function(arg_58_0)
			return not not arg_58_0
		end):value()

		if _.any(var_55_5, function(arg_59_0)
			return arg_59_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_60_0, arg_60_1)
	return Clone(arg_60_0.data[arg_60_1])
end

function var_0_0.RawGetActivityById(arg_61_0, arg_61_1)
	return arg_61_0.data[arg_61_1]
end

function var_0_0.updateActivity(arg_62_0, arg_62_1)
	assert(arg_62_0.data[arg_62_1.id], "activity should exist" .. arg_62_1.id)
	assert(isa(arg_62_1, Activity), "activity should instance of Activity")

	if arg_62_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_62_0 = pg.battlepass_event_pt[arg_62_1.id].target

		if arg_62_0.data[arg_62_1.id].data1 < var_62_0[#var_62_0] and arg_62_1.data1 - arg_62_0.data[arg_62_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_62_1.id].pt,
				ptCount = arg_62_1.data1 - arg_62_0.data[arg_62_1.id].data1
			})
		end
	end

	arg_62_0.data[arg_62_1.id] = arg_62_1

	arg_62_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_62_1:clone())
	arg_62_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_62_1.id
	})
end

function var_0_0.addActivity(arg_63_0, arg_63_1)
	assert(arg_63_0.data[arg_63_1.id] == nil, "activity already exist" .. arg_63_1.id)
	assert(isa(arg_63_1, Activity), "activity should instance of Activity")

	arg_63_0.data[arg_63_1.id] = arg_63_1

	arg_63_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_63_1:clone())

	if arg_63_1.stopTime > 0 then
		table.insert(arg_63_0.stopList, {
			arg_63_1.stopTime,
			arg_63_1.id
		})
		table.sort(arg_63_0.stopList, CompareFuncs({
			function(arg_64_0)
				return arg_64_0[1]
			end
		}))
	end

	if arg_63_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUFF then
		table.insert(arg_63_0.buffActs, arg_63_1.id)
		arg_63_0:refreshActivityBuffs()
	end
end

function var_0_0.deleteActivityById(arg_65_0, arg_65_1)
	assert(arg_65_0.data[arg_65_1], "activity should exist" .. arg_65_1)

	arg_65_0.data[arg_65_1] = nil

	arg_65_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_65_1)

	local var_65_0 = table.getIndex(arg_65_0.stopList, function(arg_66_0)
		return arg_66_0[2] == arg_65_1
	end)

	if var_65_0 then
		table.remove(arg_65_0.stopList, var_65_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_67_0, arg_67_1)
	return arg_67_0.data[arg_67_1] and not arg_67_0.data[arg_67_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_68_0, arg_68_1)
	local var_68_0 = false
	local var_68_1 = arg_68_0:getActivitiesByType(arg_68_1)

	for iter_68_0, iter_68_1 in ipairs(var_68_1) do
		if iter_68_1:readyToAchieve() then
			var_68_0 = true

			break
		end
	end

	return var_68_0
end

function var_0_0.getBuildActivityCfgByID(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	})

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		if not iter_69_1:isEnd() then
			local var_69_1 = iter_69_1:getConfig("config_client")

			if var_69_1 and var_69_1.id == arg_69_1 then
				return var_69_1
			end
		end
	end

	return nil
end

function var_0_0.getNoneActBuildActivityCfgByID(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
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

function var_0_0.getBuffShipList(arg_71_0)
	local var_71_0 = {}
	local var_71_1 = arg_71_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_71_1, function(arg_72_0)
		if arg_72_0 and not arg_72_0:isEnd() then
			local var_72_0 = arg_72_0:getConfig("config_id")
			local var_72_1 = pg.activity_expup_ship[var_72_0]

			if not var_72_1 then
				return
			end

			local var_72_2 = var_72_1.expup

			for iter_72_0, iter_72_1 in pairs(var_72_2) do
				var_71_0[iter_72_1[1]] = iter_72_1[2]
			end
		end
	end)

	return var_71_0
end

function var_0_0.getVirtualItemNumber(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_73_0 and not var_73_0:isEnd() then
		return var_73_0.data1KeyValueList[1][arg_73_1] and var_73_0.data1KeyValueList[1][arg_73_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = arg_74_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_74_0, "vbagType invalid")

	if var_74_0 and not var_74_0:isEnd() then
		var_74_0.data1KeyValueList[1][arg_74_1] = var_74_0.data1KeyValueList[1][arg_74_1] - arg_74_2
	end

	arg_74_0:updateActivity(var_74_0)
end

function var_0_0.addVitemById(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) or arg_75_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA)

	assert(var_75_0, "vbagType invalid")

	if var_75_0 and not var_75_0:isEnd() then
		if not var_75_0.data1KeyValueList[1][arg_75_1] then
			var_75_0.data1KeyValueList[1][arg_75_1] = 0
		end

		var_75_0.data1KeyValueList[1][arg_75_1] = var_75_0.data1KeyValueList[1][arg_75_1] + arg_75_2
	end

	arg_75_0:updateActivity(var_75_0)

	local var_75_1 = Item.getConfigData(arg_75_1).link_id

	if var_75_1 ~= 0 then
		local var_75_2 = arg_75_0:getActivityById(var_75_1)

		if var_75_2 and not var_75_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_75_2, arg_75_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_76_0, arg_76_1)
	if arg_76_1 and not arg_76_1:isEnd() and arg_76_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_76_0 = arg_76_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_76_0) then
			arg_76_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_76_1.id
			})
		end
	end
end

function var_0_0.InitActtivityFleet(arg_77_0, arg_77_1, arg_77_2)
	getProxy(FleetProxy):addActivityFleet(arg_77_1, arg_77_2.group_list)
end

function var_0_0.InitActivityBossData(arg_78_0, arg_78_1)
	local var_78_0 = pg.activity_event_worldboss[arg_78_1:getConfig("config_id")]

	if not var_78_0 then
		return
	end

	local var_78_1 = arg_78_1.data1KeyValueList

	for iter_78_0, iter_78_1 in pairs(var_78_0.normal_expedition_drop_num or {}) do
		for iter_78_2, iter_78_3 in pairs(iter_78_1[1]) do
			local var_78_2 = iter_78_1[2]
			local var_78_3 = var_78_1[1][iter_78_3] or 0

			var_78_1[1][iter_78_3] = math.max(var_78_2 - var_78_3, 0)
			var_78_1[2][iter_78_3] = var_78_1[2][iter_78_3] or 0
		end
	end
end

function var_0_0.AddInstagramTimer(arg_79_0, arg_79_1)
	arg_79_0:RemoveInstagramTimer()

	local var_79_0, var_79_1 = arg_79_0.data[arg_79_1]:GetNextPushTime()

	if var_79_0 then
		local var_79_2 = var_79_0 - pg.TimeMgr.GetInstance():GetServerTime()

		local function var_79_3()
			arg_79_0:sendNotification(GAME.ACT_INSTAGRAM_OP, {
				arg2 = 0,
				activity_id = arg_79_1,
				cmd = ActivityConst.INSTAGRAM_OP_ACTIVE,
				arg1 = var_79_1
			})
		end

		if var_79_2 <= 0 then
			var_79_3()
		else
			arg_79_0.instagramTimer = Timer.New(function()
				var_79_3()
				arg_79_0:RemoveInstagramTimer()
			end, var_79_2, 1)

			arg_79_0.instagramTimer:Start()
		end
	end
end

function var_0_0.RemoveInstagramTimer(arg_82_0)
	if arg_82_0.instagramTimer then
		arg_82_0.instagramTimer:Stop()

		arg_82_0.instagramTimer = nil
	end
end

function var_0_0.RegisterRequestTime(arg_83_0, arg_83_1, arg_83_2)
	if not arg_83_1 or arg_83_1 <= 0 then
		return
	end

	arg_83_0.requestTime[arg_83_1] = arg_83_2
end

function var_0_0.remove(arg_84_0)
	arg_84_0:RemoveInstagramTimer()
end

function var_0_0.addActivityParameter(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_1:getConfig("config_data")
	local var_85_1 = arg_85_1.stopTime

	for iter_85_0, iter_85_1 in ipairs(var_85_0) do
		arg_85_0.params[iter_85_1[1]] = {
			iter_85_1[2],
			var_85_1
		}
	end
end

function var_0_0.getActivityParameter(arg_86_0, arg_86_1)
	if arg_86_0.params[arg_86_1] then
		local var_86_0, var_86_1 = unpack(arg_86_0.params[arg_86_1])

		if not (var_86_1 > 0) or not (var_86_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_86_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_87_0, arg_87_1)
	for iter_87_0, iter_87_1 in ipairs(arg_87_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_87_1 and not iter_87_1:isEnd() and iter_87_1.data1 > 0 and iter_87_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_87_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_87_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_87_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_88_0, arg_88_1)
	for iter_88_0, iter_88_1 in ipairs(arg_88_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_88_1:getConfig("config_data"), function(arg_89_0)
			return arg_89_0 == arg_88_1
		end) then
			return iter_88_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_90_0, arg_90_1)
	if arg_90_1:IsActivity() then
		return arg_90_0:getActivityById(arg_90_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_91_0)
	local var_91_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_92_0)
			return not arg_92_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = false
	}
	local var_91_1 = _.keys(var_91_0)
	local var_91_2 = {}

	for iter_91_0, iter_91_1 in ipairs(var_91_1) do
		var_91_2[iter_91_1] = 0
	end

	for iter_91_2, iter_91_3 in pairs(arg_91_0.data) do
		local var_91_3 = iter_91_3:getConfig("type")

		if var_91_2[var_91_3] and not iter_91_3:isEnd() and not existCall(var_91_0[var_91_3], iter_91_3) then
			var_91_2[var_91_3] = math.max(var_91_2[var_91_3], iter_91_2)
		end
	end

	table.sort(var_91_1)

	for iter_91_4, iter_91_5 in ipairs(var_91_1) do
		if var_91_2[iter_91_5] > 0 then
			return arg_91_0.data[var_91_2[iter_91_5]]
		end
	end
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_93_0)
	local var_93_0 = arg_93_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_93_0 or var_93_0:isEnd() then
		return false
	end

	local var_93_1 = var_93_0:GetSlots()

	for iter_93_0, iter_93_1 in pairs(var_93_1) do
		if iter_93_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_94_0, arg_94_1, arg_94_2)
	local var_94_0 = arg_94_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_94_0 or var_94_0:isEnd() then
		return false
	end

	local var_94_1 = var_94_0:GetItems()[arg_94_1]

	return var_94_1 and arg_94_2 <= var_94_1.count
end

function var_0_0.refreshActivityBuffs(arg_95_0)
	arg_95_0.actBuffs = {}

	local var_95_0 = 1

	while var_95_0 <= #arg_95_0.buffActs do
		local var_95_1 = arg_95_0.data[arg_95_0.buffActs[var_95_0]]

		if not var_95_1 or var_95_1:isEnd() then
			table.remove(arg_95_0.buffActs, var_95_0)
		else
			var_95_0 = var_95_0 + 1

			local var_95_2 = {
				var_95_1:getConfig("config_id")
			}

			if var_95_2[1] == 0 then
				var_95_2 = var_95_1:getConfig("config_data")
			end

			for iter_95_0, iter_95_1 in ipairs(var_95_2) do
				local var_95_3 = ActivityBuff.New(var_95_1.id, iter_95_1)

				if var_95_3:isActivate() then
					table.insert(arg_95_0.actBuffs, var_95_3)
				end
			end
		end
	end
end

function var_0_0.getActivityBuffs(arg_96_0)
	if underscore.any(arg_96_0.buffActs, function(arg_97_0)
		return not arg_96_0.data[arg_97_0] or arg_96_0.data[arg_97_0]:isEnd()
	end) or underscore.any(arg_96_0.actBuffs, function(arg_98_0)
		return not arg_98_0:isActivate()
	end) then
		arg_96_0:refreshActivityBuffs()
	end

	return arg_96_0.actBuffs
end

function var_0_0.getShipModExpActivity(arg_99_0)
	return underscore.select(arg_99_0:getActivityBuffs(), function(arg_100_0)
		return arg_100_0:ShipModExpUsage()
	end)
end

function var_0_0.getBackyardEnergyActivityBuffs(arg_101_0)
	return underscore.select(arg_101_0:getActivityBuffs(), function(arg_102_0)
		return arg_102_0:BackyardEnergyUsage()
	end)
end

function var_0_0.InitContinuousTime(arg_103_0, arg_103_1)
	arg_103_0.continuousOpeartionTime = arg_103_1
	arg_103_0.continuousOpeartionTotalTime = arg_103_1
end

function var_0_0.UseContinuousTime(arg_104_0)
	if not arg_104_0.continuousOpeartionTime then
		return
	end

	arg_104_0.continuousOpeartionTime = arg_104_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_105_0)
	return arg_105_0.continuousOpeartionTime, arg_105_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_106_0, arg_106_1)
	arg_106_0.bossrushAwards = arg_106_0.bossrushAwards or {}

	table.insertto(arg_106_0.bossrushAwards, arg_106_1)
end

function var_0_0.PopBossRushAwards(arg_107_0)
	local var_107_0 = arg_107_0.bossrushAwards or {}

	arg_107_0.bossrushAwards = nil

	return var_107_0
end

function var_0_0.GetBossRushRuntime(arg_108_0, arg_108_1)
	if not arg_108_0.extraDatas[arg_108_1] then
		arg_108_0.extraDatas[arg_108_1] = {
			record = 0
		}
	end

	return arg_108_0.extraDatas[arg_108_1]
end

function var_0_0.GetActivityBossRuntime(arg_109_0, arg_109_1)
	if not arg_109_0.extraDatas[arg_109_1] then
		arg_109_0.extraDatas[arg_109_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_109_0.extraDatas[arg_109_1]
end

function var_0_0.GetTaskActivities(arg_110_0)
	local var_110_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_111_0, arg_111_1)
		if not isa(arg_111_1, ITaskActivity) then
			return
		end

		table.insertto(var_110_0, arg_110_0:getActivitiesByType(arg_111_0))
	end)

	return var_110_0
end

function var_0_0.setSurveyState(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_112_0 and not var_112_0:isEnd() then
		arg_112_0.surveyState = arg_112_1
	end
end

function var_0_0.isSurveyDone(arg_113_0)
	local var_113_0 = arg_113_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_113_0 and not var_113_0:isEnd() then
		return arg_113_0.surveyState and arg_113_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_114_0)
	local var_114_0 = arg_114_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_114_0 and not var_114_0:isEnd() then
		local var_114_1 = var_114_0:getConfig("config_data")
		local var_114_2 = var_114_1[1]
		local var_114_3 = var_114_1[2]

		if var_114_2 == 1 then
			local var_114_4 = var_114_3 <= getProxy(PlayerProxy):getData().level
			local var_114_5 = var_114_0:getConfig("config_id")

			return var_114_4, var_114_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_115_0, arg_115_1)
	local var_115_0 = table.Find(arg_115_0.data, function(arg_116_0, arg_116_1)
		if arg_116_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_116_1:getDataConfig("link_id") == arg_115_1
	end)

	return var_115_0 and var_115_0.id
end

function var_0_0.CheckDailyEventRequest(arg_117_0, arg_117_1)
	if arg_117_1:CheckDailyEventRequest() then
		arg_117_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_117_1.id
		})
	end
end

return var_0_0

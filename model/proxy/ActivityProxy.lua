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

				if var_2_1 == ActivityConst.ACTIVITY_TYPE_PARAMETER then
					arg_1_0:addActivityParameter(var_2_0)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE then
					arg_1_0:CheckDailyEventRequest(var_2_0)
				else
					arg_1_0:CheckCreateActivityFleet(var_2_0, iter_2_3)
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

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inElite")
		;(function()
			local var_4_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

			if not var_4_0 then
				return
			end

			arg_1_0:sendNotification(GAME.REQUEST_ATELIER, var_4_0.id)
		end)()

		local var_2_4 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT)

		if var_2_4 and not var_2_4:isEnd() then
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

		if not arg_1_0.data[var_5_0.id] or var_5_1 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			arg_1_0:CheckCreateActivityFleet(var_5_0, arg_5_0.activity_info)
		end

		if not arg_1_0.data[var_5_0.id] then
			arg_1_0:addActivity(var_5_0)
		else
			arg_1_0:updateActivity(var_5_0)
		end

		arg_1_0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
			activity = var_5_0
		})
	end)
	arg_1_0:on(40009, function(arg_6_0)
		local var_6_0 = arg_1_0:GetBossActivityByChapterId(arg_6_0.arg1) or arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)
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

		local var_8_0 = arg_1_0:getActivityById(arg_8_0.act_id)

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
						end,
						[ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_UP] = function()
							iter_14_1:DayReset()
							arg_13_0:updateActivity(iter_14_1)
						end
					})
				end
			end
		end,
		[ProxyRegister.SecondCall] = function(arg_35_0)
			for iter_35_0, iter_35_1 in pairs(arg_13_0.data) do
				if not iter_35_1:isEnd() then
					switch(iter_35_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_TOWN] = function()
							iter_35_1:UpdateTime()
						end,
						[ActivityConst.ACTIVITY_TYPE_TOWN2] = function()
							iter_35_1:UpdateTime()
						end
					})
				end
			end

			if not arg_13_0.stopList then
				return
			end

			local var_35_0 = pg.TimeMgr.GetInstance():GetServerTime()

			while #arg_13_0.stopList > 0 and var_35_0 >= arg_13_0.stopList[1][1] do
				local var_35_1, var_35_2 = unpack(table.remove(arg_13_0.stopList, 1))
				local var_35_3 = arg_13_0.data[var_35_2]

				switch(var_35_3:getConfig("type"), {
					[ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE] = function()
						getProxy(MilitaryExerciseProxy):setSeasonOver()
					end,
					[ActivityConst.ACTIVITY_TYPE_NPC_COLLECTION] = function()
						local var_39_0 = getProxy(BayProxy):getShipById(var_35_3.data2)

						if var_39_0 and var_39_0:isActivityNpc() then
							arg_13_0:sendNotification(GAME.SEND_CMD, {
								cmd = "kick"
							})
						end
					end,
					[ActivityConst.ACTIVITY_TYPE_TASKS] = function()
						local var_40_0 = getProxy(TaskProxy)

						for iter_40_0, iter_40_1 in ipairs(var_35_3:getConfig("config_data")) do
							var_40_0:deleteTaskById(iter_40_1)
						end
					end
				})
				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
				arg_13_0:sendNotification(var_0_0.ACTIVITY_END, var_35_2)
			end
		end
	}
end

function var_0_0.getAliveActivityByType(arg_41_0, arg_41_1)
	for iter_41_0, iter_41_1 in pairs(arg_41_0.data) do
		if iter_41_1:getConfig("type") == arg_41_1 and not iter_41_1:isEnd() then
			return iter_41_1
		end
	end
end

function var_0_0.getActivityByType(arg_42_0, arg_42_1)
	for iter_42_0, iter_42_1 in pairs(arg_42_0.data) do
		if iter_42_1:getConfig("type") == arg_42_1 then
			return iter_42_1
		end
	end
end

function var_0_0.getActivitiesByType(arg_43_0, arg_43_1)
	local var_43_0 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0.data) do
		if iter_43_1:getConfig("type") == arg_43_1 then
			table.insert(var_43_0, iter_43_1)
		end
	end

	return var_43_0
end

function var_0_0.getActivitiesByTypes(arg_44_0, arg_44_1)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in pairs(arg_44_0.data) do
		if table.contains(arg_44_1, iter_44_1:getConfig("type")) then
			table.insert(var_44_0, iter_44_1)
		end
	end

	return var_44_0
end

function var_0_0.getMilitaryExerciseActivity(arg_45_0)
	local var_45_0

	for iter_45_0, iter_45_1 in pairs(arg_45_0.data) do
		if iter_45_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			var_45_0 = iter_45_1

			break
		end
	end

	return Clone(var_45_0)
end

function var_0_0.getPanelActivities(arg_46_0)
	local function var_46_0(arg_47_0)
		local var_47_0 = arg_47_0:getConfig("type")
		local var_47_1 = arg_47_0:isShow() and not arg_47_0:isAfterShow() and arg_47_0:isCorePage("")

		if var_47_1 then
			if var_47_0 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				var_47_1 = arg_47_0.data2 == 0
			elseif var_47_0 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				var_47_1 = arg_47_0.data1 < 7 or not arg_47_0.achieved
			elseif var_47_0 == ActivityConst.ACTIVITY_TYPE_SURVEY then
				var_47_1 = PLATFORM ~= PLATFORM_OPENHARMONY
			end
		end

		return var_47_1 and not arg_47_0:isEnd()
	end

	local var_46_1 = {}

	for iter_46_0, iter_46_1 in pairs(arg_46_0.data) do
		if var_46_0(iter_46_1) then
			table.insert(var_46_1, iter_46_1)
		end
	end

	table.sort(var_46_1, CompareFuncs({
		function(arg_48_0)
			return -arg_48_0:getConfig("login_pop")
		end,
		function(arg_49_0)
			return arg_49_0.id
		end
	}))

	return var_46_1
end

function var_0_0.getCorePanelActivities(arg_50_0, arg_50_1)
	local var_50_0 = {}

	for iter_50_0, iter_50_1 in pairs(arg_50_0.data) do
		if iter_50_1:isShow() and iter_50_1:isCorePage(arg_50_1) then
			table.insert(var_50_0, iter_50_1)
		end
	end

	table.sort(var_50_0, CompareFuncs({
		function(arg_51_0)
			return -arg_51_0:getConfig("login_pop")
		end,
		function(arg_52_0)
			return arg_52_0.id
		end
	}))

	return var_50_0
end

function var_0_0.getIslandPanelActivities(arg_53_0)
	local function var_53_0(arg_54_0)
		local var_54_0 = arg_54_0:getConfig("type")
		local var_54_1 = arg_54_0:isIslandShow()

		if var_54_1 and var_54_0 == ActivityConst.ACTIVITY_TYPE_SURVEY then
			local var_54_2 = arg_53_0:isSurveyOpen()
			local var_54_3 = arg_53_0:isSurveyDone()

			var_54_1 = var_54_2 and not var_54_3

			if PLATFORM == PLATFORM_OPENHARMONY then
				var_54_1 = false
			end
		end

		return var_54_1 and not arg_54_0:isEnd()
	end

	local var_53_1 = {}

	for iter_53_0, iter_53_1 in pairs(arg_53_0.data) do
		if var_53_0(iter_53_1) then
			table.insert(var_53_1, iter_53_1)
		end
	end

	return var_53_1
end

function var_0_0.checkHxActivity(arg_55_0, arg_55_1)
	if arg_55_0.hxList and #arg_55_0.hxList > 0 then
		for iter_55_0 = 1, #arg_55_0.hxList do
			if arg_55_0.hxList[iter_55_0] == arg_55_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_56_0)
	return _(pg.activity_banner.all):chain():map(function(arg_57_0)
		return pg.activity_banner[arg_57_0]
	end):filter(function(arg_58_0)
		return pg.TimeMgr.GetInstance():inTime(arg_58_0.time) and arg_58_0.type ~= GAMEUI_BANNER_9 and arg_58_0.type ~= GAMEUI_BANNER_11 and arg_58_0.type ~= GAMEUI_BANNER_10 and arg_58_0.type ~= GAMEUI_BANNER_12 and arg_58_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_59_0, arg_59_1)
	local var_59_0 = pg.activity_banner.get_id_list_by_type[arg_59_1]

	if not var_59_0 then
		return nil
	end

	for iter_59_0, iter_59_1 in ipairs(var_59_0) do
		local var_59_1 = pg.activity_banner[iter_59_1]

		if pg.TimeMgr.GetInstance():inTime(var_59_1.time) then
			return var_59_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_60_0)
	return _.map(pg.activity_banner_notice.all, function(arg_61_0)
		return pg.activity_banner_notice[arg_61_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_62_0, arg_62_1)
	local var_62_0
	local var_62_1 = pg.TimeMgr.GetInstance()
	local var_62_2 = var_62_1:GetServerTime()
	local var_62_3 = arg_62_1 and arg_62_1 ~= "" and arg_62_0:getCorePanelActivities(arg_62_1) or arg_62_0:getPanelActivities()

	for iter_62_0, iter_62_1 in ipairs(var_62_3) do
		if not iter_62_1.autoActionForbidden then
			local var_62_4 = iter_62_1:getConfig("type")

			if var_62_4 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_62_5 = iter_62_1:getConfig("config_client")

				if var_62_5 and var_62_5.manulSign == true then
					-- block empty
				else
					local var_62_6 = iter_62_1:getConfig("config_id")
					local var_62_7 = pg.activity_7_day_sign[var_62_6].front_drops

					if iter_62_1.data1 < #var_62_7 and not var_62_1:IsSameDay(var_62_2, iter_62_1.data2) and var_62_2 > iter_62_1.data2 then
						var_62_0 = iter_62_1

						break
					end
				end
			elseif var_62_4 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_62_8 = getProxy(ChapterProxy)

				if iter_62_1.data1 < 7 and not var_62_1:IsSameDay(var_62_2, iter_62_1.data2) or iter_62_1.data1 == 7 and not iter_62_1.achieved and var_62_8:isClear(204) then
					var_62_0 = iter_62_1

					break
				end
			elseif var_62_4 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_62_9 = pg.TimeMgr.GetInstance():STimeDescS(var_62_2, "*t")

				iter_62_1:setSpecialData("reMonthSignDay", nil)

				if var_62_9.year ~= iter_62_1.data1 or var_62_9.month ~= iter_62_1.data2 then
					iter_62_1.data1 = var_62_9.year
					iter_62_1.data2 = var_62_9.month
					iter_62_1.data1_list = {}
					var_62_0 = iter_62_1

					break
				elseif not table.contains(iter_62_1.data1_list, var_62_9.day) then
					var_62_0 = iter_62_1

					break
				elseif var_62_9.day > #iter_62_1.data1_list and pg.activity_month_sign[iter_62_1.data2].resign_count > iter_62_1.data3 then
					for iter_62_2 = var_62_9.day, 1, -1 do
						if not table.contains(iter_62_1.data1_list, iter_62_2) then
							iter_62_1:setSpecialData("reMonthSignDay", iter_62_2)

							break
						end
					end

					var_62_0 = iter_62_1
				end
			elseif iter_62_1.id == ActivityConst.SHADOW_PLAY_ID and iter_62_1.clientData1 == 0 then
				local var_62_10 = iter_62_1:getConfig("config_data")[1]
				local var_62_11 = getProxy(TaskProxy)
				local var_62_12 = var_62_11:getTaskById(var_62_10) or var_62_11:getFinishTaskById(var_62_10)

				if var_62_12 and not var_62_12:isReceive() then
					var_62_0 = iter_62_1

					break
				end
			end
		end
	end

	if not var_62_0 then
		for iter_62_3, iter_62_4 in pairs(arg_62_0.data) do
			if not iter_62_4:isShow() and iter_62_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_62_13 = iter_62_4:getConfig("config_id")
				local var_62_14 = pg.activity_7_day_sign[var_62_13].front_drops

				if iter_62_4.data1 < #var_62_14 and not var_62_1:IsSameDay(var_62_2, iter_62_4.data2) and var_62_2 > iter_62_4.data2 then
					var_62_0 = iter_62_4

					break
				end
			end
		end
	end

	return var_62_0
end

function var_0_0.findRefluxAutoActivity(arg_63_0)
	local var_63_0 = arg_63_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_63_0 and not var_63_0:isEnd() and not var_63_0.autoActionForbidden then
		local var_63_1 = pg.TimeMgr.GetInstance()

		if var_63_0.data1_list[2] < #pg.return_sign_template.all and not var_63_1:IsSameDay(var_63_1:GetServerTime(), var_63_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_64_0)
	local var_64_0 = arg_64_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_64_0 and not var_64_0:isEnd() then
		local var_64_1 = pg.return_pt_template

		for iter_64_0 = #var_64_1.all, 1, -1 do
			local var_64_2 = var_64_1.all[iter_64_0]
			local var_64_3 = var_64_1[var_64_2]

			if var_64_0.data3 >= var_64_3.pt_require and var_64_2 > var_64_0.data4 then
				return true
			end
		end

		local var_64_4 = getProxy(TaskProxy)
		local var_64_5 = _(var_64_0:getConfig("config_data")[7]):chain():map(function(arg_65_0)
			return arg_65_0[2]
		end):flatten():map(function(arg_66_0)
			return var_64_4:getTaskById(arg_66_0) or var_64_4:getFinishTaskById(arg_66_0) or false
		end):filter(function(arg_67_0)
			return not not arg_67_0
		end):value()

		if _.any(var_64_5, function(arg_68_0)
			return arg_68_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_69_0, arg_69_1)
	return Clone(arg_69_0.data[arg_69_1])
end

function var_0_0.RawGetActivityById(arg_70_0, arg_70_1)
	return arg_70_0.data[arg_70_1]
end

function var_0_0.updateActivity(arg_71_0, arg_71_1)
	assert(arg_71_0.data[arg_71_1.id], "activity should exist" .. arg_71_1.id)
	assert(isa(arg_71_1, Activity), "activity should instance of Activity")

	if arg_71_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_71_0 = pg.battlepass_event_pt[arg_71_1.id].target

		if arg_71_0.data[arg_71_1.id].data1 < var_71_0[#var_71_0] and arg_71_1.data1 - arg_71_0.data[arg_71_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_71_1.id].pt,
				ptCount = arg_71_1.data1 - arg_71_0.data[arg_71_1.id].data1
			})
		end
	elseif arg_71_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_HEI5 then
		local var_71_1 = pg.black_friday_battlepass_event_pt[arg_71_1.id].target

		if arg_71_0.data[arg_71_1.id].data1 < var_71_1[#var_71_1] and arg_71_1.data1 - arg_71_0.data[arg_71_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.black_friday_battlepass_event_pt[arg_71_1.id].pt,
				ptCount = arg_71_1.data1 - arg_71_0.data[arg_71_1.id].data1
			})
		end
	end

	arg_71_0.data[arg_71_1.id] = arg_71_1

	arg_71_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_71_1:clone())
	arg_71_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_71_1.id
	})
	BuffHelper.GenBuffsForActivity(arg_71_1)
end

function var_0_0.addActivity(arg_72_0, arg_72_1)
	assert(arg_72_0.data[arg_72_1.id] == nil, "activity already exist" .. arg_72_1.id)
	assert(isa(arg_72_1, Activity), "activity should instance of Activity")

	arg_72_0.data[arg_72_1.id] = arg_72_1

	arg_72_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_72_1:clone())

	if arg_72_1.stopTime > 0 then
		table.insert(arg_72_0.stopList, {
			arg_72_1.stopTime,
			arg_72_1.id
		})
		table.sort(arg_72_0.stopList, CompareFuncs({
			function(arg_73_0)
				return arg_73_0[1]
			end
		}))
	end
end

function var_0_0.deleteActivityById(arg_74_0, arg_74_1)
	assert(arg_74_0.data[arg_74_1], "activity should exist" .. arg_74_1)

	arg_74_0.data[arg_74_1] = nil

	arg_74_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_74_1)

	local var_74_0 = table.getIndex(arg_74_0.stopList, function(arg_75_0)
		return arg_75_0[2] == arg_74_1
	end)

	if var_74_0 then
		table.remove(arg_74_0.stopList, var_74_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_76_0, arg_76_1)
	return arg_76_0.data[arg_76_1] and not arg_76_0.data[arg_76_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_77_0, arg_77_1)
	local var_77_0 = false
	local var_77_1 = arg_77_0:getActivitiesByType(arg_77_1)

	for iter_77_0, iter_77_1 in ipairs(var_77_1) do
		if iter_77_1:readyToAchieve() then
			var_77_0 = true

			break
		end
	end

	return var_77_0
end

function var_0_0.getBuildActivityCfgByID(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	})

	for iter_78_0, iter_78_1 in ipairs(var_78_0) do
		if not iter_78_1:isEnd() then
			local var_78_1 = iter_78_1:getConfig("config_client")

			if var_78_1 and var_78_1.id == arg_78_1 then
				return var_78_1
			end
		end
	end

	return nil
end

function var_0_0.getNoneActBuildActivityCfgByID(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
	})

	for iter_79_0, iter_79_1 in ipairs(var_79_0) do
		if not iter_79_1:isEnd() then
			local var_79_1 = iter_79_1:getConfig("config_client")

			if var_79_1 and var_79_1.id == arg_79_1 then
				return var_79_1
			end
		end
	end

	return nil
end

function var_0_0.getBuffShipList(arg_80_0)
	local var_80_0 = {}
	local var_80_1 = arg_80_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_80_1, function(arg_81_0)
		if arg_81_0 and not arg_81_0:isEnd() then
			local var_81_0 = arg_81_0:getConfig("config_id")
			local var_81_1 = pg.activity_expup_ship[var_81_0]

			if not var_81_1 then
				return
			end

			local var_81_2 = var_81_1.expup

			for iter_81_0, iter_81_1 in pairs(var_81_2) do
				var_80_0[iter_81_1[1]] = iter_81_1[2]
			end
		end
	end)

	return var_80_0
end

function var_0_0.getVirtualItemNumber(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_82_0 and not var_82_0:isEnd() then
		return var_82_0.data1KeyValueList[1][arg_82_1] and var_82_0.data1KeyValueList[1][arg_82_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = arg_83_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_83_0, "vbagType invalid")

	if var_83_0 and not var_83_0:isEnd() then
		var_83_0.data1KeyValueList[1][arg_83_1] = var_83_0.data1KeyValueList[1][arg_83_1] - arg_83_2
	end

	arg_83_0:updateActivity(var_83_0)
end

function var_0_0.addVitemById(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) or arg_84_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA)

	var_84_0 = var_84_0 or arg_84_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CITY_REBUILD)

	assert(var_84_0, "vbagType invalid")

	if var_84_0 and not var_84_0:isEnd() then
		if not var_84_0.data1KeyValueList[1][arg_84_1] then
			var_84_0.data1KeyValueList[1][arg_84_1] = 0
		end

		var_84_0.data1KeyValueList[1][arg_84_1] = var_84_0.data1KeyValueList[1][arg_84_1] + arg_84_2
	end

	arg_84_0:updateActivity(var_84_0)

	local var_84_1 = Item.getConfigData(arg_84_1).link_id

	if var_84_1 ~= 0 then
		local var_84_2 = arg_84_0:getActivityById(var_84_1)

		if var_84_2 and not var_84_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_84_2, arg_84_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_85_0, arg_85_1)
	if arg_85_1 and not arg_85_1:isEnd() and arg_85_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_85_0 = arg_85_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_85_0) then
			arg_85_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_85_1.id
			})
		end
	end
end

function var_0_0.CheckCreateActivityFleet(arg_86_0, arg_86_1, arg_86_2)
	switch(arg_86_1:getConfig("type"), {
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
			if arg_86_1:checkBattleTimeInBossAct() then
				arg_86_0:InitActtivityFleet(arg_86_1, arg_86_2)
			end

			arg_86_0:InitActivityBossData(arg_86_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_CHALLENGE] = function()
			arg_86_0:InitActtivityFleet(arg_86_1, arg_86_2)
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = ActivityConst.ACTIVITY_TYPE_CHALLENGE,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = ActivityConst.ACTIVITY_TYPE_CHALLENGE,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = ActivityConst.ACTIVITY_TYPE_CHALLENGE,
		[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = ActivityConst.ACTIVITY_TYPE_CHALLENGE
	})
end

function var_0_0.InitActtivityFleet(arg_89_0, arg_89_1, arg_89_2)
	getProxy(FleetProxy):addActivityFleet(arg_89_1, arg_89_2.group_list)
end

function var_0_0.InitActivityBossData(arg_90_0, arg_90_1)
	local var_90_0 = pg.activity_event_worldboss[arg_90_1:getConfig("config_id")]

	if not var_90_0 then
		return
	end

	local var_90_1 = arg_90_1.data1KeyValueList

	for iter_90_0, iter_90_1 in pairs(var_90_0.normal_expedition_drop_num or {}) do
		for iter_90_2, iter_90_3 in pairs(iter_90_1[1]) do
			local var_90_2 = iter_90_1[2]
			local var_90_3 = var_90_1[1][iter_90_3] or 0

			var_90_1[1][iter_90_3] = math.max(var_90_2 - var_90_3, 0)
			var_90_1[2][iter_90_3] = var_90_1[2][iter_90_3] or 0
		end
	end
end

function var_0_0.RegisterRequestTime(arg_91_0, arg_91_1, arg_91_2)
	if not arg_91_1 or arg_91_1 <= 0 then
		return
	end

	arg_91_0.requestTime[arg_91_1] = arg_91_2
end

function var_0_0.addActivityParameter(arg_92_0, arg_92_1)
	local var_92_0 = arg_92_1:getConfig("config_data")
	local var_92_1 = arg_92_1.stopTime

	for iter_92_0, iter_92_1 in ipairs(var_92_0) do
		arg_92_0.params[iter_92_1[1]] = {
			iter_92_1[2],
			var_92_1
		}
	end
end

function var_0_0.getActivityParameter(arg_93_0, arg_93_1)
	if arg_93_0.params[arg_93_1] then
		local var_93_0, var_93_1 = unpack(arg_93_0.params[arg_93_1])

		if not (var_93_1 > 0) or not (var_93_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_93_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_94_0, arg_94_1)
	for iter_94_0, iter_94_1 in ipairs(arg_94_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_94_1 and not iter_94_1:isEnd() and iter_94_1.data1 > 0 and iter_94_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_94_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_94_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_94_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_95_0, arg_95_1)
	for iter_95_0, iter_95_1 in ipairs(arg_95_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_95_1:getConfig("config_data"), function(arg_96_0)
			return arg_96_0 == arg_95_1
		end) then
			return iter_95_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_97_0, arg_97_1)
	if arg_97_1:IsActivity() then
		return arg_97_0:getActivityById(arg_97_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_98_0)
	local var_98_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function(arg_99_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_100_0)
			return arg_100_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function(arg_101_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function(arg_102_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function(arg_103_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = function(arg_104_0)
			return true
		end
	}
	local var_98_1 = {}

	for iter_98_0, iter_98_1 in pairs(arg_98_0.data) do
		if switch(iter_98_1:getConfig("type"), var_98_0, function(arg_105_0)
			return false
		end, iter_98_1) and not iter_98_1:isEnd() and tobool(iter_98_1:getConfig("config_client").entrance_bg) then
			table.insert(var_98_1, iter_98_1)
		end
	end

	table.sort(var_98_1, CompareFuncs({
		function(arg_106_0)
			return arg_106_0:getConfig("config_client").order or 1
		end,
		function(arg_107_0)
			return -arg_107_0.id
		end
	}))

	return var_98_1
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_108_0)
	local var_108_0 = arg_108_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_108_0 or var_108_0:isEnd() then
		return false
	end

	local var_108_1 = var_108_0:GetSlots()

	for iter_108_0, iter_108_1 in pairs(var_108_1) do
		if iter_108_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_109_0, arg_109_1, arg_109_2)
	local var_109_0 = arg_109_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_109_0 or var_109_0:isEnd() then
		return false
	end

	local var_109_1 = var_109_0:GetItems()[arg_109_1]

	return var_109_1 and arg_109_2 <= var_109_1.count
end

function var_0_0.InitContinuousTime(arg_110_0, arg_110_1)
	arg_110_0.continuousOpeartionTime = arg_110_1
	arg_110_0.continuousOpeartionTotalTime = arg_110_1
end

function var_0_0.UseContinuousTime(arg_111_0)
	if not arg_111_0.continuousOpeartionTime then
		return
	end

	arg_111_0.continuousOpeartionTime = arg_111_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_112_0)
	return arg_112_0.continuousOpeartionTime, arg_112_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_113_0, arg_113_1)
	arg_113_0.bossrushAwards = arg_113_0.bossrushAwards or {}

	table.insertto(arg_113_0.bossrushAwards, arg_113_1)
end

function var_0_0.PopBossRushAwards(arg_114_0)
	local var_114_0 = arg_114_0.bossrushAwards or {}

	arg_114_0.bossrushAwards = nil

	return var_114_0
end

function var_0_0.GetBossRushRuntime(arg_115_0, arg_115_1)
	if not arg_115_0.extraDatas[arg_115_1] then
		arg_115_0.extraDatas[arg_115_1] = {
			record = 0,
			diff = 1
		}
	end

	return arg_115_0.extraDatas[arg_115_1]
end

function var_0_0.GetActivityBossRuntime(arg_116_0, arg_116_1)
	if not arg_116_0.extraDatas[arg_116_1] then
		arg_116_0.extraDatas[arg_116_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_116_0.extraDatas[arg_116_1]
end

function var_0_0.GetTaskActivities(arg_117_0)
	local var_117_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_118_0, arg_118_1)
		if not isa(arg_118_1, ITaskActivity) then
			return
		end

		table.insertto(var_117_0, arg_117_0:getActivitiesByType(arg_118_0))
	end)

	return var_117_0
end

function var_0_0.setSurveyState(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_119_0 and not var_119_0:isEnd() then
		arg_119_0.surveyState = arg_119_1

		if arg_119_1 > 0 then
			arg_119_0:sendNotification(GAME.SURVEY_DONE, var_119_0)
		end
	end
end

function var_0_0.isSurveyDone(arg_120_0)
	local var_120_0 = arg_120_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_120_0 and not var_120_0:isEnd() then
		return arg_120_0.surveyState and arg_120_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_121_0)
	local var_121_0 = arg_121_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_121_0 and not var_121_0:isEnd() then
		local var_121_1 = var_121_0:getConfig("config_data")
		local var_121_2 = var_121_1[1]
		local var_121_3 = var_121_1[2]

		if var_121_2 == 1 then
			local var_121_4 = var_121_3 <= getProxy(PlayerProxy):getData().level
			local var_121_5 = var_121_0:getConfig("config_id")

			return var_121_4, var_121_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_122_0, arg_122_1)
	local var_122_0 = table.Find(arg_122_0.data, function(arg_123_0, arg_123_1)
		if arg_123_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_123_1:getDataConfig("link_id") == arg_122_1
	end)

	return var_122_0 and var_122_0.id
end

function var_0_0.CheckDailyEventRequest(arg_124_0, arg_124_1)
	if arg_124_1:CheckDailyEventRequest() then
		arg_124_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_124_1.id
		})
	end
end

function var_0_0.IsTipLoveLetterMail(arg_125_0)
	local var_125_0 = arg_125_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_MAIL)

	return var_125_0 and not var_125_0:isEnd() and var_125_0:readyToAchieve()
end

function var_0_0.GetBossRushActivities(arg_126_0, arg_126_1)
	local var_126_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)

	return _.select(var_126_0, function(arg_127_0)
		local var_127_0 = pg.activity_task_permanent[arg_127_0.id] ~= nil

		if arg_126_1 then
			return var_127_0 and not arg_127_0:isEnd()
		else
			return not var_127_0 and not arg_127_0:isEnd()
		end
	end)
end

function var_0_0.GetBossRushActivitity(arg_128_0, arg_128_1)
	return arg_128_0:GetBossRushActivities(arg_128_1)[1]
end

function var_0_0.GetBossRushActivityById(arg_129_0, arg_129_1)
	local var_129_0 = arg_129_0:getActivityById(arg_129_1)

	if var_129_0 and var_129_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSSRUSH and not var_129_0:isEnd() then
		return var_129_0
	end

	return nil
end

function var_0_0.GetBossActivityByChapterId(arg_130_0, arg_130_1)
	local var_130_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)

	for iter_130_0, iter_130_1 in ipairs(var_130_0) do
		if not iter_130_1:isEnd() then
			local var_130_1 = iter_130_1:getConfig("config_data")

			if table.contains(var_130_1, arg_130_1) then
				return iter_130_1
			end
		end
	end

	return nil
end

function var_0_0.GetFakeGiftPackActivity(arg_131_0, arg_131_1)
	arg_131_0.skinCommodityActDic = arg_131_0.skinCommodityActDic or {}

	if arg_131_0.skinCommodityActDic[arg_131_1.id] then
		local var_131_0 = arg_131_0.skinCommodityActDic[arg_131_1.id]

		if not var_131_0:isEnd() then
			return var_131_0
		end

		arg_131_0.skinCommodityActDic[arg_131_1.id] = nil
	end

	for iter_131_0, iter_131_1 in ipairs(arg_131_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE,
		ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE
	})) do
		if switch(iter_131_1:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE] = function()
				return not iter_131_1:isEnd() and iter_131_1.data1 < 1 and underscore.any(iter_131_1:getConfig("config_data")[1], function(arg_133_0)
					return pg.ship_skin_template[arg_133_0].shop_id == arg_131_1.id
				end)
			end,
			[ActivityConst.ACTIVITY_TYPE_TIMES_FAKE_PACKAGE] = function()
				local var_134_0 = pg.activity_giftpackage[iter_131_1:getConfig("config_id")]

				return not iter_131_1:isEnd() and iter_131_1.data1 < var_134_0.limit_count and underscore.any(var_134_0.skin, function(arg_135_0)
					return pg.ship_skin_template[arg_135_0].shop_id == arg_131_1.id
				end)
			end
		}, function()
			return
		end) then
			arg_131_0.skinCommodityActDic[arg_131_1.id] = iter_131_1

			return iter_131_1
		end
	end
end

return var_0_0

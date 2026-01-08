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
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
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
		local var_6_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH) or arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)
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

function var_0_0.getCorePanelActivities(arg_45_0, arg_45_1)
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

function var_0_0.getIslandPanelActivities(arg_48_0)
	local function var_48_0(arg_49_0)
		local var_49_0 = arg_49_0:getConfig("type")
		local var_49_1 = arg_49_0:isIslandShow()

		if var_49_1 and var_49_0 == ActivityConst.ACTIVITY_TYPE_SURVEY then
			local var_49_2 = arg_48_0:isSurveyOpen()
			local var_49_3 = arg_48_0:isSurveyDone()

			var_49_1 = var_49_2 and not var_49_3
		end

		return var_49_1 and not arg_49_0:isEnd()
	end

	local var_48_1 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.data) do
		if var_48_0(iter_48_1) then
			table.insert(var_48_1, iter_48_1)
		end
	end

	return var_48_1
end

function var_0_0.checkHxActivity(arg_50_0, arg_50_1)
	if arg_50_0.hxList and #arg_50_0.hxList > 0 then
		for iter_50_0 = 1, #arg_50_0.hxList do
			if arg_50_0.hxList[iter_50_0] == arg_50_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_51_0)
	return _(pg.activity_banner.all):chain():map(function(arg_52_0)
		return pg.activity_banner[arg_52_0]
	end):filter(function(arg_53_0)
		return pg.TimeMgr.GetInstance():inTime(arg_53_0.time) and arg_53_0.type ~= GAMEUI_BANNER_9 and arg_53_0.type ~= GAMEUI_BANNER_11 and arg_53_0.type ~= GAMEUI_BANNER_10 and arg_53_0.type ~= GAMEUI_BANNER_12 and arg_53_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_54_0, arg_54_1)
	local var_54_0 = pg.activity_banner.get_id_list_by_type[arg_54_1]

	if not var_54_0 then
		return nil
	end

	for iter_54_0, iter_54_1 in ipairs(var_54_0) do
		local var_54_1 = pg.activity_banner[iter_54_1]

		if pg.TimeMgr.GetInstance():inTime(var_54_1.time) then
			return var_54_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_55_0)
	return _.map(pg.activity_banner_notice.all, function(arg_56_0)
		return pg.activity_banner_notice[arg_56_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_57_0, arg_57_1)
	local var_57_0
	local var_57_1 = pg.TimeMgr.GetInstance()
	local var_57_2 = var_57_1:GetServerTime()
	local var_57_3 = arg_57_1 and arg_57_1 ~= "" and arg_57_0:getCorePanelActivities(arg_57_1) or arg_57_0:getPanelActivities()

	for iter_57_0, iter_57_1 in ipairs(var_57_3) do
		if not iter_57_1.autoActionForbidden then
			local var_57_4 = iter_57_1:getConfig("type")

			if var_57_4 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_57_5 = iter_57_1:getConfig("config_client")

				if var_57_5 and var_57_5.manulSign == true then
					-- block empty
				else
					local var_57_6 = iter_57_1:getConfig("config_id")
					local var_57_7 = pg.activity_7_day_sign[var_57_6].front_drops

					if iter_57_1.data1 < #var_57_7 and not var_57_1:IsSameDay(var_57_2, iter_57_1.data2) and var_57_2 > iter_57_1.data2 then
						var_57_0 = iter_57_1

						break
					end
				end
			elseif var_57_4 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_57_8 = getProxy(ChapterProxy)

				if iter_57_1.data1 < 7 and not var_57_1:IsSameDay(var_57_2, iter_57_1.data2) or iter_57_1.data1 == 7 and not iter_57_1.achieved and var_57_8:isClear(204) then
					var_57_0 = iter_57_1

					break
				end
			elseif var_57_4 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_57_9 = pg.TimeMgr.GetInstance():STimeDescS(var_57_2, "*t")

				iter_57_1:setSpecialData("reMonthSignDay", nil)

				if var_57_9.year ~= iter_57_1.data1 or var_57_9.month ~= iter_57_1.data2 then
					iter_57_1.data1 = var_57_9.year
					iter_57_1.data2 = var_57_9.month
					iter_57_1.data1_list = {}
					var_57_0 = iter_57_1

					break
				elseif not table.contains(iter_57_1.data1_list, var_57_9.day) then
					var_57_0 = iter_57_1

					break
				elseif var_57_9.day > #iter_57_1.data1_list and pg.activity_month_sign[iter_57_1.data2].resign_count > iter_57_1.data3 then
					for iter_57_2 = var_57_9.day, 1, -1 do
						if not table.contains(iter_57_1.data1_list, iter_57_2) then
							iter_57_1:setSpecialData("reMonthSignDay", iter_57_2)

							break
						end
					end

					var_57_0 = iter_57_1
				end
			elseif iter_57_1.id == ActivityConst.SHADOW_PLAY_ID and iter_57_1.clientData1 == 0 then
				local var_57_10 = iter_57_1:getConfig("config_data")[1]
				local var_57_11 = getProxy(TaskProxy)
				local var_57_12 = var_57_11:getTaskById(var_57_10) or var_57_11:getFinishTaskById(var_57_10)

				if var_57_12 and not var_57_12:isReceive() then
					var_57_0 = iter_57_1

					break
				end
			end
		end
	end

	if not var_57_0 then
		for iter_57_3, iter_57_4 in pairs(arg_57_0.data) do
			if not iter_57_4:isShow() and iter_57_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_57_13 = iter_57_4:getConfig("config_id")
				local var_57_14 = pg.activity_7_day_sign[var_57_13].front_drops

				if iter_57_4.data1 < #var_57_14 and not var_57_1:IsSameDay(var_57_2, iter_57_4.data2) and var_57_2 > iter_57_4.data2 then
					var_57_0 = iter_57_4

					break
				end
			end
		end
	end

	return var_57_0
end

function var_0_0.findRefluxAutoActivity(arg_58_0)
	local var_58_0 = arg_58_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_58_0 and not var_58_0:isEnd() and not var_58_0.autoActionForbidden then
		local var_58_1 = pg.TimeMgr.GetInstance()

		if var_58_0.data1_list[2] < #pg.return_sign_template.all and not var_58_1:IsSameDay(var_58_1:GetServerTime(), var_58_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_59_0)
	local var_59_0 = arg_59_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_59_0 and not var_59_0:isEnd() then
		local var_59_1 = pg.return_pt_template

		for iter_59_0 = #var_59_1.all, 1, -1 do
			local var_59_2 = var_59_1.all[iter_59_0]
			local var_59_3 = var_59_1[var_59_2]

			if var_59_0.data3 >= var_59_3.pt_require and var_59_2 > var_59_0.data4 then
				return true
			end
		end

		local var_59_4 = getProxy(TaskProxy)
		local var_59_5 = _(var_59_0:getConfig("config_data")[7]):chain():map(function(arg_60_0)
			return arg_60_0[2]
		end):flatten():map(function(arg_61_0)
			return var_59_4:getTaskById(arg_61_0) or var_59_4:getFinishTaskById(arg_61_0) or false
		end):filter(function(arg_62_0)
			return not not arg_62_0
		end):value()

		if _.any(var_59_5, function(arg_63_0)
			return arg_63_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_64_0, arg_64_1)
	return Clone(arg_64_0.data[arg_64_1])
end

function var_0_0.RawGetActivityById(arg_65_0, arg_65_1)
	return arg_65_0.data[arg_65_1]
end

function var_0_0.updateActivity(arg_66_0, arg_66_1)
	assert(arg_66_0.data[arg_66_1.id], "activity should exist" .. arg_66_1.id)
	assert(isa(arg_66_1, Activity), "activity should instance of Activity")

	if arg_66_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_66_0 = pg.battlepass_event_pt[arg_66_1.id].target

		if arg_66_0.data[arg_66_1.id].data1 < var_66_0[#var_66_0] and arg_66_1.data1 - arg_66_0.data[arg_66_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_66_1.id].pt,
				ptCount = arg_66_1.data1 - arg_66_0.data[arg_66_1.id].data1
			})
		end
	elseif arg_66_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_HEI5 then
		local var_66_1 = pg.black_friday_battlepass_event_pt[arg_66_1.id].target

		if arg_66_0.data[arg_66_1.id].data1 < var_66_1[#var_66_1] and arg_66_1.data1 - arg_66_0.data[arg_66_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.black_friday_battlepass_event_pt[arg_66_1.id].pt,
				ptCount = arg_66_1.data1 - arg_66_0.data[arg_66_1.id].data1
			})
		end
	end

	arg_66_0.data[arg_66_1.id] = arg_66_1

	arg_66_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_66_1:clone())
	arg_66_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_66_1.id
	})
	BuffHelper.GenBuffsForActivity(arg_66_1)
end

function var_0_0.addActivity(arg_67_0, arg_67_1)
	assert(arg_67_0.data[arg_67_1.id] == nil, "activity already exist" .. arg_67_1.id)
	assert(isa(arg_67_1, Activity), "activity should instance of Activity")

	arg_67_0.data[arg_67_1.id] = arg_67_1

	arg_67_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_67_1:clone())

	if arg_67_1.stopTime > 0 then
		table.insert(arg_67_0.stopList, {
			arg_67_1.stopTime,
			arg_67_1.id
		})
		table.sort(arg_67_0.stopList, CompareFuncs({
			function(arg_68_0)
				return arg_68_0[1]
			end
		}))
	end
end

function var_0_0.deleteActivityById(arg_69_0, arg_69_1)
	assert(arg_69_0.data[arg_69_1], "activity should exist" .. arg_69_1)

	arg_69_0.data[arg_69_1] = nil

	arg_69_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_69_1)

	local var_69_0 = table.getIndex(arg_69_0.stopList, function(arg_70_0)
		return arg_70_0[2] == arg_69_1
	end)

	if var_69_0 then
		table.remove(arg_69_0.stopList, var_69_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_71_0, arg_71_1)
	return arg_71_0.data[arg_71_1] and not arg_71_0.data[arg_71_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_72_0, arg_72_1)
	local var_72_0 = false
	local var_72_1 = arg_72_0:getActivitiesByType(arg_72_1)

	for iter_72_0, iter_72_1 in ipairs(var_72_1) do
		if iter_72_1:readyToAchieve() then
			var_72_0 = true

			break
		end
	end

	return var_72_0
end

function var_0_0.getBuildActivityCfgByID(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	})

	for iter_73_0, iter_73_1 in ipairs(var_73_0) do
		if not iter_73_1:isEnd() then
			local var_73_1 = iter_73_1:getConfig("config_client")

			if var_73_1 and var_73_1.id == arg_73_1 then
				return var_73_1
			end
		end
	end

	return nil
end

function var_0_0.getNoneActBuildActivityCfgByID(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
	})

	for iter_74_0, iter_74_1 in ipairs(var_74_0) do
		if not iter_74_1:isEnd() then
			local var_74_1 = iter_74_1:getConfig("config_client")

			if var_74_1 and var_74_1.id == arg_74_1 then
				return var_74_1
			end
		end
	end

	return nil
end

function var_0_0.getBuffShipList(arg_75_0)
	local var_75_0 = {}
	local var_75_1 = arg_75_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_75_1, function(arg_76_0)
		if arg_76_0 and not arg_76_0:isEnd() then
			local var_76_0 = arg_76_0:getConfig("config_id")
			local var_76_1 = pg.activity_expup_ship[var_76_0]

			if not var_76_1 then
				return
			end

			local var_76_2 = var_76_1.expup

			for iter_76_0, iter_76_1 in pairs(var_76_2) do
				var_75_0[iter_76_1[1]] = iter_76_1[2]
			end
		end
	end)

	return var_75_0
end

function var_0_0.getVirtualItemNumber(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_77_0 and not var_77_0:isEnd() then
		return var_77_0.data1KeyValueList[1][arg_77_1] and var_77_0.data1KeyValueList[1][arg_77_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_78_0, arg_78_1, arg_78_2)
	local var_78_0 = arg_78_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_78_0, "vbagType invalid")

	if var_78_0 and not var_78_0:isEnd() then
		var_78_0.data1KeyValueList[1][arg_78_1] = var_78_0.data1KeyValueList[1][arg_78_1] - arg_78_2
	end

	arg_78_0:updateActivity(var_78_0)
end

function var_0_0.addVitemById(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0 = arg_79_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) or arg_79_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_HOLIDAY_VILLA)

	var_79_0 = var_79_0 or arg_79_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CITY_REBUILD)

	assert(var_79_0, "vbagType invalid")

	if var_79_0 and not var_79_0:isEnd() then
		if not var_79_0.data1KeyValueList[1][arg_79_1] then
			var_79_0.data1KeyValueList[1][arg_79_1] = 0
		end

		var_79_0.data1KeyValueList[1][arg_79_1] = var_79_0.data1KeyValueList[1][arg_79_1] + arg_79_2
	end

	arg_79_0:updateActivity(var_79_0)

	local var_79_1 = Item.getConfigData(arg_79_1).link_id

	if var_79_1 ~= 0 then
		local var_79_2 = arg_79_0:getActivityById(var_79_1)

		if var_79_2 and not var_79_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_79_2, arg_79_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_80_0, arg_80_1)
	if arg_80_1 and not arg_80_1:isEnd() and arg_80_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_80_0 = arg_80_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_80_0) then
			arg_80_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_80_1.id
			})
		end
	end
end

function var_0_0.InitActtivityFleet(arg_81_0, arg_81_1, arg_81_2)
	getProxy(FleetProxy):addActivityFleet(arg_81_1, arg_81_2.group_list)
end

function var_0_0.InitActivityBossData(arg_82_0, arg_82_1)
	local var_82_0 = pg.activity_event_worldboss[arg_82_1:getConfig("config_id")]

	if not var_82_0 then
		return
	end

	local var_82_1 = arg_82_1.data1KeyValueList

	for iter_82_0, iter_82_1 in pairs(var_82_0.normal_expedition_drop_num or {}) do
		for iter_82_2, iter_82_3 in pairs(iter_82_1[1]) do
			local var_82_2 = iter_82_1[2]
			local var_82_3 = var_82_1[1][iter_82_3] or 0

			var_82_1[1][iter_82_3] = math.max(var_82_2 - var_82_3, 0)
			var_82_1[2][iter_82_3] = var_82_1[2][iter_82_3] or 0
		end
	end
end

function var_0_0.RegisterRequestTime(arg_83_0, arg_83_1, arg_83_2)
	if not arg_83_1 or arg_83_1 <= 0 then
		return
	end

	arg_83_0.requestTime[arg_83_1] = arg_83_2
end

function var_0_0.addActivityParameter(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1:getConfig("config_data")
	local var_84_1 = arg_84_1.stopTime

	for iter_84_0, iter_84_1 in ipairs(var_84_0) do
		arg_84_0.params[iter_84_1[1]] = {
			iter_84_1[2],
			var_84_1
		}
	end
end

function var_0_0.getActivityParameter(arg_85_0, arg_85_1)
	if arg_85_0.params[arg_85_1] then
		local var_85_0, var_85_1 = unpack(arg_85_0.params[arg_85_1])

		if not (var_85_1 > 0) or not (var_85_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_85_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_86_0, arg_86_1)
	for iter_86_0, iter_86_1 in ipairs(arg_86_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_86_1 and not iter_86_1:isEnd() and iter_86_1.data1 > 0 and iter_86_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_86_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_86_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_86_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_87_0, arg_87_1)
	for iter_87_0, iter_87_1 in ipairs(arg_87_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_87_1:getConfig("config_data"), function(arg_88_0)
			return arg_88_0 == arg_87_1
		end) then
			return iter_87_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_89_0, arg_89_1)
	if arg_89_1:IsActivity() then
		return arg_89_0:getActivityById(arg_89_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_90_0)
	local var_90_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function(arg_91_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_92_0)
			return arg_92_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function(arg_93_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function(arg_94_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function(arg_95_0)
			return true
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB] = function(arg_96_0)
			return true
		end
	}
	local var_90_1 = {}

	for iter_90_0, iter_90_1 in pairs(arg_90_0.data) do
		if switch(iter_90_1:getConfig("type"), var_90_0, function(arg_97_0)
			return false
		end) and not iter_90_1:isEnd() and tobool(iter_90_1:getConfig("config_client").entrance_bg) then
			table.insert(var_90_1, iter_90_1)
		end
	end

	table.sort(var_90_1, CompareFuncs({
		function(arg_98_0)
			return arg_98_0:getConfig("config_client").order or 1
		end,
		function(arg_99_0)
			return -arg_99_0.id
		end
	}))

	return var_90_1
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_100_0)
	local var_100_0 = arg_100_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_100_0 or var_100_0:isEnd() then
		return false
	end

	local var_100_1 = var_100_0:GetSlots()

	for iter_100_0, iter_100_1 in pairs(var_100_1) do
		if iter_100_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_101_0, arg_101_1, arg_101_2)
	local var_101_0 = arg_101_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_101_0 or var_101_0:isEnd() then
		return false
	end

	local var_101_1 = var_101_0:GetItems()[arg_101_1]

	return var_101_1 and arg_101_2 <= var_101_1.count
end

function var_0_0.InitContinuousTime(arg_102_0, arg_102_1)
	arg_102_0.continuousOpeartionTime = arg_102_1
	arg_102_0.continuousOpeartionTotalTime = arg_102_1
end

function var_0_0.UseContinuousTime(arg_103_0)
	if not arg_103_0.continuousOpeartionTime then
		return
	end

	arg_103_0.continuousOpeartionTime = arg_103_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_104_0)
	return arg_104_0.continuousOpeartionTime, arg_104_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_105_0, arg_105_1)
	arg_105_0.bossrushAwards = arg_105_0.bossrushAwards or {}

	table.insertto(arg_105_0.bossrushAwards, arg_105_1)
end

function var_0_0.PopBossRushAwards(arg_106_0)
	local var_106_0 = arg_106_0.bossrushAwards or {}

	arg_106_0.bossrushAwards = nil

	return var_106_0
end

function var_0_0.GetBossRushRuntime(arg_107_0, arg_107_1)
	if not arg_107_0.extraDatas[arg_107_1] then
		arg_107_0.extraDatas[arg_107_1] = {
			record = 0,
			diff = 1
		}
	end

	return arg_107_0.extraDatas[arg_107_1]
end

function var_0_0.GetActivityBossRuntime(arg_108_0, arg_108_1)
	if not arg_108_0.extraDatas[arg_108_1] then
		arg_108_0.extraDatas[arg_108_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_108_0.extraDatas[arg_108_1]
end

function var_0_0.GetTaskActivities(arg_109_0)
	local var_109_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_110_0, arg_110_1)
		if not isa(arg_110_1, ITaskActivity) then
			return
		end

		table.insertto(var_109_0, arg_109_0:getActivitiesByType(arg_110_0))
	end)

	return var_109_0
end

function var_0_0.setSurveyState(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_111_0 and not var_111_0:isEnd() then
		arg_111_0.surveyState = arg_111_1
	end
end

function var_0_0.isSurveyDone(arg_112_0)
	local var_112_0 = arg_112_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_112_0 and not var_112_0:isEnd() then
		return arg_112_0.surveyState and arg_112_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_113_0)
	local var_113_0 = arg_113_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_113_0 and not var_113_0:isEnd() then
		local var_113_1 = var_113_0:getConfig("config_data")
		local var_113_2 = var_113_1[1]
		local var_113_3 = var_113_1[2]

		if var_113_2 == 1 then
			local var_113_4 = var_113_3 <= getProxy(PlayerProxy):getData().level
			local var_113_5 = var_113_0:getConfig("config_id")

			return var_113_4, var_113_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_114_0, arg_114_1)
	local var_114_0 = table.Find(arg_114_0.data, function(arg_115_0, arg_115_1)
		if arg_115_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_115_1:getDataConfig("link_id") == arg_114_1
	end)

	return var_114_0 and var_114_0.id
end

function var_0_0.CheckDailyEventRequest(arg_116_0, arg_116_1)
	if arg_116_1:CheckDailyEventRequest() then
		arg_116_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_116_1.id
		})
	end
end

return var_0_0

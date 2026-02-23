local var_0_0 = class("MainRequestActDataSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	arg_1_0:RequestReturnAwardAct()
	arg_1_0:RequestActivityTask()
	arg_1_0:RequestColoring()
	arg_1_0:RequestMetaData()
	arg_1_0:RequestManualSignAct()
	arg_1_0:RequestRandomDailyTask()
	arg_1_0:RequestDALDailyTask()
	arg_1_1()
end

function var_0_0.RequestReturnAwardAct(arg_2_0)
	local var_2_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RETURN_AWARD)

	if var_2_0 and not var_2_0:isEnd() and (var_2_0.data1 == 0 or var_2_0.data1 == 1 and var_2_0.data2 == 0) then
		pg.m02:sendNotification(GAME.RETURN_AWARD_OP, {
			activity_id = var_2_0.id,
			cmd = ActivityConst.RETURN_AWARD_OP_ACTIVTION
		})
	end

	local var_2_1 = var_2_0

	if var_2_1 and not var_2_1:isEnd() then
		local var_2_2 = var_2_1:ShouldAcceptTasks()

		if var_2_2 and var_2_1:IsInviter() then
			pg.m02:sendNotification(GAME.RETURN_AWARD_OP, {
				activity_id = var_2_1.id,
				cmd = ActivityConst.RETURN_AWARD_OP_ACCEPT_TASK
			})
		elseif var_2_2 and var_2_1:IsReturner() then
			pg.m02:sendNotification(GAME.RETURN_AWARD_OP, {
				activity_id = var_2_1.id,
				cmd = ActivityConst.RETURN_AWARD_OP_RETURNER_GET_AWARD
			})
		end
	end
end

function var_0_0.RequestActivityTask(arg_3_0)
	local var_3_0 = getProxy(ActivityProxy)

	_.each(var_3_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_TASK_LIST,
		ActivityConst.ACTIVITY_TYPE_TASK_RES
	}), function(arg_4_0)
		if not arg_4_0:isEnd() then
			updateActivityTaskStatus(arg_4_0)
		end
	end)
	underscore.each(var_3_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_PT_CRUSING
	}), function(arg_5_0)
		if not arg_5_0:isEnd() then
			updateCrusingActivityTask(arg_5_0)
		end
	end)
end

function var_0_0.RequestColoring(arg_6_0)
	local var_6_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA)

	if var_6_0 and not var_6_0:isEnd() then
		pg.m02:sendNotification(GAME.COLORING_FETCH, {
			activityId = var_6_0.id
		})
	end
end

function var_0_0.RequestMetaData(arg_7_0)
	getProxy(MetaCharacterProxy):requestMetaTacticsInfo()
end

function var_0_0.RequestManualSignAct(arg_8_0)
	local var_8_0 = getProxy(ActivityProxy):getRawData()

	for iter_8_0, iter_8_1 in pairs(var_8_0) do
		if iter_8_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN and not iter_8_1:TodayIsSigned() then
			pg.m02:sendNotification(GAME.ACT_MANUAL_SIGN, {
				activity_id = iter_8_1.id,
				cmd = ManualSignActivity.OP_SIGN
			})
		end
	end
end

function var_0_0.RequestRandomDailyTask(arg_9_0)
	local var_9_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RANDOM_DAILY_TASK)

	if not var_9_0 or var_9_0:isEnd() then
		return
	end

	local var_9_1 = pg.TimeMgr.GetInstance():GetServerTime()

	if pg.TimeMgr.GetInstance():IsSameDay(var_9_0.data1, var_9_1) then
		return
	end

	pg.m02:sendNotification(GAME.ACT_RANDOM_DAILY_TASK, {
		activity_id = var_9_0.id,
		cmd = ActivityConst.RANDOM_DAILY_TASK_OP_RANDOM
	})
end

function var_0_0.RequestDALDailyTask(arg_10_0)
	local var_10_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_RUSH_DAL_COLLAB)

	if not var_10_0 then
		return 0
	end

	pg.m02:sendNotification(GAME.COLLABRATE_BOSS_RUSH_REQUEST_DATA, {
		actId = var_10_0.id
	})
end

return var_0_0

local var_0_0 = class("ActivityPermanentProxy", import(".NetProxy"))

var_0_0.TYPE_NORMAL_ACTIVITY = 1
var_0_0.TYPE_REMASTER_ACTIVITY = 2
var_0_0.ACTIVITY_GROUP_RANGES = {
	[var_0_0.TYPE_NORMAL_ACTIVITY] = {
		min = 1,
		max = 1999
	},
	[var_0_0.TYPE_REMASTER_ACTIVITY] = {
		min = 2000,
		max = 2999
	}
}

function var_0_0.register(arg_1_0)
	arg_1_0:on(11210, function(arg_2_0)
		arg_1_0.finishActivity = {}
		arg_1_0.doingActivities = {}
		arg_1_0.activityProgressList = {}

		underscore.each(arg_2_0.permanent_activity, function(arg_3_0)
			arg_1_0.finishActivity[arg_3_0] = true
		end)

		if type(arg_2_0.permanent_now) == "number" then
			table.insert(arg_1_0.doingActivities, arg_2_0.permanent_now)
		else
			for iter_2_0, iter_2_1 in ipairs(arg_2_0.permanent_now) do
				table.insert(arg_1_0.doingActivities, iter_2_1)
			end
		end

		_.each(arg_2_0.progress, function(arg_4_0)
			arg_1_0.activityProgressList[arg_4_0.key] = arg_4_0.value
		end)
	end)
end

function var_0_0.UpdateActivityProgress(arg_5_0, arg_5_1, arg_5_2)
	if not arg_5_0.activityProgressList then
		return
	end

	arg_5_0.activityProgressList[arg_5_1] = arg_5_2
end

function var_0_0.GetActivityProgress(arg_6_0, arg_6_1)
	return arg_6_0.activityProgressList[arg_6_1] or 0
end

function var_0_0.startSelectActivity(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:GetActivityTypeById(arg_7_1)

	for iter_7_0 = #arg_7_0.doingActivities, 1, -1 do
		if arg_7_0.doingActivities[iter_7_0] == arg_7_1 or var_7_0 and arg_7_0:GetActivityTypeById(arg_7_0.doingActivities[iter_7_0]) == var_7_0 then
			table.remove(arg_7_0.doingActivities, iter_7_0)
		end
	end

	table.insert(arg_7_0.doingActivities, arg_7_1)
end

function var_0_0.StopNowActivity(arg_8_0, arg_8_1)
	if table.contains(arg_8_0.doingActivities, arg_8_1) then
		table.removebyvalue(arg_8_0.doingActivities, arg_8_1)
	end
end

function var_0_0.finishNowActivity(arg_9_0, arg_9_1)
	arg_9_0.finishActivity[arg_9_1] = true

	arg_9_0:StopNowActivity(arg_9_1)
end

function var_0_0.isActivityFinish(arg_10_0, arg_10_1)
	return arg_10_0.finishActivity[arg_10_1]
end

function var_0_0.IsActivityGroupByType(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = var_0_0.ACTIVITY_GROUP_RANGES[arg_11_2]

	return var_11_0 and arg_11_1 >= var_11_0.min and arg_11_1 <= var_11_0.max
end

function var_0_0.GetActivityTypeById(arg_12_0, arg_12_1)
	local var_12_0 = pg.activity_task_permanent[arg_12_1]

	if not var_12_0 then
		return nil
	end

	for iter_12_0, iter_12_1 in pairs(var_0_0.ACTIVITY_GROUP_RANGES) do
		if arg_12_0:IsActivityGroupByType(var_12_0.activity_group, iter_12_0) then
			return iter_12_0
		end
	end

	return nil
end

function var_0_0.IsActivityIdByType(arg_13_0, arg_13_1, arg_13_2)
	return arg_13_0:GetActivityTypeById(arg_13_1) == arg_13_2
end

function var_0_0.IsNormalActivityId(arg_14_0, arg_14_1)
	return arg_14_0:IsActivityIdByType(arg_14_1, var_0_0.TYPE_NORMAL_ACTIVITY)
end

function var_0_0.getActivityIdsByType(arg_15_0, arg_15_1)
	arg_15_1 = arg_15_1 or var_0_0.TYPE_NORMAL_ACTIVITY

	return _.select(pg.activity_task_permanent.all, function(arg_16_0)
		return arg_15_0:IsActivityIdByType(arg_16_0, arg_15_1)
	end)
end

function var_0_0.getDoingActivityId(arg_17_0, arg_17_1, arg_17_2)
	arg_17_1 = arg_17_1 or var_0_0.TYPE_NORMAL_ACTIVITY

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.doingActivities or {}) do
		if (not arg_17_2 or arg_17_2 == iter_17_1) and arg_17_0:IsActivityIdByType(iter_17_1, arg_17_1) then
			return iter_17_1
		end
	end

	return nil
end

function var_0_0.getDoingActivityById(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0:getDoingActivityId(arg_18_1, arg_18_2)

	return var_18_0 and getProxy(ActivityProxy):getActivityById(var_18_0) or nil
end

function var_0_0.getDoingActivity(arg_19_0, arg_19_1)
	if #arg_19_0.doingActivities == 0 then
		return nil
	end

	return arg_19_0:getDoingActivityById(arg_19_1)
end

return var_0_0

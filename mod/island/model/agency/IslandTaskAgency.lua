local var_0_0 = class("IslandTaskAgency", import(".IslandBaseAgency"))

var_0_0.TASK_ADDED = "IslandTaskAgency.TASK_ADDED"
var_0_0.TASK_UPDATED = "IslandTaskAgency.TASK_UPDATED"
var_0_0.TASK_REMOVED = "IslandTaskAgency.TASK_REMOVED"
var_0_0.FUTURE_TASK_REMOVED = "IslandTaskAgency.FUTURE_TASK_REMOVED"
var_0_0.TASK_FINISH = "IslandTaskAgency.TASK_FINISH"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.task_info or {}

	arg_1_0.traceId = var_1_0.focus_id or 0

	if arg_1_0.traceId ~= 0 and pg.island_task[arg_1_0.traceId].type == IslandTaskType.MAIN then
		arg_1_0.traceId = 0
	end

	arg_1_0.finishedIds = var_1_0.task_id_list_finish or {}
	arg_1_0.tasks = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.task_list or {}) do
		local var_1_1 = IslandTask.New(iter_1_1)

		arg_1_0.tasks[var_1_1.id] = var_1_1
	end

	arg_1_0:InitFutureTasks(var_1_0.task_list_random or {})

	for iter_1_2, iter_1_3 in pairs(arg_1_0.tasks) do
		if arg_1_0.randomTaskTimes[iter_1_3.id] then
			iter_1_3:SetEndTime(arg_1_0.randomTaskTimes[iter_1_3.id])
		end
	end

	arg_1_0:SetMainTraceId(arg_1_0:GetPriorityMainTraceTaskId())

	arg_1_0.acceptCheckTimestampTags = {}
end

function var_0_0.InitFutureTasks(arg_2_0, arg_2_1)
	arg_2_0.mutexIds = Clone(arg_2_0.finishedIds)

	for iter_2_0, iter_2_1 in pairs(arg_2_0.tasks) do
		table.insert(arg_2_0.mutexIds, iter_2_1.id)
	end

	arg_2_0.futureTasks = {}
	arg_2_0.randomTaskTimes = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1) do
		arg_2_0.randomTaskTimes[iter_2_3.task_id] = iter_2_3.timestamp

		if not arg_2_0:CheckMutex(iter_2_3.task_id) then
			local var_2_0 = IslandFutureTask.New(iter_2_3)

			arg_2_0.futureTasks[var_2_0.id] = var_2_0
		end
	end

	for iter_2_4, iter_2_5 in ipairs(IslandTaskType.GetPermanentTypes()) do
		local var_2_1 = pg.island_task.get_id_list_by_type[iter_2_5] or {}
		local var_2_2 = underscore.select(var_2_1, function(arg_3_0)
			return pg.island_task[arg_3_0].unlock_time ~= "stop" and not var_0_0.IsServerAcceptType(arg_3_0) and not arg_2_0:CheckMutex(arg_3_0)
		end)

		underscore.each(var_2_2, function(arg_4_0)
			local var_4_0 = IslandFutureTask.New({
				task_id = arg_4_0
			})

			arg_2_0.futureTasks[var_4_0.id] = var_4_0
		end)
	end

	arg_2_0:BuildObjectTaskHudData()
end

function var_0_0.BuildObjectTaskHudData(arg_5_0)
	local var_5_0 = table.mergeArray(underscore.keys(arg_5_0.tasks), underscore.keys(arg_5_0.futureTasks))

	IslandObjectTaskHudHelper.BuildData(var_5_0)
end

function var_0_0.CheckMutex(arg_6_0, arg_6_1)
	if arg_6_0:IsPassId(arg_6_1) then
		return true
	end

	local var_6_0 = pg.island_task[arg_6_1].unlock_condition

	if var_6_0 == "" or #var_6_0 == 0 then
		return false
	end

	return underscore.any(var_6_0, function(arg_7_0)
		return arg_7_0[1] == IslandTaskConditionType.MUTEX_TASK and table.contains(arg_6_0.mutexIds, arg_7_0[2])
	end)
end

function var_0_0.GetFinishedIds(arg_8_0)
	return arg_8_0.finishedIds
end

function var_0_0.IsFinishTask(arg_9_0, arg_9_1)
	return table.contains(arg_9_0.finishedIds, arg_9_1)
end

function var_0_0.GetFinishCntByType(arg_10_0, arg_10_1)
	return underscore.reduce(arg_10_0.finishedIds, 0, function(arg_11_0, arg_11_1)
		return arg_11_0 + (pg.island_task[arg_11_1].type == arg_10_1 and 1 or 0)
	end)
end

function var_0_0.IsPassId(arg_12_0, arg_12_1)
	return table.contains(arg_12_0.mutexIds, arg_12_1)
end

function var_0_0.GetTasks(arg_13_0)
	return arg_13_0.tasks
end

function var_0_0.GetShowTasks(arg_14_0)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in pairs(arg_14_0.tasks) do
		local var_14_1 = iter_14_1:getConfig("type")

		if var_14_1 ~= IslandTaskType.SEASON then
			local var_14_2 = iter_14_1:getConfig("link_task")
			local var_14_3 = underscore.all(var_14_2, function(arg_15_0)
				return arg_14_0:IsFinishTask(arg_15_0)
			end)

			if var_14_1 == IslandTaskType.HIDE then
				if #var_14_2 > 0 and var_14_3 then
					table.insert(var_14_0, iter_14_1)
				end
			elseif var_14_3 then
				table.insert(var_14_0, iter_14_1)
			end
		end
	end

	return var_14_0
end

function var_0_0.GetTask(arg_16_0, arg_16_1)
	return arg_16_0.tasks[arg_16_1]
end

function var_0_0.GetFutureTask(arg_17_0, arg_17_1)
	return arg_17_0.futureTasks[arg_17_1]
end

function var_0_0.SetTraceId(arg_18_0, arg_18_1)
	arg_18_0.traceId = arg_18_1
end

function var_0_0.GetTraceId(arg_19_0)
	return arg_19_0.traceId
end

function var_0_0.GetTraceTask(arg_20_0)
	if arg_20_0.traceId == 0 then
		return nil
	end

	return arg_20_0.tasks[arg_20_0.traceId]
end

function var_0_0.SetMainTraceId(arg_21_0, arg_21_1)
	arg_21_0.mainTraceId = arg_21_1
end

function var_0_0.GetMainTraceId(arg_22_0)
	return arg_22_0.mainTraceId
end

function var_0_0.GetMainTraceTask(arg_23_0)
	if arg_23_0.mainTraceId == 0 then
		return nil
	end

	return arg_23_0.tasks[arg_23_0.mainTraceId]
end

function var_0_0.GetPriorityTraceTaskId(arg_24_0)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.tasks) do
		if not table.contains(IslandTaskType.EXCLUED_TRACK_TYPES, iter_24_1:GetType()) then
			table.insert(var_24_0, iter_24_1)
		end
	end

	table.sort(var_24_0, CompareFuncs({
		function(arg_25_0)
			return -arg_25_0:GetAcceptTime()
		end,
		function(arg_26_0)
			return IslandTaskType.GetTrackPriority(arg_26_0:GetType())
		end,
		function(arg_27_0)
			return arg_27_0.id
		end
	}))

	return var_24_0[1] and var_24_0[1].id or 0
end

function var_0_0.GetPriorityMainTraceTaskId(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.tasks) do
		if iter_28_1:GetType() == IslandTaskType.MAIN then
			return iter_28_1.id
		end
	end

	return 0
end

function var_0_0.AddTask(arg_29_0, arg_29_1)
	arg_29_0.tasks[arg_29_1.id] = arg_29_1

	if arg_29_0.randomTaskTimes[arg_29_1.id] then
		arg_29_0.tasks[arg_29_1.id]:SetEndTime(arg_29_0.randomTaskTimes[arg_29_1.id])
	end

	arg_29_0.futureTasks[arg_29_1.id] = nil

	table.insert(arg_29_0.mutexIds, arg_29_1.id)

	for iter_29_0, iter_29_1 in pairs(arg_29_0.futureTasks) do
		if arg_29_0:CheckMutex(iter_29_1.id) then
			arg_29_0:RemoveFutureTask(iter_29_1.id)
		end
	end

	arg_29_0:DispatchEvent(var_0_0.TASK_ADDED, arg_29_1)
end

function var_0_0.UpdateTask(arg_30_0, arg_30_1)
	arg_30_0.tasks[arg_30_1.id] = arg_30_1

	if arg_30_0.randomTaskTimes[arg_30_1.id] then
		arg_30_0.tasks[arg_30_1.id]:SetEndTime(arg_30_0.randomTaskTimes[arg_30_1.id])
	end

	arg_30_0:DispatchEvent(var_0_0.TASK_UPDATED, arg_30_1)

	if arg_30_1:IsFinish() and arg_30_1:IsSubmitImmediately() then
		pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
			taskId = arg_30_1.id
		})
	end
end

function var_0_0.GetDiffTargetIdsByTypeAndParam(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in pairs(arg_31_0.tasks) do
		local var_31_1 = iter_31_1:GetTargetIdByTypeAndParam(arg_31_1, arg_31_2)

		var_31_0 = table.mergeArray(var_31_0, var_31_1, true)
	end

	return var_31_0
end

function var_0_0.GetTasksByTypeAndParam(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = {}

	for iter_32_0, iter_32_1 in pairs(arg_32_0.tasks) do
		if iter_32_1:ExistTargetType(arg_32_1, arg_32_2) then
			table.insert(var_32_0, iter_32_1)
		end
	end

	return task
end

function var_0_0.ExistDailyTask(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.tasks) do
		if iter_33_1:GetShowType() == IslandTaskType.DAILY then
			return true
		end
	end

	return false
end

function var_0_0.AddFinishId(arg_34_0, arg_34_1)
	table.insert(arg_34_0.finishedIds, arg_34_1)
	arg_34_0:DispatchEvent(var_0_0.TASK_FINISH)
end

function var_0_0.RemoveTask(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.tasks[arg_35_1]

	arg_35_0.tasks[arg_35_1] = nil

	arg_35_0:DispatchEvent(var_0_0.TASK_REMOVED, var_35_0)
end

function var_0_0.RemoveFutureTask(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0.futureTasks[arg_36_1]

	arg_36_0.futureTasks[arg_36_1] = nil

	arg_36_0:DispatchEvent(var_0_0.FUTURE_TASK_REMOVED, var_36_0)
end

function var_0_0.UpdatePerDay(arg_37_0)
	pg.m02:sendNotification(GAME.ISLAND_GET_RANDOM_REFRESH_TASK)
end

function var_0_0.UpdateRandomRefreshTask(arg_38_0, arg_38_1)
	for iter_38_0, iter_38_1 in ipairs(arg_38_1.remove_task_list or {}) do
		arg_38_0.tasks[iter_38_1] = nil
	end

	for iter_38_2, iter_38_3 in ipairs(arg_38_1.remove_task_finish or {}) do
		table.removebyvalue(arg_38_0.finishedIds, iter_38_3)
	end

	arg_38_0:InitFutureTasks(arg_38_1.task_list_random or {})
end

function var_0_0.UpdatePerSecond(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.tasks) do
		if not iter_39_1:InTime() then
			arg_39_0:RemoveTask(iter_39_1.id)
		end
	end

	local var_39_0 = {}

	for iter_39_2, iter_39_3 in pairs(arg_39_0.futureTasks) do
		if not iter_39_3:InTime() then
			arg_39_0:RemoveFutureTask(iter_39_3.id)
		end
	end

	local var_39_1 = pg.TimeMgr.GetInstance():GetServerTime()

	if arg_39_0.acceptCheckTimestampTags[var_39_1] then
		arg_39_0.acceptCheckTimestampTags[var_39_1] = nil

		arg_39_0:TryAcceptAutoTasks()
	end
end

function var_0_0.TryAcceptAutoTasks(arg_40_0, arg_40_1)
	local var_40_0 = {}

	arg_40_0.acceptCheckTimestampTags = {}

	for iter_40_0, iter_40_1 in pairs(arg_40_0.futureTasks) do
		if iter_40_1:IsAcceptImmediately() and iter_40_1:IsUnlock() then
			table.insert(var_40_0, iter_40_1.id)
		elseif iter_40_1:IsUnlockWaitTime() then
			arg_40_0.acceptCheckTimestampTags[iter_40_1:GetUnlockTime()] = true
		end
	end

	if #var_40_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
			taskIds = var_40_0,
			callback = arg_40_1
		})
	else
		existCall(arg_40_1)
	end
end

function var_0_0.TrySubmitAutoTasks(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0.tasks) do
		if iter_41_1:IsFinish() and iter_41_1:IsSubmitImmediately() then
			table.insert(var_41_0, function(arg_42_0)
				pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
					taskId = iter_41_1.id,
					callback = arg_42_0
				})
			end)
		end
	end

	seriesAsync(var_41_0, function()
		existCall(arg_41_1)
	end)
end

function var_0_0.TryAutoTrackTask(arg_44_0)
	local var_44_0 = arg_44_0:GetPriorityTraceTaskId()

	if var_44_0 then
		pg.m02:sendNotification(GAME.ISLAND_SET_TRACE_TASK, {
			traceId = var_44_0,
			type = IslandTaskTrackCard.TYPES.OTHER
		})
	end

	local var_44_1 = arg_44_0:GetPriorityMainTraceTaskId()

	if var_44_1 then
		pg.m02:sendNotification(GAME.ISLAND_SET_TRACE_TASK, {
			traceId = var_44_1,
			type = IslandTaskTrackCard.TYPES.MAIN
		})
	end
end

function var_0_0.GetCanAcceptTasks(arg_45_0)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in pairs(arg_45_0.futureTasks) do
		if iter_45_1:IsUnlock() then
			table.insert(var_45_0, iter_45_1)
		end
	end

	return var_45_0
end

function var_0_0.GetCanSubmitTasks(arg_46_0)
	local var_46_0 = {}

	for iter_46_0, iter_46_1 in pairs(arg_46_0.tasks) do
		if iter_46_1:IsFinish() then
			table.insert(var_46_0, iter_46_1)
		end
	end

	return var_46_0
end

function var_0_0.GetCanAcceptTasksByMapId(arg_47_0, arg_47_1)
	local var_47_0 = {}

	for iter_47_0, iter_47_1 in pairs(arg_47_0.futureTasks) do
		if iter_47_1:getConfig("map_trigger_tips") == arg_47_1 and iter_47_1:IsUnlock() then
			table.insert(var_47_0, iter_47_1)
		end
	end

	return var_47_0
end

function var_0_0.GetCanSubmitTasksByMapId(arg_48_0, arg_48_1)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.tasks) do
		if iter_48_1:getConfig("map_complete_tips") == arg_48_1 and iter_48_1:IsFinish() then
			table.insert(var_48_0, iter_48_1)
		end
	end

	return var_48_0
end

function var_0_0.IsServerAcceptType(arg_49_0)
	return pg.island_task[arg_49_0].trigger_type == 3
end

return var_0_0

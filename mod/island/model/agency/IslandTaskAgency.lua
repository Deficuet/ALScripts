local var_0_0 = class("IslandTaskAgency", import(".IslandBaseAgency"))

var_0_0.TASK_ADDED = "IslandTaskAgency.TASK_ADDED"
var_0_0.TASK_UPDATED = "IslandTaskAgency.TASK_UPDATED"
var_0_0.TASK_REMOVED = "IslandTaskAgency.TASK_REMOVED"
var_0_0.FUTURE_TASK_REMOVED = "IslandTaskAgency.FUTURE_TASK_REMOVED"
var_0_0.TASK_FINISH = "IslandTaskAgency.TASK_FINISH"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.task_info or {}

	arg_1_0.traceId = var_1_0.focus_id or 0
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
			return not var_0_0.IsServerAcceptType(arg_3_0) and not arg_2_0:CheckMutex(arg_3_0)
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

function var_0_0.IsFinishTask(arg_8_0, arg_8_1)
	return table.contains(arg_8_0.finishedIds, arg_8_1)
end

function var_0_0.IsPassId(arg_9_0, arg_9_1)
	return table.contains(arg_9_0.mutexIds, arg_9_1)
end

function var_0_0.GetTasks(arg_10_0)
	return arg_10_0.tasks
end

function var_0_0.GetShowTasks(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.tasks) do
		local var_11_1 = iter_11_1:getConfig("type")

		if var_11_1 ~= IslandTaskType.SEASON then
			local var_11_2 = iter_11_1:getConfig("link_task")
			local var_11_3 = underscore.all(var_11_2, function(arg_12_0)
				return arg_11_0:IsFinishTask(arg_12_0)
			end)

			if var_11_1 == IslandTaskType.SEASON then
				if #var_11_2 > 0 and var_11_3 then
					table.insert(var_11_0, iter_11_1)
				end
			elseif var_11_3 then
				table.insert(var_11_0, iter_11_1)
			end
		end
	end

	return var_11_0
end

function var_0_0.GetTask(arg_13_0, arg_13_1)
	return arg_13_0.tasks[arg_13_1]
end

function var_0_0.GetFutureTask(arg_14_0, arg_14_1)
	return arg_14_0.futureTasks[arg_14_1]
end

function var_0_0.SetTraceId(arg_15_0, arg_15_1)
	arg_15_0.traceId = arg_15_1
end

function var_0_0.GetTraceId(arg_16_0)
	return arg_16_0.traceId
end

function var_0_0.GetTraceTask(arg_17_0)
	if arg_17_0.traceId == 0 then
		return nil
	end

	return arg_17_0.tasks[arg_17_0.traceId]
end

function var_0_0.GetPriorityTraceTaskId(arg_18_0)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in pairs(arg_18_0.tasks) do
		if not table.contains(IslandTaskType.EXCLUED_TRACK_TYPES, iter_18_1:GetType()) then
			table.insert(var_18_0, iter_18_1)
		end
	end

	table.sort(var_18_0, CompareFuncs({
		function(arg_19_0)
			return -arg_19_0:GetAcceptTime()
		end,
		function(arg_20_0)
			return IslandTaskType.GetTrackPriority(arg_20_0:GetType())
		end,
		function(arg_21_0)
			return arg_21_0.id
		end
	}))

	return var_18_0[1] and var_18_0[1].id
end

function var_0_0.AddTask(arg_22_0, arg_22_1)
	arg_22_0.tasks[arg_22_1.id] = arg_22_1

	if arg_22_0.randomTaskTimes[arg_22_1.id] then
		arg_22_0.tasks[arg_22_1.id]:SetEndTime(arg_22_0.randomTaskTimes[arg_22_1.id])
	end

	arg_22_0.futureTasks[arg_22_1.id] = nil

	table.insert(arg_22_0.mutexIds, arg_22_1.id)

	for iter_22_0, iter_22_1 in pairs(arg_22_0.futureTasks) do
		if arg_22_0:CheckMutex(iter_22_1.id) then
			arg_22_0:RemoveFutureTask(iter_22_1.id)
		end
	end

	arg_22_0:DispatchEvent(var_0_0.TASK_ADDED, arg_22_1)
end

function var_0_0.UpdateTask(arg_23_0, arg_23_1)
	arg_23_0.tasks[arg_23_1.id] = arg_23_1

	if arg_23_0.randomTaskTimes[arg_23_1.id] then
		arg_23_0.tasks[arg_23_1.id]:SetEndTime(arg_23_0.randomTaskTimes[arg_23_1.id])
	end

	arg_23_0:DispatchEvent(var_0_0.TASK_UPDATED, arg_23_1)

	if arg_23_1:IsFinish() and arg_23_1:IsSubmitImmediately() then
		pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
			taskId = arg_23_1.id
		})
	end
end

function var_0_0.GetDiffTargetIdsByTypeAndParam(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.tasks) do
		local var_24_1 = iter_24_1:GetTargetIdByTypeAndParam(arg_24_1, arg_24_2)

		var_24_0 = table.mergeArray(var_24_0, var_24_1, true)
	end

	return var_24_0
end

function var_0_0.GetTasksByTypeAndParam(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0.tasks) do
		if iter_25_1:ExistTargetType(arg_25_1, arg_25_2) then
			table.insert(var_25_0, iter_25_1)
		end
	end

	return task
end

function var_0_0.ExistDailyTask(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.tasks) do
		if iter_26_1:GetShowType() == IslandTaskType.DAILY then
			return true
		end
	end

	return false
end

function var_0_0.AddFinishId(arg_27_0, arg_27_1)
	table.insert(arg_27_0.finishedIds, arg_27_1)
	arg_27_0:DispatchEvent(var_0_0.TASK_FINISH)
end

function var_0_0.RemoveTask(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.tasks[arg_28_1]

	arg_28_0.tasks[arg_28_1] = nil

	arg_28_0:DispatchEvent(var_0_0.TASK_REMOVED, var_28_0)
end

function var_0_0.RemoveFutureTask(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.futureTasks[arg_29_1]

	arg_29_0.futureTasks[arg_29_1] = nil

	arg_29_0:DispatchEvent(var_0_0.FUTURE_TASK_REMOVED, var_29_0)
end

function var_0_0.UpdatePerDay(arg_30_0)
	pg.m02:sendNotification(GAME.ISLAND_GET_RANDOM_REFRESH_TASK)
end

function var_0_0.UpdateRandomRefreshTask(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in ipairs(arg_31_1.remove_task_list or {}) do
		arg_31_0.tasks[iter_31_1] = nil
	end

	for iter_31_2, iter_31_3 in ipairs(arg_31_1.remove_task_finish or {}) do
		table.removebyvalue(arg_31_0.finishedIds, iter_31_3)
	end

	arg_31_0:InitFutureTasks(arg_31_1.task_list_random or {})
end

function var_0_0.UpdatePerSecond(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.tasks) do
		if not iter_32_1:InTime() then
			arg_32_0:RemoveTask(iter_32_1.id)
		end
	end

	local var_32_0 = {}

	for iter_32_2, iter_32_3 in pairs(arg_32_0.futureTasks) do
		if not iter_32_3:InTime() then
			arg_32_0:RemoveFutureTask(iter_32_3.id)
		end
	end

	local var_32_1 = pg.TimeMgr.GetInstance():GetServerTime()

	if arg_32_0.acceptCheckTimestampTags[var_32_1] then
		arg_32_0.acceptCheckTimestampTags[var_32_1] = nil

		arg_32_0:TryAcceptAutoTasks()
	end
end

function var_0_0.TryAcceptAutoTasks(arg_33_0, arg_33_1)
	local var_33_0 = {}

	arg_33_0.acceptCheckTimestampTags = {}

	for iter_33_0, iter_33_1 in pairs(arg_33_0.futureTasks) do
		if iter_33_1:IsAcceptImmediately() and iter_33_1:IsUnlock() then
			table.insert(var_33_0, iter_33_1.id)
		elseif iter_33_1:IsUnlockWaitTime() then
			arg_33_0.acceptCheckTimestampTags[iter_33_1:GetUnlockTime()] = true
		end
	end

	if #var_33_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
			taskIds = var_33_0,
			callback = arg_33_1
		})
	else
		existCall(arg_33_1)
	end
end

function var_0_0.TrySubmitAutoTasks(arg_34_0, arg_34_1)
	local var_34_0 = {}

	for iter_34_0, iter_34_1 in pairs(arg_34_0.tasks) do
		if iter_34_1:IsFinish() and iter_34_1:IsSubmitImmediately() then
			table.insert(var_34_0, function(arg_35_0)
				pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
					taskId = iter_34_1.id,
					callback = arg_35_0
				})
			end)
		end
	end

	seriesAsync(var_34_0, function()
		existCall(arg_34_1)
	end)
end

function var_0_0.TryAutoTrackTask(arg_37_0)
	local var_37_0 = arg_37_0:GetPriorityTraceTaskId()

	if var_37_0 then
		pg.m02:sendNotification(GAME.ISLAND_SET_TRACE_TASK, {
			traceId = var_37_0
		})
	end
end

function var_0_0.GetCanAcceptTasks(arg_38_0)
	local var_38_0 = {}

	for iter_38_0, iter_38_1 in pairs(arg_38_0.futureTasks) do
		if iter_38_1:IsUnlock() then
			table.insert(var_38_0, iter_38_1)
		end
	end

	return var_38_0
end

function var_0_0.GetCanSubmitTasks(arg_39_0)
	local var_39_0 = {}

	for iter_39_0, iter_39_1 in pairs(arg_39_0.tasks) do
		if iter_39_1:IsFinish() then
			table.insert(var_39_0, iter_39_1)
		end
	end

	return var_39_0
end

function var_0_0.GetCanAcceptTasksByMapId(arg_40_0, arg_40_1)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in pairs(arg_40_0.futureTasks) do
		if iter_40_1:getConfig("map_trigger_tips") == arg_40_1 and iter_40_1:IsUnlock() then
			table.insert(var_40_0, iter_40_1)
		end
	end

	return var_40_0
end

function var_0_0.GetCanSubmitTasksByMapId(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0.tasks) do
		if iter_41_1:getConfig("map_complete_tips") == arg_41_1 and iter_41_1:IsFinish() then
			table.insert(var_41_0, iter_41_1)
		end
	end

	return var_41_0
end

function var_0_0.IsServerAcceptType(arg_42_0)
	return pg.island_task[arg_42_0].trigger_type == 3
end

return var_0_0

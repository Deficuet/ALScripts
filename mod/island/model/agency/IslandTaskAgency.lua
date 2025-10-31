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

function var_0_0.GetFinishedIds(arg_8_0)
	return arg_8_0.finishedIds
end

function var_0_0.IsFinishTask(arg_9_0, arg_9_1)
	return table.contains(arg_9_0.finishedIds, arg_9_1)
end

function var_0_0.IsPassId(arg_10_0, arg_10_1)
	return table.contains(arg_10_0.mutexIds, arg_10_1)
end

function var_0_0.GetTasks(arg_11_0)
	return arg_11_0.tasks
end

function var_0_0.GetShowTasks(arg_12_0)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0.tasks) do
		local var_12_1 = iter_12_1:getConfig("type")

		if var_12_1 ~= IslandTaskType.SEASON then
			local var_12_2 = iter_12_1:getConfig("link_task")
			local var_12_3 = underscore.all(var_12_2, function(arg_13_0)
				return arg_12_0:IsFinishTask(arg_13_0)
			end)

			if var_12_1 == IslandTaskType.HIDE then
				if #var_12_2 > 0 and var_12_3 then
					table.insert(var_12_0, iter_12_1)
				end
			elseif var_12_3 then
				table.insert(var_12_0, iter_12_1)
			end
		end
	end

	return var_12_0
end

function var_0_0.GetTask(arg_14_0, arg_14_1)
	return arg_14_0.tasks[arg_14_1]
end

function var_0_0.GetFutureTask(arg_15_0, arg_15_1)
	return arg_15_0.futureTasks[arg_15_1]
end

function var_0_0.SetTraceId(arg_16_0, arg_16_1)
	arg_16_0.traceId = arg_16_1
end

function var_0_0.GetTraceId(arg_17_0)
	return arg_17_0.traceId
end

function var_0_0.GetTraceTask(arg_18_0)
	if arg_18_0.traceId == 0 then
		return nil
	end

	return arg_18_0.tasks[arg_18_0.traceId]
end

function var_0_0.GetPriorityTraceTaskId(arg_19_0)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_0.tasks) do
		if not table.contains(IslandTaskType.EXCLUED_TRACK_TYPES, iter_19_1:GetType()) then
			table.insert(var_19_0, iter_19_1)
		end
	end

	table.sort(var_19_0, CompareFuncs({
		function(arg_20_0)
			return -arg_20_0:GetAcceptTime()
		end,
		function(arg_21_0)
			return IslandTaskType.GetTrackPriority(arg_21_0:GetType())
		end,
		function(arg_22_0)
			return arg_22_0.id
		end
	}))

	return var_19_0[1] and var_19_0[1].id
end

function var_0_0.AddTask(arg_23_0, arg_23_1)
	arg_23_0.tasks[arg_23_1.id] = arg_23_1

	if arg_23_0.randomTaskTimes[arg_23_1.id] then
		arg_23_0.tasks[arg_23_1.id]:SetEndTime(arg_23_0.randomTaskTimes[arg_23_1.id])
	end

	arg_23_0.futureTasks[arg_23_1.id] = nil

	table.insert(arg_23_0.mutexIds, arg_23_1.id)

	for iter_23_0, iter_23_1 in pairs(arg_23_0.futureTasks) do
		if arg_23_0:CheckMutex(iter_23_1.id) then
			arg_23_0:RemoveFutureTask(iter_23_1.id)
		end
	end

	arg_23_0:DispatchEvent(var_0_0.TASK_ADDED, arg_23_1)
end

function var_0_0.UpdateTask(arg_24_0, arg_24_1)
	arg_24_0.tasks[arg_24_1.id] = arg_24_1

	if arg_24_0.randomTaskTimes[arg_24_1.id] then
		arg_24_0.tasks[arg_24_1.id]:SetEndTime(arg_24_0.randomTaskTimes[arg_24_1.id])
	end

	arg_24_0:DispatchEvent(var_0_0.TASK_UPDATED, arg_24_1)

	if arg_24_1:IsFinish() and arg_24_1:IsSubmitImmediately() then
		pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
			taskId = arg_24_1.id
		})
	end
end

function var_0_0.GetDiffTargetIdsByTypeAndParam(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0.tasks) do
		local var_25_1 = iter_25_1:GetTargetIdByTypeAndParam(arg_25_1, arg_25_2)

		var_25_0 = table.mergeArray(var_25_0, var_25_1, true)
	end

	return var_25_0
end

function var_0_0.GetTasksByTypeAndParam(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.tasks) do
		if iter_26_1:ExistTargetType(arg_26_1, arg_26_2) then
			table.insert(var_26_0, iter_26_1)
		end
	end

	return task
end

function var_0_0.ExistDailyTask(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.tasks) do
		if iter_27_1:GetShowType() == IslandTaskType.DAILY then
			return true
		end
	end

	return false
end

function var_0_0.AddFinishId(arg_28_0, arg_28_1)
	table.insert(arg_28_0.finishedIds, arg_28_1)
	arg_28_0:DispatchEvent(var_0_0.TASK_FINISH)
end

function var_0_0.RemoveTask(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.tasks[arg_29_1]

	arg_29_0.tasks[arg_29_1] = nil

	arg_29_0:DispatchEvent(var_0_0.TASK_REMOVED, var_29_0)
end

function var_0_0.RemoveFutureTask(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.futureTasks[arg_30_1]

	arg_30_0.futureTasks[arg_30_1] = nil

	arg_30_0:DispatchEvent(var_0_0.FUTURE_TASK_REMOVED, var_30_0)
end

function var_0_0.UpdatePerDay(arg_31_0)
	pg.m02:sendNotification(GAME.ISLAND_GET_RANDOM_REFRESH_TASK)
end

function var_0_0.UpdateRandomRefreshTask(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in ipairs(arg_32_1.remove_task_list or {}) do
		arg_32_0.tasks[iter_32_1] = nil
	end

	for iter_32_2, iter_32_3 in ipairs(arg_32_1.remove_task_finish or {}) do
		table.removebyvalue(arg_32_0.finishedIds, iter_32_3)
	end

	arg_32_0:InitFutureTasks(arg_32_1.task_list_random or {})
end

function var_0_0.UpdatePerSecond(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.tasks) do
		if not iter_33_1:InTime() then
			arg_33_0:RemoveTask(iter_33_1.id)
		end
	end

	local var_33_0 = {}

	for iter_33_2, iter_33_3 in pairs(arg_33_0.futureTasks) do
		if not iter_33_3:InTime() then
			arg_33_0:RemoveFutureTask(iter_33_3.id)
		end
	end

	local var_33_1 = pg.TimeMgr.GetInstance():GetServerTime()

	if arg_33_0.acceptCheckTimestampTags[var_33_1] then
		arg_33_0.acceptCheckTimestampTags[var_33_1] = nil

		arg_33_0:TryAcceptAutoTasks()
	end
end

function var_0_0.TryAcceptAutoTasks(arg_34_0, arg_34_1)
	local var_34_0 = {}

	arg_34_0.acceptCheckTimestampTags = {}

	for iter_34_0, iter_34_1 in pairs(arg_34_0.futureTasks) do
		if iter_34_1:IsAcceptImmediately() and iter_34_1:IsUnlock() then
			table.insert(var_34_0, iter_34_1.id)
		elseif iter_34_1:IsUnlockWaitTime() then
			arg_34_0.acceptCheckTimestampTags[iter_34_1:GetUnlockTime()] = true
		end
	end

	if #var_34_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
			taskIds = var_34_0,
			callback = arg_34_1
		})
	else
		existCall(arg_34_1)
	end
end

function var_0_0.TrySubmitAutoTasks(arg_35_0, arg_35_1)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in pairs(arg_35_0.tasks) do
		if iter_35_1:IsFinish() and iter_35_1:IsSubmitImmediately() then
			table.insert(var_35_0, function(arg_36_0)
				pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
					taskId = iter_35_1.id,
					callback = arg_36_0
				})
			end)
		end
	end

	seriesAsync(var_35_0, function()
		existCall(arg_35_1)
	end)
end

function var_0_0.TryAutoTrackTask(arg_38_0)
	local var_38_0 = arg_38_0:GetPriorityTraceTaskId()

	if var_38_0 then
		pg.m02:sendNotification(GAME.ISLAND_SET_TRACE_TASK, {
			traceId = var_38_0
		})
	end
end

function var_0_0.GetCanAcceptTasks(arg_39_0)
	local var_39_0 = {}

	for iter_39_0, iter_39_1 in pairs(arg_39_0.futureTasks) do
		if iter_39_1:IsUnlock() then
			table.insert(var_39_0, iter_39_1)
		end
	end

	return var_39_0
end

function var_0_0.GetCanSubmitTasks(arg_40_0)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in pairs(arg_40_0.tasks) do
		if iter_40_1:IsFinish() then
			table.insert(var_40_0, iter_40_1)
		end
	end

	return var_40_0
end

function var_0_0.GetCanAcceptTasksByMapId(arg_41_0, arg_41_1)
	local var_41_0 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0.futureTasks) do
		if iter_41_1:getConfig("map_trigger_tips") == arg_41_1 and iter_41_1:IsUnlock() then
			table.insert(var_41_0, iter_41_1)
		end
	end

	return var_41_0
end

function var_0_0.GetCanSubmitTasksByMapId(arg_42_0, arg_42_1)
	local var_42_0 = {}

	for iter_42_0, iter_42_1 in pairs(arg_42_0.tasks) do
		if iter_42_1:getConfig("map_complete_tips") == arg_42_1 and iter_42_1:IsFinish() then
			table.insert(var_42_0, iter_42_1)
		end
	end

	return var_42_0
end

function var_0_0.IsServerAcceptType(arg_43_0)
	return pg.island_task[arg_43_0].trigger_type == 3
end

return var_0_0

local var_0_0 = class("UpdateLowPriorityTaskProgressCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.taskId
	local var_1_2 = pg.task_data_template[var_1_1]
	local var_1_3
	local var_1_4
	local var_1_5 = getProxy(TaskProxy)
	local var_1_6 = var_1_5:getTaskById(var_1_1)

	if not var_1_6 then
		return
	end

	local var_1_7 = var_1_6:getActId()
	local var_1_8 = var_1_6:getConfig("sub_type")
	local var_1_9 = false

	if var_1_8 == 2001 then
		var_1_3 = Task.TASK_PROGRESS_UPDATE

		local var_1_10 = var_1_2.target_id
		local var_1_11 = var_1_2.target_num
		local var_1_12 = getProxy(FleetProxy):getData()

		for iter_1_0, iter_1_1 in pairs(var_1_12) do
			if (table.contains(var_1_10, iter_1_1.id) or #var_1_10 == 0) and iter_1_1:getShipCount() == var_1_11 then
				var_1_9 = true

				break
			end
		end

		var_1_4 = var_1_11
	elseif var_1_8 == 2002 then
		var_1_3 = Task.TASK_PROGRESS_UPDATE

		local var_1_13 = var_1_2.target_id
		local var_1_14 = var_1_13[1]
		local var_1_15 = var_1_13[2]
		local var_1_16 = var_1_2.target_num
		local var_1_17 = getProxy(FleetProxy):getData()
		local var_1_18 = 0

		for iter_1_2, iter_1_3 in pairs(var_1_17) do
			if iter_1_3:getShipCount() == var_1_15 and var_1_14 <= iter_1_3:avgLevel() then
				var_1_18 = var_1_18 + 1
			end
		end

		if not var_1_6:isFinish() and var_1_18 > var_1_6.progress then
			var_1_9 = true
			var_1_4 = var_1_18
		end
	elseif var_1_8 == 2003 then
		var_1_3 = Task.TASK_PROGRESS_UPDATE
		var_1_9 = true
		var_1_4 = 1
	elseif var_1_8 == 2010 or var_1_8 == 2011 then
		var_1_3 = Task.TASK_PROGRESS_APPEND
		var_1_9 = true
		var_1_4 = 1
	elseif var_1_8 == 2012 then
		var_1_3 = Task.TASK_PROGRESS_UPDATE
		var_1_4 = var_1_0.progress
		var_1_9 = true
	elseif var_1_8 == 2025 then
		var_1_3 = Task.TASK_PROGRESS_UPDATE
		var_1_4 = 1
		var_1_9 = true
	end

	if not var_1_9 then
		return
	end

	local var_1_19 = {
		task_id = var_1_1,
		mode = var_1_3,
		progress = var_1_4,
		act_id = var_1_7
	}

	pg.ConnectionMgr.GetInstance():Send(20209, {
		progressinfo = {
			var_1_19
		}
	}, 20210, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_3 == Task.TASK_PROGRESS_UPDATE then
				var_1_6:updateProgress(var_1_4)
			elseif var_1_3 == Task.TASK_PROGRESS_APPEND then
				local var_2_0 = var_1_6.progress + var_1_4

				var_1_6:updateProgress(var_2_0)
			end

			var_1_5:updateTask(var_1_6)
			arg_1_0:sendNotification(GAME.SHARE_TASK_FINISHED)
		end
	end)
end

return var_0_0

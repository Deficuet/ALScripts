local var_0_0 = class("ActivityTaskProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0.actTasks = {}
	arg_1_0.autoSubmitTasks = {}
end

function var_0_0.clearData(arg_2_0)
	arg_2_0.actTasks = {}
	arg_2_0.autoSubmitTasks = {}
end

function var_0_0.initActList(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not arg_3_2 then
		return {}
	end

	local var_3_0 = {}
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
		local var_3_2 = arg_3_0:createTask(arg_3_1, iter_3_1)

		table.insert(var_3_0, var_3_2)
	end

	if arg_3_3 and #arg_3_3 > 0 then
		for iter_3_2, iter_3_3 in ipairs(arg_3_3) do
			local var_3_3 = arg_3_0:createTask(arg_3_1, {
				id = iter_3_3
			})

			table.insert(var_3_1, var_3_3)
		end
	end

	table.insert(arg_3_0.actTasks, {
		actId = arg_3_1,
		tasks = var_3_0,
		finish_tasks = var_3_1
	})
	arg_3_0:checkAutoSubmit()
end

function var_0_0.finishActTask(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = pg.task_data_template[arg_4_2].type

	if not table.contains(TotalTaskProxy.act_task_onece_type, var_4_0) then
		return
	end

	for iter_4_0 = 1, #arg_4_0.actTasks do
		if arg_4_0.actTasks[iter_4_0].actId == arg_4_1 then
			local var_4_1 = true

			for iter_4_1, iter_4_2 in ipairs(arg_4_0.actTasks[iter_4_0].finish_tasks) do
				if iter_4_2.id == arg_4_2 then
					var_4_1 = false

					break
				end
			end

			if var_4_1 then
				table.insert(arg_4_0.actTasks[iter_4_0].finish_tasks, arg_4_0:createTask(arg_4_1, {
					id = arg_4_2
				}))
			end
		end
	end
end

function var_0_0.updateActList(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_2) do
		for iter_5_2 = 1, #arg_5_0.actTasks do
			if arg_5_0.actTasks[iter_5_2].actId == arg_5_1 then
				for iter_5_3, iter_5_4 in ipairs(arg_5_0.actTasks[iter_5_2].tasks) do
					if iter_5_4.id == iter_5_1.id then
						iter_5_4:updateProgress(iter_5_1.progress)
					end
				end
			end
		end
	end

	arg_5_0:checkAutoSubmit()
end

function var_0_0.updateProgressBySubType(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	for iter_6_0 = 1, #arg_6_0.actTasks do
		if arg_6_0.actTasks[iter_6_0].actId == arg_6_1 then
			for iter_6_1, iter_6_2 in ipairs(arg_6_0.actTasks[iter_6_0].tasks) do
				if iter_6_2:getConfig("sub_type") == arg_6_2 then
					iter_6_2:updateProgress(arg_6_3)
				end
			end
		end
	end

	arg_6_0:checkAutoSubmit()
end

function var_0_0.addActList(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0, iter_7_1 in ipairs(arg_7_2) do
		for iter_7_2 = 1, #arg_7_0.actTasks do
			if arg_7_0.actTasks[iter_7_2].actId == arg_7_1 then
				local var_7_0 = arg_7_0.actTasks[iter_7_2].tasks

				for iter_7_3 = #var_7_0, 1, -1 do
					if var_7_0[iter_7_3].id == iter_7_1.id then
						table.remove(var_7_0, iter_7_3)
					end
				end

				local var_7_1 = arg_7_0:createTask(arg_7_1, iter_7_1)

				table.insert(var_7_0, var_7_1)
			end
		end
	end

	arg_7_0:checkAutoSubmit()
end

function var_0_0.checkAutoSubmit(arg_8_0)
	if not arg_8_0.actTasks or #arg_8_0.actTasks == 0 then
		return
	end

	for iter_8_0 = 1, #arg_8_0.actTasks do
		local var_8_0 = arg_8_0.actTasks[iter_8_0].actId
		local var_8_1 = arg_8_0.actTasks[iter_8_0].tasks
		local var_8_2 = {}

		for iter_8_1, iter_8_2 in ipairs(var_8_1) do
			if iter_8_2.autoCommit and iter_8_2:isFinish() then
				if not table.contains(arg_8_0.autoSubmitTasks, iter_8_2.id) then
					table.insert(var_8_2, iter_8_2.id)
					table.insert(arg_8_0.autoSubmitTasks, iter_8_2.id)
				else
					warning("task_id" .. iter_8_2.id .. "已经存在于提交列表中，无需重复提交")
				end
			end
		end

		if #var_8_2 > 0 then
			arg_8_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
				act_id = var_8_0,
				task_ids = var_8_2
			})
		end
	end
end

function var_0_0.removeActList(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0, iter_9_1 in ipairs(arg_9_2) do
		for iter_9_2 = 1, #arg_9_0.actTasks do
			if arg_9_0.actTasks[iter_9_2].actId == arg_9_1 then
				local var_9_0 = arg_9_0.actTasks[iter_9_2].tasks

				for iter_9_3 = #var_9_0, 1, -1 do
					if var_9_0[iter_9_3].id == iter_9_1.id then
						if var_9_0[iter_9_3]:isCircle() then
							var_9_0[iter_9_3]:updateProgress(0)
						else
							local var_9_1 = table.remove(var_9_0, iter_9_3)

							arg_9_0:finishActTask(arg_9_1, var_9_1.id)
						end
					end
				end
			end
		end
	end
end

function var_0_0.getTaskById(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.actTasks) do
		if iter_10_1.actId == arg_10_1 then
			return Clone(iter_10_1.tasks)
		end
	end

	return {}
end

function var_0_0.getFinishTaskById(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.actTasks) do
		if iter_11_1.actId == arg_11_1 then
			local var_11_0 = Clone(iter_11_1.finish_tasks)

			_.each(var_11_0, function(arg_12_0)
				arg_12_0:setOver()
			end)

			return var_11_0
		end
	end

	return {}
end

function var_0_0.getFinishTasksByActId(arg_13_0, arg_13_1)
	local var_13_0 = getProxy(ActivityProxy):getActivityById(arg_13_1)

	if not var_13_0 then
		return {}
	end

	local var_13_1 = var_13_0:GetFinishedTaskIds()

	return _.map(var_13_1, function(arg_14_0)
		local var_14_0 = ActivityTask.New(arg_13_1, {
			id = arg_14_0
		})

		var_14_0:setOver()

		return var_14_0
	end)
end

function var_0_0.checkTasksFinish(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0:getFinishTasksByActId(arg_15_1)) do
		var_15_0[iter_15_1.id] = true
	end

	return underscore.all(arg_15_2, function(arg_16_0)
		return var_15_0[arg_16_0.id]
	end)
end

function var_0_0.getTaskVOsByActId(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:getTaskById(arg_17_1)

	table.insertto(var_17_0, arg_17_0:getFinishTasksByActId(arg_17_1))

	return var_17_0
end

function var_0_0.getActTaskTip(arg_18_0, arg_18_1)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.actTasks) do
		if iter_18_1.actId == arg_18_1 then
			var_18_0 = iter_18_1.tasks
		end
	end

	local var_18_1 = 0

	for iter_18_2, iter_18_3 in ipairs(var_18_0) do
		if not iter_18_3:isCircle() and not iter_18_3:isOver() and iter_18_3:isFinish() and not iter_18_3.autoCommit then
			var_18_1 = var_18_1 + 1
		end
	end

	return var_18_1 > 0
end

function var_0_0.getTaskVo(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0:getTaskById(arg_19_1)

	for iter_19_0 = 1, #var_19_0 do
		if var_19_0[iter_19_0].id == arg_19_2 then
			return Clone(var_19_0[iter_19_0])
		end
	end

	return nil
end

function var_0_0.createTask(arg_20_0, arg_20_1, arg_20_2)
	return (ActivityTask.New(arg_20_1, arg_20_2))
end

function var_0_0.getFinishTasks(arg_21_0)
	local var_21_0 = getProxy(ActivityProxy):GetTaskActivities()
	local var_21_1 = {}

	_.each(_.map(var_21_0, function(arg_22_0)
		return arg_21_0:getFinishTasksByActId(arg_22_0.id)
	end), function(arg_23_0)
		table.insertto(var_21_1, arg_23_0)
	end)

	return var_21_1
end

function var_0_0.GetActivityTasks(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:getTaskById(arg_24_1)
	local var_24_1 = arg_24_0:getFinishTaskById(arg_24_1)
	local var_24_2 = {}

	_.each(var_24_0, function(arg_25_0)
		var_24_2[arg_25_0.id] = arg_25_0
	end)
	_.each(var_24_1, function(arg_26_0)
		var_24_2[arg_26_0.id] = arg_26_0
	end)

	return var_24_2
end

return var_0_0

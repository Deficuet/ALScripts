local var_0_0 = class("AvatarFrameProxy", import(".NetProxy"))

var_0_0.FRAME_TASK_UPDATED = "frame task updated"
var_0_0.FRAME_TASK_TIME_OUT = "frame task time out"

function var_0_0.register(arg_1_0)
	arg_1_0.avatarFrames = {}
end

function var_0_0.clearData(arg_2_0)
	arg_2_0.avatarFrames = {}
end

function var_0_0.initListData(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = {}
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
		local var_3_2 = arg_3_0:createAvatarFrameTask(arg_3_1, iter_3_1)

		table.insert(var_3_0, var_3_2)
	end

	if arg_3_3 and #arg_3_3 then
		for iter_3_2, iter_3_3 in ipairs(arg_3_3) do
			local var_3_3 = arg_3_0:createAvatarFrameTask(arg_3_1, {
				id = iter_3_3
			})

			var_3_3:setTaskFinish()
			table.insert(var_3_1, var_3_3)
		end
	end

	table.insert(arg_3_0.avatarFrames, {
		actId = arg_3_1,
		tasks = var_3_0,
		finish_tasks = var_3_1
	})
end

function var_0_0.update(arg_4_0, arg_4_1, arg_4_2)
	for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
		arg_4_0:updateAvatarTask(arg_4_1, iter_4_1)
	end

	arg_4_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
end

function var_0_0.addData(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_2) do
		local var_5_0 = arg_5_0:createAvatarFrameTask(arg_5_1, iter_5_1)

		arg_5_0:addAvatarTask(arg_5_1, var_5_0)
	end

	arg_5_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
end

function var_0_0.removeData(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in ipairs(arg_6_2) do
		arg_6_0:removeAvatarTask(arg_6_1, iter_6_1.id)
	end

	arg_6_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
end

function var_0_0.createAvatarFrameTask(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = pg.activity_template[arg_7_1].config_id

	return (AvatarFrameTask.New(arg_7_1, var_7_0, arg_7_2))
end

function var_0_0.updateAvatarTask(arg_8_0, arg_8_1, arg_8_2)
	for iter_8_0 = 1, #arg_8_0.avatarFrames do
		if arg_8_0.avatarFrames[iter_8_0].actId == arg_8_1 then
			local var_8_0 = arg_8_0.avatarFrames[iter_8_0]

			for iter_8_1 = #var_8_0.tasks, 1, -1 do
				if var_8_0.tasks[iter_8_1].id == arg_8_2.id then
					var_8_0.tasks[iter_8_1]:updateProgress(arg_8_2.progress)
				end
			end
		end
	end
end

function var_0_0.addAvatarTask(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0 = 1, #arg_9_0.avatarFrames do
		if arg_9_0.avatarFrames[iter_9_0].actId == arg_9_1 then
			local var_9_0 = arg_9_0.avatarFrames[iter_9_0]

			for iter_9_1 = #var_9_0.tasks, 1, -1 do
				if var_9_0.tasks[iter_9_1].id == arg_9_2.id then
					table.remove(var_9_0.tasks, iter_9_1)
				end
			end

			table.insert(var_9_0.tasks, arg_9_2)
		end
	end
end

function var_0_0.removeAvatarTask(arg_10_0, arg_10_1, arg_10_2)
	for iter_10_0 = 1, #arg_10_0.avatarFrames do
		if arg_10_0.avatarFrames[iter_10_0].actId == arg_10_1 then
			local var_10_0 = arg_10_0.avatarFrames[iter_10_0]

			for iter_10_1 = #var_10_0.tasks, 1, -1 do
				if var_10_0.tasks[iter_10_1].id == arg_10_2 then
					table.remove(var_10_0.tasks, iter_10_1)
				end
			end
		end
	end
end

function var_0_0.getAvatarFrameById(arg_11_0, arg_11_1)
	for iter_11_0 = 1, #arg_11_0.avatarFrames do
		if arg_11_0.avatarFrames[iter_11_0].actId == arg_11_1 then
			return Clone(arg_11_0.avatarFrames[iter_11_0])
		end
	end

	return nil
end

function var_0_0.getAllAvatarFrame(arg_12_0)
	return Clone(arg_12_0.avatarFrames)
end

function var_0_0.getCanReceiveCount(arg_13_0)
	local var_13_0 = 0

	for iter_13_0 = 1, #arg_13_0.avatarFrames do
		local var_13_1 = arg_13_0.avatarFrames[iter_13_0]

		for iter_13_1, iter_13_2 in ipairs(var_13_1.tasks) do
			if iter_13_2:getTaskStatus() == 1 then
				var_13_0 = var_13_0 + 1
			end
		end
	end

	return var_13_0
end

function var_0_0.clearTimeOut(arg_14_0)
	if not arg_14_0.avatarFrames or #arg_14_0.avatarFrames == 0 then
		return
	end

	local var_14_0 = false

	for iter_14_0 = #arg_14_0.avatarFrames, 1, -1 do
		local var_14_1 = arg_14_0.avatarFrames[iter_14_0].actId
		local var_14_2 = getProxy(ActivityProxy):getActivityById(var_14_1)

		if not var_14_2 or var_14_2:isEnd() then
			table.remove(arg_14_0.avatarFrames, iter_14_0)

			var_14_0 = true
		end
	end

	if var_14_0 then
		arg_14_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
		arg_14_0.facade:sendNotification(var_0_0.FRAME_TASK_TIME_OUT)
	end
end

return var_0_0

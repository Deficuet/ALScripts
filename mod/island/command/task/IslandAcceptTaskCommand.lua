local var_0_0 = class("IslandAcceptTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.taskIds
	local var_1_2 = var_1_0.callback

	pg.ConnectionMgr.GetInstance():Send(21032, {
		task_id_list = var_1_1
	}, 21033, function(arg_2_0)
		local var_2_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
		local var_2_1 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.task_list or {}) do
			local var_2_2 = IslandTask.New(iter_2_1)

			var_2_0:AddTask(var_2_2)
			table.insert(var_2_1, iter_2_1.id)
		end

		if #var_2_1 > 0 then
			var_2_0:TryAutoTrackTask()
		end

		arg_1_0:sendNotification(GAME.ISLAND_ACCEPT_TASK_DONE, {
			taskIds = var_2_1,
			callback = var_1_2
		})
	end)
end

return var_0_0

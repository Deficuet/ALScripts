local var_0_0 = class("TriggerTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = arg_1_1:getType()

	pg.ConnectionMgr.GetInstance():Send(20007, {
		id = var_1_0
	}, 20008, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(TaskProxy):addTask(Task.New({
				id = var_1_0
			}))
			arg_1_0:sendNotification(GAME.TRIGGER_TASK_DONE)

			if var_1_1 then
				var_1_1(true)
			end
		elseif var_1_1 then
			var_1_1(false)
		end
	end)
end

return var_0_0

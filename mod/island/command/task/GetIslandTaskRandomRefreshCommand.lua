local var_0_0 = class("GetIslandTaskRandomRefreshCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(21030, {
		type = 0
	}, 21031, function(arg_2_0)
		local var_2_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()

		var_2_0:UpdateRandomRefreshTask(arg_2_0)
		var_2_0:TryAcceptAutoTasks()
		arg_1_0:sendNotification(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE)
	end)
end

return var_0_0

local var_0_0 = class("SetIslandTraceTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().traceId

	pg.ConnectionMgr.GetInstance():Send(21034, {
		task_id = var_1_0
	}, 21035, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetTaskAgency():SetTraceId(var_1_0)
			arg_1_0:sendNotification(GAME.ISLAND_SET_TRACE_TASK_DONE, {
				traceId = var_1_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

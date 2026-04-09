local var_0_0 = class("MiniGameTaskProgressUpdateCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.actId
	local var_1_2 = var_1_0.taskId
	local var_1_3 = getProxy(ActivityTaskProxy)
	local var_1_4 = getProxy(TaskProxy)
	local var_1_5 = var_1_1 and var_1_3:getTaskVo(var_1_1, var_1_2) or var_1_4:getTaskById(var_1_2)

	if not var_1_5 then
		return
	end

	local var_1_6 = var_1_5:getConfig("sub_type")
	local var_1_7 = tonumber(var_1_5:getConfig("target_id"))
	local var_1_8 = var_1_0.progressAdd

	pg.ConnectionMgr.GetInstance():Send(20016, {
		event_type = var_1_6,
		event_target = var_1_7,
		event_count = var_1_8
	}, 20017, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_5.progress + var_1_8

			if var_1_1 then
				var_1_3:updateProgressBySubType(var_1_1, var_1_6, var_2_0)
			else
				var_1_5:updateProgress(var_2_0)
				var_1_4:updateTask(var_1_5)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

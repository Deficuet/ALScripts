local var_0_0 = class("ActivityDreamlandOPCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(ActivityProxy)
	local var_1_2 = var_1_1:getActivityById(var_1_0.activity_id)

	if not var_1_2 or var_1_2:isEnd() then
		return
	end

	print(var_1_0.activity_id, var_1_0.cmd, var_1_0.arg1, var_1_0.arg2)
	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = var_1_0.activity_id,
		cmd = var_1_0.cmd or 0,
		arg1 = var_1_0.arg1 or 0,
		arg2 = var_1_0.arg2 or 0,
		arg_list = {}
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_0.cmd == DreamlandData.OP_GET_MAP_AWARD then
				table.insert(var_1_2.data1_list, var_1_0.arg1)
			elseif var_1_0.cmd == DreamlandData.OP_GET_EXPLORE_AWARD then
				table.insert(var_1_2.data2_list, var_1_0.arg1)
			elseif var_1_0.cmd == DreamlandData.OP_RECORD_EXPLORE then
				table.insert(var_1_2.data3_list, var_1_0.arg1)
			end

			local var_2_0 = PlayerConst.addTranDrop(arg_2_0.award_list)

			var_1_1:updateActivity(var_1_2)
			arg_1_0:sendNotification(GAME.ACTIVITY_DREAMLAND_OP_DONE, {
				activity = var_1_2,
				cmd = var_1_0.cmd,
				awards = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

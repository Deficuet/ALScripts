local var_0_0 = class("FetchNpcShipActivityCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = getProxy(ActivityProxy):getActivityById(var_1_0.activity_id)

	if var_1_2.data1 > 0 then
		existCall(var_1_1)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		arg1 = 0,
		arg2 = 0,
		cmd = 1,
		activity_id = var_1_0.activity_id,
		arg_list = {}
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = PlayerConst.GetTranAwards(var_1_0, arg_2_0)
			local var_2_1 = getProxy(BayProxy):getActivityNPCShipByActId(var_1_2.id)

			var_1_2.data1 = 1
			var_1_2.data2 = var_2_1

			getProxy(ActivityProxy):updateActivity(var_1_2)
			arg_1_0:sendNotification(GAME.FETCH_NPC_SHIP_ACTIVITY_DONE, {
				items = var_2_0,
				callback = var_1_1
			})
		else
			originalPrint(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0

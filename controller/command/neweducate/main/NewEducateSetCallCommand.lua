local var_0_0 = class("NewEducateSetCallCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.name

	pg.ConnectionMgr.GetInstance():Send(29009, {
		id = var_1_1,
		name = var_1_2
	}, 29010, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):GetCurChar():SetCallName(var_1_2)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_SET_CALL_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_SetCall: " .. arg_2_0.result)
		end
	end)
end

return var_0_0

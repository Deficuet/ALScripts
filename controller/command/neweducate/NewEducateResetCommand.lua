local var_0_0 = class("NewEducateResetCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback
	local var_1_2 = var_1_0.id

	pg.ConnectionMgr.GetInstance():Send(29007, {
		id = var_1_2
	}, 29008, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):ResetChar(var_1_2, arg_2_0.tb)
			getProxy(NewEducateProxy):GetCurChar():GetFSM():SetStystemNo(NewEducateFSM.STYSTEM.INIT)
			existCall(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_Reset", arg_2_0.result))
		end
	end)
end

return var_0_0

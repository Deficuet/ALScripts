local var_0_0 = class("NewEducateRequestCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback
	local var_1_2 = var_1_0.id

	pg.ConnectionMgr.GetInstance():Send(29001, {
		id = var_1_2
	}, 29002, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):UpdateChar(arg_2_0.tb, arg_2_0.permanent)
			existCall(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_Request", arg_2_0.result))
		end
	end)
end

return var_0_0

local var_0_0 = class("SendCmdGMValidCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = {
		cmd = "is_gm"
	}

	pg.ConnectionMgr.GetInstance():Send(11100, var_1_1, 11101, function(arg_2_0)
		existCall(var_1_0, arg_2_0.result == 0, arg_2_0.msg)
	end)
end

return var_0_0

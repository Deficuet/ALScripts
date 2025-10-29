local var_0_0 = class("IslandGetCardDataCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = var_1_0.userId

	pg.ConnectionMgr.GetInstance():Send(21326, {
		user_id = var_1_2
	}, 21327, function(arg_2_0)
		local var_2_0 = IslandCard.New(var_1_2, arg_2_0)

		existCall(var_1_1, var_2_0)
	end)
end

return var_0_0

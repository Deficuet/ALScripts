local var_0_0 = class("IslandCheaterReconectCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().type

	pg.ConnectionMgr.GetInstance():Send(23113, {
		Type = var_1_0
	}, 23114, function(arg_2_0)
		if arg_2_0.result == 0 then
			-- block empty
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end, false)
end

return var_0_0

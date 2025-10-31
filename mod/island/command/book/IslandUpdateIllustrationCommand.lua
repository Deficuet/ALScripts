local var_0_0 = class("IslandUpdateIllustrationCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.linkId

	pg.ConnectionMgr.GetInstance():Send(21340, {
		type = var_1_1,
		cond_id = var_1_2
	}, 21341, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetBookAgency():AddCanUnlock(var_1_1, var_1_2)
			arg_1_0:sendNotification(GAME.ISLAND_UPDATE_ILLUSTRATION_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

local var_0_0 = class("IslandGiveCardLabelCommand ", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.userId
	local var_1_2 = var_1_0.labelId

	pg.ConnectionMgr.GetInstance():Send(21336, {
		user_id = var_1_1,
		label_id = var_1_2
	}, 21337, function(arg_2_0)
		if arg_2_0.result == 0 then
			arg_1_0:sendNotification(GAME.ISLAND_GIVE_CARD_LABEL_DONE, {
				labelId = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

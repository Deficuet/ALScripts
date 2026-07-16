local var_0_0 = class("AuctionGameEventSelectedIDCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(AuctionGameProxy)

	pg.ConnectionMgr.GetInstance():Send(23402, {
		event_id = var_1_0
	}, 23403, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_1:SetPersonalEventSelectedID(var_1_0)
			var_1_1:UpdateEventEffect(arg_2_0.public_event_effect)
			arg_1_0:sendNotification(GAME.AUCTION_GAME_EVENT_SELECTED_ID_DONE, arg_2_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end, false)
end

return var_0_0

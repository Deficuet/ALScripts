local var_0_0 = class("AuctionGameEmojiCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(23413, {
		expression_id = var_1_0
	}, 23414, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(AuctionGameProxy):SetSendEmojiTimestamp(pg.TimeMgr.GetInstance():GetServerTime())
			arg_1_0:sendNotification(GAME.AUCTION_GAME_EMOJI_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0

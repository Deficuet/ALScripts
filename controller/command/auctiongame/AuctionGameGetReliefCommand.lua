local var_0_0 = class("AuctionGameGetReliefCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(23426, {
		arg = 1
	}, 23427, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AUCTION_GAME):getConfig("config_client").itemID
			local var_2_1 = PlayerConst.GetTranAwards({}, {
				award_list = {
					{
						type = DROP_TYPE_VITEM,
						id = var_2_0,
						number = pg.gameset.auction_relief_payment.key_value
					}
				}
			})

			getProxy(AuctionGameBaseProxy):AddReliefCnt()
			pg.m02:sendNotification(GAME.AUCTION_GAME_GET_RELIEF_DONE, var_2_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0

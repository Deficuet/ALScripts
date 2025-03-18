local var_0_0 = class("GameRoomSuccessCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.roomId
	local var_1_2 = var_1_0.times
	local var_1_3 = var_1_0.score
	local var_1_4 = getProxy(GameRoomProxy):lastMonthlyTicket()

	if getProxy(GameRoomProxy):lastTicketMax() == 0 or var_1_4 == 0 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(26126, {
		roomid = var_1_1,
		times = var_1_2,
		score = var_1_3
	}, 26127, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(GameRoomProxy):storeGameScore(var_1_1, var_1_3)

			local var_2_0 = getProxy(GameRoomProxy):lastTicketMax()
			local var_2_1 = id2res(GameRoomProxy.coin_res_id)

			getProxy(PlayerProxy):getRawData():consume({
				[var_2_1] = var_1_2 or 0
			})

			local var_2_2 = PlayerConst.addTranDrop(arg_2_0.drop_list)
			local var_2_3 = var_2_2[1].count
			local var_2_4 = getProxy(GameRoomProxy):lastMonthlyTicket()

			if var_2_4 < var_2_3 then
				var_2_3 = var_2_4
			end

			if var_2_0 < var_2_3 then
				var_2_3 = var_2_0
			end

			getProxy(GameRoomProxy):setMonthlyTicket(var_2_3)

			var_2_2[1].count = var_2_3

			if var_2_2[1].count ~= 0 then
				pg.m02:sendNotification(GAME.GAME_ROOM_AWARD_DONE, var_2_2)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

local var_0_0 = class("IslandChangeViewDressCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.ship_id
	local var_1_2 = var_1_0.game_type
	local var_1_3 = var_1_0.type

	pg.ConnectionMgr.GetInstance():Send(23029, {
		type = var_1_3,
		game_type = var_1_2,
		ship_id = var_1_1
	}, 23030, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetCharacterAgency():SetMiniGameShipViewId(var_1_2, var_1_1)
			arg_1_0:sendNotification(GAME.PLAY_ROOM_REFRESH_ROOM_INFO)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

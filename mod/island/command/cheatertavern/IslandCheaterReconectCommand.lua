local var_0_0 = class("IslandCheaterReconectCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = 1
	local var_1_2 = getProxy(IslandProxy):GetIsland():GetCheaterTavernAgency()

	pg.ConnectionMgr.GetInstance():Send(23106, {
		type = var_1_1
	}, 23107, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_2:SetIsConnecting()
			var_1_2:SetResetGameData(arg_2_0)
			arg_1_0:InitPlayerDate(arg_2_0)

			local var_2_0 = {
				user_id = arg_2_0.user_id,
				operationType = IslandCheaterTavernConst.PlayerCurrentOperateType.PutCardOrQuery,
				auto_time = arg_2_0.auto_time
			}

			pg.m02:sendNotification(GAME.ISLAND_CHEATER_RECONNECT, {
				operation = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end, false)
end

function var_0_0.InitPlayerDate(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(IslandProxy):GetIsland()

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.player_list or {}) do
		local var_3_1 = iter_3_1.seat
		local var_3_2 = iter_3_1.player_info
		local var_3_3 = {
			user_view = PlayRoomTools.GetGameViewID(var_3_2.user_view),
			seat = var_3_1,
			id = var_3_2.id
		}

		var_3_0:DispatchEvent(IslandCheaterTavernMonitor.ADD_CHEATERTAVERN_PLAYER, var_3_3)
	end

	var_3_0:DispatchEvent(IslandCheaterTavernMonitor.INIT_PLAYER_DATA_DONE)
end

return var_0_0

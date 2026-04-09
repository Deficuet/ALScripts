local var_0_0 = class("IslandCheaterOperateCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.arg_list

	pg.ConnectionMgr.GetInstance():Send(23103, {
		type = var_1_1,
		arg_list = var_1_2
	}, 23104, function(arg_2_0)
		if arg_2_0.result == 0 then
			switch(var_1_1, {
				[IslandCheaterTavernConst.PlayerOperateType.PutCard] = function()
					getProxy(IslandProxy):GetIsland():GetCheaterTavernAgency():MainPlayerPutCard(var_1_2)
				end,
				[IslandCheaterTavernConst.PlayerOperateType.Query] = function()
					return
				end,
				[IslandCheaterTavernConst.PlayerOperateType.Shoot] = function()
					return
				end
			})
			arg_1_0:sendNotification(GAME.ISLAND_PLAYER_CHEATER_OPERATE_DONE, {
				type = var_1_1,
				arg_list = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end, false)
end

return var_0_0

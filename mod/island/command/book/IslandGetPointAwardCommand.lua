local var_0_0 = class("IslandGetPointAwardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(21347, {
		lv = var_1_0
	}, 21348, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetBookAgency():AddPointAwardGotId(var_1_0)

			local var_2_0 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_GET_POINT_AWARD_DONE, {
				dropData = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

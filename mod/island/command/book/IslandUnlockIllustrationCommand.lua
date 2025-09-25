local var_0_0 = class("IslandUnlockIllustrationCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(21343, {
		book_id = var_1_0
	}, 21344, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland():GetBookAgency()
			local var_2_1 = var_2_0:GetAllPoints()

			var_2_0:AddUnlock(var_1_0)

			local var_2_2 = var_2_0:GetAllPoints() - var_2_1

			if var_2_2 > 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("island_get_collect_point_success", var_2_2))
			end

			arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_ILLUSTRATION_DONE, {
				id = var_1_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

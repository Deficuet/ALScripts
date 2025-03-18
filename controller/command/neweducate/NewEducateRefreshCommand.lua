local var_0_0 = class("NewEducateRefreshCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29092, {
		id = var_1_0
	}, 29093, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(NewEducateProxy):RefreshChar(var_1_0, arg_2_0.tb)
			NewEducateHelper.ClearEventPerformance()
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_REFRESH_DONE, {
				id = var_1_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_Refresh", arg_2_0.result))
		end
	end)
end

return var_0_0

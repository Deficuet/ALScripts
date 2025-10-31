local var_0_0 = class("BuildPoolRegularExchangeCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	if getProxy(BuildShipProxy):getRegularExchangeCount() < pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID].exchange_request then
		pg.TipsMgr.GetInstance():ShowTips("unenough")

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12047, {
		ship_tid = var_1_0
	}, 12048, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(BuildShipProxy):changeRegularExchangeCount(-pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID].exchange_request)

			local var_2_0 = PlayerConst.addTranDrop(arg_2_0.drop_list)

			arg_1_0:sendNotification(GAME.REGULAR_BUILD_POOL_EXCHANGE_DONE, {
				awards = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

local var_0_0 = class("ShipExitCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(DormProxy)
	local var_1_2 = var_1_0.shipId
	local var_1_3 = getProxy(BayProxy)
	local var_1_4 = var_1_3:getShipById(var_1_2)
	local var_1_5 = var_1_0.callback

	pg.ConnectionMgr.GetInstance():Send(19004, {
		ship_id = var_1_2
	}, 19005, function(arg_2_0)
		local var_2_0 = 0

		if arg_2_0.result == 0 then
			local var_2_1 = var_1_1:getRawData()

			var_2_1:DeleteShip(var_1_2)
			var_1_1:updateDrom(var_2_1, BackYardConst.DORM_UPDATE_TYPE_SHIP)
			arg_1_0:sendNotification(DormProxy.SHIP_EXIT, var_1_4)

			var_2_0 = arg_2_0.exp

			var_1_4:addExp(var_2_0)
			var_1_3:updateShip(var_1_4)
			arg_1_0:sendNotification(GAME.EXIT_SHIP_DONE, var_1_4)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("backyard_shipExit", arg_2_0.result))
		end

		if var_1_5 ~= nil then
			var_1_5(var_2_0)
		end
	end)
end

return var_0_0

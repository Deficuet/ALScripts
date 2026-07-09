local var_0_0 = class("BackYardRequestShipExpCommand", pm.SimpleCommand)

var_0_0.isTipSettle = true

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	if getProxy(ContextProxy):getCurrentContext().mediator.__cname ~= CourtYardMediator.__cname then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(19026, {
		type = 0
	}, 19027, function(arg_2_0)
		local var_2_0 = getProxy(DormProxy)
		local var_2_1 = var_2_0:getRawData()
		local var_2_2 = var_2_1:GetLastAddShipExpTime()

		var_2_1:consumeFood(arg_2_0.food)
		var_2_1:UpdateLastAddShipExpTime(pg.TimeMgr.GetInstance():GetServerTime())
		var_2_1:UpdateNextSettlementShipExpTime(arg_2_0.next_timestamp)
		var_2_0:updateDrom(var_2_1, BackYardConst.DORM_UPDATE_TYPE_UPDATEFOOD)

		local var_2_3 = arg_2_0.exp

		if var_2_3 > 0 then
			local var_2_4 = var_2_1:GetBayShipOnFloor(DormShip.FLOOR_1)
			local var_2_5 = getProxy(BayProxy)
			local var_2_6 = {}
			local var_2_7 = {}

			for iter_2_0, iter_2_1 in pairs(var_2_4) do
				local var_2_8 = var_2_5:getShipById(iter_2_1.id)
				local var_2_9 = var_2_5:getShipById(iter_2_1.id)

				if var_2_9.level ~= var_2_9:getMaxLevel() then
					var_2_9:addExp(var_2_3)
					var_2_5:updateShip(var_2_9)
					arg_1_0:sendNotification(GAME.BACKYARD_SHIP_EXP_ADDED, {
						id = var_2_9.id,
						exp = var_2_3
					})
				end

				var_2_6[var_2_9.id] = var_2_9
				var_2_7[var_2_8.id] = var_2_8
			end

			local var_2_10 = var_0_0.isTipSettle

			arg_1_0:sendNotification(DormProxy.SHIPS_EXP_ADDED, {
				oldShips = var_2_7,
				newShips = var_2_6,
				exp = var_2_3,
				food = arg_2_0.food,
				time = var_2_2,
				isTipSettle = var_2_10
			})

			var_0_0.isTipSettle = false
		end

		var_2_0:SettlementShipExp()
	end)
end

return var_0_0

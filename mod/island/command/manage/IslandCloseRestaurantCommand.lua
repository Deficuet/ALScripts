local var_0_0 = class("IslandCloseRestaurantCommand", pm.SimpleCommand)

var_0_0.CLOSE_RESTAURANT = "IslandCloseRestaurantCommand.CLOSE_RESTAURANT"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.restId
	local var_1_2 = var_1_0.isPost

	pg.ConnectionMgr.GetInstance():Send(21420, {
		trade_id = var_1_1
	}, 21421, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland():GetManageAgency():GetRestaurant(var_1_1)
			local var_2_1 = var_2_0:GetSellCommondities()
			local var_2_2 = var_2_0:GetRemainCommodities()
			local var_2_3 = var_2_0:GetSales()
			local var_2_4 = {}
			local var_2_5 = 0

			for iter_2_0, iter_2_1 in ipairs(var_2_0:GetAssistants()) do
				var_2_5 = var_2_5 + 1

				if iter_2_1.shipId ~= 0 then
					table.insert(var_2_4, iter_2_1.shipId)
				end
			end

			local var_2_6 = var_2_0:AddSales()

			var_2_0:SetCommodities({}, {})
			var_2_0:ClearAssistantShips()
			var_2_0:SetEndTime(0)
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandCloseRest(var_1_2 and 1 or 0, arg_2_0.drop_list))

			local var_2_7 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_CLOSE_RESTAURANT_DONE, {
				restId = var_1_1,
				saleList = var_2_1,
				remainList = var_2_2,
				isUpgrade = var_2_6,
				oldShipCnt = var_2_5,
				shipIds = var_2_4,
				oldSale = var_2_3,
				dropData = var_2_7
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

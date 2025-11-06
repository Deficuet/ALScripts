local var_0_0 = class("IslandExchangeShipOrderCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.delegateId
	local var_1_3 = getProxy(IslandProxy):GetIsland():GetOrderAgency()
	local var_1_4 = var_1_3:GetDelegateSlot(var_1_2)

	if not var_1_4 then
		return
	end

	local var_1_5 = var_1_3:GetShipOrderSlot(var_1_1)

	if not var_1_5 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21431, {
		slot_id = var_1_1,
		appoint_id = var_1_2
	}, 21432, function(arg_2_0)
		if arg_2_0.result == 0 then
			if var_1_5:GetOrder():IsAnyLoadUp() then
				var_1_5:IncreaseFinishCnt()
			end

			var_1_5:FillDelegate(var_1_4)

			local var_2_0 = IslandShipOrderDelegateSlot.New(arg_2_0.appoint)

			var_1_3:RemoveDelegateSlot(var_1_2)
			var_1_3:AddDelegateSlot(var_2_0)
			arg_1_0:sendNotification(GAME.ISLAND_EXCHANGE_SHIP_ORDER_DONE, {
				id = var_1_1,
				delegateId = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0

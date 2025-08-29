local var_0_0 = class("IslandSubmitOrderCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().slotId
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(var_1_0)

	if not var_1_1:CanSubmit() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	if var_1_1:GetOrder():IsUrgency() then
		arg_1_0:HandleUrgencyOrder(var_1_1)
	elseif var_1_1:GetOrder():IsFirm() then
		arg_1_0:HandleFirmOrder(var_1_1)
	else
		arg_1_0:HandleCommonOrder(var_1_1)
	end
end

function var_0_0.HandleUrgencyOrder(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	pg.ConnectionMgr.GetInstance():Send(21405, {
		slot_id = arg_2_1.id
	}, 21406, function(arg_3_0)
		if arg_3_0.result == 0 then
			local var_3_0 = arg_2_0:HandleDrops(arg_2_1)

			arg_2_0:HandleConsume(arg_2_1)
			var_2_0:RemoveSlot(arg_2_1.id)
			var_2_0:IncUrgencyFinishCnt()
			var_2_0:RecordNextCanSubmitTime()
			var_2_0:AddExp(arg_2_1:GetOrder():GetExpValue())
			arg_2_0:sendNotification(GAME.ISLAND_SUBMIT_ORDER_DONE, {
				dropData = var_3_0,
				slotId = arg_2_1.id
			})
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandSubmitOrder(IslandOrder.TYPE_URGENCY, arg_2_1.id))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end)
end

function var_0_0.HandleCommonOrder(arg_4_0, arg_4_1)
	local var_4_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	pg.ConnectionMgr.GetInstance():Send(21401, {
		slot_id = arg_4_1.id
	}, 21402, function(arg_5_0)
		if arg_5_0.result == 0 then
			local var_5_0 = arg_4_0:HandleDrops(arg_4_1)

			arg_4_0:HandleConsume(arg_4_1)

			if arg_5_0.slot then
				arg_4_1:Flush(arg_5_0.slot)
			else
				var_4_0:RemoveSlot(arg_4_1.id)
			end

			var_4_0:IncFinishCnt()
			var_4_0:RecordNextCanSubmitTime()
			var_4_0:AddExp(arg_4_1:GetOrder():GetExpValue())
			arg_4_0:sendNotification(GAME.ISLAND_SUBMIT_ORDER_DONE, {
				dropData = var_5_0,
				slotId = arg_4_1.id
			})
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandSubmitOrder(IslandOrder.TYPE_NORMAL, arg_4_1.id))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_5_0.result] .. arg_5_0.result)
		end
	end)
end

function var_0_0.HandleFirmOrder(arg_6_0, arg_6_1)
	local var_6_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency()

	pg.ConnectionMgr.GetInstance():Send(21414, {
		order_id = arg_6_1.id
	}, 21415, function(arg_7_0)
		if arg_7_0.result == 0 then
			local var_7_0 = arg_6_0:HandleDrops(arg_6_1)

			arg_6_0:HandleConsume(arg_6_1)
			var_6_0:RemoveSlot(arg_6_1.id)
			var_6_0:RecordNextCanSubmitTime()
			var_6_0:AddExp(arg_6_1:GetOrder():GetExpValue())
			arg_6_0:sendNotification(GAME.ISLAND_SUBMIT_ORDER_DONE, {
				dropData = var_7_0,
				slotId = arg_6_1.id
			})
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildIslandSubmitOrder(IslandOrder.TYPE_FORM, arg_6_1.id))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_7_0.result] .. arg_7_0.result)
		end
	end)
end

function var_0_0.HandleDrops(arg_8_0, arg_8_1)
	local var_8_0, var_8_1 = arg_8_1:GetOrder():GetAwardItemAndExp()

	return (IslandDropHelper.AddItems({
		drop_list = var_8_0
	}, var_8_1))
end

function var_0_0.HandleConsume(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:GetOrder():GetConsume()

	for iter_9_0, iter_9_1 in ipairs(var_9_0) do
		arg_9_0:sendNotification(GAME.CONSUME_ITEM, iter_9_1)
	end
end

return var_0_0

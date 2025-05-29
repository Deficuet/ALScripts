local var_0_0 = class("FinishPhantomQuestCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.bluePrintId
	local var_1_2 = var_1_0.questId
	local var_1_3 = getProxy(TechnologyProxy):getBluePrintById(var_1_1)
	local var_1_4 = var_1_3:getPhantomQuestInfo(var_1_2)

	if var_1_4.unlocked or var_1_4.progress < var_1_4.config.target_num then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(12210, {
		ship_id = var_1_3.shipId,
		skin_shadow_id = var_1_2
	}, 12211, function(arg_2_0)
		local var_2_0 = ShipBluePrint.getPhantomQuestCostDrop(var_1_4)

		if var_2_0 then
			reducePlayerOwn(var_2_0)
		end

		getProxy(BayProxy):updateShipSkin(var_1_3.shipId, var_1_2, 0)
		arg_1_0:sendNotification(GAME.FINISH_PHANTOM_QUEST_DONE)
	end)
end

return var_0_0

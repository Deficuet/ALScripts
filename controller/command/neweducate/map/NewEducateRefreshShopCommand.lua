local var_0_0 = class("NewEducateRefreshShopCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	if getProxy(NewEducateProxy):GetCurChar():GetFSM():CheckPriorityStystem() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("child2_priority_tip"))

		return
	end

	local var_1_1 = getProxy(NewEducateProxy):GetCurChar()
	local var_1_2 = var_1_1:GetResByType(NewEducateChar.RES_TYPE.REFRESH_SHOP)
	local var_1_3 = var_1_1:GetResByType(NewEducateChar.RES_TYPE.MONEY)
	local var_1_4 = pg.gameset.child2_shop_refresh_price.key_value

	if var_1_2 <= 0 and var_1_3 < var_1_4 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(29072, {
		id = var_1_0
	}, 29073, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_2 > 0 and var_1_1:GetResIdByType(NewEducateChar.RES_TYPE.REFRESH_SHOP) or var_1_1:GetResIdByType(NewEducateChar.RES_TYPE.MONEY)
			local var_2_1 = var_1_2 > 0 and 1 or var_1_4

			getProxy(NewEducateProxy):Cost({
				type = NewEducateConst.DROP_TYPE.RES,
				id = var_2_0,
				number = var_2_1
			})
			getProxy(NewEducateProxy):GetCurChar():GetFSM():GetState(NewEducateFSM.SYSTEM.MAP):OnRefreshShopDone(arg_2_0.shops, var_1_2 <= 0)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_REFRESH_SHOP_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips("NewEducate_RefreshShop_Error: " .. arg_2_0.result)
		end
	end)
end

return var_0_0

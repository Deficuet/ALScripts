local var_0_0 = class("QuotaShoppingCommand", pm.SimpleCommand)

var_0_0.QUOTA_SHOP = 4

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.count
	local var_1_3 = var_1_0.type
	local var_1_4 = getProxy(ShopsProxy)
	local var_1_5 = var_1_4:getQuotaShop():getGoodsCfg(var_1_1)
	local var_1_6 = Drop.New({
		type = var_1_5.resource_category,
		id = var_1_5.resource_type
	})

	if var_1_6:getOwnedCount() < var_1_5.resource_num * var_1_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_x", var_1_6:getName()))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(16201, {
		id = var_1_1,
		type = var_0_0.QUOTA_SHOP,
		count = var_1_2
	}, 16202, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = PlayerConst.addTranDrop(arg_2_0.drop_list)
			local var_2_1 = var_1_4:getQuotaShop()

			var_1_4:updateQuotaShop(var_2_1)
			reducePlayerOwn({
				type = var_1_5.resource_category,
				id = var_1_5.resource_type,
				count = var_1_5.resource_num * var_1_2
			})
			arg_1_0:sendNotification(GAME.QUOTA_SHOPPING_DONE, {
				awards = var_2_0,
				id = var_1_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.result))
		end
	end)
end

return var_0_0

local var_0_0 = class("GiftActCommodity", import(".CommonCommodity"))

function var_0_0.canPurchase(arg_1_0)
	assert(arg_1_0:getConfig("genre") == ShopArgs.GiftActPackage)

	local var_1_0 = arg_1_0:getBindActivity()

	return var_1_0 and not var_1_0:isEnd() and var_1_0.data1 < arg_1_0:getLimitCount()
end

function var_0_0.getBindActivity(arg_2_0)
	assert(arg_2_0:getConfig("genre") == ShopArgs.GiftActPackage)

	local var_2_0 = arg_2_0:getDropInfo():getConfig("link_id")

	return getProxy(ActivityProxy):getActivityById(var_2_0)
end

function var_0_0.GetPrice(arg_3_0)
	local var_3_0 = arg_3_0:getBindActivity()

	return var_0_0.CalcPrice(var_3_0)
end

function var_0_0.getLimitCount(arg_4_0)
	return 1
end

function var_0_0.getBuyCount(arg_5_0)
	local var_5_0 = arg_5_0:getBindActivity()

	return var_5_0 and not var_5_0:isEnd() and var_5_0.data1 or 0
end

function var_0_0.isFree(arg_6_0)
	return arg_6_0:GetPrice() == 0
end

function var_0_0.CalcPrice(arg_7_0)
	local var_7_0 = 0
	local var_7_1 = 0

	for iter_7_0, iter_7_1 in ipairs(arg_7_0:getConfig("config_data")[1]) do
		local var_7_2 = pg.ship_skin_template[iter_7_1].shop_id

		assert(var_7_2 and var_7_2 > 0)

		local var_7_3 = Goods.Create({
			shop_id = var_7_2
		}, Goods.TYPE_SKIN)

		var_7_1 = var_7_1 + var_7_3:getConfig("resource_num")

		if not getProxy(ShipSkinProxy):hasNonLimitSkin(iter_7_1) then
			var_7_0 = var_7_0 + var_7_3:getConfig("resource_num")
		end
	end

	local var_7_4 = (var_7_1 - var_7_0) * 100 / var_7_1

	return var_7_0, var_7_4, var_7_1
end

return var_0_0

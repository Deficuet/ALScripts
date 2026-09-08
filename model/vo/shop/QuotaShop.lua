local var_0_0 = class("QuotaShop", import(".BaseShop"))

function var_0_0.Ctor(arg_1_0)
	arg_1_0.type = ShopArgs.ShopQuota

	local var_1_0 = pg.quota_shop_template[1].shop_goods

	arg_1_0.goods = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		arg_1_0.goods[iter_1_1] = Goods.Create({
			shop_id = iter_1_1
		}, Goods.TYPE_QUOTA)
	end
end

function var_0_0.IsSameKind(arg_2_0, arg_2_1)
	return isa(arg_2_1, QuotaShop)
end

function var_0_0.GetCommodityById(arg_3_0, arg_3_1)
	return arg_3_0:getGoodsById(arg_3_1)
end

function var_0_0.GetCommodities(arg_4_0)
	return arg_4_0:getSortGoods()
end

function var_0_0.getSortGoods(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.goods) do
		table.insert(var_5_0, iter_5_1)
	end

	table.sort(var_5_0, CompareFuncs({
		function(arg_6_0)
			return arg_6_0:canPurchase() and 0 or 1
		end,
		function(arg_7_0)
			return arg_7_0:getConfig("order")
		end,
		function(arg_8_0)
			return arg_8_0.id
		end
	}))

	return var_5_0
end

function var_0_0.getGoodsCfg(arg_9_0, arg_9_1)
	return pg.activity_shop_template[arg_9_1]
end

function var_0_0.getGoodsById(arg_10_0, arg_10_1)
	assert(arg_10_0.goods[arg_10_1], "goods should exist")

	return arg_10_0.goods[arg_10_1]
end

function var_0_0.getLimitGoodCount(arg_11_0, arg_11_1)
	local var_11_0 = pg.activity_shop_template[arg_11_1].limit_args

	if type(var_11_0) == "table" then
		for iter_11_0, iter_11_1 in ipairs(var_11_0) do
			if iter_11_1[1] == "quota" then
				return iter_11_1[2]
			end
		end
	end

	assert(false, "good not limit_args 'quota' with good id: " .. arg_11_1)
end

function var_0_0.GetResList(arg_12_0)
	return {
		59900
	}
end

return var_0_0

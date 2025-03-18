local var_0_0 = class("CruiseShop", import(".BaseShop"))

var_0_0.TYPE_SKIN = "skin"
var_0_0.TYPE_EQUIP_SKIN = "equip_skin"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.type = var_0_0.ShopCruise
	arg_1_0.genres = {
		[var_0_0.TYPE_SKIN] = ShopArgs.CruiseSkin,
		[var_0_0.TYPE_EQUIP_SKIN] = ShopArgs.CruiseGearSkin
	}

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in pairs(arg_1_0.genres) do
		local var_1_1 = pg.shop_template.get_id_list_by_genre[iter_1_1]

		if var_1_1 then
			local var_1_2 = pg.TimeMgr.GetInstance()

			for iter_1_2, iter_1_3 in ipairs(var_1_1) do
				if var_1_2:inTime(pg.shop_template[iter_1_3].time) then
					table.insert(var_1_0, iter_1_3)
				end
			end
		end
	end

	local var_1_3 = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_1) do
		var_1_3[iter_1_5.shop_id] = iter_1_5.pay_count
	end

	local var_1_4 = {}

	for iter_1_6, iter_1_7 in ipairs(arg_1_2) do
		var_1_4[iter_1_7.shop_id] = iter_1_7.pay_count
	end

	arg_1_0.goods = {}

	for iter_1_8, iter_1_9 in ipairs(var_1_0) do
		local var_1_5 = var_1_3[iter_1_9] or 0
		local var_1_6 = var_1_4[pg.shop_template[iter_1_9].group] or 0

		arg_1_0.goods[iter_1_9] = Goods.Create({
			shop_id = iter_1_9,
			buy_count = var_1_5,
			groupCount = var_1_6
		}, Goods.TYPE_CRUISE)
	end
end

function var_0_0.GetRemainEquipSkinCnt(arg_2_0)
	for iter_2_0, iter_2_1 in pairs(arg_2_0.goods) do
		if iter_2_1:getConfig("genre") == ShopArgs.CruiseGearSkin then
			return iter_2_1:getConfig("group_limit") - iter_2_1.groupCount
		end
	end

	return 0
end

function var_0_0.IsSameKind(arg_3_0, arg_3_1)
	return isa(arg_3_1, CruiseShop)
end

function var_0_0.GetCommodityById(arg_4_0, arg_4_1)
	return arg_4_0:getGoodsById(arg_4_1)
end

function var_0_0.GetCommodities(arg_5_0)
	return arg_5_0:getSortGoods()
end

function var_0_0.GetCommoditiesByType(arg_6_0, arg_6_1)
	return arg_6_0:getSortGoodsByType(arg_6_1)
end

function var_0_0.getGoodsById(arg_7_0, arg_7_1)
	return arg_7_0.goods[arg_7_1]
end

function var_0_0.getSortGoods(arg_8_0)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in pairs(arg_8_0.goods) do
		table.insert(var_8_0, iter_8_1)
	end

	return arg_8_0:sort(var_8_0)
end

function var_0_0.getSortGoodsByType(arg_9_0, arg_9_1)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.goods) do
		if iter_9_1:getConfig("genre") == arg_9_0.genres[arg_9_1] then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return arg_9_0:sort(var_9_0)
end

function var_0_0.sort(arg_10_0, arg_10_1)
	table.sort(arg_10_1, CompareFuncs({
		function(arg_11_0)
			return arg_11_0:canPurchase() and 0 or 1
		end,
		function(arg_12_0)
			return arg_12_0:getConfig("order")
		end,
		function(arg_13_0)
			return arg_13_0.id
		end
	}))

	return arg_10_1
end

return var_0_0

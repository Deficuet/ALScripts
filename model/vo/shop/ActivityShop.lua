local var_0_0 = class("ActivityShop", import(".BaseShop"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.activityId = arg_1_1.id

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.data1_list) do
		var_1_0[iter_1_1] = arg_1_1.data2_list[iter_1_0]
	end

	arg_1_0.goods = {}

	local var_1_1 = arg_1_0:bindConfigTable()

	for iter_1_2, iter_1_3 in ipairs(var_1_1.all) do
		if arg_1_1.id == var_1_1[iter_1_3].activity then
			local var_1_2 = var_1_0[iter_1_3] or 0

			arg_1_0.goods[iter_1_3] = Goods.Create({
				shop_id = iter_1_3,
				buy_count = var_1_2
			}, Goods.TYPE_ACTIVITY)
		end
	end

	arg_1_0.type = ShopArgs.ShopActivity
	arg_1_0.config = pg.activity_template[arg_1_0.activityId]
end

function var_0_0.IsSameKind(arg_2_0, arg_2_1)
	return isa(arg_2_1, ActivityShop) and arg_2_1.activityId and arg_2_1.activityId == arg_2_0.activityId
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

	arg_5_0:SortGoods(var_5_0)

	return var_5_0
end

function var_0_0.SortGoods(arg_6_0, arg_6_1)
	table.sort(arg_6_1, CompareFuncs({
		function(arg_7_0)
			local var_7_0 = arg_7_0:CheckArgLimit()

			return (arg_7_0:canPurchase() or var_7_0) and arg_7_0:CheckCntLimit() and 0 or 1
		end,
		function(arg_8_0)
			local var_8_0, var_8_1, var_8_2 = arg_8_0:CheckTimeLimit()

			return var_8_0 and var_8_1 and 0 or 1
		end,
		function(arg_9_0)
			return arg_9_0:getConfig("order")
		end,
		function(arg_10_0)
			return arg_10_0.id
		end
	}))
end

function var_0_0.GetSplitNameCodes(arg_11_0)
	local var_11_0 = {}

	if arg_11_0.config and arg_11_0.config.config_client and arg_11_0.config.config_client.category then
		for iter_11_0, iter_11_1 in ipairs(arg_11_0.config.config_client.category) do
			table.insert(var_11_0, iter_11_1[1])
		end
	end

	return var_11_0
end

function var_0_0.GetSplitCommodities(arg_12_0)
	local var_12_0 = {}

	if arg_12_0.config and arg_12_0.config.config_client and arg_12_0.config.config_client.category then
		for iter_12_0, iter_12_1 in ipairs(arg_12_0.config.config_client.category) do
			local var_12_1 = {}

			for iter_12_2, iter_12_3 in ipairs(iter_12_1[2]) do
				table.insert(var_12_1, arg_12_0.goods[iter_12_3])
			end

			arg_12_0:SortGoods(var_12_1)
			table.insert(var_12_0, var_12_1)
		end
	end

	return var_12_0
end

function var_0_0.bindConfigTable(arg_13_0)
	return pg.activity_shop_template
end

function var_0_0.getGoodsById(arg_14_0, arg_14_1)
	return arg_14_0.goods[arg_14_1]
end

function var_0_0.isEnd(arg_15_0)
	local var_15_0 = getProxy(ActivityProxy):getActivityById(arg_15_0.activityId)

	return not var_15_0 or var_15_0:isEnd()
end

function var_0_0.getOpenTime(arg_16_0)
	local var_16_0 = pg.activity_template[arg_16_0.activityId].time

	if var_16_0 == "stop" then
		local var_16_1 = getProxy(ActivityRemasterProxy):GetActivaingReamsterData()

		if not var_16_1 then
			return ""
		end

		return var_16_1:GetActivityTimeDesc(arg_16_0.activityId, true)
	else
		local var_16_2 = var_16_0[2][1]
		local var_16_3 = var_16_0[3][1]
		local var_16_4 = var_16_0[3][2]

		return string.format("%d.%d.%d~%d.%d.%d %d:%d:%d", var_16_2[1], var_16_2[2], var_16_2[3], var_16_3[1], var_16_3[2], var_16_3[3], var_16_4[1], var_16_4[2], var_16_4[3])
	end
end

function var_0_0.getStartTime(arg_17_0)
	if arg_17_0:isEnd() then
		return 0
	end

	return getProxy(ActivityProxy):getActivityById(arg_17_0.activityId):getStartTime()
end

function var_0_0.getBgPath(arg_18_0)
	local var_18_0 = pg.activity_template[arg_18_0.activityId]
	local var_18_1 = var_18_0.config_client[2] or {
		255,
		255,
		255,
		255
	}
	local var_18_2 = var_18_0.config_client.outline or {
		0,
		0,
		0,
		1
	}

	return var_18_0.config_client[1], Color.New(var_18_1[1], var_18_1[2], var_18_1[3], var_18_1[4]), Color.New(var_18_2[1], var_18_2[2], var_18_2[3], var_18_2[4])
end

function var_0_0.getToggleImage(arg_19_0)
	return pg.activity_template[arg_19_0.activityId].config_client.toggle or "huodongdduihuan_butten"
end

function var_0_0.GetResList(arg_20_0)
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_0.goods) do
		local var_20_1 = iter_20_1:GetConsume()

		var_20_1.count = var_20_1:getOwnedCount()

		if not var_20_0[var_20_1.type .. "_" .. var_20_1.id] then
			var_20_0[var_20_1.type .. "_" .. var_20_1.id] = var_20_1
		end
	end

	local var_20_2 = {}

	for iter_20_2, iter_20_3 in pairs(var_20_0) do
		table.insert(var_20_2, iter_20_3)
	end

	return var_20_2
end

function var_0_0.GetEnterVoice(arg_21_0)
	local var_21_0 = arg_21_0.config.config_client.enter

	if var_21_0 then
		return var_21_0[1], var_21_0[2], var_21_0[3]
	end
end

function var_0_0.GetPurchaseVoice(arg_22_0)
	local var_22_0 = arg_22_0.config.config_client.purchase

	if var_22_0 then
		return var_22_0[1], var_22_0[2], var_22_0[3]
	end
end

function var_0_0.GetPurchaseAllVoice(arg_23_0)
	local var_23_0 = arg_23_0.config.config_client.purchase_all

	if var_23_0 then
		return var_23_0[1], var_23_0[2], var_23_0[3]
	end
end

function var_0_0.GetTouchVoice(arg_24_0)
	local var_24_0 = arg_24_0.config.config_client.touch

	if var_24_0 then
		return var_24_0[1], var_24_0[2], var_24_0[3]
	end
end

function var_0_0.IsEventShop(arg_25_0)
	return pg.activity_template[arg_25_0.activityId].config_client.event_shop
end

function var_0_0.GetBGM(arg_26_0)
	return pg.activity_template[arg_26_0.activityId].config_client.bgm or ""
end

function var_0_0.IsHide(arg_27_0)
	if arg_27_0.config.config_client == "" then
		return false
	end

	return arg_27_0.config.config_client.isHide
end

return var_0_0

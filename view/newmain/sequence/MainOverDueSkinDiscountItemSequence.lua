local var_0_0 = class("MainOverDueSkinDiscountItemSequence", import(".MainOverDueAttireSequence"))

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0, var_1_1 = arg_1_0:CollectExpiredItems()
	local var_1_2

	seriesAsync({
		function(arg_2_0)
			arg_1_0:RecycleItems(var_1_0, var_1_1, function(arg_3_0)
				var_1_2 = arg_3_0

				arg_2_0()
			end)
		end,
		function(arg_4_0)
			if not var_1_2 then
				arg_4_0()

				return
			end

			arg_1_0:DisplayResult(var_1_0, arg_4_0)
		end,
		function(arg_5_0)
			if not var_1_2 then
				arg_5_0()

				return
			end

			arg_1_0:ShowAwardInfo(var_1_2, arg_5_0)
		end,
		function(arg_6_0)
			onNextTick(arg_6_0)
		end
	}, arg_1_1)
end

function var_0_0.ShowAwardInfo(arg_7_0, arg_7_1, arg_7_2)
	pg.m02:sendNotification(NewMainMediator.ON_AWRADS, {
		items = arg_7_1,
		callback = arg_7_2
	})
end

function var_0_0.RecycleItems(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		table.insert(var_8_0, iter_8_1)
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_2) do
		table.insert(var_8_0, iter_8_3)
	end

	pg.m02:sendNotification(GAME.SELL_ITEM, {
		items = var_8_0,
		callback = arg_8_3
	})
end

function var_0_0.DisplayResult(arg_9_0, arg_9_1, arg_9_2)
	if #arg_9_1 > 0 then
		arg_9_0:Display(SkinDiscountItemExpireDisplayPage, arg_9_1, arg_9_2)
	else
		arg_9_2()
	end
end

function var_0_0.CollectExpiredItems(arg_10_0)
	local var_10_0 = arg_10_0:_CollectExpiredItems(ItemUsage.USAGE_SHOP_DISCOUNT)
	local var_10_1 = arg_10_0:_CollectExpiredItems(ItemUsage.USAGE_SKIN_EXP)

	return var_10_0, var_10_1
end

function var_0_0._CollectExpiredItems(arg_11_0, arg_11_1)
	local var_11_0 = {}
	local var_11_1 = pg.shop_template.get_id_list_by_genre[ShopArgs.GiftPackage]

	for iter_11_0, iter_11_1 in pairs(var_11_1) do
		local var_11_2 = pg.shop_template[iter_11_1]

		if arg_11_0:InTime(var_11_2.time) then
			local var_11_3 = var_11_2.effect_args[1] or 0
			local var_11_4 = pg.item_data_statistics[var_11_3]

			if var_11_4 then
				arg_11_0:GetExpiredItemIdFromDropList(var_11_0, var_11_4.display_icon, arg_11_1)
			end
		end
	end

	return var_11_0
end

function var_0_0.InTime(arg_12_0, arg_12_1)
	if type(arg_12_1) == "table" then
		return pg.TimeMgr.GetInstance():passTime(arg_12_1[2])
	elseif arg_12_1 == "stop" then
		return true
	end
end

function var_0_0.GetExpiredItemIdFromDropList(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local function var_13_0(arg_14_0)
		local var_14_0 = pg.item_data_statistics[arg_14_0]

		assert(var_14_0, arg_14_0)

		return var_14_0 and var_14_0.usage == arg_13_3
	end

	local var_13_1 = getProxy(BagProxy)

	local function var_13_2(arg_15_0)
		return var_13_1:getItemCountById(arg_15_0) > 0
	end

	for iter_13_0, iter_13_1 in pairs(arg_13_2) do
		local var_13_3 = iter_13_1[1]
		local var_13_4 = iter_13_1[2]

		if var_13_3 == DROP_TYPE_ITEM and var_13_2(var_13_4) and var_13_0(var_13_4) then
			local var_13_5 = var_13_1:RawGetItemById(var_13_4)

			if not _.any(arg_13_1, function(arg_16_0)
				return arg_16_0.id == var_13_4
			end) then
				table.insert(arg_13_1, {
					id = var_13_5.id,
					count = var_13_5.count
				})
			end
		end
	end
end

return var_0_0

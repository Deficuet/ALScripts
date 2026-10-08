local var_0_0 = class("GetOpeningUpShopCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback

	arg_1_0.shopsProxy = getProxy(ShopsProxy)
	arg_1_0.shopList = {}

	parallelAsync({
		function(arg_2_0)
			arg_1_0:GetStressShop(arg_2_0)
		end,
		function(arg_3_0)
			arg_1_0:GetMilitaryShop(arg_3_0)
		end,
		function(arg_4_0)
			arg_1_0:GetShamShop(arg_4_0)
		end,
		function(arg_5_0)
			arg_1_0:GetFragmentShop(arg_5_0)
		end,
		function(arg_6_0)
			arg_1_0:GetActivityShops(arg_6_0)
		end,
		function(arg_7_0)
			arg_1_0:GetGuildShop(arg_7_0)
		end,
		function(arg_8_0)
			arg_1_0:GetMedalShops(arg_8_0)
		end,
		function(arg_9_0)
			arg_1_0:GetMetaShops(arg_9_0)
		end,
		function(arg_10_0)
			arg_1_0:GetMiniShops(arg_10_0)
		end,
		function(arg_11_0)
			arg_1_0:GetQuotaShop(arg_11_0)
		end
	}, function()
		if var_1_1 then
			var_1_1(arg_1_0.shopList)
		end
	end)
end

function var_0_0.GetMilitaryShop(arg_13_0, arg_13_1)
	local var_13_0 = {}
	local var_13_1 = arg_13_0.shopsProxy:getMeritorousShop()

	if not var_13_1 then
		table.insert(var_13_0, function(arg_14_0)
			arg_13_0:sendNotification(GAME.GET_MILITARY_SHOP, {
				callback = arg_14_0
			})
		end)
	else
		table.insert(var_13_0, function(arg_15_0)
			arg_15_0(var_13_1)
		end)
	end

	table.insert(var_13_0, function(arg_16_0, arg_16_1)
		arg_13_0.shopList[ShopConst.TYPE_MILITARY_SHOP] = {}

		table.insert(arg_13_0.shopList[ShopConst.TYPE_MILITARY_SHOP], arg_16_1)
		arg_16_0()
	end)
	seriesAsync(var_13_0, arg_13_1)
end

function var_0_0.GetStressShop(arg_17_0, arg_17_1)
	local var_17_0 = {}
	local var_17_1 = arg_17_0.shopsProxy:getShopStreet()

	if not var_17_1 then
		table.insert(var_17_0, function(arg_18_0)
			arg_17_0:sendNotification(GAME.GET_SHOPSTREET, {
				callback = arg_18_0
			})
		end)
	else
		table.insert(var_17_0, function(arg_19_0)
			arg_19_0(var_17_1)
		end)
	end

	table.insert(var_17_0, function(arg_20_0, arg_20_1)
		arg_17_0.shopList[ShopConst.TYPE_SHOP_STREET] = {}

		table.insert(arg_17_0.shopList[ShopConst.TYPE_SHOP_STREET], arg_20_1)
		arg_20_0()
	end)
	seriesAsync(var_17_0, arg_17_1)
end

function var_0_0.GetGuildShop(arg_21_0, arg_21_1)
	if LOCK_GUILD_SHOP then
		arg_21_1()

		return
	end

	local var_21_0 = {}
	local var_21_1 = arg_21_0.shopsProxy:getGuildShop()

	if not var_21_1 then
		table.insert(var_21_0, function(arg_22_0)
			arg_21_0:sendNotification(GAME.GET_GUILD_SHOP, {
				type = GuildConst.GET_SHOP,
				callback = arg_22_0
			})
		end)
	else
		table.insert(var_21_0, function(arg_23_0)
			arg_23_0(var_21_1)
		end)
	end

	table.insert(var_21_0, function(arg_24_0, arg_24_1)
		arg_21_0.shopList[ShopConst.TYPE_GUILD] = {}

		table.insert(arg_21_0.shopList[ShopConst.TYPE_GUILD], arg_24_1)
		arg_24_0()
	end)
	seriesAsync(var_21_0, arg_21_1)
end

function var_0_0.GetShamShop(arg_25_0, arg_25_1)
	local var_25_0 = {}
	local var_25_1 = arg_25_0.shopsProxy:getShamShop()

	if not LOCK_SHAM_CHAPTER and var_25_1 and var_25_1:isOpen() then
		table.insert(var_25_0, function(arg_26_0)
			arg_25_0.shopList[ShopConst.TYPE_SHAM_SHOP] = {}

			table.insert(arg_25_0.shopList[ShopConst.TYPE_SHAM_SHOP], var_25_1)
			arg_26_0()
		end)
	end

	seriesAsync(var_25_0, arg_25_1)
end

function var_0_0.GetFragmentShop(arg_27_0, arg_27_1)
	local var_27_0 = {}
	local var_27_1 = arg_27_0.shopsProxy:getFragmentShop()

	if not LOCK_FRAGMENT_SHOP and var_27_1 and var_27_1:isOpen() then
		table.insert(var_27_0, function(arg_28_0)
			arg_27_0.shopList[ShopConst.TYPE_FRAGMENT] = {}

			table.insert(arg_27_0.shopList[ShopConst.TYPE_FRAGMENT], var_27_1)
			arg_28_0()
		end)
	end

	seriesAsync(var_27_0, arg_27_1)
end

function var_0_0.GetActivityShops(arg_29_0, arg_29_1)
	local var_29_0 = {}
	local var_29_1 = {}

	for iter_29_0, iter_29_1 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP)) do
		table.insert(var_29_0, arg_29_0.shopsProxy:getActivityShopById(iter_29_1.id))

		var_29_1[iter_29_1.id] = iter_29_1:getStartTime()
	end

	if #var_29_0 > 0 then
		arg_29_0.shopList[ShopConst.TYPE_ACTIVITY] = {}

		for iter_29_2, iter_29_3 in ipairs(var_29_0) do
			table.insert(arg_29_0.shopList[ShopConst.TYPE_ACTIVITY], iter_29_3)
		end

		local var_29_2 = getProxy(ActivityProxy):getRawData()

		table.sort(arg_29_0.shopList[ShopConst.TYPE_ACTIVITY], CompareFuncs({
			function(arg_30_0)
				return var_29_1[arg_30_0.activityId]
			end
		}))
	end

	arg_29_1()
end

function var_0_0.GetMetaShops(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = arg_31_0.shopsProxy:GetMetaShop()

	if not var_31_1 then
		table.insert(var_31_0, function(arg_32_0)
			local var_32_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP_SELECTABLE)

			for iter_32_0, iter_32_1 in ipairs(var_32_0) do
				if iter_32_1 and not iter_32_1:isEnd() and iter_32_1:getConfig("config_id") == 1 then
					local var_32_1 = MetaShop.New(iter_32_1)

					arg_31_0.shopsProxy:AddMetaShop(var_32_1)

					break
				end
			end

			arg_32_0(arg_31_0.shopsProxy:GetMetaShop())
		end)
	else
		table.insert(var_31_0, function(arg_33_0)
			arg_33_0(var_31_1)
		end)
	end

	table.insert(var_31_0, function(arg_34_0, arg_34_1)
		if arg_34_1 then
			arg_31_0.shopList[ShopConst.TYPE_META] = {}

			table.insert(arg_31_0.shopList[ShopConst.TYPE_META], arg_34_1)
		end

		arg_34_0()
	end)
	seriesAsync(var_31_0, arg_31_1)
end

function var_0_0.GetMedalShops(arg_35_0, arg_35_1)
	local var_35_0 = {}
	local var_35_1 = arg_35_0.shopsProxy:GetMedalShop()

	if not var_35_1 then
		table.insert(var_35_0, function(arg_36_0)
			arg_35_0:sendNotification(GAME.GET_MEDALSHOP, {
				callback = arg_36_0
			})
		end)
	else
		table.insert(var_35_0, function(arg_37_0)
			arg_37_0(var_35_1)
		end)
	end

	table.insert(var_35_0, function(arg_38_0, arg_38_1)
		if arg_38_1 then
			arg_35_0.shopList[ShopConst.TYPE_MEDAL] = {}

			table.insert(arg_35_0.shopList[ShopConst.TYPE_MEDAL], arg_38_1)
		end

		arg_38_0()
	end)
	seriesAsync(var_35_0, arg_35_1)
end

function var_0_0.GetMiniShops(arg_39_0, arg_39_1)
	if LOCK_MINIGAME_HALL then
		if arg_39_1 then
			arg_39_1()
		end

		return
	end

	local var_39_0 = {}
	local var_39_1 = arg_39_0.shopsProxy:getMiniShop()

	if not var_39_1 then
		table.insert(var_39_0, function(arg_40_0)
			arg_39_0:sendNotification(GAME.GET_MINI_GAME_SHOP, {
				callback = arg_40_0
			})
		end)
	else
		table.insert(var_39_0, function(arg_41_0)
			if var_39_1:checkShopFlash() then
				arg_39_0:sendNotification(GAME.MINI_GAME_SHOP_FLUSH, {
					callback = arg_41_0
				})
			else
				arg_41_0(var_39_1)
			end
		end)
	end

	table.insert(var_39_0, function(arg_42_0, arg_42_1)
		arg_39_0.shopList[ShopConst.TYPE_MINI_GAME] = {}

		table.insert(arg_39_0.shopList[ShopConst.TYPE_MINI_GAME], arg_42_1)
		arg_42_0()
	end)
	seriesAsync(var_39_0, arg_39_1)
end

function var_0_0.GetQuotaShop(arg_43_0, arg_43_1)
	if LOCK_QUOTA_SHOP then
		arg_43_1()

		return
	end

	local var_43_0 = {}
	local var_43_1 = arg_43_0.shopsProxy:getQuotaShop()

	if not var_43_1 then
		var_43_1 = QuotaShop.New()

		arg_43_0.shopsProxy:setQuotaShop(var_43_1)
	else
		table.insert(var_43_0, function(arg_44_0)
			arg_44_0(var_43_1)
		end)
	end

	table.insert(var_43_0, function(arg_45_0)
		arg_43_0.shopList[ShopConst.TYPE_QUOTA] = {}

		table.insert(arg_43_0.shopList[ShopConst.TYPE_QUOTA], var_43_1)
		arg_45_0()
	end)
	seriesAsync(var_43_0, arg_43_1)
end

return var_0_0

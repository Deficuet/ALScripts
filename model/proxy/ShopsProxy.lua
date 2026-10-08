local var_0_0 = class("ShopsProxy", import(".NetProxy"))

var_0_0.MERITOROUS_SHOP_UPDATED = "ShopsProxy:MERITOROUS_SHOP_UPDATED"
var_0_0.SHOPPINGSTREET_UPDATE = "ShopsProxy:SHOPPINGSTREET_UPDATE"
var_0_0.FIRST_CHARGE_IDS_UPDATED = "ShopsProxy:FIRST_CHARGE_IDS_UPDATED"
var_0_0.CHARGED_LIST_UPDATED = "ShopsProxy:CHARGED_LIST_UPDATED"
var_0_0.NORMAL_LIST_UPDATED = "ShopsProxy:NORMAL_LIST_UPDATED"
var_0_0.NORMAL_GROUP_LIST_UPDATED = "ShopsProxy:NORMAL_GROUP_LIST_UPDATED"
var_0_0.ACTIVITY_SHOP_UPDATED = "ShopsProxy:ACTIVITY_SHOP_UPDATED"
var_0_0.GUILD_SHOP_ADDED = "ShopsProxy:GUILD_SHOP_ADDED"
var_0_0.GUILD_SHOP_UPDATED = "ShopsProxy:GUILD_SHOP_UPDATED"
var_0_0.SHAM_SHOP_UPDATED = "ShopsProxy:SHAM_SHOP_UPDATED"
var_0_0.FRAGMENT_SHOP_UPDATED = "ShopsProxy:FRAGMENT_SHOP_UPDATED"
var_0_0.ACTIVITY_SHOP_GOODS_UPDATED = "ShopsProxy:ACTIVITY_SHOP_GOODS_UPDATED"
var_0_0.META_SHOP_GOODS_UPDATED = "ShopsProxy:META_SHOP_GOODS_UPDATED"
var_0_0.MEDAL_SHOP_UPDATED = "ShopsProxy:MEDAL_SHOP_UPDATED"
var_0_0.QUOTA_SHOP_UPDATED = "ShopsProxy:QUOTA_SHOP_UPDATED"
var_0_0.CRUISE_SHOP_UPDATED = "ShopsProxy:CRUISE_SHOP_UPDATED"

function var_0_0.register(arg_1_0)
	arg_1_0.shopStreet = nil
	arg_1_0.meritorousShop = nil
	arg_1_0.guildShop = nil
	arg_1_0.refreshChargeList = false
	arg_1_0.metaShop = nil
	arg_1_0.miniShop = nil

	arg_1_0:on(22102, function(arg_2_0)
		local var_2_0 = getProxy(ShopsProxy)
		local var_2_1 = ShoppingStreet.New(arg_2_0.street)

		var_2_0:setShopStreet(var_2_1)
	end)

	arg_1_0.shamShop = ShamBattleShop.New()
	arg_1_0.fragmentShop = FragmentShop.New()

	arg_1_0:on(16200, function(arg_3_0)
		arg_1_0.shamShop:update(arg_3_0.month, arg_3_0.core_shop_list)
		arg_1_0.fragmentShop:update(arg_3_0.month, arg_3_0.blue_shop_list, arg_3_0.normal_shop_list)
	end)

	arg_1_0.timers = {}
	arg_1_0.tradeNoPrev = ""

	local var_1_0 = pg.shop_template

	arg_1_0.freeGiftIdList = {}

	for iter_1_0, iter_1_1 in pairs(var_1_0.all) do
		if var_1_0[iter_1_1].genre == ShopArgs.GiftPackage and var_1_0[iter_1_1].discount == 100 then
			table.insert(arg_1_0.freeGiftIdList, iter_1_1)
		end
	end

	arg_1_0.newServerShopList = {}
	arg_1_0.activityShops = {}
end

function var_0_0.timeCall(arg_4_0)
	return {
		[ProxyRegister.DayCall] = function(arg_5_0, arg_5_1)
			local var_5_0 = arg_4_0:getShopStreet()

			if var_5_0 then
				var_5_0:resetflashCount()
				arg_4_0:setShopStreet(var_5_0)
			end

			arg_4_0.refreshChargeList = true

			local var_5_1 = arg_4_0:getMiniShop()

			if var_5_1 and var_5_1:checkShopFlash() then
				pg.m02:sendNotification(GAME.MINI_GAME_SHOP_FLUSH)
			end

			if arg_5_0 == 1 then
				arg_4_0.shamShop:update(arg_5_1.month, {})
				arg_4_0:AddShamShop(arg_4_0.shamShop)
				arg_4_0.fragmentShop:Reset(arg_5_1.month)
				arg_4_0:AddFragmentShop(arg_4_0.fragmentShop)

				if not LOCK_UR_SHIP then
					local var_5_2 = pg.gameset.urpt_chapter_max.description[1]

					getProxy(BagProxy):ClearLimitCnt(var_5_2)
				end
			end
		end
	}
end

function var_0_0.setShopStreet(arg_6_0, arg_6_1)
	arg_6_0.shopStreet = arg_6_1

	arg_6_0:sendNotification(var_0_0.SHOPPINGSTREET_UPDATE, {
		shopStreet = Clone(arg_6_0.shopStreet)
	})
end

function var_0_0.UpdateShopStreet(arg_7_0, arg_7_1)
	arg_7_0.shopStreet = arg_7_1
end

function var_0_0.getShopStreet(arg_8_0)
	return Clone(arg_8_0.shopStreet)
end

function var_0_0.getMeritorousShop(arg_9_0)
	return Clone(arg_9_0.meritorousShop)
end

function var_0_0.addMeritorousShop(arg_10_0, arg_10_1)
	arg_10_0.meritorousShop = arg_10_1

	arg_10_0:sendNotification(var_0_0.MERITOROUS_SHOP_UPDATED, Clone(arg_10_1))
end

function var_0_0.updateMeritorousShop(arg_11_0, arg_11_1)
	arg_11_0.meritorousShop = arg_11_1
end

function var_0_0.getMiniShop(arg_12_0)
	return Clone(arg_12_0.miniShop)
end

function var_0_0.setMiniShop(arg_13_0, arg_13_1)
	arg_13_0.miniShop = arg_13_1
end

function var_0_0.setNormalList(arg_14_0, arg_14_1)
	arg_14_0.normalList = arg_14_1 or {}
end

function var_0_0.GetNormalList(arg_15_0)
	return Clone(arg_15_0.normalList)
end

function var_0_0.GetNormalByID(arg_16_0, arg_16_1)
	if not arg_16_0.normalList then
		arg_16_0.normalList = {}
	end

	local var_16_0 = arg_16_0.normalList[arg_16_1] or Goods.Create({
		buyCount = 0,
		id = arg_16_1
	}, Goods.TYPE_GIFT_PACKAGE)

	arg_16_0.normalList[arg_16_1] = var_16_0

	return arg_16_0.normalList[arg_16_1]
end

function var_0_0.updateNormalByID(arg_17_0, arg_17_1)
	arg_17_0.normalList[arg_17_1.id] = arg_17_1
end

function var_0_0.checkHasFreeNormal(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.freeGiftIdList) do
		if arg_18_0:checkNormalCanPurchase(iter_18_1) then
			return true
		end
	end

	return false
end

function var_0_0.checkNormalCanPurchase(arg_19_0, arg_19_1)
	if arg_19_0.normalList[arg_19_1] ~= nil then
		local var_19_0 = arg_19_0.normalList[arg_19_1]

		if not var_19_0:inTime() then
			return false
		end

		local var_19_1 = var_19_0:getConfig("group") or 0

		if var_19_1 > 0 then
			local var_19_2 = var_19_0:getConfig("group_limit")
			local var_19_3 = arg_19_0:getGroupLimit(var_19_1)

			return var_19_2 > 0 and var_19_3 < var_19_2
		elseif var_19_0:canPurchase() then
			return true
		end
	else
		return arg_19_0:GetNormalByID(arg_19_1):inTime()
	end
end

function var_0_0.setNormalGroupList(arg_20_0, arg_20_1)
	arg_20_0.normalGroupList = arg_20_1
end

function var_0_0.GetNormalGroupList(arg_21_0)
	return arg_21_0.normalGroupList
end

function var_0_0.updateNormalGroupList(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_1 <= 0 then
		return
	end

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.normalGroupList) do
		if iter_22_1.shop_id == arg_22_1 then
			local var_22_0 = arg_22_0.normalGroupList[iter_22_0].pay_count or 0

			arg_22_0.normalGroupList[iter_22_0].pay_count = var_22_0 + arg_22_2

			return
		end
	end

	table.insert(arg_22_0.normalGroupList, {
		shop_id = arg_22_1,
		pay_count = arg_22_2
	})
end

function var_0_0.getGroupLimit(arg_23_0, arg_23_1)
	if not arg_23_0.normalGroupList then
		return 0
	end

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.normalGroupList) do
		if iter_23_1.shop_id == arg_23_1 then
			return iter_23_1.pay_count
		end
	end

	return 0
end

function var_0_0.getActivityShopById(arg_24_0, arg_24_1)
	if not arg_24_0.activityShops[arg_24_1] then
		local var_24_0 = getProxy(ActivityProxy):getActivityById(arg_24_1)
		local var_24_1 = var_24_0 and not var_24_0:isEnd() and ActivityShop.New(var_24_0)

		arg_24_0.activityShops[arg_24_1] = var_24_1
	end

	return arg_24_0.activityShops[arg_24_1]
end

function var_0_0.updateActivityShop(arg_25_0, arg_25_1, arg_25_2)
	assert(arg_25_0.activityShops, "activityShops can not be nil")

	arg_25_0.activityShops[arg_25_1] = arg_25_2:sendselfNotification(var_0_0.ACTIVITY_SHOP_UPDATED, {
		activityId = arg_25_1,
		shop = arg_25_2:clone()
	})
end

function var_0_0.UpdateActivityGoods(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	local var_26_0 = arg_26_0:getActivityShopById(arg_26_1)

	var_26_0:getGoodsById(arg_26_2):addBuyCount(arg_26_3)

	arg_26_0.activityShops[arg_26_1] = var_26_0

	arg_26_0:sendNotification(var_0_0.ACTIVITY_SHOP_GOODS_UPDATED, {
		activityId = arg_26_1,
		goodsId = arg_26_2
	})
end

function var_0_0.setFirstChargeList(arg_27_0, arg_27_1)
	arg_27_0.firstChargeList = arg_27_1

	arg_27_0:sendNotification(var_0_0.FIRST_CHARGE_IDS_UPDATED, Clone(arg_27_1))
end

function var_0_0.getFirstChargeList(arg_28_0)
	return Clone(arg_28_0.firstChargeList)
end

function var_0_0.setChargedList(arg_29_0, arg_29_1)
	arg_29_0.chargeList = arg_29_1

	arg_29_0:sendNotification(var_0_0.CHARGED_LIST_UPDATED, Clone(arg_29_1))
end

function var_0_0.getChargedList(arg_30_0)
	return Clone(arg_30_0.chargeList)
end

local var_0_1 = 3
local var_0_2 = 10

function var_0_0.chargeFailed(arg_31_0, arg_31_1, arg_31_2)
	if not arg_31_0.timers[arg_31_1] then
		pg.UIMgr.GetInstance():LoadingOn()

		arg_31_0.timers[arg_31_1] = Timer.New(function()
			if arg_31_0.timers[arg_31_1].loop == 1 then
				pg.UIMgr.GetInstance():LoadingOff()
			end

			PaySuccess(arg_31_1, arg_31_2)
		end, var_0_1, var_0_2)

		arg_31_0.timers[arg_31_1]:Start()
	end
end

function var_0_0.removeChargeTimer(arg_33_0, arg_33_1)
	if arg_33_0.timers[arg_33_1] then
		pg.UIMgr.GetInstance():LoadingOff()
		arg_33_0.timers[arg_33_1]:Stop()

		arg_33_0.timers[arg_33_1] = nil
	end
end

function var_0_0.addWaitTimer(arg_34_0)
	pg.UIMgr.GetInstance():LoadingOn()

	arg_34_0.waitBiliTimer = Timer.New(function()
		arg_34_0:removeWaitTimer()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("charge_time_out")
		})
	end, 25, 1)

	arg_34_0.waitBiliTimer:Start()
end

function var_0_0.removeWaitTimer(arg_36_0)
	if arg_36_0.waitBiliTimer then
		pg.UIMgr.GetInstance():LoadingOff()
		arg_36_0.waitBiliTimer:Stop()

		arg_36_0.waitBiliTimer = nil
	end
end

function var_0_0.setGuildShop(arg_37_0, arg_37_1)
	assert(isa(arg_37_1, GuildShop), "shop should instance of GuildShop")
	assert(arg_37_0.guildShop == nil, "shop already exist")

	arg_37_0.guildShop = arg_37_1

	arg_37_0:sendNotification(var_0_0.GUILD_SHOP_ADDED, arg_37_0.guildShop)
end

function var_0_0.getGuildShop(arg_38_0)
	return arg_38_0.guildShop
end

function var_0_0.updateGuildShop(arg_39_0, arg_39_1, arg_39_2)
	assert(isa(arg_39_1, GuildShop), "shop should instance of GuildShop")
	assert(arg_39_0.guildShop, "should exist shop")

	arg_39_0.guildShop = arg_39_1

	arg_39_0:sendNotification(var_0_0.GUILD_SHOP_UPDATED, {
		shop = arg_39_0.guildShop,
		reset = arg_39_2
	})
end

function var_0_0.AddShamShop(arg_40_0, arg_40_1)
	arg_40_0.shamShop = arg_40_1

	arg_40_0:sendNotification(var_0_0.SHAM_SHOP_UPDATED, arg_40_1)
end

function var_0_0.updateShamShop(arg_41_0, arg_41_1)
	arg_41_0.shamShop = arg_41_1
end

function var_0_0.getShamShop(arg_42_0)
	return arg_42_0.shamShop
end

function var_0_0.AddFragmentShop(arg_43_0, arg_43_1)
	arg_43_0.fragmentShop = arg_43_1

	arg_43_0:sendNotification(var_0_0.FRAGMENT_SHOP_UPDATED, arg_43_1)
end

function var_0_0.updateFragmentShop(arg_44_0, arg_44_1)
	arg_44_0.fragmentShop = arg_44_1
end

function var_0_0.getFragmentShop(arg_45_0)
	return arg_45_0.fragmentShop
end

function var_0_0.AddMetaShop(arg_46_0, arg_46_1)
	arg_46_0.metaShop = arg_46_1
end

function var_0_0.GetMetaShop(arg_47_0)
	return arg_47_0.metaShop
end

function var_0_0.UpdateMetaShopGoods(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0:GetMetaShop():getGoodsById(arg_48_1):addBuyCount(arg_48_2)
	arg_48_0:sendNotification(var_0_0.META_SHOP_GOODS_UPDATED, {
		goodsId = arg_48_1
	})
end

function var_0_0.SetNewServerShop(arg_49_0, arg_49_1, arg_49_2)
	arg_49_0.newServerShopList[arg_49_1] = arg_49_2
end

function var_0_0.GetNewServerShop(arg_50_0, arg_50_1)
	return arg_50_0.newServerShopList[arg_50_1]
end

function var_0_0.SetMedalShop(arg_51_0, arg_51_1)
	arg_51_0.medalShop = arg_51_1
end

function var_0_0.UpdateMedalShop(arg_52_0, arg_52_1)
	arg_52_0.medalShop = arg_52_1

	arg_52_0:sendNotification(var_0_0.MEDAL_SHOP_UPDATED, arg_52_1)
end

function var_0_0.GetMedalShop(arg_53_0)
	return arg_53_0.medalShop
end

function var_0_0.setQuotaShop(arg_54_0, arg_54_1)
	arg_54_0.quotaShop = arg_54_1
end

function var_0_0.getQuotaShop(arg_55_0)
	return arg_55_0.quotaShop
end

function var_0_0.updateQuotaShop(arg_56_0, arg_56_1, arg_56_2)
	arg_56_0.quotaShop = arg_56_1

	arg_56_0:sendNotification(var_0_0.QUOTA_SHOP_UPDATED, {
		shop = arg_56_0.quotaShop,
		reset = arg_56_2
	})
end

function var_0_0.SetCruiseShop(arg_57_0, arg_57_1)
	arg_57_0.cruiseShop = arg_57_1
end

function var_0_0.UpdateCruiseShop(arg_58_0)
	arg_58_0.cruiseShop = CruiseShop.New(arg_58_0:GetNormalList(), arg_58_0:GetNormalGroupList())

	arg_58_0:sendNotification(var_0_0.CRUISE_SHOP_UPDATED, {
		shop = arg_58_0.cruiseShop
	})
end

function var_0_0.GetCruiseShop(arg_59_0)
	return arg_59_0.cruiseShop
end

function var_0_0.remove(arg_60_0)
	for iter_60_0, iter_60_1 in pairs(arg_60_0.timers) do
		iter_60_1:Stop()
	end

	arg_60_0.timers = nil

	arg_60_0:removeWaitTimer()
end

function var_0_0.ShouldRefreshChargeList(arg_61_0)
	local var_61_0 = arg_61_0:getFirstChargeList()
	local var_61_1 = arg_61_0:getChargedList()
	local var_61_2 = arg_61_0:GetNormalList()
	local var_61_3 = arg_61_0:GetNormalGroupList()

	return not var_61_0 or not var_61_1 or not var_61_2 or not var_61_3 or arg_61_0.refreshChargeList
end

function var_0_0.GetRecommendCommodities(arg_62_0)
	local var_62_0 = arg_62_0:getChargedList()
	local var_62_1 = arg_62_0:GetNormalList()
	local var_62_2 = arg_62_0:GetNormalGroupList()

	if not var_62_0 or not var_62_1 or not var_62_2 then
		return {}
	end

	local var_62_3 = {}

	for iter_62_0, iter_62_1 in ipairs(pg.recommend_shop.all) do
		local var_62_4 = pg.recommend_shop[iter_62_1].time

		if pg.TimeMgr.GetInstance():inTime(var_62_4) then
			local var_62_5 = RecommendCommodity.New({
				id = iter_62_1,
				chargedList = var_62_0,
				normalList = var_62_1,
				normalGroupList = var_62_2
			})

			if var_62_5:CanShow() then
				table.insert(var_62_3, var_62_5)
			end
		end
	end

	table.sort(var_62_3, function(arg_63_0, arg_63_1)
		return arg_63_0:GetOrder() < arg_63_1:GetOrder()
	end)

	return var_62_3
end

function var_0_0.GetGiftCommodity(arg_64_0, arg_64_1, arg_64_2)
	local var_64_0 = Goods.Create({
		shop_id = arg_64_1
	}, arg_64_2)

	if var_64_0:isChargeType() then
		local var_64_1 = ChargeConst.getBuyCount(arg_64_0.chargeList, var_64_0.id)

		var_64_0:updateBuyCount(var_64_1)
	else
		local var_64_2 = ChargeConst.getBuyCount(arg_64_0.normalList, var_64_0.id)

		var_64_0:updateBuyCount(var_64_2)

		local var_64_3 = var_64_0:getConfig("group") or 0

		if var_64_3 > 0 then
			local var_64_4 = ChargeConst.getGroupLimit(arg_64_0.normalGroupList, var_64_3)

			var_64_0:updateGroupCount(var_64_4)
		end
	end

	return var_64_0
end

function var_0_0.GetGroupPayCount(arg_65_0, arg_65_1)
	for iter_65_0, iter_65_1 in ipairs(arg_65_0.normalGroupList) do
		if iter_65_1.shop_id == arg_65_1 then
			return arg_65_0.normalGroupList[iter_65_0].pay_count or 0
		end
	end

	return 0
end

function var_0_0.SpecialBannerBlockCheck(arg_66_0, arg_66_1)
	if not LOCK_SHOP_BANNER_US then
		return true
	end

	local var_66_0, var_66_1 = unpack(getGameset("levellimit_shopbanner"))

	return var_66_0 <= arg_66_1.level or arg_66_0.name ~= "banner_big" or table.contains(var_66_1, arg_66_0.id)
end

function var_0_0.GiftPackageRedDotTip(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = {}

	if arg_67_0:ShouldRefreshChargeList() then
		table.insert(var_67_0, function(arg_68_0)
			pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
				callback = arg_68_0
			})
		end)
	end

	seriesAsync(var_67_0, function()
		local var_69_0 = underscore.any(arg_67_0:GetAllShowGiftPackages(arg_67_2), function(arg_70_0)
			return arg_70_0:isTip()
		end)

		for iter_69_0, iter_69_1 in ipairs(arg_67_1) do
			setActive(iter_69_1, var_69_0)
		end
	end)
end

function var_0_0.GetAllShowGiftPackages(arg_71_0, arg_71_1)
	assert(not arg_71_0:ShouldRefreshChargeList())

	local var_71_0 = {}
	local var_71_1 = RefluxShopView.getAllRefluxPackID()
	local var_71_2 = getProxy(PlayerProxy):getRawData()
	local var_71_3 = pg.pay_data_display

	for iter_71_0, iter_71_1 in pairs(var_71_3.all) do
		if not table.contains(var_71_1, iter_71_1) then
			local var_71_4 = var_71_3[iter_71_1]
			local var_71_5 = var_71_4.extra_service
			local var_71_6 = var_71_4.akashi_pick > 0

			if (arg_71_1 == nil or var_71_6 == arg_71_1) and (var_71_5 == Goods.ITEM_BOX or var_71_5 == Goods.PASS_ITEM) then
				local var_71_7 = Goods.Create({
					shop_id = iter_71_1
				}, Goods.TYPE_CHARGE)

				if arg_71_0:filterLimitTypeGoods(var_71_7, var_71_2) and arg_71_0:IsVaildBattlePass(var_71_7) then
					table.insert(var_71_0, var_71_7)
				end
			end
		end
	end

	for iter_71_2, iter_71_3 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.GiftPackage] or {}) do
		local var_71_8 = ShopConst.GetShopConfig(iter_71_3).akashi_pick > 0

		if (arg_71_1 == nil or var_71_8 == arg_71_1) and not table.contains(var_71_1, iter_71_3) then
			local var_71_9 = Goods.Create({
				shop_id = iter_71_3
			}, Goods.TYPE_GIFT_PACKAGE)

			table.insert(var_71_0, var_71_9)
		end
	end

	for iter_71_4, iter_71_5 in ipairs(pg.shop_template.get_id_list_by_genre[ShopArgs.GiftActPackage] or {}) do
		local var_71_10 = ShopConst.GetShopConfig(iter_71_5).akashi_pick > 0

		if (arg_71_1 == nil or var_71_10 == arg_71_1) and not table.contains(var_71_1, iter_71_5) then
			local var_71_11 = Goods.Create({
				shop_id = iter_71_5
			}, Goods.TYPE_GIFT_PACKAGE_ACT)

			table.insert(var_71_0, var_71_11)
		end
	end

	local var_71_12 = {}
	local var_71_13 = {}

	for iter_71_6, iter_71_7 in ipairs(var_71_0) do
		if iter_71_7:isChargeType() then
			local var_71_14 = ChargeConst.getBuyCount(arg_71_0.chargeList, iter_71_7.id)

			iter_71_7:updateBuyCount(var_71_14)

			if iter_71_7:canPurchase() and iter_71_7:inTime() then
				table.insert(var_71_12, iter_71_7)
			end
		elseif not iter_71_7:isLevelLimit(var_71_2.level, true) then
			local var_71_15 = ChargeConst.getBuyCount(arg_71_0.normalList, iter_71_7.id)

			iter_71_7:updateBuyCount(var_71_15)

			local var_71_16 = iter_71_7:getConfig("group") or 0
			local var_71_17 = false

			if var_71_16 > 0 then
				local var_71_18 = iter_71_7:getConfig("group_limit")
				local var_71_19 = ChargeConst.getGroupLimit(arg_71_0.normalGroupList, var_71_16)

				iter_71_7:updateGroupCount(var_71_19)

				var_71_17 = var_71_18 > 0 and var_71_18 <= var_71_19
			end

			local var_71_20, var_71_21 = pg.TimeMgr.GetInstance():inTime(iter_71_7:getConfig("time"))

			if iter_71_7.id == 69999 then
				warning(PrintTable(iter_71_7:getConfig("time")), iter_71_7.__cname)
				warning(var_71_20, var_71_21, iter_71_7:canPurchase(), var_71_17)
			end

			if var_71_21 then
				table.insert(var_71_13, iter_71_7)
			end

			if var_71_20 and iter_71_7:canPurchase() and not var_71_17 then
				table.insert(var_71_12, iter_71_7)
			end
		end
	end

	return var_71_12, var_71_13
end

function var_0_0.IsVaildBattlePass(arg_72_0, arg_72_1)
	if not arg_72_1:isPassItem() then
		return true
	end

	local var_72_0 = arg_72_1:getConfig("sub_display")[1]
	local var_72_1 = getProxy(ActivityProxy):RawGetActivityById(var_72_0)

	if var_72_1 and not var_72_1:isEnd() then
		return true
	end

	local var_72_2, var_72_3 = PrevPeriodCrusingActivity.StaticExistPrevPeriodCrusingActivity()

	if var_72_2 and var_72_0 == var_72_3 then
		return true
	end

	return false
end

function var_0_0.filterLimitTypeGoods(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_1:getConfig("limit_type")

	return switch(var_73_0, {
		[3] = function()
			if arg_73_1:getConfig("limit_arg") ~= 0 or arg_73_1:isLevelLimit(arg_73_2.level, true) then
				return false
			end

			local var_74_0
			local var_74_1
			local var_74_2

			for iter_74_0, iter_74_1 in ipairs(arg_73_1:getSameLimitGroupTecGoods()) do
				if iter_74_1:getConfig("limit_arg") == 1 then
					var_74_1 = iter_74_1
				elseif iter_74_1:getConfig("limit_arg") == 2 then
					var_74_0 = iter_74_1
				elseif iter_74_1:getConfig("limit_arg") == 3 then
					var_74_2 = iter_74_1
				end
			end

			local var_74_3 = ChargeConst.getBuyCount(arg_73_0.chargeList, var_74_0.id)
			local var_74_4 = ChargeConst.getBuyCount(arg_73_0.chargeList, var_74_1.id)
			local var_74_5 = ChargeConst.getBuyCount(arg_73_0.chargeList, var_74_2.id)

			if var_74_4 > 0 then
				return false
			elseif var_74_3 > 0 and var_74_5 > 0 then
				return false
			else
				return true
			end
		end,
		[5] = function()
			if arg_73_1:getConfig("limit_arg") ~= 0 or arg_73_1:isLevelLimit(arg_73_2.level, true) then
				return false
			end

			for iter_75_0, iter_75_1 in ipairs(arg_73_1:getSameLimitGroupTecGoods()) do
				if iter_75_1:getConfig("limit_arg") ~= 0 and ChargeConst.getBuyCount(arg_73_0.chargeList, iter_75_1.id) > 0 then
					return false
				end
			end

			return true
		end
	}, function()
		return true
	end)
end

function var_0_0.CanPurchasedByCharge(arg_77_0, arg_77_1)
	local var_77_0 = pg.pay_data_display.get_id_list_by_extra_service[Goods.NON_MAIL] or {}

	for iter_77_0, iter_77_1 in ipairs(var_77_0) do
		local var_77_1 = pg.pay_data_display[iter_77_1].extra_service_item

		if type(var_77_1) == "string" then
			var_77_1 = {}
		end

		for iter_77_2, iter_77_3 in ipairs(var_77_1) do
			local var_77_2 = iter_77_3[1]
			local var_77_3 = iter_77_3[2]
			local var_77_4 = iter_77_3[3]

			if var_77_2 == DROP_TYPE_SKIN and var_77_3 == arg_77_1 then
				return true, iter_77_1
			end
		end
	end

	return false
end

function var_0_0.IsSkinTypeCharge(arg_78_0, arg_78_1)
	local var_78_0 = pg.pay_data_display[arg_78_1]

	assert(var_78_0, "pay_data_display" .. arg_78_1)

	local var_78_1 = var_78_0.extra_service_item

	if type(var_78_1) == "string" then
		var_78_1 = {}
	end

	for iter_78_0, iter_78_1 in ipairs(var_78_1) do
		local var_78_2 = iter_78_1[1]
		local var_78_3 = iter_78_1[2]
		local var_78_4 = iter_78_1[3]

		if var_78_2 == DROP_TYPE_SKIN then
			return true, var_78_3
		end
	end

	return false
end

return var_0_0

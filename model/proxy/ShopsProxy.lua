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
var_0_0.ACTIVITY_SHOPS_UPDATED = "ShopsProxy:ACTIVITY_SHOPS_UPDATED"
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
		if var_1_0[iter_1_1].genre == "gift_package" and var_1_0[iter_1_1].discount == 100 then
			table.insert(arg_1_0.freeGiftIdList, iter_1_1)
		end
	end

	arg_1_0.newServerShopList = {}
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

function var_0_0.addActivityShops(arg_24_0, arg_24_1)
	arg_24_0.activityShops = arg_24_1

	arg_24_0:sendNotification(var_0_0.ACTIVITY_SHOPS_UPDATED)
end

function var_0_0.getActivityShopById(arg_25_0, arg_25_1)
	assert(arg_25_0.activityShops[arg_25_1], "activity shop should exist" .. arg_25_1)

	return arg_25_0.activityShops[arg_25_1]
end

function var_0_0.updateActivityShop(arg_26_0, arg_26_1, arg_26_2)
	assert(arg_26_0.activityShops, "activityShops can not be nil")

	arg_26_0.activityShops[arg_26_1] = arg_26_2

	arg_26_0:sendNotification(var_0_0.ACTIVITY_SHOP_UPDATED, {
		activityId = arg_26_1,
		shop = arg_26_2:clone()
	})
end

function var_0_0.UpdateActivityGoods(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = arg_27_0:getActivityShopById(arg_27_1)

	var_27_0:getGoodsById(arg_27_2):addBuyCount(arg_27_3)

	arg_27_0.activityShops[arg_27_1] = var_27_0

	arg_27_0:sendNotification(var_0_0.ACTIVITY_SHOP_GOODS_UPDATED, {
		activityId = arg_27_1,
		goodsId = arg_27_2
	})
end

function var_0_0.getActivityShops(arg_28_0)
	return arg_28_0.activityShops
end

function var_0_0.setFirstChargeList(arg_29_0, arg_29_1)
	arg_29_0.firstChargeList = arg_29_1

	arg_29_0:sendNotification(var_0_0.FIRST_CHARGE_IDS_UPDATED, Clone(arg_29_1))
end

function var_0_0.getFirstChargeList(arg_30_0)
	return Clone(arg_30_0.firstChargeList)
end

function var_0_0.setChargedList(arg_31_0, arg_31_1)
	arg_31_0.chargeList = arg_31_1

	arg_31_0:sendNotification(var_0_0.CHARGED_LIST_UPDATED, Clone(arg_31_1))
end

function var_0_0.getChargedList(arg_32_0)
	return Clone(arg_32_0.chargeList)
end

local var_0_1 = 3
local var_0_2 = 10

function var_0_0.chargeFailed(arg_33_0, arg_33_1, arg_33_2)
	if not arg_33_0.timers[arg_33_1] then
		pg.UIMgr.GetInstance():LoadingOn()

		arg_33_0.timers[arg_33_1] = Timer.New(function()
			if arg_33_0.timers[arg_33_1].loop == 1 then
				pg.UIMgr.GetInstance():LoadingOff()
			end

			PaySuccess(arg_33_1, arg_33_2)
		end, var_0_1, var_0_2)

		arg_33_0.timers[arg_33_1]:Start()
	end
end

function var_0_0.removeChargeTimer(arg_35_0, arg_35_1)
	if arg_35_0.timers[arg_35_1] then
		pg.UIMgr.GetInstance():LoadingOff()
		arg_35_0.timers[arg_35_1]:Stop()

		arg_35_0.timers[arg_35_1] = nil
	end
end

function var_0_0.addWaitTimer(arg_36_0)
	pg.UIMgr.GetInstance():LoadingOn()

	arg_36_0.waitBiliTimer = Timer.New(function()
		arg_36_0:removeWaitTimer()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("charge_time_out")
		})
	end, 25, 1)

	arg_36_0.waitBiliTimer:Start()
end

function var_0_0.removeWaitTimer(arg_38_0)
	if arg_38_0.waitBiliTimer then
		pg.UIMgr.GetInstance():LoadingOff()
		arg_38_0.waitBiliTimer:Stop()

		arg_38_0.waitBiliTimer = nil
	end
end

function var_0_0.setGuildShop(arg_39_0, arg_39_1)
	assert(isa(arg_39_1, GuildShop), "shop should instance of GuildShop")
	assert(arg_39_0.guildShop == nil, "shop already exist")

	arg_39_0.guildShop = arg_39_1

	arg_39_0:sendNotification(var_0_0.GUILD_SHOP_ADDED, arg_39_0.guildShop)
end

function var_0_0.getGuildShop(arg_40_0)
	return arg_40_0.guildShop
end

function var_0_0.updateGuildShop(arg_41_0, arg_41_1, arg_41_2)
	assert(isa(arg_41_1, GuildShop), "shop should instance of GuildShop")
	assert(arg_41_0.guildShop, "should exist shop")

	arg_41_0.guildShop = arg_41_1

	arg_41_0:sendNotification(var_0_0.GUILD_SHOP_UPDATED, {
		shop = arg_41_0.guildShop,
		reset = arg_41_2
	})
end

function var_0_0.AddShamShop(arg_42_0, arg_42_1)
	arg_42_0.shamShop = arg_42_1

	arg_42_0:sendNotification(var_0_0.SHAM_SHOP_UPDATED, arg_42_1)
end

function var_0_0.updateShamShop(arg_43_0, arg_43_1)
	arg_43_0.shamShop = arg_43_1
end

function var_0_0.getShamShop(arg_44_0)
	return arg_44_0.shamShop
end

function var_0_0.AddFragmentShop(arg_45_0, arg_45_1)
	arg_45_0.fragmentShop = arg_45_1

	arg_45_0:sendNotification(var_0_0.FRAGMENT_SHOP_UPDATED, arg_45_1)
end

function var_0_0.updateFragmentShop(arg_46_0, arg_46_1)
	arg_46_0.fragmentShop = arg_46_1
end

function var_0_0.getFragmentShop(arg_47_0)
	return arg_47_0.fragmentShop
end

function var_0_0.AddMetaShop(arg_48_0, arg_48_1)
	arg_48_0.metaShop = arg_48_1
end

function var_0_0.GetMetaShop(arg_49_0)
	return arg_49_0.metaShop
end

function var_0_0.UpdateMetaShopGoods(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0:GetMetaShop():getGoodsById(arg_50_1):addBuyCount(arg_50_2)
	arg_50_0:sendNotification(var_0_0.META_SHOP_GOODS_UPDATED, {
		goodsId = arg_50_1
	})
end

function var_0_0.SetNewServerShop(arg_51_0, arg_51_1, arg_51_2)
	arg_51_0.newServerShopList[arg_51_1] = arg_51_2
end

function var_0_0.GetNewServerShop(arg_52_0, arg_52_1)
	return arg_52_0.newServerShopList[arg_52_1]
end

function var_0_0.SetMedalShop(arg_53_0, arg_53_1)
	arg_53_0.medalShop = arg_53_1
end

function var_0_0.UpdateMedalShop(arg_54_0, arg_54_1)
	arg_54_0.medalShop = arg_54_1

	arg_54_0:sendNotification(var_0_0.MEDAL_SHOP_UPDATED, arg_54_1)
end

function var_0_0.GetMedalShop(arg_55_0)
	return arg_55_0.medalShop
end

function var_0_0.setQuotaShop(arg_56_0, arg_56_1)
	arg_56_0.quotaShop = arg_56_1
end

function var_0_0.getQuotaShop(arg_57_0)
	return arg_57_0.quotaShop
end

function var_0_0.updateQuotaShop(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.quotaShop = arg_58_1

	arg_58_0:sendNotification(var_0_0.QUOTA_SHOP_UPDATED, {
		shop = arg_58_0.quotaShop,
		reset = arg_58_2
	})
end

function var_0_0.SetCruiseShop(arg_59_0, arg_59_1)
	arg_59_0.cruiseShop = arg_59_1
end

function var_0_0.UpdateCruiseShop(arg_60_0)
	arg_60_0.cruiseShop = CruiseShop.New(arg_60_0:GetNormalList(), arg_60_0:GetNormalGroupList())

	arg_60_0:sendNotification(var_0_0.CRUISE_SHOP_UPDATED, {
		shop = arg_60_0.cruiseShop
	})
end

function var_0_0.GetCruiseShop(arg_61_0)
	return arg_61_0.cruiseShop
end

function var_0_0.remove(arg_62_0)
	for iter_62_0, iter_62_1 in pairs(arg_62_0.timers) do
		iter_62_1:Stop()
	end

	arg_62_0.timers = nil

	arg_62_0:removeWaitTimer()
end

function var_0_0.ShouldRefreshChargeList(arg_63_0)
	local var_63_0 = arg_63_0:getFirstChargeList()
	local var_63_1 = arg_63_0:getChargedList()
	local var_63_2 = arg_63_0:GetNormalList()
	local var_63_3 = arg_63_0:GetNormalGroupList()

	return not var_63_0 or not var_63_1 or not var_63_2 or not var_63_3 or arg_63_0.refreshChargeList
end

function var_0_0.GetRecommendCommodities(arg_64_0)
	local var_64_0 = arg_64_0:getChargedList()
	local var_64_1 = arg_64_0:GetNormalList()
	local var_64_2 = arg_64_0:GetNormalGroupList()

	if not var_64_0 or not var_64_1 or not var_64_2 then
		return {}
	end

	local var_64_3 = {}

	for iter_64_0, iter_64_1 in ipairs(pg.recommend_shop.all) do
		local var_64_4 = pg.recommend_shop[iter_64_1].time

		if pg.TimeMgr.GetInstance():inTime(var_64_4) then
			local var_64_5 = RecommendCommodity.New({
				id = iter_64_1,
				chargedList = var_64_0,
				normalList = var_64_1,
				normalGroupList = var_64_2
			})

			if var_64_5:CanShow() then
				table.insert(var_64_3, var_64_5)
			end
		end
	end

	table.sort(var_64_3, function(arg_65_0, arg_65_1)
		return arg_65_0:GetOrder() < arg_65_1:GetOrder()
	end)

	return var_64_3
end

function var_0_0.GetGiftCommodity(arg_66_0, arg_66_1, arg_66_2)
	local var_66_0 = Goods.Create({
		shop_id = arg_66_1
	}, arg_66_2)

	if var_66_0:isChargeType() then
		local var_66_1 = ChargeConst.getBuyCount(arg_66_0.chargeList, var_66_0.id)

		var_66_0:updateBuyCount(var_66_1)
	else
		local var_66_2 = ChargeConst.getBuyCount(arg_66_0.normalList, var_66_0.id)

		var_66_0:updateBuyCount(var_66_2)

		local var_66_3 = var_66_0:getConfig("group") or 0

		if var_66_3 > 0 then
			local var_66_4 = ChargeConst.getGroupLimit(arg_66_0.normalGroupList, var_66_3)

			var_66_0:updateGroupCount(var_66_4)
		end
	end

	return var_66_0
end

function var_0_0.GetGroupPayCount(arg_67_0, arg_67_1)
	for iter_67_0, iter_67_1 in ipairs(arg_67_0.normalGroupList) do
		if iter_67_1.shop_id == arg_67_1 then
			return arg_67_0.normalGroupList[iter_67_0].pay_count or 0
		end
	end

	return 0
end

return var_0_0

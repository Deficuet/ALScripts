local var_0_0 = class("SkinCouponActivity", import("model.vo.Activity"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.dataConfig = pg.activity_event_shop_discount[arg_1_0.configId]
end

function var_0_0.GetDiscountPrice(arg_2_0)
	return arg_2_0.dataConfig.discount_price
end

function var_0_0.GetNewPrice(arg_3_0, arg_3_1)
	return arg_3_1 - arg_3_0:GetDiscountPrice()
end

function var_0_0.GetShopIdList(arg_4_0)
	return arg_4_0.dataConfig.shop_list
end

function var_0_0.Left3Day(arg_5_0)
	if arg_5_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 then
		return true
	end

	return false
end

function var_0_0.ShouldTipUsage(arg_6_0)
	local function var_6_0()
		local var_7_0 = getProxy(PlayerProxy):getRawData().id
		local var_7_1 = PlayerPrefs.GetInt(arg_6_0.id .. "_SkinCouponActivity_Tip" .. var_7_0, 0)

		if var_7_1 <= 0 then
			return true
		end

		local var_7_2 = pg.TimeMgr.GetInstance():GetServerTime()

		return var_7_1 < var_7_2 and not pg.TimeMgr.GetInstance():IsSameDay(var_7_2, var_7_1)
	end

	return arg_6_0:GetCanUsageCnt() > 0 and arg_6_0:Left3Day() and var_6_0()
end

function var_0_0.SaveTipTime(arg_8_0)
	local var_8_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_8_1 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(arg_8_0.id .. "_SkinCouponActivity_Tip" .. var_8_1, var_8_0)
	PlayerPrefs.Save()
end

function var_0_0.IncludeShop(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:GetShopIdList()

	return table.contains(var_9_0, arg_9_1)
end

function var_0_0.GetCanUsageCnt(arg_10_0)
	return arg_10_0.data1 - arg_10_0.data2
end

function var_0_0.GetEquivalentRes(arg_11_0)
	if arg_11_0.dataConfig.change_resource_type == 0 or arg_11_0.dataConfig.change_resource_num == 0 then
		return nil
	end

	local var_11_0 = Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = arg_11_0.dataConfig.change_resource_type,
		count = arg_11_0.dataConfig.change_resource_num
	})

	var_11_0.name = var_11_0:getName()
end

function var_0_0.GetLimitCnt(arg_12_0)
	if arg_12_0.dataConfig.max_count == 0 then
		return math.huge
	else
		return arg_12_0.dataConfig.max_count
	end
end

function var_0_0.IsMaxCnt(arg_13_0)
	return arg_13_0.data1 > arg_13_0:GetLimitCnt()
end

function var_0_0.GetItemId(arg_14_0)
	return arg_14_0.dataConfig.item_id
end

function var_0_0.GetItemConfig(arg_15_0)
	local var_15_0 = arg_15_0:GetItemId()

	return Item.getConfigData(var_15_0) or {}
end

function var_0_0.GetItemName(arg_16_0)
	local var_16_0 = arg_16_0:GetItemId()
	local var_16_1 = Item.getConfigData(var_16_0)

	return var_16_1 and var_16_1.name or ""
end

function var_0_0.ShopId2SkinId(arg_17_0, arg_17_1)
	return pg.shop_template[arg_17_1].effect_args[1]
end

function var_0_0.GetOwnCount(arg_18_0)
	local var_18_0 = underscore.map(arg_18_0:GetShopIdList(), function(arg_19_0)
		return arg_18_0:ShopId2SkinId(arg_19_0)
	end)

	return #underscore.filter(var_18_0, function(arg_20_0)
		return getProxy(ShipSkinProxy):hasNonLimitSkin(arg_20_0)
	end), #var_18_0
end

function var_0_0.OwnAllSkin(arg_21_0)
	local var_21_0, var_21_1 = arg_21_0:GetOwnCount()

	return var_21_0 == var_21_1
end

function var_0_0.GetSkinCouponActivities(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(pg.activity_template.get_id_list_by_type[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON] or {}) do
		local var_22_1 = getProxy(ActivityProxy):RawGetActivityById(iter_22_1)

		if var_22_1 and not var_22_1:isEnd() and (not arg_22_0 or var_22_1:IncludeShop(arg_22_0)) then
			table.insert(var_22_0, var_22_1)
		end
	end

	return var_22_0
end

function var_0_0.GetBestReadySkinCouponAct(arg_23_0)
	local var_23_0 = 0
	local var_23_1

	for iter_23_0, iter_23_1 in ipairs(var_0_0.GetSkinCouponActivities(arg_23_0)) do
		if iter_23_1:GetCanUsageCnt() > 0 and var_23_0 < iter_23_1:GetDiscountPrice() then
			var_23_0 = iter_23_1:GetDiscountPrice()
			var_23_1 = iter_23_1
		end
	end

	return var_23_1
end

function var_0_0.StaticExistActivityAndCoupon(arg_24_0)
	return underscore.any(var_0_0.GetSkinCouponActivities(arg_24_0), function(arg_25_0)
		return arg_25_0:GetCanUsageCnt() > 0
	end)
end

function var_0_0.GetSkinCouponActFromEncoreAct(arg_26_0)
	if not arg_26_0 then
		return
	end

	local var_26_0 = Drop.New({
		type = DROP_TYPE_VITEM,
		id = arg_26_0:GetConfigClientSetting("item_id")
	})
	local var_26_1 = getProxy(ActivityProxy):getActivityById(var_26_0:getConfig("link_id"))

	if var_26_1 and not var_26_1:isEnd() then
		return var_26_1
	end
end

function var_0_0.GetSkinCouponEncoreActivities(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in ipairs(pg.activity_template.get_id_list_by_type[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON_COUNTING] or {}) do
		local var_27_1 = getProxy(ActivityProxy):RawGetActivityById(iter_27_1)

		if var_27_1 and not var_27_1:isEnd() and (not arg_27_0 or table.contains(var_27_1:getConfig("config_data")[2], arg_27_0)) then
			table.insert(var_27_0, var_27_1)
		end
	end

	return var_27_0
end

function var_0_0.StaticEncoreActTip(arg_28_0)
	assert(arg_28_0)

	for iter_28_0, iter_28_1 in ipairs(var_0_0.GetSkinCouponEncoreActivities()) do
		local var_28_0 = var_0_0.GetSkinCouponActFromEncoreAct(iter_28_1)

		if var_28_0 and not var_28_0:isEnd() and iter_28_1 and not iter_28_1:isEnd() and var_28_0:IncludeShop(arg_28_0) and var_28_0:GetCanUsageCnt() <= 0 and iter_28_1:getData1() > 0 then
			return iter_28_1
		end
	end
end

function var_0_0.GetOvercountEncoreActs(arg_29_0)
	local var_29_0 = {}

	for iter_29_0, iter_29_1 in ipairs(var_0_0.GetSkinCouponEncoreActivities(arg_29_0)) do
		local var_29_1 = SkinCouponActivity.GetSkinCouponActFromEncoreAct(iter_29_1)

		if var_29_1 and not var_29_1:isEnd() then
			local var_29_2, var_29_3 = var_29_1:GetOwnCount()

			if var_29_1:GetCanUsageCnt() + iter_29_1:getData1() + 1 > var_29_3 - var_29_2 - 1 then
				table.insert(var_29_0, iter_29_1)
			end
		end
	end

	return var_29_0
end

function var_0_0.UseSkinCoupon(arg_30_0)
	local var_30_0 = getProxy(ActivityProxy):getActivityById(arg_30_0)

	if not var_30_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

		return
	end

	var_30_0.data2 = var_30_0.data2 + 1

	getProxy(ActivityProxy):updateActivity(var_30_0)
end

return var_0_0

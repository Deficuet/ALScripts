local var_0_0 = class("CommonCommodity", import(".BaseCommodity"))

function var_0_0.InCommodityDiscountTime(arg_1_0)
	local var_1_0 = ShopConst.GetShopConfig(arg_1_0).discount_time

	if var_1_0 == "always" then
		return true
	end

	if type(var_1_0) == "table" then
		return table.getCount(var_1_0) == 0 or pg.TimeMgr.GetInstance():inTime(var_1_0)
	end

	return false
end

function var_0_0.bindConfigTable(arg_2_0)
	return setmetatable({}, {
		__index = function(arg_3_0, arg_3_1)
			arg_3_0[arg_3_1] = ShopConst.GetShopConfig(arg_3_1)

			return arg_3_0[arg_3_1]
		end
	})
end

function var_0_0.canPurchase(arg_4_0)
	if arg_4_0.type == Goods.TYPE_MILITARY then
		return arg_4_0:getBuyCount() == 0
	elseif arg_4_0.type == Goods.TYPE_GIFT_PACKAGE or arg_4_0.type == Goods.TYPE_SKIN or arg_4_0.type == Goods.TYPE_WORLD or arg_4_0.type == Goods.TYPE_NEW_SERVER then
		local var_4_0 = arg_4_0:getLimitCount()

		return var_4_0 <= 0 or var_4_0 > arg_4_0:getBuyCount()
	elseif arg_4_0.type == Goods.TYPE_CRUISE then
		return arg_4_0:getLimitCount() - arg_4_0:GetOwnedCnt() > 0
	else
		return var_0_0.super.canPurchase(arg_4_0)
	end
end

function var_0_0.isDisCount(arg_5_0)
	if arg_5_0:IsItemDiscountType() then
		return true
	else
		return arg_5_0:getConfig("discount") ~= 0 and var_0_0.InCommodityDiscountTime(arg_5_0.id)
	end
end

function var_0_0.isShopDiscount(arg_6_0)
	return arg_6_0:getConfig("discount") ~= 0 and var_0_0.InCommodityDiscountTime(arg_6_0.id)
end

function var_0_0.GetDiscountEndTime(arg_7_0)
	local var_7_0 = arg_7_0:getConfig("discount_time")
	local var_7_1, var_7_2 = unpack(var_7_0)
	local var_7_3 = var_7_2[1]
	local var_7_4, var_7_5, var_7_6 = unpack(var_7_3)

	return (pg.TimeMgr.GetInstance():Table2ServerTime({
		year = var_7_4,
		month = var_7_5,
		day = var_7_6,
		hour = var_7_2[2][1],
		min = var_7_2[2][2],
		sec = var_7_2[2][3]
	}))
end

function var_0_0.IsGroupSale(arg_8_0)
	local var_8_0 = arg_8_0:getConfig("group") > 0
	local var_8_1 = arg_8_0:getConfig("limit_args2")[1]

	return arg_8_0.type == Goods.TYPE_MILITARY and var_8_0 and var_8_1[1] == "purchase"
end

function var_0_0.IsShowWhenGroupSale(arg_9_0, arg_9_1)
	if arg_9_0:IsGroupSale() then
		local var_9_0 = arg_9_0:getConfig("limit_args2")[1]
		local var_9_1 = var_9_0[2]
		local var_9_2 = var_9_0[3]

		if arg_9_1 == var_9_2 and var_9_2 == arg_9_0:getConfig("group_limit") then
			return true
		end

		arg_9_1 = arg_9_1 + 1

		return var_9_1 <= arg_9_1 and arg_9_1 <= var_9_2
	end

	return true
end

function var_0_0.GetOwnedCnt(arg_10_0)
	return arg_10_0:getDropInfo():getOwnedCount()
end

function var_0_0.GetPrice(arg_11_0)
	local var_11_0 = arg_11_0:getConfig("resource_num")
	local var_11_1 = var_11_0
	local var_11_2 = 0

	if arg_11_0:isShopDiscount() then
		var_11_2 = arg_11_0:getConfig("discount")
		var_11_0 = var_11_1 * (100 - var_11_2) / 100
	elseif arg_11_0:isDisCount() and arg_11_0:IsItemDiscountType() then
		var_11_0 = SkinCouponActivity.GetBestReadySkinCouponAct(arg_11_0.id):GetNewPrice(var_11_1)
		var_11_2 = (var_11_1 - var_11_0) * 100 / var_11_1
	end

	return var_11_0, var_11_2, var_11_1
end

function var_0_0.GetName(arg_12_0)
	return arg_12_0:getDropInfo():getName()
end

function var_0_0.GetResType(arg_13_0)
	return arg_13_0:getConfig("resource_type")
end

function var_0_0.GetResIcon(arg_14_0)
	local var_14_0 = arg_14_0:GetResType()

	if var_14_0 == 4 or var_14_0 == 14 then
		return "diamond"
	elseif var_14_0 == 1 then
		return "gold"
	end
end

function var_0_0.GetConsume(arg_15_0)
	return Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = arg_15_0:GetResType(),
		count = arg_15_0:GetPrice()
	})
end

function var_0_0.IsItemDiscountType(arg_16_0)
	return arg_16_0:getConfig("genre") == ShopArgs.SkinShop and SkinCouponActivity.StaticExistActivityAndCoupon(arg_16_0.id)
end

function var_0_0.CanUseVoucherType(arg_17_0)
	local var_17_0 = getProxy(BagProxy):GetSkinShopDiscountItemList()

	return arg_17_0:StaticCanUseVoucherType(var_17_0)
end

function var_0_0.ExistExclusiveDiscountItem(arg_18_0)
	return #getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_18_0.id) > 0
end

function var_0_0.StaticCanUseVoucherType(arg_19_0, arg_19_1)
	if #arg_19_1 <= 0 then
		return false
	end

	for iter_19_0, iter_19_1 in ipairs(arg_19_1) do
		if iter_19_1:CanUseForShop(arg_19_0.id) then
			return true
		end
	end

	return false
end

function var_0_0.GetVoucherIdList(arg_20_0)
	local var_20_0 = {}
	local var_20_1 = getProxy(BagProxy):GetSkinShopDiscountItemList()

	for iter_20_0, iter_20_1 in pairs(var_20_1) do
		if iter_20_1:CanUseForShop(arg_20_0.id) then
			table.insert(var_20_0, iter_20_1.id)
		end
	end

	return var_20_0
end

function var_0_0.getLimitCount(arg_21_0)
	local var_21_0 = arg_21_0:getConfig("limit_args") or {}

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		if iter_21_1[1] == "time" then
			return iter_21_1[2]
		end
	end

	return 0
end

function var_0_0.GetDiscountItem(arg_22_0)
	if arg_22_0:IsItemDiscountType() then
		return SkinCouponActivity.StaticGetItemConfig(arg_22_0.id)
	end

	return nil
end

function var_0_0.isLevelLimit(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0, var_23_1 = arg_23_0:getLevelLimit()

	if arg_23_2 and var_23_1 then
		return false
	end

	return var_23_0 > 0 and arg_23_1 < var_23_0
end

function var_0_0.getLevelLimit(arg_24_0)
	local var_24_0 = arg_24_0:getConfig("limit_args")

	for iter_24_0, iter_24_1 in ipairs(var_24_0) do
		if type(iter_24_1) == "table" and iter_24_1[1] == "level" then
			return iter_24_1[2], iter_24_1[3]
		end
	end

	return 0
end

function var_0_0.getSkinId(arg_25_0)
	if arg_25_0.type == Goods.TYPE_SKIN then
		return arg_25_0:getConfig("effect_args")[1]
	end

	assert(false)
end

function var_0_0.getDropInfo(arg_26_0)
	local var_26_0 = switch(arg_26_0:getConfig("effect_args"), {
		ship_bag_size = function()
			return {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = Goods.SHIP_BAG_SIZE_ITEM
			}
		end,
		equip_bag_size = function()
			return {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = Goods.EQUIP_BAG_SIZE_ITEM
			}
		end,
		commander_bag_size = function()
			return {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = Goods.COMMANDER_BAG_SIZE_ITEM
			}
		end,
		spweapon_bag_size = function()
			return {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = Goods.SPWEAPON_BAG_SIZE_ITEM
			}
		end,
		ship_bag_size = function()
			return {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = Goods.SHIP_BAG_SIZE_ITEM
			}
		end,
		ship_bag_size = function()
			return {
				count = 1,
				type = DROP_TYPE_ITEM,
				id = Goods.SHIP_BAG_SIZE_ITEM
			}
		end
	}, function()
		if arg_26_0:getConfig("genre") == ShopArgs.WorldCollection then
			return {
				type = DROP_TYPE_WORLD_ITEM,
				id = arg_26_0:getConfig("effect_args")[1],
				count = arg_26_0:getConfig("num")
			}
		elseif arg_26_0:getConfig("genre") == ShopArgs.CruiseSkin then
			return {
				type = DROP_TYPE_SKIN,
				id = arg_26_0:getConfig("effect_args")[1],
				count = arg_26_0:getConfig("num")
			}
		elseif arg_26_0:getConfig("genre") == ShopArgs.CruiseGearSkin then
			return {
				type = DROP_TYPE_EQUIPMENT_SKIN,
				id = arg_26_0:getConfig("effect_args")[1],
				count = arg_26_0:getConfig("num")
			}
		else
			return {
				type = arg_26_0:getConfig("type"),
				id = arg_26_0:getConfig("effect_args")[1],
				count = arg_26_0:getConfig("num")
			}
		end
	end)

	return Drop.New(var_26_0)
end

function var_0_0.GetDropList(arg_34_0)
	local var_34_0 = {}
	local var_34_1 = Item.getConfigData(arg_34_0:getConfig("effect_args")[1]).display_icon

	if type(var_34_1) == "table" then
		for iter_34_0, iter_34_1 in ipairs(var_34_1) do
			table.insert(var_34_0, {
				type = iter_34_1[1],
				id = iter_34_1[2],
				count = iter_34_1[3]
			})
		end
	end

	return var_34_0
end

function var_0_0.IsGroupLimit(arg_35_0)
	if arg_35_0:getConfig("group") <= 0 then
		return false
	end

	local var_35_0 = arg_35_0:getConfig("group_limit")

	return var_35_0 > 0 and var_35_0 <= (arg_35_0.groupCount or 0)
end

function var_0_0.GetLimitDesc(arg_36_0)
	local var_36_0 = arg_36_0:getLimitCount()
	local var_36_1 = arg_36_0:getBuyCount()

	if var_36_0 > 0 then
		return i18n("charge_limit_all", var_36_0 - var_36_1, var_36_0)
	end

	local var_36_2 = arg_36_0:getConfig("group_limit")

	if var_36_2 > 0 then
		local var_36_3 = arg_36_0:getConfig("group_type") or 0

		if var_36_3 == 1 then
			return i18n("charge_limit_daily", var_36_2 - arg_36_0.groupCount, var_36_2)
		elseif var_36_3 == 2 then
			return i18n("charge_limit_weekly", var_36_2 - arg_36_0.groupCount, var_36_2)
		elseif var_36_3 == 3 then
			return i18n("charge_limit_monthly", var_36_2 - arg_36_0.groupCount, var_36_2)
		end
	end

	return ""
end

function var_0_0.GetGiftList(arg_37_0)
	if arg_37_0:getConfig("genre") == ShopArgs.SkinShop then
		local var_37_0 = arg_37_0:getSkinId()

		return ShipSkin.New({
			id = var_37_0
		}):GetRewardList()
	else
		return var_0_0.super.GetGiftList(arg_37_0)
	end
end

function var_0_0.GetPackageTag(arg_38_0)
	if arg_38_0:getConfig("genre") ~= ShopArgs.GiftPackage or arg_38_0:getConfig("package_tag_open") == 0 then
		return ""
	else
		return arg_38_0:getConfig("package_tag")
	end
end

function var_0_0.isTip(arg_39_0)
	if arg_39_0:isGiftPackage() or arg_39_0:isActGiftPackage() then
		local var_39_0 = arg_39_0:getConfig("akashi_pick") > 0 and "payshop_pack_red_dot" or "gemshop_pack_red_dot"
		local var_39_1, var_39_2 = unpack(getGameset(var_39_0))

		if PlayerPrefs.GetInt(var_39_0, 0) ~= var_39_1 and table.contains(var_39_2[1], arg_39_0.id) then
			return true
		end

		return arg_39_0:isFree()
	end
end

return var_0_0

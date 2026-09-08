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

function var_0_0.GetDiscountEndTime(arg_6_0)
	local var_6_0 = arg_6_0:getConfig("discount_time")
	local var_6_1, var_6_2 = unpack(var_6_0)
	local var_6_3 = var_6_2[1]
	local var_6_4, var_6_5, var_6_6 = unpack(var_6_3)

	return (pg.TimeMgr.GetInstance():Table2ServerTime({
		year = var_6_4,
		month = var_6_5,
		day = var_6_6,
		hour = var_6_2[2][1],
		min = var_6_2[2][2],
		sec = var_6_2[2][3]
	}))
end

function var_0_0.IsGroupSale(arg_7_0)
	local var_7_0 = arg_7_0:getConfig("group") > 0
	local var_7_1 = arg_7_0:getConfig("limit_args2")[1]

	return arg_7_0.type == Goods.TYPE_MILITARY and var_7_0 and var_7_1[1] == "purchase"
end

function var_0_0.IsShowWhenGroupSale(arg_8_0, arg_8_1)
	if arg_8_0:IsGroupSale() then
		local var_8_0 = arg_8_0:getConfig("limit_args2")[1]
		local var_8_1 = var_8_0[2]
		local var_8_2 = var_8_0[3]

		if arg_8_1 == var_8_2 and var_8_2 == arg_8_0:getConfig("group_limit") then
			return true
		end

		arg_8_1 = arg_8_1 + 1

		return var_8_1 <= arg_8_1 and arg_8_1 <= var_8_2
	end

	return true
end

function var_0_0.GetOwnedCnt(arg_9_0)
	return arg_9_0:getDropInfo():getOwnedCount()
end

function var_0_0.GetPrice(arg_10_0)
	local var_10_0 = arg_10_0:getConfig("resource_num")
	local var_10_1 = var_10_0
	local var_10_2 = 0

	if arg_10_0:isDisCount() then
		if arg_10_0:IsItemDiscountType() then
			var_10_0 = SkinCouponActivity.GetBestReadySkinCouponAct(arg_10_0.id):GetNewPrice(var_10_1)
			var_10_2 = (var_10_1 - var_10_0) * 100 / var_10_1
		else
			var_10_2 = arg_10_0:getConfig("discount")
			var_10_0 = var_10_1 * (100 - var_10_2) / 100
		end
	end

	return var_10_0, var_10_2, var_10_1
end

function var_0_0.GetName(arg_11_0)
	return arg_11_0:getDropInfo():getName()
end

function var_0_0.GetResType(arg_12_0)
	return arg_12_0:getConfig("resource_type")
end

function var_0_0.GetResIcon(arg_13_0)
	local var_13_0 = arg_13_0:GetResType()

	if var_13_0 == 4 or var_13_0 == 14 then
		return "diamond"
	elseif var_13_0 == 1 then
		return "gold"
	end
end

function var_0_0.GetConsume(arg_14_0)
	return Drop.New({
		type = DROP_TYPE_RESOURCE,
		id = arg_14_0:GetResType(),
		count = arg_14_0:GetPrice()
	})
end

function var_0_0.IsItemDiscountType(arg_15_0)
	return arg_15_0:getConfig("genre") == ShopArgs.SkinShop and SkinCouponActivity.StaticExistActivityAndCoupon(arg_15_0.id)
end

function var_0_0.CanUseVoucherType(arg_16_0)
	local var_16_0 = getProxy(BagProxy):GetSkinShopDiscountItemList()

	return arg_16_0:StaticCanUseVoucherType(var_16_0)
end

function var_0_0.ExistExclusiveDiscountItem(arg_17_0)
	return #getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_17_0.id) > 0
end

function var_0_0.StaticCanUseVoucherType(arg_18_0, arg_18_1)
	if #arg_18_1 <= 0 then
		return false
	end

	for iter_18_0, iter_18_1 in ipairs(arg_18_1) do
		if iter_18_1:CanUseForShop(arg_18_0.id) then
			return true
		end
	end

	return false
end

function var_0_0.GetVoucherIdList(arg_19_0)
	local var_19_0 = {}
	local var_19_1 = getProxy(BagProxy):GetSkinShopDiscountItemList()

	for iter_19_0, iter_19_1 in pairs(var_19_1) do
		if iter_19_1:CanUseForShop(arg_19_0.id) then
			table.insert(var_19_0, iter_19_1.id)
		end
	end

	return var_19_0
end

function var_0_0.getLimitCount(arg_20_0)
	local var_20_0 = arg_20_0:getConfig("limit_args") or {}

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if iter_20_1[1] == "time" then
			return iter_20_1[2]
		end
	end

	return 0
end

function var_0_0.GetDiscountItem(arg_21_0)
	if arg_21_0:IsItemDiscountType() then
		return SkinCouponActivity.StaticGetItemConfig(arg_21_0.id)
	end

	return nil
end

function var_0_0.isLevelLimit(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0, var_22_1 = arg_22_0:getLevelLimit()

	if arg_22_2 and var_22_1 then
		return false
	end

	return var_22_0 > 0 and arg_22_1 < var_22_0
end

function var_0_0.getLevelLimit(arg_23_0)
	local var_23_0 = arg_23_0:getConfig("limit_args")

	for iter_23_0, iter_23_1 in ipairs(var_23_0) do
		if type(iter_23_1) == "table" and iter_23_1[1] == "level" then
			return iter_23_1[2], iter_23_1[3]
		end
	end

	return 0
end

function var_0_0.getSkinId(arg_24_0)
	if arg_24_0.type == Goods.TYPE_SKIN then
		return arg_24_0:getConfig("effect_args")[1]
	end

	assert(false)
end

function var_0_0.getDropInfo(arg_25_0)
	local var_25_0 = switch(arg_25_0:getConfig("effect_args"), {
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
		if arg_25_0:getConfig("genre") == ShopArgs.WorldCollection then
			return {
				type = DROP_TYPE_WORLD_ITEM,
				id = arg_25_0:getConfig("effect_args")[1],
				count = arg_25_0:getConfig("num")
			}
		elseif arg_25_0:getConfig("genre") == ShopArgs.CruiseSkin then
			return {
				type = DROP_TYPE_SKIN,
				id = arg_25_0:getConfig("effect_args")[1],
				count = arg_25_0:getConfig("num")
			}
		elseif arg_25_0:getConfig("genre") == ShopArgs.CruiseGearSkin then
			return {
				type = DROP_TYPE_EQUIPMENT_SKIN,
				id = arg_25_0:getConfig("effect_args")[1],
				count = arg_25_0:getConfig("num")
			}
		else
			return {
				type = arg_25_0:getConfig("type"),
				id = arg_25_0:getConfig("effect_args")[1],
				count = arg_25_0:getConfig("num")
			}
		end
	end)

	return Drop.New(var_25_0)
end

function var_0_0.GetDropList(arg_33_0)
	local var_33_0 = {}
	local var_33_1 = Item.getConfigData(arg_33_0:getConfig("effect_args")[1]).display_icon

	if type(var_33_1) == "table" then
		for iter_33_0, iter_33_1 in ipairs(var_33_1) do
			table.insert(var_33_0, {
				type = iter_33_1[1],
				id = iter_33_1[2],
				count = iter_33_1[3]
			})
		end
	end

	return var_33_0
end

function var_0_0.IsGroupLimit(arg_34_0)
	if arg_34_0:getConfig("group") <= 0 then
		return false
	end

	local var_34_0 = arg_34_0:getConfig("group_limit")

	return var_34_0 > 0 and var_34_0 <= (arg_34_0.groupCount or 0)
end

function var_0_0.GetLimitDesc(arg_35_0)
	local var_35_0 = arg_35_0:getLimitCount()
	local var_35_1 = arg_35_0:getBuyCount()

	if var_35_0 > 0 then
		return i18n("charge_limit_all", var_35_0 - var_35_1, var_35_0)
	end

	local var_35_2 = arg_35_0:getConfig("group_limit")

	if var_35_2 > 0 then
		local var_35_3 = arg_35_0:getConfig("group_type") or 0

		if var_35_3 == 1 then
			return i18n("charge_limit_daily", var_35_2 - arg_35_0.groupCount, var_35_2)
		elseif var_35_3 == 2 then
			return i18n("charge_limit_weekly", var_35_2 - arg_35_0.groupCount, var_35_2)
		elseif var_35_3 == 3 then
			return i18n("charge_limit_monthly", var_35_2 - arg_35_0.groupCount, var_35_2)
		end
	end

	return ""
end

function var_0_0.GetGiftList(arg_36_0)
	if arg_36_0:getConfig("genre") == ShopArgs.SkinShop then
		local var_36_0 = arg_36_0:getSkinId()

		return ShipSkin.New({
			id = var_36_0
		}):GetRewardList()
	else
		return var_0_0.super.GetGiftList(arg_36_0)
	end
end

function var_0_0.GetPackageTag(arg_37_0)
	if arg_37_0:getConfig("genre") ~= ShopArgs.GiftPackage or arg_37_0:getConfig("package_tag_open") == 0 then
		return ""
	else
		return arg_37_0:getConfig("package_tag")
	end
end

function var_0_0.isTip(arg_38_0)
	if arg_38_0:isGiftPackage() or arg_38_0:isActGiftPackage() then
		local var_38_0 = arg_38_0:getConfig("akashi_pick") > 0 and "payshop_pack_red_dot" or "gemshop_pack_red_dot"
		local var_38_1, var_38_2 = unpack(getGameset(var_38_0))

		if PlayerPrefs.GetInt(var_38_0, 0) ~= var_38_1 and table.contains(var_38_2[1], arg_38_0.id) then
			return true
		end

		return arg_38_0:isFree()
	end
end

return var_0_0

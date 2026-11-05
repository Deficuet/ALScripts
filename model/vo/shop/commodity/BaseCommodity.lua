local var_0_0 = class("BaseCommodity", import("...BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.id = arg_1_1.goods_id or arg_1_1.shop_id or arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.discount = arg_1_1.discount or 100
	arg_1_0.buyCount = arg_1_1.buy_count or arg_1_1.count or arg_1_1.pay_count or 0

	assert(arg_1_2, "type should exist")

	arg_1_0.type = arg_1_2
	arg_1_0.groupCount = arg_1_1.groupCount or 0
end

function var_0_0.bindConfigTable(arg_2_0)
	assert(false, "overwrite!!!")
end

function var_0_0.GetPrice(arg_3_0)
	assert(false, "overwrite!!!")
end

function var_0_0.GetPurchasableCnt(arg_4_0)
	assert(false, "overwrite!!!")
end

function var_0_0.GetName(arg_5_0)
	assert(false, "overwrite!!!")
end

function var_0_0.GetDropList(arg_6_0)
	assert(false, "overwrite!!!")
end

function var_0_0.GetResType(arg_7_0)
	assert(false, "overwrite!!!")
end

function var_0_0.reduceBuyCount(arg_8_0)
	arg_8_0.buyCount = arg_8_0.buyCount - 1
end

function var_0_0.increaseBuyCount(arg_9_0)
	if not arg_9_0.buyCount then
		arg_9_0.buyCount = 0
	end

	arg_9_0.buyCount = arg_9_0.buyCount + 1
end

function var_0_0.addBuyCount(arg_10_0, arg_10_1)
	arg_10_0.buyCount = arg_10_0.buyCount + arg_10_1
end

function var_0_0.canPurchase(arg_11_0)
	return arg_11_0.buyCount > 0
end

function var_0_0.hasDiscount(arg_12_0)
	return arg_12_0.discount < 100
end

function var_0_0.isFree(arg_13_0)
	return arg_13_0:getConfig("discount") == 100
end

function var_0_0.isTip(arg_14_0)
	return false
end

function var_0_0.isDisCount(arg_15_0)
	return false
end

function var_0_0.isShopDiscount(arg_16_0)
	return false
end

function var_0_0.isChargeType(arg_17_0)
	return false
end

function var_0_0.isGiftPackage(arg_18_0)
	return arg_18_0.type == Goods.TYPE_GIFT_PACKAGE
end

function var_0_0.isActGiftPackage(arg_19_0)
	return arg_19_0.type == Goods.TYPE_GIFT_PACKAGE_ACT
end

function var_0_0.isSham(arg_20_0)
	return arg_20_0.type == Goods.TYPE_SHAM_BATTLE
end

function var_0_0.IsActivityExtra(arg_21_0)
	return arg_21_0.type == Goods.TYPE_ACTIVITY_EXTRA
end

function var_0_0.getKey(arg_22_0)
	return arg_22_0.id .. "_" .. arg_22_0.type
end

function var_0_0.getBuyCount(arg_23_0)
	return arg_23_0.buyCount or 0
end

function var_0_0.updateBuyCount(arg_24_0, arg_24_1)
	arg_24_0.buyCount = arg_24_1
end

function var_0_0.updateGroupCount(arg_25_0, arg_25_1)
	arg_25_0.groupCount = arg_25_1
end

function var_0_0.firstPayDouble(arg_26_0)
	return false
end

function var_0_0.inTime(arg_27_0)
	if arg_27_0.type == Goods.TYPE_NEW_SERVER then
		local var_27_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_NEWSERVER_GIFT)

		if var_27_0 and not var_27_0:isEnd() then
			return true, var_27_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime()
		else
			return false
		end
	end

	local var_27_1 = arg_27_0:getConfig("time")

	if not var_27_1 then
		return true
	end

	if type(var_27_1) == "string" then
		return var_27_1 == "always"
	else
		local var_27_2, var_27_3 = arg_27_0:getTimeStamp()

		if var_27_2 and var_27_3 then
			local var_27_4 = pg.TimeMgr.GetInstance():GetServerTime()

			return var_27_2 <= var_27_4 and var_27_4 <= var_27_3, var_27_3 - var_27_4
		else
			return true
		end
	end
end

function var_0_0.getTimeStamp(arg_28_0)
	local var_28_0 = arg_28_0:getConfig("time")

	if var_28_0 and type(var_28_0) == "table" then
		local var_28_1
		local var_28_2

		if #var_28_0 > 0 then
			local var_28_3 = var_28_0[1][1][1] .. "-" .. var_28_0[1][1][2] .. "-" .. var_28_0[1][1][3] .. " " .. var_28_0[1][2][1] .. ":" .. var_28_0[1][2][2] .. ":" .. var_28_0[1][2][3]

			var_28_1 = pg.TimeMgr.GetInstance():ParseTimeEx(var_28_3, nil, true)
		end

		if #var_28_0 > 1 then
			local var_28_4 = var_28_0[2][1][1] .. "-" .. var_28_0[2][1][2] .. "-" .. var_28_0[2][1][3] .. " " .. var_28_0[2][2][1] .. ":" .. var_28_0[2][2][2] .. ":" .. var_28_0[2][2][3]

			var_28_2 = pg.TimeMgr.GetInstance():ParseTimeEx(var_28_4, nil, true)
		end

		if var_28_1 and var_28_2 then
			return var_28_1, var_28_2
		end
	end
end

function var_0_0.calDayLeft(arg_29_0)
	local var_29_0, var_29_1 = arg_29_0:inTime()

	if var_29_0 and var_29_1 and var_29_1 > 0 then
		local var_29_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_29_1)

		return var_29_0, var_29_2 + 1
	end
end

function var_0_0.GetGiftList(arg_30_0)
	return {}
end

function var_0_0.GetName(arg_31_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.IsGroupLimit(arg_32_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.CanUseVoucherType(arg_33_0)
	return false
end

function var_0_0.ExistExclusiveDiscountItem(arg_34_0)
	return false
end

function var_0_0.StaticCanUseVoucherType(arg_35_0, arg_35_1)
	return false
end

return var_0_0

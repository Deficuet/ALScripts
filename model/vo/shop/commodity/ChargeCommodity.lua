local var_0_0 = class("ChargeCommodity", import(".BaseCommodity"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.pay_data_display
end

function var_0_0.isChargeType(arg_2_0)
	return true
end

function var_0_0.canPurchase(arg_3_0)
	local var_3_0 = arg_3_0:getLimitCount()

	return var_3_0 <= 0 or var_3_0 > arg_3_0.buyCount
end

function var_0_0.firstPayDouble(arg_4_0)
	return arg_4_0:getConfig("first_pay_double") ~= 0
end

function var_0_0.hasExtraGem(arg_5_0)
	return arg_5_0:getConfig("extra_gem") ~= 0
end

function var_0_0.GetGemCnt(arg_6_0)
	return arg_6_0:getConfig("gem") + arg_6_0:getConfig("extra_gem")
end

function var_0_0.isGem(arg_7_0)
	return arg_7_0:getConfig("extra_service") == Goods.GEM
end

function var_0_0.isGiftBox(arg_8_0)
	return arg_8_0:getConfig("extra_service") == Goods.GIFT_BOX
end

function var_0_0.isMonthCard(arg_9_0)
	return arg_9_0:getConfig("extra_service") == Goods.MONTH_CARD
end

function var_0_0.isItemBox(arg_10_0)
	return arg_10_0:getConfig("extra_service") == Goods.ITEM_BOX
end

function var_0_0.isPassItem(arg_11_0)
	return arg_11_0:getConfig("extra_service") == Goods.PASS_ITEM
end

function var_0_0.getLimitCount(arg_12_0)
	return arg_12_0:getConfig("limit_arg")
end

function var_0_0.GetName(arg_13_0)
	return arg_13_0:getConfig("name")
end

function var_0_0.GetDropList(arg_14_0)
	local var_14_0 = arg_14_0:getConfig("display")

	if #var_14_0 == 0 then
		var_14_0 = arg_14_0:getConfig("extra_service_item")
	end

	local var_14_1 = {}

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		table.insert(var_14_1, Drop.Create(iter_14_1))
	end

	return var_14_1
end

function var_0_0.GetExtraServiceItem(arg_15_0)
	local var_15_0

	if arg_15_0:isPassItem() then
		local var_15_1 = arg_15_0:getConfig("sub_display")[1]
		local var_15_2 = pg.battlepass_event_pt[var_15_1].award_pay

		var_15_0 = PlayerConst.MergePassItemDrop(underscore.map(var_15_2, function(arg_16_0)
			return Drop.Create(pg.battlepass_event_award[arg_16_0].drop_client)
		end))
	else
		var_15_0 = underscore.map(arg_15_0:getConfig("extra_service_item"), function(arg_17_0)
			return Drop.Create(arg_17_0)
		end)
	end

	local var_15_3 = arg_15_0:GetGemCnt()

	if not arg_15_0:isMonthCard() and var_15_3 > 0 then
		table.insert(var_15_0, Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = PlayerConst.ResDiamond,
			count = var_15_3
		}))
	end

	return var_15_0
end

function var_0_0.GetBonusItem(arg_18_0)
	if arg_18_0:isMonthCard() then
		return Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = PlayerConst.ResDiamond,
			count = arg_18_0:GetGemCnt()
		})
	end

	return nil
end

function var_0_0.GetChargeTip(arg_19_0)
	local var_19_0
	local var_19_1

	if arg_19_0:isPassItem() then
		var_19_0 = i18n("battlepass_pay_tip")
	elseif arg_19_0:isMonthCard() then
		var_19_0 = i18n("charge_title_getitem_month")
		var_19_1 = i18n("charge_title_getitem_soon")
	else
		var_19_0 = i18n("charge_title_getitem")
	end

	return var_19_0, var_19_1
end

function var_0_0.GetExtraDrop(arg_20_0)
	local var_20_0

	if arg_20_0:isPassItem() then
		local var_20_1, var_20_2 = unpack(arg_20_0:getConfig("sub_display"))
		local var_20_3 = pg.battlepass_event_pt[var_20_1].pt

		var_20_0 = Drop.New({
			type = DROP_TYPE_VITEM,
			id = pg.battlepass_event_pt[var_20_1].pt,
			count = var_20_2
		})
	end

	return var_20_0
end

function var_0_0.getConfig(arg_21_0, arg_21_1)
	if arg_21_1 == "money" and PLATFORM_CODE == PLATFORM_CHT then
		local var_21_0 = pg.SdkMgr.GetInstance():GetProduct(arg_21_0:getConfig("id_str"))

		if var_21_0 then
			return var_21_0.price
		else
			return arg_21_0:RawGetConfig(arg_21_1)
		end
	elseif arg_21_1 == "money" and PLATFORM_CODE == PLATFORM_US then
		local var_21_1 = arg_21_0:RawGetConfig(arg_21_1)

		return math.floor(var_21_1 / 100) .. "." .. var_21_1 - math.floor(var_21_1 / 100) * 100
	else
		return arg_21_0:RawGetConfig(arg_21_1)
	end
end

function var_0_0.RawGetConfig(arg_22_0, arg_22_1)
	return var_0_0.super.getConfig(arg_22_0, arg_22_1)
end

function var_0_0.IsLocalPrice(arg_23_0)
	return arg_23_0:getConfig("money") ~= arg_23_0:RawGetConfig("money")
end

function var_0_0.isLevelLimit(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0, var_24_1 = arg_24_0:getLevelLimit()

	if arg_24_2 and var_24_1 then
		return false
	end

	return var_24_0 > 0 and arg_24_1 < var_24_0
end

function var_0_0.getLevelLimit(arg_25_0)
	local var_25_0 = arg_25_0:getConfig("limit_args")

	for iter_25_0, iter_25_1 in ipairs(var_25_0) do
		if type(iter_25_1) == "table" and iter_25_1[1] == "level" then
			return iter_25_1[2], iter_25_1[3]
		end
	end

	return 0
end

function var_0_0.getSameLimitGroupTecGoods(arg_26_0)
	local var_26_0 = {}
	local var_26_1 = arg_26_0:getConfig("limit_group")
	local var_26_2 = arg_26_0:bindConfigTable()

	for iter_26_0, iter_26_1 in ipairs(var_26_2.all) do
		if var_26_2[iter_26_1].limit_group == var_26_1 then
			local var_26_3 = Goods.Create({
				shop_id = iter_26_1
			}, Goods.TYPE_CHARGE)

			table.insert(var_26_0, var_26_3)
		end
	end

	return var_26_0
end

function var_0_0.getShowType(arg_27_0)
	local var_27_0 = arg_27_0:getConfig("show_group")

	if var_27_0 == "" then
		-- block empty
	end

	return var_27_0
end

function var_0_0.CanViewSkinProbability(arg_28_0)
	local var_28_0 = arg_28_0:getConfig("skin_inquire_relation")

	if not var_28_0 or var_28_0 <= 0 then
		return false
	end

	if pg.gameset.package_view_display.key_value == 0 then
		return false
	end

	return true
end

function var_0_0.GetSkinProbability(arg_29_0)
	local var_29_0 = {}

	if arg_29_0:CanViewSkinProbability() then
		local var_29_1 = arg_29_0:getConfig("skin_inquire_relation")

		var_29_0 = Item.getConfigData(var_29_1).combination_display
	end

	return var_29_0
end

function var_0_0.GetSkinProbabilityItem(arg_30_0)
	if not arg_30_0:CanViewSkinProbability() then
		return nil
	end

	local var_30_0 = arg_30_0:getConfig("skin_inquire_relation")

	return {
		count = 1,
		type = DROP_TYPE_ITEM,
		id = var_30_0
	}
end

function var_0_0.GetDropItem(arg_31_0)
	local var_31_0 = arg_31_0:getConfig("drop_item")

	if #var_31_0 > 0 then
		return var_31_0
	else
		assert(false, "should exist drop item")
	end
end

function var_0_0.GetLimitDesc(arg_32_0)
	local var_32_0 = arg_32_0:getLimitCount()
	local var_32_1 = arg_32_0.buyCount or 0

	if var_32_0 > 0 then
		return i18n("charge_limit_all", var_32_0 - var_32_1, var_32_0)
	end

	local var_32_2 = arg_32_0:getConfig("group_limit")

	if var_32_2 > 0 then
		local var_32_3 = arg_32_0:getConfig("group_type") or 0

		if var_32_3 == 1 then
			return i18n("charge_limit_daily", var_32_2 - arg_32_0.groupCount, var_32_2)
		elseif var_32_3 == 2 then
			return i18n("charge_limit_weekly", var_32_2 - arg_32_0.groupCount, var_32_2)
		elseif var_32_3 == 3 then
			return i18n("charge_limit_monthly", var_32_2 - arg_32_0.groupCount, var_32_2)
		end
	end

	return ""
end

function var_0_0.GetInfoTip(arg_33_0)
	if not arg_33_0:isItemBox() or arg_33_0:getConfig("tip_open") == 0 then
		return ""
	else
		return arg_33_0:getConfig("tip")
	end
end

function var_0_0.GetPackageTag(arg_34_0)
	if not arg_34_0:isItemBox() or arg_34_0:getConfig("package_tag_open") == 0 then
		return ""
	else
		return arg_34_0:getConfig("package_tag")
	end
end

return var_0_0

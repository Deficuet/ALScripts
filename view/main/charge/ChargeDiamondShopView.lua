local var_0_0 = class("ChargeDiamondShopView", import("...base.BaseSubView"))

var_0_0.MonthCardID = 1

function var_0_0.getUIName(arg_1_0)
	return "ChargeDiamondShopUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:Show()
end

function var_0_0.OnDestroy(arg_3_0)
	return
end

function var_0_0.initData(arg_4_0)
	arg_4_0.isNeedHideMonthCard = (PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US) and pg.SdkMgr.GetInstance():CheckAudit()
	arg_4_0.diamondGoodsVOList = {}
	arg_4_0.diamondGoodsVOListForShow = {}
	arg_4_0.player = getProxy(PlayerProxy):getData()

	arg_4_0:updateData()
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.itemTpl = arg_5_0._tf:Find("ItemTpl")

	local var_5_0 = arg_5_0._tf:Find("content")

	arg_5_0.monthCardTF = var_5_0:Find("ItemMonth")
	arg_5_0.itemContainerTF = var_5_0:Find("ItemList")
	arg_5_0.uiItemList = arg_5_0:initUIItemList()

	arg_5_0:updateView()
end

function var_0_0.initUIItemList(arg_6_0)
	local var_6_0 = UIItemList.New(arg_6_0.itemContainerTF, arg_6_0.itemTpl)

	var_6_0:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_7_1 = arg_7_1 + 1

			local var_7_0 = ChargeDiamondCard.New(go(arg_7_2), arg_6_0.monthCardTF, arg_6_0)
			local var_7_1 = arg_6_0.diamondGoodsVOListForShow[arg_7_1]

			var_7_0:update(var_7_1, arg_6_0.player, arg_6_0.firstChargeIds)
			onButton(arg_6_0, var_7_0.tr, function()
				arg_6_0:confirm(var_7_0.goods)
			end, SFX_PANEL)
		end
	end)

	arg_6_0.uiItemList = var_6_0

	return var_6_0
end

function var_0_0.updateUIItemList(arg_9_0)
	arg_9_0.uiItemList:align(#arg_9_0.diamondGoodsVOListForShow)
end

function var_0_0.updateView(arg_10_0)
	setActive(arg_10_0.monthCardTF, not arg_10_0.isNeedHideMonthCard)
	arg_10_0:updateUIItemList()
end

function var_0_0.confirm(arg_11_0, arg_11_1)
	if not arg_11_1 then
		return
	end

	arg_11_1 = Clone(arg_11_1)

	if arg_11_1:isChargeType() then
		local var_11_0 = not table.contains(arg_11_0.firstChargeIds, arg_11_1.id) and arg_11_1:firstPayDouble()
		local var_11_1 = var_11_0 and 4 or arg_11_1:getConfig("tag")

		if arg_11_1:isMonthCard() or arg_11_1:isGiftBox() or arg_11_1:isItemBox() or arg_11_1:isPassItem() then
			local var_11_2 = arg_11_1:GetExtraServiceItem()
			local var_11_3 = arg_11_1:GetExtraDrop()
			local var_11_4 = arg_11_1:GetBonusItem()
			local var_11_5
			local var_11_6

			if arg_11_1:isPassItem() then
				var_11_5 = i18n("battlepass_pay_tip")
			elseif arg_11_1:isMonthCard() then
				var_11_5 = i18n("charge_title_getitem_month")
				var_11_6 = i18n("charge_title_getitem_soon")
			else
				var_11_5 = i18n("charge_title_getitem")
			end

			local var_11_7 = {
				isChargeType = true,
				commodity = arg_11_1,
				infoTip = arg_11_1:GetInfoTip(),
				icon = "chargeicon/" .. arg_11_1:getConfig("picture"),
				name = arg_11_1:getConfig("name_display"),
				tipExtra = var_11_5,
				extraItems = var_11_2,
				price = arg_11_1:getConfig("money"),
				isLocalPrice = arg_11_1:IsLocalPrice(),
				tagType = var_11_1,
				isMonthCard = arg_11_1:isMonthCard(),
				tipBonus = var_11_6,
				bonusItem = var_11_4,
				extraDrop = var_11_3,
				descExtra = arg_11_1:getConfig("descrip_extra"),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_11_0:emit(NewShopMainMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_11_0:emit(NewShopMainMediator.CHARGE, arg_11_1.id)
					end
				end
			}

			arg_11_0:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_PANEL, var_11_7)
		elseif arg_11_1:isGem() then
			local var_11_8 = arg_11_1:getConfig("money")
			local var_11_9 = arg_11_1:getConfig("gem")

			if var_11_0 then
				var_11_9 = var_11_9 + arg_11_1:getConfig("gem")
			else
				var_11_9 = var_11_9 + arg_11_1:getConfig("extra_gem")
			end

			local var_11_10 = {
				isChargeType = true,
				commodity = arg_11_1,
				icon = "chargeicon/" .. arg_11_1:getConfig("picture"),
				name = arg_11_1:getConfig("name_display"),
				price = arg_11_1:getConfig("money"),
				isLocalPrice = arg_11_1:IsLocalPrice(),
				tagType = var_11_1,
				normalTip = i18n("charge_start_tip", var_11_8, var_11_9),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_11_0:emit(NewShopMainMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_11_0:emit(NewShopMainMediator.CHARGE, arg_11_1.id)
					end
				end
			}

			arg_11_0:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_BOX, var_11_10)
		end
	else
		local var_11_11 = {}
		local var_11_12 = arg_11_1:getConfig("effect_args")
		local var_11_13 = Item.getConfigData(var_11_12[1])
		local var_11_14 = var_11_13.display_icon

		if type(var_11_14) == "table" then
			for iter_11_0, iter_11_1 in ipairs(var_11_14) do
				table.insert(var_11_11, {
					type = iter_11_1[1],
					id = iter_11_1[2],
					count = iter_11_1[3]
				})
			end
		end

		local var_11_15 = {
			isMonthCard = false,
			isChargeType = false,
			isLocalPrice = false,
			commodity = arg_11_1,
			icon = var_11_13.icon,
			name = var_11_13.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = var_11_11,
			price = arg_11_1:getConfig("resource_num"),
			tagType = arg_11_1:getConfig("tag"),
			onYes = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", arg_11_1:getConfig("resource_num"), var_11_13.name),
					onYes = function()
						arg_11_0:emit(NewShopMainMediator.BUY_ITEM, arg_11_1.id, 1)
					end
				})
			end
		}

		arg_11_0:emit(NewShopMainMediator.OPEN_CHARGE_ITEM_PANEL, var_11_15)
	end
end

function var_0_0.updateDiamondGoodsVOList(arg_16_0)
	arg_16_0.diamondGoodsVOList = {}

	local var_16_0 = pg.pay_data_display

	for iter_16_0, iter_16_1 in pairs(var_16_0.all) do
		local var_16_1 = var_16_0[iter_16_1].extra_service

		if arg_16_0.isNeedHideMonthCard and iter_16_1 == var_0_0.MonthCardID then
			-- block empty
		elseif pg.SdkMgr.GetInstance():IgnorePlatform(var_16_0[iter_16_1].ignorePlatform) then
			-- block empty
		elseif var_16_1 == Goods.MONTH_CARD or var_16_1 == Goods.GEM or var_16_1 == Goods.GIFT_BOX then
			local var_16_2 = Goods.Create({
				shop_id = iter_16_1
			}, Goods.TYPE_CHARGE)

			table.insert(arg_16_0.diamondGoodsVOList, var_16_2)
		end
	end
end

function var_0_0.sortDiamondGoodsVOList(arg_17_0)
	arg_17_0.diamondGoodsVOListForShow = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.diamondGoodsVOList) do
		local var_17_0 = ChargeConst.getBuyCount(arg_17_0.chargedList, iter_17_1.id)

		iter_17_1:updateBuyCount(var_17_0)

		if iter_17_1:canPurchase() and iter_17_1:inTime() then
			table.insert(arg_17_0.diamondGoodsVOListForShow, iter_17_1)
		end
	end

	table.sort(arg_17_0.diamondGoodsVOListForShow, CompareFuncs({
		function(arg_18_0)
			return arg_18_0:isFree() and 0 or 1
		end,
		function(arg_19_0)
			if arg_19_0:isChargeType() and arg_19_0:isMonthCard() then
				local var_19_0 = arg_17_0.player:getCardById(VipCard.MONTH)

				if var_19_0 then
					local var_19_1 = var_19_0:getLeftDate()
					local var_19_2 = pg.TimeMgr.GetInstance():GetServerTime()

					if math.floor((var_19_1 - var_19_2) / 86400) > (arg_19_0:getConfig("limit_arg") or 0) then
						return 1
					end
				end
			end

			return 0
		end,
		function(arg_20_0)
			return not table.contains(arg_17_0.firstChargeIds, arg_20_0.id) and arg_20_0:firstPayDouble() and 0 or 1
		end,
		function(arg_21_0)
			return arg_21_0:getConfig("tag") == 2 and 0 or 1
		end,
		function(arg_22_0)
			return arg_22_0.id
		end
	}))
end

function var_0_0.updateGoodsData(arg_23_0)
	arg_23_0.firstChargeIds = arg_23_0.contextData.firstChargeIds
	arg_23_0.chargedList = arg_23_0.contextData.chargedList
	arg_23_0.normalList = arg_23_0.contextData.normalList
	arg_23_0.normalGroupList = arg_23_0.contextData.normalGroupList
end

function var_0_0.setGoodData(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	arg_24_0.firstChargeIds = arg_24_1
	arg_24_0.chargedList = arg_24_2
	arg_24_0.normalList = arg_24_3
	arg_24_0.normalGroupList = arg_24_4
end

function var_0_0.updateData(arg_25_0)
	arg_25_0.player = getProxy(PlayerProxy):getData()

	arg_25_0:updateDiamondGoodsVOList()
	arg_25_0:sortDiamondGoodsVOList()
end

function var_0_0.IsSupplyShop(arg_26_0)
	return false
end

function var_0_0.reUpdateAll(arg_27_0)
	arg_27_0:updateData()
	arg_27_0:updateView()
end

function var_0_0.ShowPanel(arg_28_0, arg_28_1)
	setActive(arg_28_0._go, arg_28_1)
end

return var_0_0

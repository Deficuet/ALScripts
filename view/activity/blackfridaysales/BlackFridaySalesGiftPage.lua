local var_0_0 = class("BlackFridaySalesGiftPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "BlackFridaySalesGiftPage"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
end

function var_0_0.initData(arg_3_0)
	arg_3_0.player = getProxy(PlayerProxy):getData()
	arg_3_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_GIFT_UP)

	arg_3_0:initGiftGoods()

	arg_3_0.openIndex = 1

	arg_3_0:updateGiftGoodsVOList()
end

function var_0_0.initUI(arg_4_0)
	arg_4_0.content = arg_4_0:findTF("scrollrect/content")
	arg_4_0.soldOutTF = arg_4_0:findTF("sold_out")

	setText(arg_4_0:findTF("Text", arg_4_0.soldOutTF), i18n("newserver_soldout"))
	setActive(arg_4_0.soldOutTF, #arg_4_0.giftGoodsVOList == 0)

	arg_4_0.pagefooters = {
		arg_4_0:findTF("pagefooter/dailyPacks"),
		arg_4_0:findTF("pagefooter/specialPacks")
	}

	setText(arg_4_0:findTF("pagefooter/dailyPacks/Text"), i18n("blackfriday_dailypack"))
	setText(arg_4_0:findTF("pagefooter/dailyPacks/mark"), i18n("blackfriday_dailypack"))
	setText(arg_4_0:findTF("pagefooter/specialPacks/Text"), i18n("blackfriday_specialpack"))
	setText(arg_4_0:findTF("pagefooter/specialPacks/mark"), i18n("blackfriday_specialpack"))

	arg_4_0.pagefooterWid = arg_4_0.pagefooters[1].rect.width
	arg_4_0.pagefooterStartPosX = arg_4_0.pagefooters[1].anchoredPosition.x
	arg_4_0.giftItemList = UIItemList.New(arg_4_0.content, arg_4_0:findTF("gift_tpl"))
	arg_4_0.chargeCardTable = {}

	arg_4_0.giftItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		arg_5_1 = arg_5_1 + 1

		if arg_5_0 == UIItemList.EventInit then
			arg_4_0:initGift(go(arg_5_2))
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_4_0:updateGift(go(arg_5_2), arg_5_1)
		end
	end)
	arg_4_0.giftItemList:align(#arg_4_0.giftGoodsVOList)
	arg_4_0:UpdatePageFooters()
end

function var_0_0.UpdatePageFooters(arg_6_0)
	arg_6_0.pagefooterTrs = {}

	for iter_6_0 = 1, 2 do
		local var_6_0 = arg_6_0.pagefooters[iter_6_0]

		arg_6_0:UpdatePageFooter(var_6_0, iter_6_0)

		arg_6_0.pagefooterTrs[iter_6_0] = var_6_0
	end

	local var_6_1 = arg_6_0.contextData.index or 1

	triggerButton(arg_6_0.pagefooterTrs[var_6_1])
end

local var_0_1 = 0

function var_0_0.UpdatePageFooter(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.pagefooterStartPosX + (var_0_1 + arg_7_0.pagefooterWid) * (arg_7_2 - 1)

	setAnchoredPosition(arg_7_1, {
		x = var_7_0
	})
	arg_7_0:OnSwitch(arg_7_1, function()
		arg_7_0:SwitchTab(arg_7_2)
	end)
end

function var_0_0.OnSwitch(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1:Find("mark")

	local function var_9_1()
		if arg_9_0.markTr then
			setActive(arg_9_0.markTr, false)
		end

		arg_9_0.markTr = var_9_0

		setActive(var_9_0, true)
	end

	onButton(arg_9_0, arg_9_1, function()
		var_9_1()
		arg_9_2()
	end, SFX_PANEL)
end

function var_0_0.SwitchTab(arg_12_0, arg_12_1)
	arg_12_0.openIndex = arg_12_1

	arg_12_0:onUpdateGift()
end

function var_0_0.initGift(arg_13_0, arg_13_1)
	local var_13_0 = BlackFridayChargeCard.New(arg_13_1)

	onButton(arg_13_0, var_13_0.tr, function()
		if var_13_0:inTime() then
			arg_13_0:confirm(var_13_0.goods)
		end
	end, SFX_PANEL)

	arg_13_0.chargeCardTable[arg_13_1] = var_13_0
end

function var_0_0.updateGift(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.chargeCardTable[arg_15_1]

	if not var_15_0 then
		arg_15_0.initGift(arg_15_1)

		var_15_0 = arg_15_0.chargeCardTable[arg_15_1]
	end

	local var_15_1 = arg_15_0.giftGoodsVOList[arg_15_2]

	if var_15_1 then
		var_15_0:update(var_15_1, arg_15_0.player, arg_15_0.firstChargeIds)
	end
end

function var_0_0.confirm(arg_16_0, arg_16_1)
	if not arg_16_1 then
		return
	end

	arg_16_1 = Clone(arg_16_1)

	if arg_16_1:isChargeType() then
		local var_16_0 = not table.contains(arg_16_0.firstChargeIds, arg_16_1.id) and arg_16_1:firstPayDouble() and 4 or arg_16_1:getConfig("tag")
		local var_16_1 = arg_16_1:GetExtraServiceItem()
		local var_16_2 = arg_16_1:GetExtraDrop()
		local var_16_3 = arg_16_1:GetBonusItem()
		local var_16_4
		local var_16_5

		if arg_16_1:isPassItem() then
			var_16_4 = i18n("battlepass_pay_tip")
		elseif arg_16_1:isMonthCard() then
			var_16_4 = i18n("charge_title_getitem_month")
			var_16_5 = i18n("charge_title_getitem_soon")
		else
			var_16_4 = i18n("charge_title_getitem")
		end

		local var_16_6 = {
			isChargeType = true,
			commodity = arg_16_1,
			infoTip = arg_16_1:GetInfoTip(),
			icon = "chargeicon/" .. arg_16_1:getConfig("picture"),
			name = arg_16_1:getConfig("name_display"),
			tipExtra = var_16_4,
			extraItems = var_16_1,
			price = arg_16_1:getConfig("money"),
			isLocalPrice = arg_16_1:IsLocalPrice(),
			tagType = var_16_0,
			isMonthCard = arg_16_1:isMonthCard(),
			tipBonus = var_16_5,
			bonusItem = var_16_3,
			extraDrop = var_16_2,
			descExtra = arg_16_1:getConfig("descrip_extra"),
			limitArgs = arg_16_1:getConfig("limit_args"),
			onYes = function()
				if ChargeConst.isNeedSetBirth() then
					arg_16_0:emit(BlackFridaySalesMediator.OPEN_CHARGE_BIRTHDAY)
				else
					arg_16_0:emit(BlackFridaySalesMediator.CHARGE, arg_16_1.id)
				end
			end
		}

		arg_16_0:emit(BlackFridaySalesMediator.GIFT_OPEN_ITEM_PANEL, var_16_6)
	else
		local var_16_7 = {}
		local var_16_8 = arg_16_1:getConfig("effect_args")
		local var_16_9 = Item.getConfigData(var_16_8[1])
		local var_16_10 = var_16_9.display_icon

		if type(var_16_10) == "table" then
			for iter_16_0, iter_16_1 in ipairs(var_16_10) do
				table.insert(var_16_7, {
					type = iter_16_1[1],
					id = iter_16_1[2],
					count = iter_16_1[3]
				})
			end
		end

		local var_16_11 = {
			isMonthCard = false,
			isChargeType = false,
			isLocalPrice = false,
			commodity = arg_16_1,
			icon = var_16_9.icon,
			name = var_16_9.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = var_16_7,
			price = arg_16_1:getConfig("resource_num"),
			tagType = arg_16_1:getConfig("tag"),
			onYes = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", arg_16_1:getConfig("resource_num"), var_16_9.name),
					onYes = function()
						arg_16_0:emit(BlackFridaySalesMediator.GIFT_BUY_ITEM, arg_16_1.id, 1)
					end
				})
			end
		}

		arg_16_0:emit(BlackFridaySalesMediator.GIFT_OPEN_ITEM_PANEL, var_16_11)
	end
end

function var_0_0.onUpdatePlayer(arg_20_0, arg_20_1)
	arg_20_0.player = arg_20_1
end

function var_0_0.onUpdateGift(arg_21_0)
	arg_21_0:updateGiftGoodsVOList()
	arg_21_0.giftItemList:align(#arg_21_0.giftGoodsVOList)
	setActive(arg_21_0.soldOutTF, #arg_21_0.giftGoodsVOList == 0)
end

function var_0_0.initGiftGoods(arg_22_0)
	arg_22_0.giftList = {
		{},
		{}
	}

	local var_22_0 = arg_22_0.activity:getConfig("config_client")
	local var_22_1 = getProxy(ShopsProxy):getChargedList() or {}

	for iter_22_0, iter_22_1 in pairs(var_22_0.gifts[1]) do
		local var_22_2 = Goods.Create({
			shop_id = iter_22_1
		}, Goods.TYPE_CHARGE)

		table.insert(arg_22_0.giftList[1], var_22_2)
	end

	for iter_22_2, iter_22_3 in pairs(var_22_0.gifts[2]) do
		local var_22_3 = Goods.Create({
			shop_id = iter_22_3
		}, Goods.TYPE_NEW_SERVER)

		table.insert(arg_22_0.giftList[1], var_22_3)
	end

	for iter_22_4, iter_22_5 in pairs(var_22_0.gifts_2) do
		local var_22_4 = Goods.Create({
			shop_id = iter_22_5
		}, Goods.TYPE_CHARGE)
		local var_22_5 = ChargeConst.getBuyCount(var_22_1, iter_22_5)

		var_22_4:updateBuyCount(var_22_5)
		table.insert(arg_22_0.giftList[2], var_22_4)
	end
end

function var_0_0.updateGiftGoodsVOList(arg_23_0, arg_23_1)
	arg_23_1 = arg_23_1 or arg_23_0.openIndex
	arg_23_0.giftGoodsVOList = Clone(arg_23_0.giftList[arg_23_1])
	arg_23_0.normalList = getProxy(ShopsProxy):GetNormalList()
	arg_23_0.chargedList = getProxy(ShopsProxy):getChargedList()

	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.giftGoodsVOList) do
		local var_23_1

		if iter_23_1:isChargeType() then
			var_23_1 = ChargeConst.getBuyCount(arg_23_0.chargedList, iter_23_1.id)
		else
			var_23_1 = ChargeConst.getBuyCount(arg_23_0.normalList, iter_23_1.id)
		end

		iter_23_1:updateBuyCount(var_23_1)

		if iter_23_1:canPurchase() then
			table.insert(var_23_0, iter_23_1)
		end
	end

	local var_23_2 = pg.TimeMgr.GetInstance()

	table.sort(var_23_0, function(arg_24_0, arg_24_1)
		local var_24_0 = var_23_2:inTime(arg_24_0:getConfig("time")) and 1 or 0
		local var_24_1 = var_23_2:inTime(arg_24_1:getConfig("time")) and 1 or 0
		local var_24_2 = arg_24_0:isChargeType() and 1 or 0
		local var_24_3 = arg_24_1:isChargeType() and 1 or 0

		if var_24_0 == var_24_1 then
			if var_24_2 == var_24_3 then
				return arg_24_0.id < arg_24_1.id
			else
				return var_24_2 < var_24_3
			end
		else
			return var_24_1 < var_24_0
		end
	end)

	arg_23_0.giftGoodsVOList = var_23_0
end

function var_0_0.isTip(arg_25_0)
	local var_25_0 = false
	local var_25_1 = pg.TimeMgr.GetInstance()

	local function var_25_2(arg_26_0)
		local var_26_0 = false
		local var_26_1 = Clone(arg_25_0.giftList[arg_26_0])

		for iter_26_0, iter_26_1 in ipairs(var_26_1) do
			if iter_26_1:isChargeType() then
				count = ChargeConst.getBuyCount(arg_25_0.chargedList, iter_26_1.id)
			else
				count = ChargeConst.getBuyCount(arg_25_0.normalList, iter_26_1.id)
			end

			iter_26_1:updateBuyCount(count)

			if iter_26_1:canPurchase() and not iter_26_1:isChargeType() and var_25_1:inTime(iter_26_1:getConfig("time")) then
				var_26_0 = true
			end
		end

		return var_26_0
	end

	return var_25_2(1) or var_25_2(2)
end

function var_0_0.OnDestroy(arg_27_0)
	return
end

return var_0_0

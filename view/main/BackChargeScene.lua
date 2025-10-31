local var_0_0 = class("ChargeScene", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "BackChargeUI"
end

function var_0_0.init(arg_2_0)
	return
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0.diamondPanel = findTF(arg_3_0._tf, "frame/viewContainer/diamondPanel")
	arg_3_0.blurPanel = arg_3_0._tf:Find("blur_panel")
	arg_3_0.detail = arg_3_0.blurPanel:Find("detail")
	arg_3_0.damondItems = {}

	setText(findTF(arg_3_0._tf, "frame/viewContainer/leftPanel/desc"), i18n("Supplement_pay2"))
	setText(findTF(arg_3_0._tf, "tip"), i18n("Supplement_pay5"))
	arg_3_0:initDamonds()
	arg_3_0:refundUpdate()
end

function var_0_0.refundUpdate(arg_4_0)
	arg_4_0:updateDamondsData()
	arg_4_0:sortDamondItems()

	if #arg_4_0.tempDamondVOs <= 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			hideClose = true,
			content = i18n("Supplement_pay3"),
			onYes = function()
				Application.Quit()
			end
		})
	end
end

function var_0_0.setPlayer(arg_6_0, arg_6_1)
	arg_6_0.player = arg_6_1
end

function var_0_0.setChargedList(arg_7_0, arg_7_1)
	arg_7_0.chargedList = arg_7_1
end

function var_0_0.initDamonds(arg_8_0)
	arg_8_0.diamondUIItemList = arg_8_0:initDiamondList(arg_8_0.diamondPanel)
end

function var_0_0.confirm(arg_9_0, arg_9_1)
	if not arg_9_1 then
		return
	end

	arg_9_0:emit(BackChargeMediator.CHARGE, arg_9_1.id)
end

function var_0_0.initDiamondList(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:Find("content")
	local var_10_1 = arg_10_1:Find("ItemTpl")

	local function var_10_2(arg_11_0)
		local var_11_0 = BackChargeDiamondCard.New(arg_11_0, arg_10_0)

		onButton(arg_10_0, var_11_0.tr, function()
			arg_10_0:confirm(var_11_0.goods)
		end, SFX_PANEL)

		arg_10_0.damondItems[arg_11_0] = var_11_0
	end

	local function var_10_3(arg_13_0, arg_13_1)
		local var_13_0 = arg_10_0.damondItems[arg_13_1]

		if not var_13_0 then
			var_10_2(arg_13_1)

			var_13_0 = arg_10_0.damondItems[arg_13_1]
		end

		local var_13_1 = arg_10_0.tempDamondVOs[arg_13_0 + 1]

		if var_13_1 then
			var_13_0:update(var_13_1, arg_10_0.player, arg_10_0.firstChargeIds)
		end
	end

	local var_10_4 = UIItemList.New(var_10_0, var_10_1)

	var_10_4:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			var_10_2(go(arg_14_2))
		elseif arg_14_0 == UIItemList.EventUpdate then
			var_10_3(arg_14_1, go(arg_14_2))
		end
	end)

	return var_10_4
end

function var_0_0.updateDamondsData(arg_15_0)
	local var_15_0 = pg.pay_data_display

	arg_15_0.damondItemVOs = {}

	local var_15_1 = getProxy(UserProxy):getData()
	local var_15_2 = getProxy(ServerProxy)
	local var_15_3 = getProxy(PlayerProxy):getRefundInfo()
	local var_15_4 = var_15_2:getLastServer(var_15_1.uid)

	var_15_3 = var_15_3 or {}

	for iter_15_0 = 1, #var_15_3 do
		local var_15_5 = Goods.Create({
			shop_id = var_15_3[iter_15_0].shopId
		}, Goods.TYPE_CHARGE)

		var_15_5.buyTime = var_15_3[iter_15_0].buyTime
		var_15_5.refundTime = var_15_3[iter_15_0].refundTime

		table.insert(arg_15_0.damondItemVOs, var_15_5)
	end
end

function var_0_0.sortDamondItems(arg_16_0)
	if arg_16_0.damondItemVOs == nil then
		return
	end

	arg_16_0.tempDamondVOs = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.damondItemVOs) do
		if iter_16_1:isChargeType() then
			iter_16_1:updateBuyCount(arg_16_0:getBuyCount(arg_16_0.chargedList, iter_16_1.id))
			table.insert(arg_16_0.tempDamondVOs, iter_16_1)
		end
	end

	table.sort(arg_16_0.tempDamondVOs, function(arg_17_0, arg_17_1)
		local var_17_0 = not table.contains(arg_16_0.firstChargeIds, arg_17_0.id) and arg_17_0:firstPayDouble() and 1 or 0
		local var_17_1 = not table.contains(arg_16_0.firstChargeIds, arg_17_1.id) and arg_17_1:firstPayDouble() and 1 or 0
		local var_17_2 = 0
		local var_17_3 = 0
		local var_17_4

		if var_17_2 ~= var_17_3 then
			return var_17_2 < var_17_3
		end

		local var_17_5 = arg_17_0:getConfig("tag") == 2 and 1 or 0
		local var_17_6 = arg_17_1:getConfig("tag") == 2 and 1 or 0

		if var_17_0 == var_17_1 and var_17_5 == var_17_6 then
			return arg_17_0.id < arg_17_1.id
		else
			return var_17_1 < var_17_0 or var_17_0 == var_17_1 and var_17_6 < var_17_5
		end
	end)

	if page == var_0_0.TYPE_DIAMOND then
		arg_16_0.diamondUIItemList:align(#arg_16_0.tempDamondVOs)
	elseif page == var_0_0.TYPE_GIFT then
		arg_16_0.giftRect:SetTotalCount(#arg_16_0.tempDamondVOs, arg_16_0.giftRect.value)
	end
end

function var_0_0.getBuyCount(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_1 then
		return 0
	end

	local var_18_0 = arg_18_1[arg_18_2]

	return var_18_0 and var_18_0.buyCount or 0
end

function var_0_0.showItemDetail(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_1.icon
	local var_19_1 = arg_19_1.name and arg_19_1.name or ""
	local var_19_2 = arg_19_1.tipBonus or ""
	local var_19_3 = arg_19_1.bonusItem
	local var_19_4 = arg_19_1.tipExtra and arg_19_1.tipExtra or ""
	local var_19_5 = arg_19_1.extraItems and arg_19_1.extraItems or {}
	local var_19_6 = arg_19_1.price and arg_19_1.price or 0
	local var_19_7 = arg_19_1.isChargeType
	local var_19_8 = arg_19_1.isMonthCard
	local var_19_9 = arg_19_1.tagType
	local var_19_10 = arg_19_1.normalTip

	setActive(arg_19_0.detail:Find("window2"), var_19_10)
	setActive(arg_19_0.detail:Find("window"), not var_19_10)
	arg_19_0:bindDetailTF(var_19_10 and arg_19_0.detail:Find("window2") or arg_19_0.detail:Find("window"))

	if arg_19_0.detailNormalTip then
		setActive(arg_19_0.detailNormalTip, var_19_10)
	end

	if arg_19_0.detailContain then
		setActive(arg_19_0.detailContain, not var_19_10)
	end

	if var_19_10 then
		if arg_19_0.detailNormalTip:GetComponent("Text") then
			setText(arg_19_0.detailNormalTip, var_19_10)
		else
			setButtonText(arg_19_0.detailNormalTip, var_19_10)
		end
	end

	setActive(arg_19_0.detailTag, var_19_9 > 0)

	if var_19_9 > 0 then
		for iter_19_0, iter_19_1 in ipairs(arg_19_0.detailTags) do
			setActive(iter_19_1, iter_19_0 == var_19_9)
		end
	end

	arg_19_0.detailIconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

	LoadSpriteAsync(var_19_0, function(arg_20_0)
		if arg_20_0 then
			arg_19_0.detailIconTF.sprite = arg_20_0
		end
	end)
	setText(arg_19_0.detailName, var_19_1)
	setActive(arg_19_0.detailRmb, var_19_7)
	setActive(arg_19_0.detailGem, not var_19_7)
	setText(arg_19_0.detailPrice, var_19_6)

	if arg_19_0.detailDescExtra ~= nil then
		setActive(arg_19_0.detailDescExtra, arg_19_1.descExtra and arg_19_1.descExtra ~= "")
		setText(arg_19_0.detailDescExtra, arg_19_1.descExtra or "")
	end

	if arg_19_0.detailContain then
		SetActive(arg_19_0.normal, var_19_8)

		if var_19_8 then
			updateDrop(arg_19_0.detailItem, var_19_3)
			onButton(arg_19_0, arg_19_0.detailItem, function()
				arg_19_0:emit(var_0_0.ON_DROP, var_19_3)
			end, SFX_PANEL)

			local var_19_11, var_19_12 = contentWrap(var_19_3:getConfig("name"), 10, 2)

			if var_19_11 then
				var_19_12 = var_19_12 .. "..."
			end

			setText(arg_19_0.detailItem:Find("name"), var_19_12)
			setText(arg_19_0.detailTip, var_19_2)
		end

		setText(arg_19_0.detailTip2, var_19_4)

		for iter_19_2 = #var_19_5, arg_19_0.detailItemList.childCount - 1 do
			Destroy(arg_19_0.detailItemList:GetChild(iter_19_2))
		end

		for iter_19_3 = arg_19_0.detailItemList.childCount, #var_19_5 - 1 do
			cloneTplTo(arg_19_0.detailItem, arg_19_0.detailItemList)
		end

		for iter_19_4 = 1, #var_19_5 do
			local var_19_13 = arg_19_0.detailItemList:GetChild(iter_19_4 - 1)

			updateDrop(var_19_13, var_19_5[iter_19_4])

			local var_19_14, var_19_15 = contentWrap(var_19_5[iter_19_4]:getConfig("name"), 8, 2)

			if var_19_14 then
				var_19_15 = var_19_15 .. "..."
			end

			setText(var_19_13:Find("name"), var_19_15)
			onButton(arg_19_0, var_19_13, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_SINGLE_ITEM,
					drop = var_19_5[iter_19_4]
				})
			end, SFX_PANEL)
		end
	end

	onButton(arg_19_0, arg_19_0.detail:Find("back_sign"), function()
		SetActive(arg_19_0.detail, false)
		arg_19_0:revertDetailBlur()
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.detailWindow:Find("button_container/button_cancel"), function()
		SetActive(arg_19_0.detail, false)
		arg_19_0:revertDetailBlur()
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.detailWindow:Find("button_container/button_ok"), arg_19_1.onYes or function()
		return
	end, SFX_PANEL)
	setActive(arg_19_0.detail, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_19_0.blurPanel)
end

function var_0_0.bindDetailTF(arg_26_0, arg_26_1)
	arg_26_0.detailWindow = arg_26_1
	arg_26_0.detailName = arg_26_0.detailWindow:Find("goods/name")
	arg_26_0.detailIcon = arg_26_0.detailWindow:Find("goods/icon")
	arg_26_0.detailIconTF = arg_26_0.detailIcon:GetComponent(typeof(Image))
	arg_26_0.detailRmb = arg_26_0.detailWindow:Find("prince_bg/contain/icon_rmb")
	arg_26_0.detailGem = arg_26_0.detailWindow:Find("prince_bg/contain/icon_gem")
	arg_26_0.detailPrice = arg_26_0.detailWindow:Find("prince_bg/contain/Text")
	arg_26_0.detailTag = arg_26_0.detailWindow:Find("goods/tag")
	arg_26_0.detailTags = {}

	table.insert(arg_26_0.detailTags, arg_26_0.detailTag:Find("hot"))
	table.insert(arg_26_0.detailTags, arg_26_0.detailTag:Find("new"))
	table.insert(arg_26_0.detailTags, arg_26_0.detailTag:Find("advice"))
	table.insert(arg_26_0.detailTags, arg_26_0.detailTag:Find("double"))
	table.insert(arg_26_0.detailTags, arg_26_0.detailTag:Find("discount"))

	arg_26_0.detailTagDoubleTF = arg_26_0.detailTag:Find("double")
	arg_26_0.detailTagAdviceTF = arg_26_0.detailTag:Find("advice")
	arg_26_0.detailContain = arg_26_0.detailWindow:Find("container")

	if arg_26_0.detailContain then
		arg_26_0.extra = arg_26_0.detailWindow:Find("container/items")
		arg_26_0.detailTip2 = arg_26_0.extra:Find("Text")
		arg_26_0.detailItemList = arg_26_0.extra:Find("scrollview/list")
		arg_26_0.normal = arg_26_0.detailWindow:Find("container/normal_items")
		arg_26_0.detailTip = arg_26_0.normal:Find("Text")
		arg_26_0.detailItem = arg_26_0.normal:Find("item_tpl")
		arg_26_0.detailDescExtra = arg_26_0.detailWindow:Find("container/Text")
	end

	arg_26_0.detailNormalTip = arg_26_0.detailWindow:Find("NormalTips")
end

function var_0_0.revertDetailBlur(arg_27_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_27_0.blurPanel, arg_27_0._tf)
end

function var_0_0.willExit(arg_28_0)
	arg_28_0:revertDetailBlur()
end

function var_0_0.onBackPressed(arg_29_0)
	return
end

return var_0_0

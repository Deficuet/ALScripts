local var_0_0 = class("EducateShopLayer", import("..base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateShopUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.initData(arg_3_0)
	assert(arg_3_0.contextData.shopId, "打开商店layer需要传入shopId")

	arg_3_0.shopId = arg_3_0.contextData.shopId
end

function var_0_0.findUI(arg_4_0)
	arg_4_0.anim = arg_4_0._tf:Find("anim_root"):GetComponent(typeof(Animation))
	arg_4_0.animEvent = arg_4_0._tf:Find("anim_root"):GetComponent(typeof(DftAniEvent))

	arg_4_0.animEvent:SetEndEvent(function()
		arg_4_0:emit(var_0_0.ON_CLOSE)
	end)

	arg_4_0.windowTF = arg_4_0._tf:Find("anim_root/window")
	arg_4_0.titleTF = arg_4_0.windowTF:Find("title")

	setText(arg_4_0.titleTF:Find("Text"), i18n("word_shop"))

	arg_4_0.closeBtn = arg_4_0.titleTF:Find("close_btn")
	arg_4_0.discountTF = arg_4_0.titleTF:Find("Text/discount")
	arg_4_0.discountValueTF = arg_4_0.discountTF:Find("Text")
	arg_4_0.goodContent = arg_4_0.windowTF:Find("view/content")
	arg_4_0.goodUIList = UIItemList.New(arg_4_0.goodContent, arg_4_0.goodContent:Find("tpl"))

	setText(arg_4_0.goodContent:Find("tpl/sellout/Text"), i18n("word_sell_out"))

	arg_4_0.tipTF = arg_4_0.windowTF:Find("tip")
	arg_4_0.detailPanelTF = arg_4_0.windowTF:Find("detail/content")
	arg_4_0.detailEmptyTF = arg_4_0.windowTF:Find("detail/empty")

	setText(arg_4_0.detailEmptyTF:Find("Text"), i18n("child_shop_empty_tip"))

	arg_4_0.detailName = arg_4_0.detailPanelTF:Find("title/Text")
	arg_4_0.detailDesc = arg_4_0.detailPanelTF:Find("desc")
	arg_4_0.detailIcon = arg_4_0.detailPanelTF:Find("icon")
	arg_4_0.detailAttrsTF = arg_4_0.detailPanelTF:Find("attrs")

	setActive(arg_4_0.detailPanelTF:Find("count"), false)

	arg_4_0.countValueTF = arg_4_0.detailPanelTF:Find("count/bg/Text")
	arg_4_0.addCountBtn = arg_4_0.detailPanelTF:Find("count/add")
	arg_4_0.reduceCountBtn = arg_4_0.detailPanelTF:Find("count/reduce")
	arg_4_0.maxCountBtn = arg_4_0.detailPanelTF:Find("count/max")
	arg_4_0.priceValue = arg_4_0.detailPanelTF:Find("price/value/Text")

	setText(arg_4_0.detailPanelTF:Find("price/title"), i18n("child_shop_price_title"))

	arg_4_0.purchaseBtn = arg_4_0.detailPanelTF:Find("purchase_btn")

	setText(arg_4_0.purchaseBtn:Find("Text"), i18n("word_buy"))
end

function var_0_0.addListener(arg_6_0)
	onButton(arg_6_0, arg_6_0._tf:Find("anim_root/bg"), function()
		arg_6_0:_close()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.closeBtn, function()
		arg_6_0:_close()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.addCountBtn, function()
		if arg_6_0.countValue >= arg_6_0:GetMaxCount() then
			return
		end

		arg_6_0.countValue = arg_6_0.countValue + 1

		arg_6_0:updateDetailPrice()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.reduceCountBtn, function()
		if arg_6_0.countValue <= 1 then
			return
		end

		arg_6_0.countValue = arg_6_0.countValue - 1

		arg_6_0:updateDetailPrice()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.maxCountBtn, function()
		local var_11_0 = arg_6_0:GetMaxCount()

		if arg_6_0.countValue == var_11_0 then
			return
		end

		arg_6_0.countValue = var_11_0

		arg_6_0:updateDetailPrice()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.purchaseBtn, function()
		if arg_6_0:GetMaxCount() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

			return
		end

		arg_6_0:emit(EducateShopMediator.ON_SHOPPING, {
			shopId = arg_6_0.shopId,
			goods = {
				{
					id = arg_6_0.goods[arg_6_0.selectedIndex].id,
					num = arg_6_0.countValue
				}
			}
		})
	end, SFX_PANEL)
	arg_6_0.goodUIList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			arg_6_0:updateGoodItem(arg_13_1, arg_13_2)
		end
	end)
end

function var_0_0.didEnter(arg_14_0)
	arg_14_0:OverlayPanel(arg_14_0._tf, {
		groupDelta = 2
	})

	arg_14_0.selectedIndex = 1
	arg_14_0.countValue = 1

	arg_14_0:refreshShops()
end

function var_0_0.updateGoodItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_1 + 1
	local var_15_1 = arg_15_0.goods[var_15_0]

	setActive(arg_15_2:Find("discount"), arg_15_0.isDiscount)
	setText(arg_15_2:Find("discount/Text"), "-" .. arg_15_0.discountValue)

	local var_15_2 = var_15_1:GetPrice()
	local var_15_3 = arg_15_0.isDiscount and var_15_1:GetPrice(arg_15_0.discountRatio) or var_15_2

	setActive(arg_15_2:Find("bottom/price/price_original"), arg_15_0.isDiscount)
	setText(arg_15_2:Find("bottom/price/price_original"), var_15_2)
	setText(arg_15_2:Find("bottom/price/price_final"), var_15_3)

	local var_15_4 = var_15_1:GetShowInfo()

	EducateHelper.UpdateDropShow(arg_15_2:Find("item"), var_15_4)
	setActive(arg_15_2:Find("sellout"), not var_15_1:CanBuy())
	setActive(arg_15_2:Find("selected"), var_15_0 == arg_15_0.selectedIndex)
	onButton(arg_15_0, arg_15_2, function()
		if var_15_0 == arg_15_0.selectedIndex then
			return
		end

		arg_15_0.selectedIndex = var_15_0

		for iter_16_0 = 0, arg_15_0.goodContent.childCount - 1 do
			local var_16_0 = arg_15_0.goodContent:GetChild(iter_16_0)

			setActive(var_16_0:Find("selected"), iter_16_0 + 1 == arg_15_0.selectedIndex)
		end

		arg_15_0:updateDetail()
	end, SFX_PANEL)
end

function var_0_0.refreshShops(arg_17_0)
	local var_17_0 = getProxy(EducateProxy):GetCurTime()

	arg_17_0.shopProxy = getProxy(EducateProxy):GetShopProxy()
	arg_17_0.shop = arg_17_0.shopProxy:GetShopWithId(arg_17_0.shopId)
	arg_17_0.goods = arg_17_0.shop:GetGoods(var_17_0)
	arg_17_0.char = getProxy(EducateProxy):GetCharData()
	arg_17_0.isDiscount = arg_17_0.shopProxy:IsDiscountById(arg_17_0.shopId)
	arg_17_0.discountRatio = arg_17_0.shopProxy:GetDiscountById(arg_17_0.shopId)
	arg_17_0.discountValue = arg_17_0.isDiscount and arg_17_0.discountRatio / 100 .. "%" or ""

	setActive(arg_17_0.discountTF, arg_17_0.isDiscount)
	setText(arg_17_0.discountValueTF, arg_17_0.discountValue)
	setText(arg_17_0.tipTF, arg_17_0.shop:GetShopTip())
	arg_17_0.goodUIList:align(#arg_17_0.goods)

	local var_17_1 = underscore.detect(arg_17_0.goods, function(arg_18_0)
		return arg_18_0:GetRemainCnt() > 0
	end)

	setActive(arg_17_0.detailEmptyTF, not var_17_1)
	setActive(arg_17_0.detailPanelTF, var_17_1)

	if var_17_1 then
		arg_17_0:updateDetail()
	end
end

function var_0_0.updateDetail(arg_19_0)
	arg_19_0.countValue = 1

	local var_19_0 = arg_19_0.goods[arg_19_0.selectedIndex]:GetShowInfo()
	local var_19_1 = pg.child_item[var_19_0.id]

	setText(arg_19_0.detailName, var_19_1.name)
	setText(arg_19_0.detailDesc, var_19_1.desc)
	setText(arg_19_0.countValueTF, arg_19_0.countValue)
	LoadImageSpriteAsync("educateprops/" .. var_19_1.icon, arg_19_0.detailIcon)

	local var_19_2 = EducateHelper.GetItemAddDrops(var_19_0)

	arg_19_0:updateDetailAttrs(var_19_2)
	arg_19_0:updateDetailPrice()
end

function var_0_0.updateDetailAttrs(arg_20_0, arg_20_1)
	local var_20_0

	var_20_0 = #arg_20_1 > 2 and 2 or #arg_20_1

	for iter_20_0 = 1, arg_20_0.detailAttrsTF.childCount do
		local var_20_1 = arg_20_1[iter_20_0]
		local var_20_2 = arg_20_0.detailAttrsTF:GetChild(iter_20_0 - 1)

		if var_20_1 then
			setActive(var_20_2, true)
			EducateHelper.UpdateDropShowForAttr(var_20_2, var_20_1)
		else
			setActive(var_20_2, false)
		end
	end
end

function var_0_0.updateDetailPrice(arg_21_0)
	setText(arg_21_0.countValueTF, arg_21_0.countValue)

	local var_21_0 = arg_21_0.goods[arg_21_0.selectedIndex]:GetCost(arg_21_0.discountRatio)

	setText(arg_21_0.priceValue, var_21_0.num * arg_21_0.countValue)
	setGray(arg_21_0.purchaseBtn, arg_21_0:GetMaxCount() == 0, true)
end

function var_0_0.GetMaxCount(arg_22_0)
	local var_22_0 = arg_22_0.goods[arg_22_0.selectedIndex]
	local var_22_1 = var_22_0:GetRemainCnt()
	local var_22_2 = var_22_0:GetCost(arg_22_0.discountRatio)
	local var_22_3 = math.floor(arg_22_0.char:GetResById(var_22_2.id) / var_22_2.num)

	return math.min(var_22_1, var_22_3)
end

function var_0_0._close(arg_23_0)
	arg_23_0.anim:Play("anim_educate_shop_out")
end

function var_0_0.onBackPressed(arg_24_0)
	arg_24_0:_close()
end

function var_0_0.willExit(arg_25_0)
	arg_25_0.animEvent:SetEndEvent(nil)
	arg_25_0:UnOverlayPanel(arg_25_0._tf)
end

return var_0_0

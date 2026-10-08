local var_0_0 = class("ChargeMenuScene", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChargeMenuUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	if getProxy(ShopsProxy):ShouldRefreshChargeList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = arg_2_1
		})
	else
		arg_2_1()
	end
end

function var_0_0.getResource(arg_3_0)
	local var_3_0 = var_0_0.super.getResource(arg_3_0)
	local var_3_1 = {}

	local function var_3_2(arg_4_0)
		if noEmptyStr(arg_4_0) and not table.contains(var_3_1, arg_4_0) then
			table.insert(var_3_1, arg_4_0)
		end
	end

	local var_3_3 = getProxy(ActivityProxy)
	local var_3_4 = var_3_3 and var_3_3:getActiveBannerByType(GAMEUI_BANNER_9)

	if var_3_4 then
		var_3_2("activitybanner/" .. var_3_4.pic)
	end

	local var_3_5 = var_3_3 and var_3_3:getActiveBannerByType(GAMEUI_BANNER_11)

	if var_3_5 then
		var_3_2("activitybanner/" .. var_3_5.pic)
	end

	local var_3_6 = getProxy(ShopsProxy)

	if var_3_6 then
		for iter_3_0, iter_3_1 in ipairs(var_3_6:GetRecommendCommodities() or {}) do
			var_3_2(iter_3_1:GetIcon())
		end
	end

	var_3_2("ui/ChargeTipUI")
	var_3_2("ui/MonthCardTipWindow")
	var_3_2("ui/GiftPackageTipWindow")
	var_3_2("ui/CrusingTipWindow")

	for iter_3_2, iter_3_3 in ipairs(var_3_1) do
		if not table.contains(var_3_0, iter_3_3) then
			table.insert(var_3_0, iter_3_3)
		end
	end

	return var_3_0
end

function var_0_0.init(arg_5_0)
	arg_5_0:initData()
	arg_5_0:findUI()
	arg_5_0:addListener()
	arg_5_0:initUIText()
	arg_5_0:InitBanner()
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:updatePlayerRes()
	arg_6_0:updatePanel()
	arg_6_0:tryAutoOpenShop()
end

function var_0_0.ResUISettings(arg_7_0)
	return true
end

function var_0_0.onBackPressed(arg_8_0)
	if arg_8_0.chargeTipWindow and arg_8_0.chargeTipWindow:GetLoaded() and arg_8_0.chargeTipWindow:isShowing() then
		arg_8_0.chargeTipWindow:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_8_0)
end

function var_0_0.willExit(arg_9_0)
	if arg_9_0.bannerRect then
		arg_9_0.bannerRect:Dispose()

		arg_9_0.bannerRect = nil
	end

	if arg_9_0.chargeOrPurchaseHandler then
		arg_9_0.chargeOrPurchaseHandler:Dispose()

		arg_9_0.chargeOrPurchaseHandler = nil
	end

	if arg_9_0.chargeTipWindow then
		arg_9_0.chargeTipWindow:Destroy()

		arg_9_0.chargeTipWindow = nil
	end
end

function var_0_0.initData(arg_10_0)
	return
end

function var_0_0.initUIText(arg_11_0)
	return
end

function var_0_0.findUI(arg_12_0)
	arg_12_0.blurTF = arg_12_0._tf:Find("blur_panel")
	arg_12_0.topTF = arg_12_0.blurTF:Find("adapt/top")
	arg_12_0.resTF = arg_12_0.topTF:Find("res")
	arg_12_0.backBtn = arg_12_0.topTF:Find("back_button")
	arg_12_0.menuTF = arg_12_0._tf:Find("menu_screen")
	arg_12_0.skinShopBtn = arg_12_0.menuTF:Find("skin_shop")
	arg_12_0.skinLockIcon = arg_12_0.menuTF:Find("skin_lock")

	local var_12_0 = LOCK_SKIN_SHOP_ENTER and getProxy(PlayerProxy):getData().level < LOCK_SKIN_SHOP_ENTER_LEVEL

	setActive(arg_12_0.skinShopBtn, not var_12_0)
	setActive(arg_12_0.skinLockIcon, var_12_0)

	arg_12_0.diamondShopBtn = arg_12_0.menuTF:Find("dimond_shop")
	arg_12_0.itemShopBtn = arg_12_0.menuTF:Find("props")
	arg_12_0.giftShopBtn = arg_12_0.menuTF:Find("gift_shop")
	arg_12_0.supplyShopBtn = arg_12_0.menuTF:Find("supply")
	arg_12_0.monthCardTag = arg_12_0.diamondShopBtn:Find("monthcard_tag")
	arg_12_0.giftTag = arg_12_0.giftShopBtn:Find("tip")
	arg_12_0.bannerRect = BannerScrollRect.New(arg_12_0._tf:Find("menu_screen/banner/mask/content"), arg_12_0._tf:Find("menu_screen/banner/dots"))
	arg_12_0.chargeOrPurchaseHandler = ChargeOrPurchaseHandler.New()
	arg_12_0.chargeTipWindow = ChargeTipWindow.New(arg_12_0._tf, arg_12_0.event)
end

local function var_0_1(arg_13_0, arg_13_1, arg_13_2)
	setText(arg_13_1:Find("name"), arg_13_2:GetName())
	setText(arg_13_1:Find("desc"), arg_13_2:GetDesc())

	local var_13_0 = arg_13_2:GetDropList()
	local var_13_1 = UIItemList.New(arg_13_1:Find("items"), arg_13_1:Find("items/award"))

	var_13_1:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = var_13_0[arg_14_1 + 1]

			updateDrop(arg_14_2, var_14_0)
			onButton(arg_13_0, arg_14_2, function()
				arg_13_0:emit(BaseUI.ON_DROP, var_14_0)
			end, SFX_PANEL)
		end
	end)
	var_13_1:align(#var_13_0)

	local var_13_2 = arg_13_2:GetGem()

	setActive(arg_13_1:Find("gem"), var_13_2 > 0)
	setText(arg_13_1:Find("gem/Text"), var_13_2)

	local var_13_3, var_13_4, var_13_5 = arg_13_2:GetPrice()

	setText(arg_13_1:Find("price/Text"), var_13_4)
	setActive(arg_13_1:Find("price/Text/icon"), var_13_3 ~= RecommendCommodity.PRICE_TYPE_RMB)
	setText(arg_13_1:Find("price/Text/label"), var_13_3 == RecommendCommodity.PRICE_TYPE_RMB and GetMoneySymbol() or "")

	local var_13_6 = arg_13_1:Find("icon")

	GetSpriteFromAtlasAsync(arg_13_2:GetIcon(), "", function(arg_16_0)
		setImageSprite(var_13_6, arg_16_0)
	end)

	var_13_6.sizeDelta = Vector2(180, 180)
end

function var_0_0.InitBanner(arg_17_0)
	local var_17_0 = getProxy(ShopsProxy):GetRecommendCommodities()

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		local var_17_1 = arg_17_0.bannerRect:AddChild()

		var_0_1(arg_17_0, var_17_1, iter_17_1)
		onButton(arg_17_0, var_17_1, function()
			local var_18_0, var_18_1 = iter_17_1:IsMonthCardAndCantPurchase()

			if var_18_0 then
				pg.TipsMgr.GetInstance():ShowTips(var_18_1)

				return
			end

			arg_17_0.bannerRect:Pause()

			arg_17_0.lookUpIndex = iter_17_0

			pg.m02:sendNotification(GAME.TRACK, TrackConst.GetTrackData(TrackConst.SYSTEM_SHOP, TrackConst.ACTION_LOOKUP_RECOMMEND, iter_17_0))
			arg_17_0.chargeOrPurchaseHandler:ChargeOrPurchaseAsyn(iter_17_1:GetRealCommodity())
		end, SFX_PANEL)
	end

	arg_17_0.bannerRect:SetUp()
end

function var_0_0.FlushBanner(arg_19_0)
	arg_19_0.bannerRect:Reset()
	arg_19_0:InitBanner()
end

function var_0_0.addListener(arg_20_0)
	onButton(arg_20_0, arg_20_0.backBtn, function()
		arg_20_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_20_0, arg_20_0.skinShopBtn, function()
		arg_20_0:emit(ChargeMenuMediator.GO_SKIN_SHOP)
	end, SFX_PANEL)
	onButton(arg_20_0, arg_20_0.diamondShopBtn, function()
		arg_20_0:emit(ChargeMenuMediator.GO_CHARGE_SHOP, ChargeScene.TYPE_DIAMOND)
	end, SFX_PANEL)
	onButton(arg_20_0, arg_20_0.giftShopBtn, function()
		arg_20_0:emit(ChargeMenuMediator.GO_CHARGE_SHOP, ChargeScene.TYPE_GIFT)

		local var_24_0 = isActive(arg_20_0.giftTag)

		pg.m02:sendNotification(GAME.TRACK, TrackConst.GetTrackData(TrackConst.SYSTEM_SHOP, TrackConst.ACTION_ENTER_GIFT, var_24_0))
	end, SFX_PANEL)
	onButton(arg_20_0, arg_20_0.itemShopBtn, function()
		arg_20_0:emit(ChargeMenuMediator.GO_CHARGE_SHOP, ChargeScene.TYPE_ITEM)
	end, SFX_PANEL)
	onButton(arg_20_0, arg_20_0.supplyShopBtn, function()
		arg_20_0:emit(ChargeMenuMediator.GO_SUPPLY_SHOP, {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end, SFX_PANEL)
end

function var_0_0.updatePlayerRes(arg_27_0)
	return
end

function var_0_0.updatePanel(arg_28_0)
	local var_28_0 = getProxy(ActivityProxy)
	local var_28_1 = var_28_0:getActiveBannerByType(GAMEUI_BANNER_9)

	if var_28_1 ~= nil then
		LoadImageSpriteAsync("activitybanner/" .. var_28_1.pic, arg_28_0.skinShopBtn)
	end

	local var_28_2 = var_28_0:getActiveBannerByType(GAMEUI_BANNER_11)

	if var_28_2 ~= nil then
		LoadImageSpriteAsync("activitybanner/" .. var_28_2.pic, arg_28_0.giftShopBtn:Find("BG"))
	end

	local var_28_3 = MonthCardOutDateTipPanel.GetShowMonthCardTag()

	setActive(arg_28_0.monthCardTag, var_28_3)
	MonthCardOutDateTipPanel.SetMonthCardTagDate()
	TagTipHelper.SetFuDaiTagMark()
	TagTipHelper.SetSkinTagMark()
	TagTipHelper.FreeGiftTag({
		arg_28_0.giftTag
	})
end

function var_0_0.tryAutoOpenShop(arg_29_0)
	local var_29_0 = arg_29_0.contextData.warp

	if var_29_0 ~= nil then
		if var_29_0 == ChargeScene.TYPE_DIAMOND then
			triggerButton(arg_29_0.diamondShopBtn)
		elseif var_29_0 == ChargeScene.TYPE_GIFT then
			triggerButton(arg_29_0.giftShopBtn)
		elseif var_29_0 == ChargeScene.TYPE_ITEM then
			triggerButton(arg_29_0.itemShopBtn)
		end
	end
end

function var_0_0.OnRemoveLayer(arg_30_0, arg_30_1)
	if arg_30_1.mediator == ChargeItemPanelMediator and arg_30_0.bannerRect then
		arg_30_0.bannerRect:Resume()
	end
end

function var_0_0.OnChargeSuccess(arg_31_0, arg_31_1)
	arg_31_0.chargeTipWindow:ExecuteAction("Show", arg_31_1)
end

return var_0_0

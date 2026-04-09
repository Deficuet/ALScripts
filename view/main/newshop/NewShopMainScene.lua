local var_0_0 = class("NewShopMainScene", import("...base.BaseUI"))

var_0_0.CLOSE_ALL_LAYER = "NewShopMainScene.CLOSE_ALL_LAYER"
var_0_0.SHOW_OR_HIDE_UI = "NewShopMainScene.SHOW_OR_HIDE_UI"
var_0_0.SHOW_OR_HIDE_UI_2 = "NewShopMainScene.SHOW_OR_HIDE_UI_2"
var_0_0.CLOSE_VIEW = "NewShopMainScene.CLOSE_VIEW"
var_0_0.TYPE_CHARGE = "charge"
var_0_0.TYPE_SKIN = "skin"

function var_0_0.getUIName(arg_1_0)
	return "NewShopUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ShopsProxy)

	local function var_2_1()
		local var_3_0 = var_2_0:getFirstChargeList()
		local var_3_1 = var_2_0:getChargedList()
		local var_3_2 = var_2_0:GetNormalList()
		local var_3_3 = var_2_0:GetNormalGroupList()

		if var_3_0 then
			arg_2_0:setFirstChargeIds(var_3_0)
		end

		if var_3_1 then
			arg_2_0:setChargedList(var_3_1)
		end

		if var_3_2 then
			arg_2_0:setNormalList(var_3_2)
		end

		if var_3_3 then
			arg_2_0:setNormalGroupList(var_3_3)
		end

		arg_2_1()
	end

	if var_2_0:ShouldRefreshChargeList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = var_2_1
		})
	else
		var_2_1()
	end
end

function var_0_0.init(arg_4_0)
	local var_4_0 = arg_4_0._tf:Find("buttonList")

	arg_4_0.buttonList = var_4_0
	arg_4_0.backBtn = var_4_0:Find("top/closeBtn")
	arg_4_0.homeBtn = var_4_0:Find("top/homeBtn")
	arg_4_0.resourcePanel = var_4_0:Find("top/resources")

	setActive(arg_4_0.resourcePanel, false)

	arg_4_0.goldBtn = var_4_0:Find("top/resources/gold")
	arg_4_0.goldText = var_4_0:Find("top/resources/gold/Text"):GetComponent(typeof(Text))
	arg_4_0.goldMax = var_4_0:Find("top/resources/gold/max"):GetComponent(typeof(Text))
	arg_4_0.oilBtn = var_4_0:Find("top/resources/oil")
	arg_4_0.oilText = var_4_0:Find("top/resources/oil/Text"):GetComponent(typeof(Text))
	arg_4_0.oilMax = var_4_0:Find("top/resources/oil/max"):GetComponent(typeof(Text))
	arg_4_0.diamondBtn = var_4_0:Find("top/resources/gem")
	arg_4_0.diamondText = var_4_0:Find("top/resources/gem/Text"):GetComponent(typeof(Text))

	setText(var_4_0:Find("top/title/Text"), i18n("shop_title"))
	setText(var_4_0:Find("shop1List/recommendation/shop1Tg/name"), i18n("shop_recommend"))
	setText(var_4_0:Find("shop1List/skinShop/shop1Tg/name"), i18n("shop_skin"))
	setText(var_4_0:Find("shop1List/diamondShop/shop1Tg/name"), i18n("shop_diamond_title"))
	setText(var_4_0:Find("shop1List/specialShop/shop1Tg/name"), i18n("shop_akashi_pick_title"))
	setText(var_4_0:Find("shop1List/giftPackShop/shop1Tg/name"), i18n("shop_gift_title"))
	setText(var_4_0:Find("shop1List/functionalItemShop/shop1Tg/name"), i18n("shop_item_title"))
	setText(var_4_0:Find("shop1List/supplyShop/shop1Tg/name"), i18n("shop_supply_prop"))
	setText(var_4_0:Find("shop1List/recommendation/shop1Tg/name/en"), i18n("shop_recommend_en"))
	setText(var_4_0:Find("shop1List/skinShop/shop1Tg/name/en"), i18n("shop_skin_en"))
	setText(var_4_0:Find("shop1List/diamondShop/shop1Tg/name/en"), i18n("shop_diamond_title_en"))
	setText(var_4_0:Find("shop1List/specialShop/shop1Tg/name/en"), i18n("shop_side_lable_en"))
	setText(var_4_0:Find("shop1List/giftPackShop/shop1Tg/name/en"), i18n("shop_gift_title_en"))
	setText(var_4_0:Find("shop1List/functionalItemShop/shop1Tg/name/en"), i18n("shop_item_title_en"))
	setText(var_4_0:Find("shop1List/supplyShop/shop1Tg/name/en"), i18n("shop_supply_prop_en"))
	setText(var_4_0:Find("shop1List/skinShop/shop2List/newSkin/name"), i18n("shop_skin_new"))
	setText(var_4_0:Find("shop1List/skinShop/shop2List/newSkin/selected/name"), i18n("shop_skin_new"))
	setText(var_4_0:Find("shop1List/skinShop/shop2List/permanentSkin/name"), i18n("shop_skin_permanent"))
	setText(var_4_0:Find("shop1List/skinShop/shop2List/permanentSkin/selected/name"), i18n("shop_skin_permanent"))
	setText(var_4_0:Find("shop1List/supplyShop/shop2List/monthShop/name"), i18n("shop_month"))
	setText(var_4_0:Find("shop1List/supplyShop/shop2List/monthShop/selected/name"), i18n("shop_month"))
	setText(var_4_0:Find("shop1List/supplyShop/shop2List/supplyShop/name"), i18n("shop_supply"))
	setText(var_4_0:Find("shop1List/supplyShop/shop2List/supplyShop/selected/name"), i18n("shop_supply"))
	setText(var_4_0:Find("shop1List/supplyShop/shop2List/activityShop/name"), i18n("shop_activity"))
	setText(var_4_0:Find("shop1List/supplyShop/shop2List/activityShop/selected/name"), i18n("shop_activity"))

	arg_4_0.frame = arg_4_0._tf:Find("frame")
	arg_4_0.viewContainer = arg_4_0._tf:Find("viewContainer")
	arg_4_0.painting = arg_4_0._tf:Find("frame/painting")
	arg_4_0.chat = arg_4_0._tf:Find("frame/chat")
	arg_4_0.chatText = arg_4_0.chat:Find("Text")
	arg_4_0.stamp = arg_4_0._tf:Find("frame/stamp")
	arg_4_0.specialTip = var_4_0:Find("shop1List/specialShop/shop1Tg/tip")
	arg_4_0.giftTip = var_4_0:Find("shop1List/giftPackShop/shop1Tg/tip")

	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_4_0.specialTip, {
		"specialShop",
		"Charge_Page_Exposure"
	}, function(arg_5_0)
		getProxy(ShopsProxy):GiftPackageRedDotTip({
			arg_5_0
		}, true)
	end)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_4_0.giftTip, {
		"specialShop",
		"Charge_Page_Exposure"
	}, function(arg_6_0)
		getProxy(ShopsProxy):GiftPackageRedDotTip({
			arg_6_0
		}, false)
	end)

	arg_4_0.toggleList = {
		{
			type = ChargeScene.TYPE_DIAMOND,
			go = var_4_0:Find("shop1List/diamondShop/shop1Tg")
		},
		{
			type = ChargeScene.TYPE_GIFT,
			go = var_4_0:Find("shop1List/giftPackShop/shop1Tg")
		},
		{
			type = ChargeScene.TYPE_ITEM,
			go = var_4_0:Find("shop1List/functionalItemShop/shop1Tg")
		},
		{
			type = ChargeScene.TYPE_PICK,
			go = var_4_0:Find("shop1List/specialShop/shop1Tg")
		}
	}
	GetComponent(var_4_0:Find("shop1List/supplyShop/shop2List/supplyShop"), typeof(Toggle)).isOn = true
	arg_4_0.chargeTipWindow = ChargeTipWindow.New(arg_4_0._tf, arg_4_0.event)

	arg_4_0:LoadMingshi()
	arg_4_0:jpUIInit()
	arg_4_0:blurView()
	arg_4_0:initSubView()

	arg_4_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_4_0, arg_4_0.pageContainer, Vector2.New(-35, -90))

	if arg_4_0.bulinTip then
		arg_4_0.bulinTip:RegisterView(arg_4_0)
		arg_4_0.bulinTip:CallbackInvoke(function()
			arg_4_0:OverlayPanel(arg_4_0.bulinTip._tf, {
				groupDelta = 1
			})
		end)

		function arg_4_0.bulinTip.destroyCall()
			if arg_4_0.bulinTip:GetLoaded() then
				arg_4_0:UnOverlayPanel(arg_4_0.bulinTip._tf)
			end
		end
	end
end

function var_0_0.setPlayer(arg_9_0, arg_9_1)
	arg_9_0.player = arg_9_1

	if arg_9_0.subViewList[arg_9_0.curSubViewNum] and arg_9_0.subViewList[arg_9_0.curSubViewNum]:IsSupplyShop() then
		arg_9_0.subViewList[arg_9_0.curSubViewNum]:SetPlayer(arg_9_1)
	end

	if arg_9_0.goldMax then
		PlayerResUI.StaticFlush(arg_9_0.player, arg_9_0.goldMax, arg_9_0.goldText, arg_9_0.oilMax, arg_9_0.oilText, arg_9_0.diamondText)
	end
end

function var_0_0.setFirstChargeIds(arg_10_0, arg_10_1)
	arg_10_0.firstChargeIds = arg_10_1
end

function var_0_0.setChargedList(arg_11_0, arg_11_1)
	arg_11_0.chargedList = arg_11_1
end

function var_0_0.setNormalList(arg_12_0, arg_12_1)
	arg_12_0.normalList = arg_12_1
end

function var_0_0.setNormalGroupList(arg_13_0, arg_13_1)
	arg_13_0.normalGroupList = arg_13_1

	arg_13_0:addRefreshTimer(GetZeroTime())
end

function var_0_0.SetSupplyShopList(arg_14_0, arg_14_1)
	arg_14_0.supplyShopList = arg_14_1

	arg_14_0:SortActivityShops()
end

function var_0_0.SortActivityShops(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.supplyShopList) do
		if #iter_15_1 > 1 then
			table.sort(iter_15_1, function(arg_16_0, arg_16_1)
				return arg_16_0:getStartTime() > arg_16_1:getStartTime()
			end)
		end
	end
end

function var_0_0.OnInitItems(arg_17_0, arg_17_1)
	arg_17_0.items = arg_17_1

	arg_17_0.subViewList[ShopConst.SHOP_ID.MONTH]:OnUpdateItems(arg_17_1)
	arg_17_0.subViewList[ShopConst.SHOP_ID.SUPPLY]:OnUpdateItems(arg_17_1)
	arg_17_0.subViewList[ShopConst.SHOP_ID.ACTIVITY]:OnUpdateItems(arg_17_1)
end

function var_0_0.OnUpdateItems(arg_18_0, arg_18_1)
	arg_18_0.items = arg_18_1

	if arg_18_0.subViewList[arg_18_0.curSubViewNum] and arg_18_0.subViewList[arg_18_0.curSubViewNum]:IsSupplyShop() then
		arg_18_0.subViewList[arg_18_0.curSubViewNum]:OnUpdateItems(arg_18_1)
	end
end

function var_0_0.OnUpdateShop(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0:SetShop(arg_19_1, arg_19_2)

	if arg_19_0.subViewList[arg_19_0.curSubViewNum] and arg_19_0.subViewList[arg_19_0.curSubViewNum]:IsSupplyShop() then
		arg_19_0.subViewList[arg_19_0.curSubViewNum]:OnUpdateShop(arg_19_1, arg_19_2)
	end
end

function var_0_0.OnUpdateCommodity(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	arg_20_0:SetShop(arg_20_1, arg_20_2)

	if arg_20_0.subViewList[arg_20_0.curSubViewNum] and arg_20_0.subViewList[arg_20_0.curSubViewNum]:IsSupplyShop() then
		arg_20_0.subViewList[arg_20_0.curSubViewNum]:OnUpdateCommodity(arg_20_1, arg_20_2, arg_20_3)
	end
end

function var_0_0.OnFragmentSellUpdate(arg_21_0)
	if arg_21_0.subViewList[arg_21_0.curSubViewNum] and arg_21_0.subViewList[arg_21_0.curSubViewNum]:IsSupplyShop() then
		arg_21_0.subViewList[arg_21_0.curSubViewNum]:OnFragmentSellUpdate()
	end
end

function var_0_0.SetShop(arg_22_0, arg_22_1, arg_22_2)
	if not arg_22_0.supplyShopList then
		return
	end

	local var_22_0 = arg_22_0.supplyShopList[arg_22_1]

	if var_22_0 then
		for iter_22_0, iter_22_1 in ipairs(var_22_0) do
			if iter_22_1:IsSameKind(arg_22_2) then
				arg_22_0.supplyShopList[arg_22_1][iter_22_0] = arg_22_2

				break
			end
		end
	end
end

function var_0_0.didEnter(arg_23_0)
	setActive(arg_23_0.chat, false)
	onButton(arg_23_0, arg_23_0.backBtn, function()
		arg_23_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_23_0, arg_23_0.homeBtn, function()
		arg_23_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_23_0, arg_23_0.goldBtn, function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_23_0, arg_23_0.oilBtn, function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_23_0, arg_23_0.diamondBtn, function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	onToggle(arg_23_0, arg_23_0.buttonList:Find("shop1List/recommendation/shop1Tg"), function(arg_29_0)
		if arg_29_0 then
			arg_23_0.contextData.shop1 = nil
			arg_23_0.contextData.shop2 = nil

			if arg_23_0.shop1 == "recommendation" then
				return
			end

			arg_23_0.shop1 = "recommendation"
			arg_23_0.shop2 = nil

			arg_23_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_23_0:emit(NewShopMainMediator.OPEN_LAYER, NewRecommendationShopLayer, NewRecommendationShopMediator)
		end
	end, SFX_PANEL)

	local var_23_0 = getProxy(ShipSkinProxy):GetInTimeSkins()

	setActive(arg_23_0.buttonList:Find("shop1List/skinShop/shop1Tg/timeLimit"), #var_23_0 > 0)
	setActive(arg_23_0.buttonList:Find("shop1List/skinShop/shop2List/newSkin"), #var_23_0 > 0)
	onToggle(arg_23_0, arg_23_0.buttonList:Find("shop1List/skinShop/shop2List/newSkin"), function(arg_30_0)
		if arg_30_0 then
			arg_23_0.contextData.shop2 = "newSkin"

			if arg_23_0.shop2 == "newSkin" then
				return
			end

			arg_23_0.shop2 = "newSkin"

			arg_23_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_23_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
				type = "newSkin",
				mode = arg_23_0.contextData.mode
			})
		end
	end, SFX_PANEL)
	onToggle(arg_23_0, arg_23_0.buttonList:Find("shop1List/skinShop/shop2List/permanentSkin"), function(arg_31_0)
		if arg_31_0 then
			arg_23_0.contextData.shop2 = "permanentSkin"

			if arg_23_0.shop2 == "permanentSkin" then
				return
			end

			arg_23_0.shop2 = "permanentSkin"

			arg_23_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_23_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
				type = "permanentSkin",
				mode = arg_23_0.contextData.mode
			})
		end
	end, SFX_PANEL)
	onToggle(arg_23_0, arg_23_0.buttonList:Find("shop1List/skinShop/shop1Tg"), function(arg_32_0)
		setActive(arg_23_0.buttonList:Find("shop1List/skinShop/shop2List"), arg_32_0)

		if arg_32_0 then
			if arg_23_0.shop1 == "skinShop" then
				return
			end

			arg_23_0.shop1 = "skinShop"

			if arg_23_0.contextData.shop1 and arg_23_0.contextData.shop2 then
				triggerToggle(arg_23_0.buttonList:Find("shop1List/skinShop/shop2List/" .. arg_23_0.contextData.shop2), true)
			else
				arg_23_0.contextData.shop1 = "skinShop"

				triggerToggle(arg_23_0.buttonList:Find("shop1List/skinShop/shop2List/" .. (#var_23_0 > 0 and "newSkin" or "permanentSkin")), true)
			end
		end
	end, SFX_PANEL)

	for iter_23_0 = 1, #arg_23_0.toggleList do
		local var_23_1 = arg_23_0.toggleList[iter_23_0]

		onToggle(arg_23_0, var_23_1.go, function(arg_33_0)
			if arg_33_0 then
				arg_23_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_23_0.contextData.shop1 = nil
				arg_23_0.contextData.shop2 = nil
				arg_23_0.shop1 = nil
				arg_23_0.shop2 = nil

				originalPrint(string.format("Begin: toggleType=%s, goName=%s", var_23_1.type, var_23_1.go.parent.name))

				arg_23_0.contextData.type = ShopConst.SHOP_TYPE.CHARGE
				arg_23_0.contextData.warp = var_23_1.type

				originalPrint(string.format("End: warp=%s", arg_23_0.contextData.warp))

				local var_33_0 = arg_23_0:GetShopID(ShopConst.SHOP_TYPE.CHARGE, var_23_1.type)

				arg_23_0:switchSubView(var_33_0)
			end

			local var_33_1 = switch(var_23_1.type, {
				[ChargeScene.TYPE_PICK] = function()
					return "payshop_pack_red_dot"
				end,
				[ChargeScene.TYPE_GIFT] = function()
					return "gemshop_pack_red_dot"
				end
			})

			if var_33_1 then
				if arg_33_0 then
					arg_23_0.toggleMark = arg_23_0.toggleMark or {}
					arg_23_0.toggleMark[var_23_1.type] = defaultValue(arg_23_0.toggleMark[var_23_1.type], 0) + 1
				elseif arg_23_0.toggleMark and defaultValue(arg_23_0.toggleMark[var_23_1.type], 0) > 0 then
					arg_23_0.toggleMark[var_23_1.type] = arg_23_0.toggleMark[var_23_1.type] - 1

					PlayerPrefs.SetInt(var_33_1, getGameset(var_33_1)[1])
					pg.EasyRedDotMgr.GetInstance():TriggerMarks("Charge_Page_Exposure")
				end
			end
		end, SFX_PANEL)
	end

	onToggle(arg_23_0, arg_23_0.buttonList:Find("shop1List/supplyShop/shop1Tg"), function(arg_36_0)
		setActive(arg_23_0.buttonList:Find("shop1List/supplyShop/shop2List"), arg_36_0)

		if arg_36_0 then
			triggerToggle(arg_23_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_23_0:GetDefaultSupplyShopName()), true)
		end
	end, SFX_PANEL)

	local var_23_2 = {
		{
			type = ShopConst.CATEGORY_MONTH,
			go = arg_23_0.buttonList:Find("shop1List/supplyShop/shop2List/monthShop")
		},
		{
			type = ShopConst.CATEGORY_SUPPLY,
			go = arg_23_0.buttonList:Find("shop1List/supplyShop/shop2List/supplyShop")
		},
		{
			type = ShopConst.CATEGORY_ACTIVITY,
			go = arg_23_0.buttonList:Find("shop1List/supplyShop/shop2List/activityShop")
		}
	}

	for iter_23_1, iter_23_2 in ipairs(var_23_2) do
		onToggle(arg_23_0, iter_23_2.go, function(arg_37_0)
			if arg_37_0 then
				arg_23_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_23_0.contextData.shop1 = nil
				arg_23_0.contextData.shop2 = nil
				arg_23_0.shop1 = nil
				arg_23_0.shop2 = nil
				arg_23_0.contextData.type = ShopConst.SHOP_TYPE.SUPPLY
				arg_23_0.contextData.warp = iter_23_2.type

				local var_37_0 = arg_23_0:GetShopID(ShopConst.SHOP_TYPE.SUPPLY, iter_23_2.type)

				arg_23_0:switchSubView(var_37_0)
			end
		end, SFX_PANEL)
	end

	local var_23_3 = "recommendation"

	if arg_23_0.contextData.type == ShopConst.SHOP_TYPE.CHARGE then
		if arg_23_0.contextData.warp == ChargeScene.TYPE_DIAMOND then
			var_23_3 = "diamondShop"
		elseif arg_23_0.contextData.warp == ChargeScene.TYPE_GIFT then
			var_23_3 = "giftPackShop"
		elseif arg_23_0.contextData.warp == ChargeScene.TYPE_ITEM then
			var_23_3 = "functionalItemShop"
		elseif arg_23_0.contextData.warp == ChargeScene.TYPE_PICK then
			var_23_3 = "specialShop"
		else
			var_23_3 = "diamondShop"
		end
	elseif arg_23_0.contextData.type == ShopConst.SHOP_TYPE.SKIN then
		var_23_3 = "skinShop"
	elseif arg_23_0.contextData.type == ShopConst.SHOP_TYPE.SUPPLY then
		var_23_3 = "supplyShop"
	end

	if arg_23_0.contextData.shop1 then
		var_23_3 = arg_23_0.contextData.shop1
	end

	triggerToggle(arg_23_0.buttonList:Find("shop1List/" .. var_23_3 .. "/shop1Tg"), true)

	if var_23_3 == "skinShop" then
		-- block empty
	elseif var_23_3 == "supplyShop" then
		triggerToggle(arg_23_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_23_0:GetDefaultSupplyShopName()), true)
	end

	onButton(arg_23_0, arg_23_0.painting, function()
		arg_23_0:displayShipWord()
		arg_23_0:emit(NewShopMainMediator.CLICK_MING_SHI)
	end, SFX_PANEL)
	onButton(arg_23_0, arg_23_0.stamp, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(4)
	end, SFX_CONFIRM)
	arg_23_0:RefreshActivityShop()
	arg_23_0:updateNoRes()
	arg_23_0:jpUIEnter()
end

function var_0_0.GetDefaultSupplyShopName(arg_40_0)
	if arg_40_0.contextData.type ~= ShopConst.SHOP_TYPE.SUPPLY then
		return "supplyShop"
	end

	local var_40_0 = arg_40_0.contextData.warp

	if type(var_40_0) == "string" then
		local var_40_1 = ShopConst.SHOP_NAME_LIST[var_40_0]

		arg_40_0.contextData.warp = var_40_1[1]
		arg_40_0.contextData.shopID = var_40_1[2]
	elseif type(var_40_0) == "number" and arg_40_0.contextData.shopID == nil then
		for iter_40_0, iter_40_1 in pairs(ShopConst.SUPPLY_SHOP_LIST) do
			for iter_40_2, iter_40_3 in pairs(iter_40_1) do
				if iter_40_3 == var_40_0 then
					arg_40_0.contextData.warp = iter_40_0
					arg_40_0.contextData.shopID = iter_40_3

					break
				end
			end
		end
	end

	local var_40_2 = ""

	return arg_40_0.contextData.warp == ShopConst.CATEGORY_MONTH and "monthShop" or arg_40_0.contextData.warp == ShopConst.CATEGORY_SUPPLY and "supplyShop" or arg_40_0.contextData.warp == ShopConst.CATEGORY_ACTIVITY and "activityShop" or "supplyShop"
end

function var_0_0.RefreshActivityShop(arg_41_0)
	local var_41_0 = arg_41_0.supplyShopList[ShopConst.TYPE_ACTIVITY] or {}

	setActive(arg_41_0.buttonList:Find("shop1List/supplyShop/shop2List/activityShop"), #var_41_0 > 0)
end

function var_0_0.ShowOrHideUI(arg_42_0, arg_42_1)
	arg_42_0:setVisible(arg_42_1)
	setActive(arg_42_0.buttonList, arg_42_1)
end

function var_0_0.ShowOrHideUI2(arg_43_0, arg_43_1)
	for iter_43_0 = 0, arg_43_0._tf.childCount - 1 do
		setActive(arg_43_0._tf:GetChild(iter_43_0), arg_43_1)
	end

	setActive(arg_43_0.buttonList:Find("leftBg"), arg_43_1)
	setActive(arg_43_0.buttonList:Find("shop1List"), arg_43_1)
	setActive(arg_43_0.buttonList:Find("top"), true)
end

function var_0_0.OnChargeSuccess(arg_44_0, arg_44_1)
	arg_44_0.chargeTipWindow:ExecuteAction("Show", arg_44_1)
end

function var_0_0.LoadMingshi(arg_45_0)
	if Live2dConst.GetLive2DArm32MatchAble() then
		local var_45_0 = Ship.New({
			configId = 312011
		}):getPainting()

		LoadPaintingPrefabAsync(arg_45_0.painting, var_45_0, var_45_0, "mainNormal", function()
			arg_45_0.loading = false
		end)
	else
		arg_45_0:createLive2D()
	end

	arg_45_0:AddLive2dTimer()
end

function var_0_0.AddLive2dTimer(arg_47_0)
	arg_47_0:StopLive2dTimer()

	arg_47_0.live2dTimer = Timer.New(function()
		local var_48_0 = pg.ChargeShipTalkInfo.Actions
		local var_48_1 = var_48_0[math.random(#var_48_0)]

		if arg_47_0:checkBuyDone(var_48_1.action) then
			arg_47_0:displayShipWord(nil, false, var_48_1.dialog_index)
		end
	end, 20, -1)

	arg_47_0.live2dTimer:Start()
end

function var_0_0.StopLive2dTimer(arg_49_0)
	if arg_49_0.live2dTimer then
		arg_49_0.live2dTimer:Stop()

		arg_49_0.live2dTimer = nil
	end
end

function var_0_0.ShowChargeWarp(arg_50_0, arg_50_1)
	setActive(arg_50_0.frame, arg_50_1)
	setActive(arg_50_0.viewContainer, arg_50_1)
	arg_50_0:ShowResourceBar(arg_50_1)

	local var_50_0 = arg_50_0.subViewList[arg_50_0.curSubViewNum]

	if var_50_0 then
		if arg_50_1 == false then
			var_50_0:Destroy()

			arg_50_0.curSubViewNum = 0
		else
			var_50_0:ShowPanel(arg_50_1)
		end
	end
end

function var_0_0.ShowResourceBar(arg_51_0, arg_51_1)
	if arg_51_0.resourceBarFlag == arg_51_1 then
		return
	end

	arg_51_0.resourceBarFlag = arg_51_1

	setActive(arg_51_0.resourcePanel, arg_51_1)
end

function var_0_0.willExit(arg_52_0)
	if arg_52_0.bulinTip then
		arg_52_0.bulinTip:Destroy()

		arg_52_0.bulinTip = nil
	end

	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_52_0.specialTip)
	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_52_0.giftTip)

	if arg_52_0.toggleMark then
		for iter_52_0, iter_52_1 in pairs(arg_52_0.toggleMark) do
			if iter_52_1 > 0 then
				local var_52_0 = switch(iter_52_0, {
					[ChargeScene.TYPE_PICK] = function()
						return "payshop_pack_red_dot"
					end,
					[ChargeScene.TYPE_GIFT] = function()
						return "gemshop_pack_red_dot"
					end
				})

				PlayerPrefs.SetInt(var_52_0, getGameset(var_52_0)[1])
			end
		end

		arg_52_0.toggleMark = nil
	end

	arg_52_0:ShowResourceBar()
	arg_52_0:unBlurView()

	if arg_52_0.chargeTipWindow then
		arg_52_0.chargeTipWindow:Destroy()

		arg_52_0.chargeTipWindow = nil
	end

	arg_52_0.contextData.singleWindow:Destroy()
	arg_52_0.contextData.multiWindow:Destroy()
	arg_52_0.contextData.singleWindowForESkin:Destroy()
	arg_52_0.contextData.paintingView:Dispose()

	arg_52_0.contextData.singleWindow = nil
	arg_52_0.contextData.multiWindow = nil
	arg_52_0.contextData.singleWindowForESkin = nil
	arg_52_0.contextData.paintingView = nil
	arg_52_0.bulinTip = nil

	for iter_52_2, iter_52_3 in pairs(arg_52_0.subViewList) do
		iter_52_3:Destroy()
	end

	arg_52_0.subViewList = nil

	if arg_52_0.heartsTimer then
		arg_52_0.heartsTimer:Stop()

		arg_52_0.heartsTimer = nil
	end

	if arg_52_0.live2dChar then
		arg_52_0.live2dChar:Dispose()
	end

	arg_52_0:StopLive2dTimer()
	arg_52_0:stopCV()

	if arg_52_0.giftShopView then
		arg_52_0.giftShopView:OnDestroy()
	end
end

function var_0_0.onBackPressed(arg_55_0)
	if arg_55_0.contextData.singleWindow:GetLoaded() and arg_55_0.contextData.singleWindow:isShowing() then
		arg_55_0.contextData.singleWindow:Close()

		return
	end

	if arg_55_0.contextData.multiWindow:GetLoaded() and arg_55_0.contextData.multiWindow:isShowing() then
		arg_55_0.contextData.multiWindow:Close()

		return
	end

	if arg_55_0.contextData.singleWindowForESkin:GetLoaded() and arg_55_0.contextData.singleWindowForESkin:isShowing() then
		arg_55_0.contextData.singleWindowForESkin:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_55_0)
end

function var_0_0.initSubView(arg_56_0)
	local var_56_0 = ChargeDiamondShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData)
	local var_56_1 = ChargeGiftShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData)
	local var_56_2 = ChargeItemShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData)
	local var_56_3 = ChargePickShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData)
	local var_56_4 = SupplyShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData, ShopConst.CATEGORY_MONTH)
	local var_56_5 = SupplyShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData, ShopConst.CATEGORY_SUPPLY)
	local var_56_6 = SupplyShopView.New(arg_56_0.viewContainer, arg_56_0.event, arg_56_0.contextData, ShopConst.CATEGORY_ACTIVITY)

	arg_56_0.curSubViewNum = 0
	arg_56_0.subViewList = {
		[ShopConst.SHOP_ID.DIAMOND] = var_56_0,
		[ShopConst.SHOP_ID.GIFT] = var_56_1,
		[ShopConst.SHOP_ID.ITEM] = var_56_2,
		[ShopConst.SHOP_ID.PICK] = var_56_3,
		[ShopConst.SHOP_ID.MONTH] = var_56_4,
		[ShopConst.SHOP_ID.SUPPLY] = var_56_5,
		[ShopConst.SHOP_ID.ACTIVITY] = var_56_6
	}

	for iter_56_0, iter_56_1 in pairs(arg_56_0.subViewList) do
		iter_56_1:RegisterView(arg_56_0)
	end

	arg_56_0.contextData.singleWindow = ShopSingleWindow.New(arg_56_0._tf, arg_56_0.event)
	arg_56_0.contextData.multiWindow = ShopMultiWindow.New(arg_56_0._tf, arg_56_0.event)
	arg_56_0.contextData.singleWindowForESkin = EquipmentSkinInfoUIForShopWindow.New(arg_56_0._tf, arg_56_0.event)
	arg_56_0.contextData.paintingView = ShopPaintingView.New(arg_56_0._tf:Find("frame/supplyPaint"), arg_56_0._tf:Find("frame/chat"))

	arg_56_0.contextData.paintingView:setSecretaryPos(arg_56_0._tf:Find("frame/secretaryPos"))
end

function var_0_0.GetShopID(arg_57_0, arg_57_1, arg_57_2)
	return ShopConst.SHOP_LIST[arg_57_1][arg_57_2]
end

function var_0_0.switchSubView(arg_58_0, arg_58_1)
	originalPrint(string.format("End: shopID=%s curShopID=%s", arg_58_1, arg_58_0.curSubViewNum))

	if arg_58_1 == arg_58_0.curSubViewNum then
		return
	end

	arg_58_0.subViewList[arg_58_1]:setGoodData(arg_58_0.firstChargeIds, arg_58_0.chargedList, arg_58_0.normalList, arg_58_0.normalGroupList)
	arg_58_0.subViewList[arg_58_1]:Reset()
	arg_58_0.subViewList[arg_58_1]:Load()

	if arg_58_0.subViewList[arg_58_1].SetAllShopData then
		arg_58_0.subViewList[arg_58_1]:ActionInvoke("SetAllShopData", arg_58_0.supplyShopList)
	end

	local var_58_0 = arg_58_0.subViewList[arg_58_0.curSubViewNum]

	if var_58_0 then
		var_58_0:Destroy()
	end

	arg_58_0.curSubViewNum = arg_58_1

	arg_58_0:SwitchPainting(arg_58_0.subViewList[arg_58_1]:IsSupplyShop())

	if PLATFORM_CODE == PLATFORM_JP then
		setActive(arg_58_0.userAgreeBtn3, arg_58_1 == ChargeScene.TYPE_DIAMOND)
		setActive(arg_58_0.userAgreeBtn4, arg_58_1 == ChargeScene.TYPE_DIAMOND)
	end
end

function var_0_0.SwitchPainting(arg_59_0, arg_59_1)
	arg_59_0.contextData.paintingView:Show(arg_59_1)
	setActive(arg_59_0.painting, not arg_59_1)

	if arg_59_1 then
		arg_59_0:StopLive2dTimer()

		arg_59_0.chatFlag = nil

		arg_59_0:stopCV()
		setActive(arg_59_0.stamp, getProxy(TaskProxy):mingshiTouchFlagEnabled())

		if LOCK_CLICK_MINGSHI then
			setActive(arg_59_0.stamp, false)
		end
	else
		setActive(arg_59_0.stamp, false)
		arg_59_0:AddLive2dTimer()
	end
end

function var_0_0.switchSubViewByTogger(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0.toggleList[arg_60_1]

	triggerToggle(var_60_0.go, true)
end

function var_0_0.updateCurSubView(arg_61_0)
	if not isActive(arg_61_0.viewContainer) then
		return
	end

	local var_61_0 = arg_61_0.subViewList[arg_61_0.curSubViewNum]

	if var_61_0 == nil then
		return
	end

	var_61_0:setGoodData(arg_61_0.firstChargeIds, arg_61_0.chargedList, arg_61_0.normalList, arg_61_0.normalGroupList)
	var_61_0:reUpdateAll()
end

function var_0_0.updateNoRes(arg_62_0, arg_62_1)
	if not arg_62_1 then
		arg_62_1 = arg_62_0.contextData.noRes
	else
		arg_62_0.contextData.noRes = arg_62_1
	end

	if not arg_62_1 or #arg_62_1 <= 0 then
		return
	end

	arg_62_0.contextData.noRes = {}

	local var_62_0 = getProxy(BagProxy):getData()
	local var_62_1 = ""

	for iter_62_0, iter_62_1 in ipairs(arg_62_1) do
		if iter_62_1[2] > 0 then
			if iter_62_1[1] == 59001 then
				arg_62_1[iter_62_0][2] = iter_62_1[3] - arg_62_0.player.gold
			else
				arg_62_1[iter_62_0][2] = iter_62_1[3] - (var_62_0[iter_62_1[1]] and var_62_0[iter_62_1[1]].count or 0)
			end
		end

		if arg_62_1[iter_62_0][2] > 0 then
			table.insert(arg_62_0.contextData.noRes, arg_62_1[iter_62_0])
		end
	end

	for iter_62_2, iter_62_3 in ipairs(arg_62_0.contextData.noRes) do
		local var_62_2 = Item.getConfigData(iter_62_3[1]).name

		var_62_1 = var_62_1 .. i18n(iter_62_3[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_62_2, iter_62_3[2])

		if iter_62_2 < #arg_62_0.contextData.noRes then
			var_62_1 = var_62_1 .. i18n("text_noRes_info_tip_link")
		end
	end

	if var_62_1 == "" then
		arg_62_0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
	else
		arg_62_0:displayShipWord(i18n("text_shop_noRes_tip", var_62_1), true)
	end
end

function var_0_0.displayShipWord(arg_63_0, arg_63_1, arg_63_2, arg_63_3)
	if not arg_63_0.chatFlag then
		if not arg_63_1 and arg_63_0.contextData.noRes and #arg_63_0.contextData.noRes > 0 then
			setActive(arg_63_0.chat, false)

			arg_63_0.chat.transform.localScale = Vector3(0, 0, 1)
		end

		arg_63_0.chatFlag = true

		if not arg_63_0.isInitChatPosition then
			arg_63_0.isInitChatPosition = true

			arg_63_0:InitChatPosition()
		end

		setActive(arg_63_0.chat, true)

		local var_63_0 = arg_63_0.player:getChargeLevel()
		local var_63_1 = arg_63_3 or math.random(1, var_63_0)
		local var_63_2

		if arg_63_3 then
			var_63_2 = pg.pay_level_award[var_63_1].dialog
		else
			var_63_2 = arg_63_1 or pg.pay_level_award[var_63_1].dialog
		end

		if not arg_63_1 then
			arg_63_0:playCV(var_63_1)
		end

		setText(arg_63_0.chatText, var_63_2)

		local var_63_3 = arg_63_0.chatText:GetComponent(typeof(Text))

		;(function()
			local var_64_0 = 3
			local var_64_1 = 0.3

			LeanTween.scale(rtf(arg_63_0.chat.gameObject), Vector3.New(1, 1, 1), var_64_1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				if not arg_63_2 then
					LeanTween.scale(rtf(arg_63_0.chat.gameObject), Vector3.New(0, 0, 1), var_64_1):setEase(LeanTweenType.easeInBack):setDelay(var_64_1 + var_64_0):setOnComplete(System.Action(function()
						arg_63_0.chatFlag = nil

						setActive(arg_63_0.chat, false)

						if arg_63_0.contextData.noRes and #arg_63_0.contextData.noRes > 0 then
							arg_63_0:updateNoRes()
						end
					end))
				else
					arg_63_0.chatFlag = nil
				end
			end))
		end)()
	end
end

function var_0_0.InitChatPosition(arg_67_0)
	return
end

function var_0_0.playHeartEffect(arg_68_0)
	if arg_68_0.heartsTimer then
		arg_68_0.heartsTimer:Stop()
	end

	local var_68_0 = arg_68_0.painting:Find("heartsfly")

	setActive(var_68_0, true)

	arg_68_0.heartsTimer = Timer.New(function()
		setActive(var_68_0, false)
	end, 1, 1)

	arg_68_0.heartsTimer:Start()
end

function var_0_0.createLive2D(arg_70_0)
	local var_70_0 = Live2D.GenerateData({
		ship = Ship.New({
			configId = 312011
		}),
		offset = {
			0,
			0,
			0,
			75
		},
		position = Vector3(0, 0, 0),
		parent = arg_70_0._tf:Find("frame/painting/live2d")
	})

	arg_70_0.live2dChar = Live2D.New(var_70_0, function(arg_71_0)
		arg_71_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
	end)
end

function var_0_0.checkBuyDone(arg_72_0, arg_72_1)
	if not arg_72_0.live2dChar or not arg_72_0.live2dChar:IsLoaded() then
		return
	end

	local var_72_0

	if type(arg_72_1) == "string" then
		if arg_72_1 == "damonds" then
			var_72_0 = "diamond"
		else
			var_72_0 = arg_72_1
		end
	else
		local var_72_1 = pg.shop_template[arg_72_1]

		if var_72_1 and var_72_1.effect_args and type(var_72_1.effect_args) == "table" then
			for iter_72_0, iter_72_1 in ipairs(var_72_1.effect_args) do
				if iter_72_1 == 1 then
					var_72_0 = "gold"
				end
			end
		end
	end

	local var_72_2 = arg_72_0.preAniName == "gold" or arg_72_0.preAniName == "diamond"
	local var_72_3 = var_72_0 == "gold" or var_72_0 == "diamond"
	local var_72_4 = var_72_2 and var_72_3 or not var_72_2

	var_72_4 = var_72_0 and arg_72_0.preAniName ~= var_72_0 and var_72_4

	if var_72_4 then
		arg_72_0.preAniName = var_72_0

		arg_72_0.live2dChar:TriggerAction(var_72_0, nil, true)
	end

	return var_72_4
end

function var_0_0.playCV(arg_73_0, arg_73_1)
	local var_73_0 = pg.pay_level_award[arg_73_1]
	local var_73_1

	if var_73_0 and var_73_0.cv_key ~= "" then
		var_73_1 = "event:/cv/chargeShop/" .. var_73_0.cv_key
	end

	if var_73_1 then
		arg_73_0:stopCV()

		arg_73_0._currentVoice = var_73_1

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_73_1)
	end
end

function var_0_0.stopCV(arg_74_0)
	if arg_74_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_74_0._currentVoice)
	end

	arg_74_0._currentVoice = nil
end

function var_0_0.blurView(arg_75_0)
	arg_75_0:OverlayPanel(arg_75_0.buttonList, {
		pbList = {
			arg_75_0.buttonList:Find("leftBg")
		}
	})
end

function var_0_0.unBlurView(arg_76_0)
	arg_76_0:UnOverlayPanel(arg_76_0.buttonList, arg_76_0._tf)
end

function var_0_0.jpUIInit(arg_77_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	arg_77_0.userAgreeBtn3 = arg_77_0._tf:Find("frame/raw1Btn")
	arg_77_0.userAgreeBtn4 = arg_77_0._tf:Find("frame/raw2Btn")
end

function var_0_0.jpUIEnter(arg_78_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	onButton(arg_78_0, arg_78_0.userAgreeBtn3, function()
		local var_79_0 = require("ShareCfg.UserAgreement3")

		arg_78_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_79_0 or "")
	end, SFX_PANEL)
	onButton(arg_78_0, arg_78_0.userAgreeBtn4, function()
		local var_80_0 = require("ShareCfg.UserAgreement4")

		arg_78_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_80_0 or "")
	end, SFX_PANEL)
end

function var_0_0.addRefreshTimer(arg_81_0, arg_81_1)
	local function var_81_0()
		if arg_81_0.refreshTimer then
			arg_81_0.refreshTimer:Stop()

			arg_81_0.refreshTimer = nil
		end
	end

	var_81_0()

	arg_81_0.refreshTimer = Timer.New(function()
		if arg_81_1 + 1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			var_81_0()
			arg_81_0:emit(NewShopMainMediator.GET_CHARGE_LIST)
		end
	end, 1, -1)

	arg_81_0.refreshTimer:Start()
	arg_81_0.refreshTimer.func()
end

return var_0_0

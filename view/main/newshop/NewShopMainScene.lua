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
	arg_4_0.giftTip = var_4_0:Find("shop1List/specialShop/shop1Tg/tip")
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
end

function var_0_0.setPlayer(arg_5_0, arg_5_1)
	arg_5_0.player = arg_5_1

	if arg_5_0.subViewList[arg_5_0.curSubViewNum] and arg_5_0.subViewList[arg_5_0.curSubViewNum]:IsSupplyShop() then
		arg_5_0.subViewList[arg_5_0.curSubViewNum]:SetPlayer(arg_5_1)
	end

	if arg_5_0.goldMax then
		PlayerResUI.StaticFlush(arg_5_0.player, arg_5_0.goldMax, arg_5_0.goldText, arg_5_0.oilMax, arg_5_0.oilText, arg_5_0.diamondText)
	end
end

function var_0_0.setFirstChargeIds(arg_6_0, arg_6_1)
	arg_6_0.firstChargeIds = arg_6_1
end

function var_0_0.setChargedList(arg_7_0, arg_7_1)
	arg_7_0.chargedList = arg_7_1
end

function var_0_0.setNormalList(arg_8_0, arg_8_1)
	arg_8_0.normalList = arg_8_1
end

function var_0_0.setNormalGroupList(arg_9_0, arg_9_1)
	arg_9_0.normalGroupList = arg_9_1

	arg_9_0:addRefreshTimer(GetZeroTime())
end

function var_0_0.SetSupplyShopList(arg_10_0, arg_10_1)
	arg_10_0.supplyShopList = arg_10_1

	arg_10_0:SortActivityShops()
end

function var_0_0.SortActivityShops(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.supplyShopList) do
		if #iter_11_1 > 1 then
			table.sort(iter_11_1, function(arg_12_0, arg_12_1)
				return arg_12_0:getStartTime() > arg_12_1:getStartTime()
			end)
		end
	end
end

function var_0_0.OnInitItems(arg_13_0, arg_13_1)
	arg_13_0.items = arg_13_1

	arg_13_0.subViewList[ShopConst.SHOP_ID.MONTH]:OnUpdateItems(arg_13_1)
	arg_13_0.subViewList[ShopConst.SHOP_ID.SUPPLY]:OnUpdateItems(arg_13_1)
	arg_13_0.subViewList[ShopConst.SHOP_ID.ACTIVITY]:OnUpdateItems(arg_13_1)
end

function var_0_0.OnUpdateItems(arg_14_0, arg_14_1)
	arg_14_0.items = arg_14_1

	if arg_14_0.subViewList[arg_14_0.curSubViewNum] and arg_14_0.subViewList[arg_14_0.curSubViewNum]:IsSupplyShop() then
		arg_14_0.subViewList[arg_14_0.curSubViewNum]:OnUpdateItems(arg_14_1)
	end
end

function var_0_0.OnUpdateShop(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:SetShop(arg_15_1, arg_15_2)

	if arg_15_0.subViewList[arg_15_0.curSubViewNum] and arg_15_0.subViewList[arg_15_0.curSubViewNum]:IsSupplyShop() then
		arg_15_0.subViewList[arg_15_0.curSubViewNum]:OnUpdateShop(arg_15_1, arg_15_2)
	end
end

function var_0_0.OnUpdateCommodity(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	arg_16_0:SetShop(arg_16_1, arg_16_2)

	if arg_16_0.subViewList[arg_16_0.curSubViewNum] and arg_16_0.subViewList[arg_16_0.curSubViewNum]:IsSupplyShop() then
		arg_16_0.subViewList[arg_16_0.curSubViewNum]:OnUpdateCommodity(arg_16_1, arg_16_2, arg_16_3)
	end
end

function var_0_0.OnFragmentSellUpdate(arg_17_0)
	if arg_17_0.subViewList[arg_17_0.curSubViewNum] and arg_17_0.subViewList[arg_17_0.curSubViewNum]:IsSupplyShop() then
		arg_17_0.subViewList[arg_17_0.curSubViewNum]:OnFragmentSellUpdate()
	end
end

function var_0_0.SetShop(arg_18_0, arg_18_1, arg_18_2)
	if not arg_18_0.supplyShopList then
		return
	end

	local var_18_0 = arg_18_0.supplyShopList[arg_18_1]

	if var_18_0 then
		for iter_18_0, iter_18_1 in ipairs(var_18_0) do
			if iter_18_1:IsSameKind(arg_18_2) then
				arg_18_0.supplyShopList[arg_18_1][iter_18_0] = arg_18_2

				break
			end
		end
	end
end

function var_0_0.didEnter(arg_19_0)
	setActive(arg_19_0.chat, false)
	onButton(arg_19_0, arg_19_0.backBtn, function()
		arg_19_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0.homeBtn, function()
		arg_19_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0.goldBtn, function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.oilBtn, function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.diamondBtn, function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	onToggle(arg_19_0, arg_19_0.buttonList:Find("shop1List/recommendation/shop1Tg"), function(arg_25_0)
		if arg_25_0 then
			arg_19_0.contextData.shop1 = nil
			arg_19_0.contextData.shop2 = nil

			if arg_19_0.shop1 == "recommendation" then
				return
			end

			arg_19_0.shop1 = "recommendation"
			arg_19_0.shop2 = nil

			arg_19_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_19_0:emit(NewShopMainMediator.OPEN_LAYER, NewRecommendationShopLayer, NewRecommendationShopMediator)
		end
	end, SFX_PANEL)

	local var_19_0 = getProxy(ShipSkinProxy):GetInTimeSkins()

	setActive(arg_19_0.buttonList:Find("shop1List/skinShop/shop1Tg/timeLimit"), #var_19_0 > 0)
	setActive(arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/newSkin"), #var_19_0 > 0)
	onToggle(arg_19_0, arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/newSkin"), function(arg_26_0)
		if arg_26_0 then
			arg_19_0.contextData.shop2 = "newSkin"

			if arg_19_0.shop2 == "newSkin" then
				return
			end

			arg_19_0.shop2 = "newSkin"

			arg_19_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_19_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
				type = "newSkin",
				mode = arg_19_0.contextData.mode
			})
		end
	end, SFX_PANEL)
	onToggle(arg_19_0, arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/permanentSkin"), function(arg_27_0)
		if arg_27_0 then
			arg_19_0.contextData.shop2 = "permanentSkin"

			if arg_19_0.shop2 == "permanentSkin" then
				return
			end

			arg_19_0.shop2 = "permanentSkin"

			arg_19_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_19_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
				type = "permanentSkin",
				mode = arg_19_0.contextData.mode
			})
		end
	end, SFX_PANEL)
	onToggle(arg_19_0, arg_19_0.buttonList:Find("shop1List/skinShop/shop1Tg"), function(arg_28_0)
		setActive(arg_19_0.buttonList:Find("shop1List/skinShop/shop2List"), arg_28_0)

		if arg_28_0 then
			if arg_19_0.shop1 == "skinShop" then
				return
			end

			arg_19_0.shop1 = "skinShop"

			if arg_19_0.contextData.shop1 and arg_19_0.contextData.shop2 then
				triggerToggle(arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/" .. arg_19_0.contextData.shop2), true)
			else
				arg_19_0.contextData.shop1 = "skinShop"

				triggerToggle(arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/" .. (#var_19_0 > 0 and "newSkin" or "permanentSkin")), true)
			end
		end
	end, SFX_PANEL)

	for iter_19_0 = 1, #arg_19_0.toggleList do
		local var_19_1 = arg_19_0.toggleList[iter_19_0]

		onToggle(arg_19_0, var_19_1.go, function(arg_29_0)
			if arg_29_0 then
				arg_19_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_19_0.contextData.shop1 = nil
				arg_19_0.contextData.shop2 = nil
				arg_19_0.shop1 = nil
				arg_19_0.shop2 = nil

				originalPrint(string.format("Begin: toggleType=%s, goName=%s", var_19_1.type, var_19_1.go.parent.name))

				arg_19_0.contextData.type = ShopConst.SHOP_TYPE.CHARGE
				arg_19_0.contextData.warp = var_19_1.type

				originalPrint(string.format("End: warp=%s", arg_19_0.contextData.warp))

				local var_29_0 = arg_19_0:GetShopID(ShopConst.SHOP_TYPE.CHARGE, var_19_1.type)

				arg_19_0:switchSubView(var_29_0)
			end
		end, SFX_PANEL)
	end

	onToggle(arg_19_0, arg_19_0.buttonList:Find("shop1List/supplyShop/shop1Tg"), function(arg_30_0)
		setActive(arg_19_0.buttonList:Find("shop1List/supplyShop/shop2List"), arg_30_0)

		if arg_30_0 then
			triggerToggle(arg_19_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_19_0:GetDefaultSupplyShopName()), true)
		end
	end, SFX_PANEL)

	local var_19_2 = {
		{
			type = ShopConst.CATEGORY_MONTH,
			go = arg_19_0.buttonList:Find("shop1List/supplyShop/shop2List/monthShop")
		},
		{
			type = ShopConst.CATEGORY_SUPPLY,
			go = arg_19_0.buttonList:Find("shop1List/supplyShop/shop2List/supplyShop")
		},
		{
			type = ShopConst.CATEGORY_ACTIVITY,
			go = arg_19_0.buttonList:Find("shop1List/supplyShop/shop2List/activityShop")
		}
	}

	for iter_19_1, iter_19_2 in ipairs(var_19_2) do
		onToggle(arg_19_0, iter_19_2.go, function(arg_31_0)
			if arg_31_0 then
				arg_19_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_19_0.contextData.shop1 = nil
				arg_19_0.contextData.shop2 = nil
				arg_19_0.shop1 = nil
				arg_19_0.shop2 = nil
				arg_19_0.contextData.type = ShopConst.SHOP_TYPE.SUPPLY
				arg_19_0.contextData.warp = iter_19_2.type

				local var_31_0 = arg_19_0:GetShopID(ShopConst.SHOP_TYPE.SUPPLY, iter_19_2.type)

				arg_19_0:switchSubView(var_31_0)
			end
		end, SFX_PANEL)
	end

	local var_19_3 = "recommendation"

	if arg_19_0.contextData.type == ShopConst.SHOP_TYPE.CHARGE then
		if arg_19_0.contextData.warp == ChargeScene.TYPE_DIAMOND then
			var_19_3 = "diamondShop"
		elseif arg_19_0.contextData.warp == ChargeScene.TYPE_GIFT then
			var_19_3 = "giftPackShop"
		elseif arg_19_0.contextData.warp == ChargeScene.TYPE_ITEM then
			var_19_3 = "functionalItemShop"
		elseif arg_19_0.contextData.warp == ChargeScene.TYPE_PICK then
			var_19_3 = "specialShop"
		else
			var_19_3 = "diamondShop"
		end
	elseif arg_19_0.contextData.type == ShopConst.SHOP_TYPE.SKIN then
		var_19_3 = "skinShop"
	elseif arg_19_0.contextData.type == ShopConst.SHOP_TYPE.SUPPLY then
		var_19_3 = "supplyShop"
	end

	if arg_19_0.contextData.shop1 then
		var_19_3 = arg_19_0.contextData.shop1
	end

	triggerToggle(arg_19_0.buttonList:Find("shop1List/" .. var_19_3 .. "/shop1Tg"), true)

	if var_19_3 == "skinShop" then
		-- block empty
	elseif var_19_3 == "supplyShop" then
		triggerToggle(arg_19_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_19_0:GetDefaultSupplyShopName()), true)
	end

	onButton(arg_19_0, arg_19_0.painting, function()
		arg_19_0:displayShipWord()
		arg_19_0:emit(NewShopMainMediator.CLICK_MING_SHI)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.stamp, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(4)
	end, SFX_CONFIRM)
	arg_19_0:RefreshActivityShop()
	arg_19_0:updateNoRes()
	arg_19_0:jpUIEnter()
end

function var_0_0.GetDefaultSupplyShopName(arg_34_0)
	if arg_34_0.contextData.type ~= ShopConst.SHOP_TYPE.SUPPLY then
		return "supplyShop"
	end

	local var_34_0 = arg_34_0.contextData.warp

	if type(var_34_0) == "string" then
		local var_34_1 = ShopConst.SHOP_NAME_LIST[var_34_0]

		arg_34_0.contextData.warp = var_34_1[1]
		arg_34_0.contextData.shopID = var_34_1[2]
	elseif type(var_34_0) == "number" and arg_34_0.contextData.shopID == nil then
		for iter_34_0, iter_34_1 in pairs(ShopConst.SUPPLY_SHOP_LIST) do
			for iter_34_2, iter_34_3 in pairs(iter_34_1) do
				if iter_34_3 == var_34_0 then
					arg_34_0.contextData.warp = iter_34_0
					arg_34_0.contextData.shopID = iter_34_3

					break
				end
			end
		end
	end

	local var_34_2 = ""

	return arg_34_0.contextData.warp == ShopConst.CATEGORY_MONTH and "monthShop" or arg_34_0.contextData.warp == ShopConst.CATEGORY_SUPPLY and "supplyShop" or arg_34_0.contextData.warp == ShopConst.CATEGORY_ACTIVITY and "activityShop" or "supplyShop"
end

function var_0_0.RefreshActivityShop(arg_35_0)
	local var_35_0 = arg_35_0.supplyShopList[ShopConst.TYPE_ACTIVITY] or {}

	setActive(arg_35_0.buttonList:Find("shop1List/supplyShop/shop2List/activityShop"), #var_35_0 > 0)
end

function var_0_0.ShowOrHideUI(arg_36_0, arg_36_1)
	arg_36_0:setVisible(arg_36_1)
	setActive(arg_36_0.buttonList, arg_36_1)
end

function var_0_0.ShowOrHideUI2(arg_37_0, arg_37_1)
	for iter_37_0 = 0, arg_37_0._tf.childCount - 1 do
		setActive(arg_37_0._tf:GetChild(iter_37_0), arg_37_1)
	end

	setActive(arg_37_0.buttonList:Find("leftBg"), arg_37_1)
	setActive(arg_37_0.buttonList:Find("shop1List"), arg_37_1)
	setActive(arg_37_0.buttonList:Find("top"), true)
end

function var_0_0.OnChargeSuccess(arg_38_0, arg_38_1)
	arg_38_0.chargeTipWindow:ExecuteAction("Show", arg_38_1)
end

function var_0_0.LoadMingshi(arg_39_0)
	if Live2dConst.GetLive2DArm32MatchAble() then
		local var_39_0 = Ship.New({
			configId = 312011
		}):getPainting()

		LoadPaintingPrefabAsync(arg_39_0.painting, var_39_0, var_39_0, "mainNormal", function()
			arg_39_0.loading = false
		end)
	else
		arg_39_0:createLive2D()
	end

	arg_39_0:AddLive2dTimer()
end

function var_0_0.AddLive2dTimer(arg_41_0)
	arg_41_0:StopLive2dTimer()

	arg_41_0.live2dTimer = Timer.New(function()
		local var_42_0 = pg.ChargeShipTalkInfo.Actions
		local var_42_1 = var_42_0[math.random(#var_42_0)]

		if arg_41_0:checkBuyDone(var_42_1.action) then
			arg_41_0:displayShipWord(nil, false, var_42_1.dialog_index)
		end
	end, 20, -1)

	arg_41_0.live2dTimer:Start()
end

function var_0_0.StopLive2dTimer(arg_43_0)
	if arg_43_0.live2dTimer then
		arg_43_0.live2dTimer:Stop()

		arg_43_0.live2dTimer = nil
	end
end

function var_0_0.ShowChargeWarp(arg_44_0, arg_44_1)
	setActive(arg_44_0.frame, arg_44_1)
	setActive(arg_44_0.viewContainer, arg_44_1)
	arg_44_0:ShowResourceBar(arg_44_1)

	local var_44_0 = arg_44_0.subViewList[arg_44_0.curSubViewNum]

	if var_44_0 then
		var_44_0:ShowPanel(arg_44_1)
	end
end

function var_0_0.ShowResourceBar(arg_45_0, arg_45_1)
	if arg_45_0.resourceBarFlag == arg_45_1 then
		return
	end

	arg_45_0.resourceBarFlag = arg_45_1

	setActive(arg_45_0.resourcePanel, arg_45_1)
end

function var_0_0.willExit(arg_46_0)
	arg_46_0:ShowResourceBar()
	arg_46_0:unBlurView()

	if arg_46_0.chargeTipWindow then
		arg_46_0.chargeTipWindow:Destroy()

		arg_46_0.chargeTipWindow = nil
	end

	arg_46_0.contextData.singleWindow:Destroy()
	arg_46_0.contextData.multiWindow:Destroy()
	arg_46_0.contextData.singleWindowForESkin:Destroy()
	arg_46_0.contextData.paintingView:Dispose()

	arg_46_0.contextData.singleWindow = nil
	arg_46_0.contextData.multiWindow = nil
	arg_46_0.contextData.singleWindowForESkin = nil
	arg_46_0.contextData.paintingView = nil

	for iter_46_0, iter_46_1 in pairs(arg_46_0.subViewList) do
		iter_46_1:Destroy()
	end

	arg_46_0.subViewList = nil

	if arg_46_0.heartsTimer then
		arg_46_0.heartsTimer:Stop()

		arg_46_0.heartsTimer = nil
	end

	if arg_46_0.live2dChar then
		arg_46_0.live2dChar:Dispose()
	end

	arg_46_0:StopLive2dTimer()
	arg_46_0:stopCV()

	if arg_46_0.giftShopView then
		arg_46_0.giftShopView:OnDestroy()
	end
end

function var_0_0.onBackPressed(arg_47_0)
	if arg_47_0.contextData.singleWindow:GetLoaded() and arg_47_0.contextData.singleWindow:isShowing() then
		arg_47_0.contextData.singleWindow:Close()

		return
	end

	if arg_47_0.contextData.multiWindow:GetLoaded() and arg_47_0.contextData.multiWindow:isShowing() then
		arg_47_0.contextData.multiWindow:Close()

		return
	end

	if arg_47_0.contextData.singleWindowForESkin:GetLoaded() and arg_47_0.contextData.singleWindowForESkin:isShowing() then
		arg_47_0.contextData.singleWindowForESkin:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_47_0)
end

function var_0_0.initSubView(arg_48_0)
	local var_48_0 = ChargeDiamondShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData)
	local var_48_1 = ChargeGiftShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData)
	local var_48_2 = ChargeItemShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData)
	local var_48_3 = ChargePickShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData)
	local var_48_4 = SupplyShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData, ShopConst.CATEGORY_MONTH)
	local var_48_5 = SupplyShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData, ShopConst.CATEGORY_SUPPLY)
	local var_48_6 = SupplyShopView.New(arg_48_0.viewContainer, arg_48_0.event, arg_48_0.contextData, ShopConst.CATEGORY_ACTIVITY)

	arg_48_0.curSubViewNum = 0
	arg_48_0.subViewList = {
		[ShopConst.SHOP_ID.DIAMOND] = var_48_0,
		[ShopConst.SHOP_ID.GIFT] = var_48_1,
		[ShopConst.SHOP_ID.ITEM] = var_48_2,
		[ShopConst.SHOP_ID.PICK] = var_48_3,
		[ShopConst.SHOP_ID.MONTH] = var_48_4,
		[ShopConst.SHOP_ID.SUPPLY] = var_48_5,
		[ShopConst.SHOP_ID.ACTIVITY] = var_48_6
	}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.subViewList) do
		iter_48_1:RegisterView(arg_48_0)
	end

	arg_48_0.contextData.singleWindow = ShopSingleWindow.New(arg_48_0._tf, arg_48_0.event)
	arg_48_0.contextData.multiWindow = ShopMultiWindow.New(arg_48_0._tf, arg_48_0.event)
	arg_48_0.contextData.singleWindowForESkin = EquipmentSkinInfoUIForShopWindow.New(arg_48_0._tf, arg_48_0.event)
	arg_48_0.contextData.paintingView = ShopPaintingView.New(arg_48_0._tf:Find("frame/supplyPaint"), arg_48_0._tf:Find("frame/chat"))

	arg_48_0.contextData.paintingView:setSecretaryPos(arg_48_0._tf:Find("frame/secretaryPos"))
end

function var_0_0.GetShopID(arg_49_0, arg_49_1, arg_49_2)
	return ShopConst.SHOP_LIST[arg_49_1][arg_49_2]
end

function var_0_0.switchSubView(arg_50_0, arg_50_1)
	originalPrint(string.format("End: shopID=%s curShopID=%s", arg_50_1, arg_50_0.curSubViewNum))

	if arg_50_1 == arg_50_0.curSubViewNum then
		return
	end

	arg_50_0.subViewList[arg_50_1]:setGoodData(arg_50_0.firstChargeIds, arg_50_0.chargedList, arg_50_0.normalList, arg_50_0.normalGroupList)
	arg_50_0.subViewList[arg_50_1]:Reset()
	arg_50_0.subViewList[arg_50_1]:Load()

	if arg_50_0.subViewList[arg_50_1].SetAllShopData then
		arg_50_0.subViewList[arg_50_1]:ActionInvoke("SetAllShopData", arg_50_0.supplyShopList)
	end

	local var_50_0 = arg_50_0.subViewList[arg_50_0.curSubViewNum]

	if var_50_0 then
		var_50_0:Destroy()
	end

	arg_50_0.curSubViewNum = arg_50_1

	arg_50_0:SwitchPainting(arg_50_0.subViewList[arg_50_1]:IsSupplyShop())

	if PLATFORM_CODE == PLATFORM_JP then
		setActive(arg_50_0.userAgreeBtn3, arg_50_1 == ChargeScene.TYPE_DIAMOND)
		setActive(arg_50_0.userAgreeBtn4, arg_50_1 == ChargeScene.TYPE_DIAMOND)
	end
end

function var_0_0.SwitchPainting(arg_51_0, arg_51_1)
	arg_51_0.contextData.paintingView:Show(arg_51_1)
	setActive(arg_51_0.painting, not arg_51_1)

	if arg_51_1 then
		arg_51_0:StopLive2dTimer()

		arg_51_0.chatFlag = nil

		arg_51_0:stopCV()
		setActive(arg_51_0.stamp, getProxy(TaskProxy):mingshiTouchFlagEnabled())

		if LOCK_CLICK_MINGSHI then
			setActive(arg_51_0.stamp, false)
		end
	else
		setActive(arg_51_0.stamp, false)
		arg_51_0:AddLive2dTimer()
	end
end

function var_0_0.switchSubViewByTogger(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_0.toggleList[arg_52_1]

	triggerToggle(var_52_0.go, true)
end

function var_0_0.updateCurSubView(arg_53_0)
	local var_53_0 = arg_53_0.subViewList[arg_53_0.curSubViewNum]

	if var_53_0 == nil then
		return
	end

	var_53_0:setGoodData(arg_53_0.firstChargeIds, arg_53_0.chargedList, arg_53_0.normalList, arg_53_0.normalGroupList)
	var_53_0:reUpdateAll()
end

function var_0_0.updateNoRes(arg_54_0, arg_54_1)
	if not arg_54_1 then
		arg_54_1 = arg_54_0.contextData.noRes
	else
		arg_54_0.contextData.noRes = arg_54_1
	end

	if not arg_54_1 or #arg_54_1 <= 0 then
		return
	end

	arg_54_0.contextData.noRes = {}

	local var_54_0 = getProxy(BagProxy):getData()
	local var_54_1 = ""

	for iter_54_0, iter_54_1 in ipairs(arg_54_1) do
		if iter_54_1[2] > 0 then
			if iter_54_1[1] == 59001 then
				arg_54_1[iter_54_0][2] = iter_54_1[3] - arg_54_0.player.gold
			else
				arg_54_1[iter_54_0][2] = iter_54_1[3] - (var_54_0[iter_54_1[1]] and var_54_0[iter_54_1[1]].count or 0)
			end
		end

		if arg_54_1[iter_54_0][2] > 0 then
			table.insert(arg_54_0.contextData.noRes, arg_54_1[iter_54_0])
		end
	end

	for iter_54_2, iter_54_3 in ipairs(arg_54_0.contextData.noRes) do
		local var_54_2 = Item.getConfigData(iter_54_3[1]).name

		var_54_1 = var_54_1 .. i18n(iter_54_3[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_54_2, iter_54_3[2])

		if iter_54_2 < #arg_54_0.contextData.noRes then
			var_54_1 = var_54_1 .. i18n("text_noRes_info_tip_link")
		end
	end

	if var_54_1 == "" then
		arg_54_0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
	else
		arg_54_0:displayShipWord(i18n("text_shop_noRes_tip", var_54_1), true)
	end
end

function var_0_0.displayShipWord(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	if not arg_55_0.chatFlag then
		if not arg_55_1 and arg_55_0.contextData.noRes and #arg_55_0.contextData.noRes > 0 then
			setActive(arg_55_0.chat, false)

			arg_55_0.chat.transform.localScale = Vector3(0, 0, 1)
		end

		arg_55_0.chatFlag = true

		if not arg_55_0.isInitChatPosition then
			arg_55_0.isInitChatPosition = true

			arg_55_0:InitChatPosition()
		end

		setActive(arg_55_0.chat, true)

		local var_55_0 = arg_55_0.player:getChargeLevel()
		local var_55_1 = arg_55_3 or math.random(1, var_55_0)
		local var_55_2

		if arg_55_3 then
			var_55_2 = pg.pay_level_award[var_55_1].dialog
		else
			var_55_2 = arg_55_1 or pg.pay_level_award[var_55_1].dialog
		end

		if not arg_55_1 then
			arg_55_0:playCV(var_55_1)
		end

		setText(arg_55_0.chatText, var_55_2)

		local var_55_3 = arg_55_0.chatText:GetComponent(typeof(Text))

		;(function()
			local var_56_0 = 3
			local var_56_1 = 0.3

			LeanTween.scale(rtf(arg_55_0.chat.gameObject), Vector3.New(1, 1, 1), var_56_1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				if not arg_55_2 then
					LeanTween.scale(rtf(arg_55_0.chat.gameObject), Vector3.New(0, 0, 1), var_56_1):setEase(LeanTweenType.easeInBack):setDelay(var_56_1 + var_56_0):setOnComplete(System.Action(function()
						arg_55_0.chatFlag = nil

						setActive(arg_55_0.chat, false)

						if arg_55_0.contextData.noRes and #arg_55_0.contextData.noRes > 0 then
							arg_55_0:updateNoRes()
						end
					end))
				else
					arg_55_0.chatFlag = nil
				end
			end))
		end)()
	end
end

function var_0_0.InitChatPosition(arg_59_0)
	return
end

function var_0_0.playHeartEffect(arg_60_0)
	if arg_60_0.heartsTimer then
		arg_60_0.heartsTimer:Stop()
	end

	local var_60_0 = arg_60_0.painting:Find("heartsfly")

	setActive(var_60_0, true)

	arg_60_0.heartsTimer = Timer.New(function()
		setActive(var_60_0, false)
	end, 1, 1)

	arg_60_0.heartsTimer:Start()
end

function var_0_0.createLive2D(arg_62_0)
	local var_62_0 = Live2D.GenerateData({
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
		parent = arg_62_0._tf:Find("frame/painting/live2d")
	})

	arg_62_0.live2dChar = Live2D.New(var_62_0, function(arg_63_0)
		arg_63_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
	end)
end

function var_0_0.checkBuyDone(arg_64_0, arg_64_1)
	if not arg_64_0.live2dChar or not arg_64_0.live2dChar:IsLoaded() then
		return
	end

	local var_64_0

	if type(arg_64_1) == "string" then
		if arg_64_1 == "damonds" then
			var_64_0 = "diamond"
		else
			var_64_0 = arg_64_1
		end
	else
		local var_64_1 = pg.shop_template[arg_64_1]

		if var_64_1 and var_64_1.effect_args and type(var_64_1.effect_args) == "table" then
			for iter_64_0, iter_64_1 in ipairs(var_64_1.effect_args) do
				if iter_64_1 == 1 then
					var_64_0 = "gold"
				end
			end
		end
	end

	local var_64_2 = arg_64_0.preAniName == "gold" or arg_64_0.preAniName == "diamond"
	local var_64_3 = var_64_0 == "gold" or var_64_0 == "diamond"
	local var_64_4 = var_64_2 and var_64_3 or not var_64_2

	var_64_4 = var_64_0 and arg_64_0.preAniName ~= var_64_0 and var_64_4

	if var_64_4 then
		arg_64_0.preAniName = var_64_0

		arg_64_0.live2dChar:TriggerAction(var_64_0, nil, true)
	end

	return var_64_4
end

function var_0_0.playCV(arg_65_0, arg_65_1)
	local var_65_0 = pg.pay_level_award[arg_65_1]
	local var_65_1

	if var_65_0 and var_65_0.cv_key ~= "" then
		var_65_1 = "event:/cv/chargeShop/" .. var_65_0.cv_key
	end

	if var_65_1 then
		arg_65_0:stopCV()

		arg_65_0._currentVoice = var_65_1

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_65_1)
	end
end

function var_0_0.stopCV(arg_66_0)
	if arg_66_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_66_0._currentVoice)
	end

	arg_66_0._currentVoice = nil
end

function var_0_0.blurView(arg_67_0)
	arg_67_0:OverlayPanel(arg_67_0.buttonList, {
		pbList = {
			arg_67_0.buttonList:Find("leftBg")
		}
	})
end

function var_0_0.unBlurView(arg_68_0)
	arg_68_0:UnOverlayPanel(arg_68_0.buttonList, arg_68_0._tf)
end

function var_0_0.jpUIInit(arg_69_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	arg_69_0.userAgreeBtn3 = arg_69_0._tf:Find("frame/raw1Btn")
	arg_69_0.userAgreeBtn4 = arg_69_0._tf:Find("frame/raw2Btn")
end

function var_0_0.jpUIEnter(arg_70_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	onButton(arg_70_0, arg_70_0.userAgreeBtn3, function()
		local var_71_0 = require("ShareCfg.UserAgreement3")

		arg_70_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_71_0 or "")
	end, SFX_PANEL)
	onButton(arg_70_0, arg_70_0.userAgreeBtn4, function()
		local var_72_0 = require("ShareCfg.UserAgreement4")

		arg_70_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_72_0 or "")
	end, SFX_PANEL)
end

function var_0_0.addRefreshTimer(arg_73_0, arg_73_1)
	local function var_73_0()
		if arg_73_0.refreshTimer then
			arg_73_0.refreshTimer:Stop()

			arg_73_0.refreshTimer = nil
		end
	end

	var_73_0()

	arg_73_0.refreshTimer = Timer.New(function()
		if arg_73_1 + 1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			var_73_0()
			arg_73_0:emit(NewShopMainMediator.GET_CHARGE_LIST)
		end
	end, 1, -1)

	arg_73_0.refreshTimer:Start()
	arg_73_0.refreshTimer.func()
end

function var_0_0.checkFreeGiftTag(arg_76_0)
	TagTipHelper.FreeGiftTag({
		arg_76_0.giftTip
	})
end

return var_0_0

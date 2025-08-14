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
	local var_4_0 = arg_4_0:findTF("buttonList")

	arg_4_0.buttonList = var_4_0
	arg_4_0.backBtn = arg_4_0:findTF("top/closeBtn", var_4_0)
	arg_4_0.homeBtn = arg_4_0:findTF("top/homeBtn", var_4_0)

	setText(arg_4_0:findTF("top/title/Text", var_4_0), i18n("shop_title"))
	setText(arg_4_0:findTF("shop1List/recommendation/shop1Tg/name", var_4_0), i18n("shop_recommend"))
	setText(arg_4_0:findTF("shop1List/skinShop/shop1Tg/name", var_4_0), i18n("shop_skin"))
	setText(arg_4_0:findTF("shop1List/diamondShop/shop1Tg/name", var_4_0), i18n("shop_diamond_title"))
	setText(arg_4_0:findTF("shop1List/specialShop/shop1Tg/name", var_4_0), i18n("shop_akashi_pick_title"))
	setText(arg_4_0:findTF("shop1List/giftPackShop/shop1Tg/name", var_4_0), i18n("shop_gift_title"))
	setText(arg_4_0:findTF("shop1List/functionalItemShop/shop1Tg/name", var_4_0), i18n("shop_item_title"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop1Tg/name", var_4_0), i18n("shop_supply_prop"))
	setText(arg_4_0:findTF("shop1List/recommendation/shop1Tg/name/en", var_4_0), i18n("shop_recommend_en"))
	setText(arg_4_0:findTF("shop1List/skinShop/shop1Tg/name/en", var_4_0), i18n("shop_skin_en"))
	setText(arg_4_0:findTF("shop1List/diamondShop/shop1Tg/name/en", var_4_0), i18n("shop_diamond_title_en"))
	setText(arg_4_0:findTF("shop1List/specialShop/shop1Tg/name/en", var_4_0), i18n("shop_side_lable_en"))
	setText(arg_4_0:findTF("shop1List/giftPackShop/shop1Tg/name/en", var_4_0), i18n("shop_gift_title_en"))
	setText(arg_4_0:findTF("shop1List/functionalItemShop/shop1Tg/name/en", var_4_0), i18n("shop_item_title_en"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop1Tg/name/en", var_4_0), i18n("shop_supply_prop_en"))
	setText(arg_4_0:findTF("shop1List/skinShop/shop2List/newSkin/name", var_4_0), i18n("shop_skin_new"))
	setText(arg_4_0:findTF("shop1List/skinShop/shop2List/newSkin/selected/name", var_4_0), i18n("shop_skin_new"))
	setText(arg_4_0:findTF("shop1List/skinShop/shop2List/permanentSkin/name", var_4_0), i18n("shop_skin_permanent"))
	setText(arg_4_0:findTF("shop1List/skinShop/shop2List/permanentSkin/selected/name", var_4_0), i18n("shop_skin_permanent"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop2List/monthShop/name", var_4_0), i18n("shop_month"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop2List/monthShop/selected/name", var_4_0), i18n("shop_month"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop2List/supplyShop/name", var_4_0), i18n("shop_supply"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop2List/supplyShop/selected/name", var_4_0), i18n("shop_supply"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop2List/activityShop/name", var_4_0), i18n("shop_activity"))
	setText(arg_4_0:findTF("shop1List/supplyShop/shop2List/activityShop/selected/name", var_4_0), i18n("shop_activity"))

	arg_4_0.frame = arg_4_0:findTF("frame")
	arg_4_0.viewContainer = arg_4_0:findTF("viewContainer")
	arg_4_0.painting = arg_4_0:findTF("frame/painting")
	arg_4_0.chat = arg_4_0:findTF("frame/chat")
	arg_4_0.chatText = arg_4_0:findTF("Text", arg_4_0.chat)
	arg_4_0.stamp = arg_4_0:findTF("frame/stamp")
	arg_4_0.giftTip = arg_4_0:findTF("shop1List/specialShop/shop1Tg/tip", var_4_0)
	arg_4_0.toggleList = {
		{
			type = ChargeScene.TYPE_DIAMOND,
			go = arg_4_0:findTF("shop1List/diamondShop/shop1Tg", var_4_0)
		},
		{
			type = ChargeScene.TYPE_GIFT,
			go = arg_4_0:findTF("shop1List/giftPackShop/shop1Tg", var_4_0)
		},
		{
			type = ChargeScene.TYPE_ITEM,
			go = arg_4_0:findTF("shop1List/functionalItemShop/shop1Tg", var_4_0)
		},
		{
			type = ChargeScene.TYPE_PICK,
			go = arg_4_0:findTF("shop1List/specialShop/shop1Tg", var_4_0)
		}
	}
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
	onToggle(arg_19_0, arg_19_0:findTF("shop1List/recommendation/shop1Tg", arg_19_0.buttonList), function(arg_22_0)
		if arg_22_0 then
			arg_19_0.contextData.shop1 = nil
			arg_19_0.contextData.shop2 = nil

			arg_19_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_19_0:emit(NewShopMainMediator.OPEN_LAYER, NewRecommendationShopLayer, NewRecommendationShopMediator)
		end
	end, SFX_PANEL)

	local var_19_0 = getProxy(ShipSkinProxy):GetInTimeSkins()

	setActive(arg_19_0:findTF("shop1List/skinShop/shop1Tg/timeLimit", arg_19_0.buttonList), #var_19_0 > 0)
	setActive(arg_19_0:findTF("shop1List/skinShop/shop2List/newSkin", arg_19_0.buttonList), #var_19_0 > 0)
	onToggle(arg_19_0, arg_19_0:findTF("shop1List/skinShop/shop2List/newSkin", arg_19_0.buttonList), function(arg_23_0)
		if arg_23_0 then
			arg_19_0.contextData.shop2 = "newSkin"

			arg_19_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_19_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
				type = "newSkin",
				mode = arg_19_0.contextData.mode
			})
		end
	end, SFX_PANEL)
	onToggle(arg_19_0, arg_19_0:findTF("shop1List/skinShop/shop2List/permanentSkin", arg_19_0.buttonList), function(arg_24_0)
		if arg_24_0 then
			arg_19_0.contextData.shop2 = "permanentSkin"

			arg_19_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_19_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
				type = "permanentSkin",
				mode = arg_19_0.contextData.mode
			})
		end
	end, SFX_PANEL)
	onToggle(arg_19_0, arg_19_0:findTF("shop1List/skinShop/shop1Tg", arg_19_0.buttonList), function(arg_25_0)
		setActive(arg_19_0:findTF("shop1List/skinShop/shop2List", arg_19_0.buttonList), arg_25_0)

		if arg_25_0 then
			if arg_19_0.contextData.shop1 and arg_19_0.contextData.shop2 then
				triggerToggle(arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/" .. arg_19_0.contextData.shop2), true)
			else
				arg_19_0.contextData.shop1 = "skinShop"

				triggerToggle(arg_19_0.buttonList:Find("shop1List/skinShop/shop2List/" .. (#var_19_0 > 0 and "newSkin" or "permanentSkin")), true)
			end
		end
	end, SFX_PANEL)

	for iter_19_0 = 1, #arg_19_0.toggleList do
		local var_19_1 = arg_19_0.toggleList[iter_19_0].go

		onToggle(arg_19_0, var_19_1, function(arg_26_0)
			if arg_26_0 then
				arg_19_0.contextData.type = ShopConst.SHOP_TYPE.CHARGE
				arg_19_0.contextData.warp = arg_19_0.toggleList[iter_19_0].type

				arg_19_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_19_0.contextData.shop1 = nil
				arg_19_0.contextData.shop2 = nil

				local var_26_0 = arg_19_0:GetShopID(arg_19_0.contextData.type, arg_19_0.contextData.warp)

				arg_19_0:switchSubView(var_26_0)
			end
		end, SFX_PANEL)
	end

	onToggle(arg_19_0, arg_19_0:findTF("shop1List/supplyShop/shop1Tg", arg_19_0.buttonList), function(arg_27_0)
		setActive(arg_19_0:findTF("shop1List/supplyShop/shop2List", arg_19_0.buttonList), arg_27_0)

		if arg_27_0 then
			triggerToggle(arg_19_0:findTF("shop1List/supplyShop/shop2List/" .. arg_19_0:GetDefaultSupplyShopName(), arg_19_0.buttonList), true)
		end
	end, SFX_PANEL)

	local var_19_2 = {
		{
			type = ShopConst.CATEGORY_MONTH,
			go = arg_19_0:findTF("shop1List/supplyShop/shop2List/monthShop", arg_19_0.buttonList)
		},
		{
			type = ShopConst.CATEGORY_SUPPLY,
			go = arg_19_0:findTF("shop1List/supplyShop/shop2List/supplyShop", arg_19_0.buttonList)
		},
		{
			type = ShopConst.CATEGORY_ACTIVITY,
			go = arg_19_0:findTF("shop1List/supplyShop/shop2List/activityShop", arg_19_0.buttonList)
		}
	}

	for iter_19_1, iter_19_2 in ipairs(var_19_2) do
		onToggle(arg_19_0, iter_19_2.go, function(arg_28_0)
			if arg_28_0 then
				arg_19_0.contextData.type = ShopConst.SHOP_TYPE.SUPPLY
				arg_19_0.contextData.warp = iter_19_2.type

				arg_19_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_19_0.contextData.shop1 = nil
				arg_19_0.contextData.shop2 = nil

				local var_28_0 = arg_19_0:GetShopID(arg_19_0.contextData.type, arg_19_0.contextData.warp)

				arg_19_0:switchSubView(var_28_0)
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

	triggerToggle(arg_19_0:findTF("shop1List/" .. var_19_3 .. "/shop1Tg", arg_19_0.buttonList), true)

	if var_19_3 == "skinShop" then
		-- block empty
	elseif var_19_3 == "supplyShop" then
		triggerToggle(arg_19_0:findTF("shop1List/supplyShop/shop2List/" .. arg_19_0:GetDefaultSupplyShopName(), arg_19_0.buttonList), true)
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

function var_0_0.GetDefaultSupplyShopName(arg_31_0)
	if arg_31_0.contextData.type ~= ShopConst.SHOP_TYPE.SUPPLY then
		return "supplyShop"
	end

	local var_31_0 = arg_31_0.contextData.warp

	if type(var_31_0) == "string" then
		local var_31_1 = ShopConst.SHOP_NAME_LIST[var_31_0]

		arg_31_0.contextData.warp = var_31_1[1]
		arg_31_0.contextData.shopID = var_31_1[2]
	elseif type(var_31_0) == "number" and arg_31_0.contextData.shopID == nil then
		for iter_31_0, iter_31_1 in pairs(ShopConst.SUPPLY_SHOP_LIST) do
			for iter_31_2, iter_31_3 in pairs(iter_31_1) do
				if iter_31_3 == var_31_0 then
					arg_31_0.contextData.warp = iter_31_0
					arg_31_0.contextData.shopID = iter_31_3

					break
				end
			end
		end
	end

	local var_31_2 = ""

	return arg_31_0.contextData.warp == ShopConst.CATEGORY_MONTH and "monthShop" or arg_31_0.contextData.warp == ShopConst.CATEGORY_SUPPLY and "supplyShop" or arg_31_0.contextData.warp == ShopConst.CATEGORY_ACTIVITY and "activityShop" or "supplyShop"
end

function var_0_0.RefreshActivityShop(arg_32_0)
	local var_32_0 = arg_32_0.supplyShopList[ShopConst.TYPE_ACTIVITY] or {}

	setActive(arg_32_0:findTF("shop1List/supplyShop/shop2List/activityShop", arg_32_0.buttonList), #var_32_0 > 0)
end

function var_0_0.ShowOrHideUI(arg_33_0, arg_33_1)
	arg_33_0:setVisible(arg_33_1)
	setActive(arg_33_0.buttonList, arg_33_1)
end

function var_0_0.ShowOrHideUI2(arg_34_0, arg_34_1)
	for iter_34_0 = 0, arg_34_0._tf.childCount - 1 do
		setActive(arg_34_0._tf:GetChild(iter_34_0), arg_34_1)
	end

	setActive(arg_34_0.buttonList:Find("leftBg"), arg_34_1)
	setActive(arg_34_0.buttonList:Find("shop1List"), arg_34_1)
	setActive(arg_34_0.buttonList:Find("top"), true)
end

function var_0_0.OnChargeSuccess(arg_35_0, arg_35_1)
	arg_35_0.chargeTipWindow:ExecuteAction("Show", arg_35_1)
end

function var_0_0.LoadMingshi(arg_36_0)
	if Live2dConst.GetLive2DArm32MatchAble() then
		local var_36_0 = Ship.New({
			configId = 312011
		}):getPainting()

		LoadPaintingPrefabAsync(arg_36_0.painting, var_36_0, var_36_0, "mainNormal", function()
			arg_36_0.loading = false
		end)
	else
		arg_36_0:createLive2D()
	end

	arg_36_0:AddLive2dTimer()
end

function var_0_0.AddLive2dTimer(arg_38_0)
	arg_38_0:StopLive2dTimer()

	arg_38_0.live2dTimer = Timer.New(function()
		local var_39_0 = pg.ChargeShipTalkInfo.Actions
		local var_39_1 = var_39_0[math.random(#var_39_0)]

		if arg_38_0:checkBuyDone(var_39_1.action) then
			arg_38_0:displayShipWord(nil, false, var_39_1.dialog_index)
		end
	end, 20, -1)

	arg_38_0.live2dTimer:Start()
end

function var_0_0.StopLive2dTimer(arg_40_0)
	if arg_40_0.live2dTimer then
		arg_40_0.live2dTimer:Stop()

		arg_40_0.live2dTimer = nil
	end
end

function var_0_0.ShowChargeWarp(arg_41_0, arg_41_1)
	setActive(arg_41_0.frame, arg_41_1)
	setActive(arg_41_0.viewContainer, arg_41_1)
	arg_41_0:ShowResourceBar(arg_41_1)

	local var_41_0 = arg_41_0.subViewList[arg_41_0.curSubViewNum]

	if var_41_0 then
		var_41_0:ShowPanel(arg_41_1)
	end
end

function var_0_0.ShowResourceBar(arg_42_0, arg_42_1)
	if arg_42_0.resourceBarFlag == arg_42_1 then
		return
	end

	arg_42_0.resourceBarFlag = arg_42_1

	local var_42_0 = {
		anim = false,
		canvasOrder = false,
		showType = PlayerResUI.TYPE_ALL,
		active = arg_42_1,
		clear = not arg_42_1 and not arg_42_0:isLayer(),
		weight = arg_42_0:getWeightFromData(),
		groupName = arg_42_0:getGroupNameFromData()
	}

	pg.playerResUI:SetActive(var_42_0)
end

function var_0_0.willExit(arg_43_0)
	arg_43_0:ShowResourceBar()
	arg_43_0:unBlurView()

	if arg_43_0.chargeTipWindow then
		arg_43_0.chargeTipWindow:Destroy()

		arg_43_0.chargeTipWindow = nil
	end

	arg_43_0.contextData.singleWindow:Destroy()
	arg_43_0.contextData.multiWindow:Destroy()
	arg_43_0.contextData.singleWindowForESkin:Destroy()
	arg_43_0.contextData.paintingView:Dispose()

	arg_43_0.contextData.singleWindow = nil
	arg_43_0.contextData.multiWindow = nil
	arg_43_0.contextData.singleWindowForESkin = nil
	arg_43_0.contextData.paintingView = nil

	for iter_43_0, iter_43_1 in pairs(arg_43_0.subViewList) do
		iter_43_1:Destroy()
	end

	arg_43_0.subViewList = nil

	if arg_43_0.heartsTimer then
		arg_43_0.heartsTimer:Stop()

		arg_43_0.heartsTimer = nil
	end

	if arg_43_0.live2dChar then
		arg_43_0.live2dChar:Dispose()
	end

	arg_43_0:StopLive2dTimer()
	arg_43_0:stopCV()

	if arg_43_0.giftShopView then
		arg_43_0.giftShopView:OnDestroy()
	end
end

function var_0_0.onBackPressed(arg_44_0)
	if arg_44_0.contextData.singleWindow:GetLoaded() and arg_44_0.contextData.singleWindow:isShowing() then
		arg_44_0.contextData.singleWindow:Close()

		return
	end

	if arg_44_0.contextData.multiWindow:GetLoaded() and arg_44_0.contextData.multiWindow:isShowing() then
		arg_44_0.contextData.multiWindow:Close()

		return
	end

	if arg_44_0.contextData.singleWindowForESkin:GetLoaded() and arg_44_0.contextData.singleWindowForESkin:isShowing() then
		arg_44_0.contextData.singleWindowForESkin:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_44_0)
end

function var_0_0.initSubView(arg_45_0)
	local var_45_0 = ChargeDiamondShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData)
	local var_45_1 = ChargeGiftShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData)
	local var_45_2 = ChargeItemShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData)
	local var_45_3 = ChargePickShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData)
	local var_45_4 = SupplyShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData, ShopConst.CATEGORY_MONTH)
	local var_45_5 = SupplyShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData, ShopConst.CATEGORY_SUPPLY)
	local var_45_6 = SupplyShopView.New(arg_45_0.viewContainer, arg_45_0.event, arg_45_0.contextData, ShopConst.CATEGORY_ACTIVITY)

	arg_45_0.curSubViewNum = 0
	arg_45_0.subViewList = {
		[ShopConst.SHOP_ID.DIAMOND] = var_45_0,
		[ShopConst.SHOP_ID.GIFT] = var_45_1,
		[ShopConst.SHOP_ID.ITEM] = var_45_2,
		[ShopConst.SHOP_ID.PICK] = var_45_3,
		[ShopConst.SHOP_ID.MONTH] = var_45_4,
		[ShopConst.SHOP_ID.SUPPLY] = var_45_5,
		[ShopConst.SHOP_ID.ACTIVITY] = var_45_6
	}
	arg_45_0.contextData.singleWindow = ShopSingleWindow.New(arg_45_0._tf, arg_45_0.event)
	arg_45_0.contextData.multiWindow = ShopMultiWindow.New(arg_45_0._tf, arg_45_0.event)
	arg_45_0.contextData.singleWindowForESkin = EquipmentSkinInfoUIForShopWindow.New(arg_45_0._tf, arg_45_0.event)
	arg_45_0.contextData.paintingView = ShopPaintingView.New(arg_45_0:findTF("frame/supplyPaint"), arg_45_0:findTF("frame/chat"))

	arg_45_0.contextData.paintingView:setSecretaryPos(arg_45_0:findTF("frame/secretaryPos"))
end

function var_0_0.GetShopID(arg_46_0)
	local var_46_0 = arg_46_0.contextData.type
	local var_46_1 = arg_46_0.contextData.warp

	return ShopConst.SHOP_LIST[var_46_0][var_46_1]
end

function var_0_0.switchSubView(arg_47_0, arg_47_1)
	if arg_47_1 == arg_47_0.curSubViewNum then
		return
	end

	arg_47_0.subViewList[arg_47_1]:setGoodData(arg_47_0.firstChargeIds, arg_47_0.chargedList, arg_47_0.normalList, arg_47_0.normalGroupList)
	arg_47_0.subViewList[arg_47_1]:Reset()
	arg_47_0.subViewList[arg_47_1]:Load()

	if arg_47_0.subViewList[arg_47_1].SetAllShopData then
		arg_47_0.subViewList[arg_47_1]:ActionInvoke("SetAllShopData", arg_47_0.supplyShopList)
	end

	local var_47_0 = arg_47_0.subViewList[arg_47_0.curSubViewNum]

	if var_47_0 then
		var_47_0:Destroy()
	end

	arg_47_0.curSubViewNum = arg_47_1

	arg_47_0:SwitchPainting(arg_47_0.subViewList[arg_47_1]:IsSupplyShop())

	if PLATFORM_CODE == PLATFORM_JP then
		setActive(arg_47_0.userAgreeBtn3, arg_47_1 == ChargeScene.TYPE_DIAMOND)
		setActive(arg_47_0.userAgreeBtn4, arg_47_1 == ChargeScene.TYPE_DIAMOND)
	end
end

function var_0_0.SwitchPainting(arg_48_0, arg_48_1)
	arg_48_0.contextData.paintingView:Show(arg_48_1)
	setActive(arg_48_0.painting, not arg_48_1)

	if arg_48_1 then
		arg_48_0:StopLive2dTimer()
		arg_48_0:stopCV()
		setActive(arg_48_0.stamp, getProxy(TaskProxy):mingshiTouchFlagEnabled())

		if LOCK_CLICK_MINGSHI then
			setActive(arg_48_0.stamp, false)
		end
	else
		setActive(arg_48_0.stamp, false)
		arg_48_0:AddLive2dTimer()
	end
end

function var_0_0.switchSubViewByTogger(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_0.toggleList[arg_49_1]

	triggerToggle(var_49_0.go, true)
end

function var_0_0.updateCurSubView(arg_50_0)
	local var_50_0 = arg_50_0.subViewList[arg_50_0.curSubViewNum]

	var_50_0:setGoodData(arg_50_0.firstChargeIds, arg_50_0.chargedList, arg_50_0.normalList, arg_50_0.normalGroupList)
	var_50_0:reUpdateAll()
end

function var_0_0.updateNoRes(arg_51_0, arg_51_1)
	if not arg_51_1 then
		arg_51_1 = arg_51_0.contextData.noRes
	else
		arg_51_0.contextData.noRes = arg_51_1
	end

	if not arg_51_1 or #arg_51_1 <= 0 then
		return
	end

	arg_51_0.contextData.noRes = {}

	local var_51_0 = getProxy(BagProxy):getData()
	local var_51_1 = ""

	for iter_51_0, iter_51_1 in ipairs(arg_51_1) do
		if iter_51_1[2] > 0 then
			if iter_51_1[1] == 59001 then
				arg_51_1[iter_51_0][2] = iter_51_1[3] - arg_51_0.player.gold
			else
				arg_51_1[iter_51_0][2] = iter_51_1[3] - (var_51_0[iter_51_1[1]] and var_51_0[iter_51_1[1]].count or 0)
			end
		end

		if arg_51_1[iter_51_0][2] > 0 then
			table.insert(arg_51_0.contextData.noRes, arg_51_1[iter_51_0])
		end
	end

	for iter_51_2, iter_51_3 in ipairs(arg_51_0.contextData.noRes) do
		local var_51_2 = Item.getConfigData(iter_51_3[1]).name

		var_51_1 = var_51_1 .. i18n(iter_51_3[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_51_2, iter_51_3[2])

		if iter_51_2 < #arg_51_0.contextData.noRes then
			var_51_1 = var_51_1 .. i18n("text_noRes_info_tip_link")
		end
	end

	if var_51_1 == "" then
		arg_51_0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
	else
		arg_51_0:displayShipWord(i18n("text_shop_noRes_tip", var_51_1), true)
	end
end

function var_0_0.displayShipWord(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	if not arg_52_0.chatFlag then
		if not arg_52_1 and arg_52_0.contextData.noRes and #arg_52_0.contextData.noRes > 0 then
			setActive(arg_52_0.chat, false)

			arg_52_0.chat.transform.localScale = Vector3(0, 0, 1)
		end

		arg_52_0.chatFlag = true

		if not arg_52_0.isInitChatPosition then
			arg_52_0.isInitChatPosition = true

			arg_52_0:InitChatPosition()
		end

		setActive(arg_52_0.chat, true)

		local var_52_0 = arg_52_0.player:getChargeLevel()
		local var_52_1 = arg_52_3 or math.random(1, var_52_0)
		local var_52_2

		if arg_52_3 then
			var_52_2 = pg.pay_level_award[var_52_1].dialog
		else
			var_52_2 = arg_52_1 or pg.pay_level_award[var_52_1].dialog
		end

		if not arg_52_1 then
			arg_52_0:playCV(var_52_1)
		end

		setText(arg_52_0.chatText, var_52_2)

		local var_52_3 = arg_52_0.chatText:GetComponent(typeof(Text))

		;(function()
			local var_53_0 = 3
			local var_53_1 = 0.3

			LeanTween.scale(rtf(arg_52_0.chat.gameObject), Vector3.New(1, 1, 1), var_53_1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				if not arg_52_2 then
					LeanTween.scale(rtf(arg_52_0.chat.gameObject), Vector3.New(0, 0, 1), var_53_1):setEase(LeanTweenType.easeInBack):setDelay(var_53_1 + var_53_0):setOnComplete(System.Action(function()
						arg_52_0.chatFlag = nil

						setActive(arg_52_0.chat, false)

						if arg_52_0.contextData.noRes and #arg_52_0.contextData.noRes > 0 then
							arg_52_0:updateNoRes()
						end
					end))
				else
					arg_52_0.chatFlag = nil
				end
			end))
		end)()
	end
end

function var_0_0.InitChatPosition(arg_56_0)
	return
end

function var_0_0.playHeartEffect(arg_57_0)
	if arg_57_0.heartsTimer then
		arg_57_0.heartsTimer:Stop()
	end

	local var_57_0 = arg_57_0.painting:Find("heartsfly")

	setActive(var_57_0, true)

	arg_57_0.heartsTimer = Timer.New(function()
		setActive(var_57_0, false)
	end, 1, 1)

	arg_57_0.heartsTimer:Start()
end

function var_0_0.createLive2D(arg_59_0)
	local var_59_0 = Live2D.GenerateData({
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
		parent = arg_59_0:findTF("frame/painting/live2d")
	})

	arg_59_0.live2dChar = Live2D.New(var_59_0, function(arg_60_0)
		arg_60_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
	end)
end

function var_0_0.checkBuyDone(arg_61_0, arg_61_1)
	if not arg_61_0.live2dChar or not arg_61_0.live2dChar:IsLoaded() then
		return
	end

	local var_61_0

	if type(arg_61_1) == "string" then
		if arg_61_1 == "damonds" then
			var_61_0 = "diamond"
		else
			var_61_0 = arg_61_1
		end
	else
		local var_61_1 = pg.shop_template[arg_61_1]

		if var_61_1 and var_61_1.effect_args and type(var_61_1.effect_args) == "table" then
			for iter_61_0, iter_61_1 in ipairs(var_61_1.effect_args) do
				if iter_61_1 == 1 then
					var_61_0 = "gold"
				end
			end
		end
	end

	local var_61_2 = arg_61_0.preAniName == "gold" or arg_61_0.preAniName == "diamond"
	local var_61_3 = var_61_0 == "gold" or var_61_0 == "diamond"
	local var_61_4 = var_61_2 and var_61_3 or not var_61_2

	var_61_4 = var_61_0 and arg_61_0.preAniName ~= var_61_0 and var_61_4

	if var_61_4 then
		arg_61_0.preAniName = var_61_0

		arg_61_0.live2dChar:TriggerAction(var_61_0, nil, true)
	end

	return var_61_4
end

function var_0_0.playCV(arg_62_0, arg_62_1)
	local var_62_0 = pg.pay_level_award[arg_62_1]
	local var_62_1

	if var_62_0 and var_62_0.cv_key ~= "" then
		var_62_1 = "event:/cv/chargeShop/" .. var_62_0.cv_key
	end

	if var_62_1 then
		arg_62_0:stopCV()

		arg_62_0._currentVoice = var_62_1

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_62_1)
	end
end

function var_0_0.stopCV(arg_63_0)
	if arg_63_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_63_0._currentVoice)
	end

	arg_63_0._currentVoice = nil
end

function var_0_0.blurView(arg_64_0)
	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_64_0.buttonList, {
		groupName = "shop",
		pbList = {
			arg_64_0:findTF("leftBg", arg_64_0.buttonList)
		}
	})
end

function var_0_0.unBlurView(arg_65_0)
	pg.LayerWeightMgr.GetInstance():DelFromOverlay(arg_65_0.buttonList, arg_65_0._tf)
end

function var_0_0.jpUIInit(arg_66_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	arg_66_0.userAgreeBtn3 = arg_66_0:findTF("frame/raw1Btn")
	arg_66_0.userAgreeBtn4 = arg_66_0:findTF("frame/raw2Btn")
end

function var_0_0.jpUIEnter(arg_67_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	onButton(arg_67_0, arg_67_0.userAgreeBtn3, function()
		local var_68_0 = require("ShareCfg.UserAgreement3")

		arg_67_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_68_0 or "")
	end, SFX_PANEL)
	onButton(arg_67_0, arg_67_0.userAgreeBtn4, function()
		local var_69_0 = require("ShareCfg.UserAgreement4")

		arg_67_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_69_0 or "")
	end, SFX_PANEL)
end

function var_0_0.addRefreshTimer(arg_70_0, arg_70_1)
	local function var_70_0()
		if arg_70_0.refreshTimer then
			arg_70_0.refreshTimer:Stop()

			arg_70_0.refreshTimer = nil
		end
	end

	var_70_0()

	arg_70_0.refreshTimer = Timer.New(function()
		local var_72_0 = arg_70_1 + 1 - pg.TimeMgr.GetInstance():GetServerTime()

		if var_72_0 <= 0 then
			var_70_0()
			arg_70_0:emit(NewShopMainMediator.GET_CHARGE_LIST)
		else
			local var_72_1 = pg.TimeMgr.GetInstance():DescCDTime(var_72_0)
		end
	end, 1, -1)

	arg_70_0.refreshTimer:Start()
	arg_70_0.refreshTimer.func()
end

function var_0_0.checkFreeGiftTag(arg_73_0)
	TagTipHelper.FreeGiftTag({
		arg_73_0.giftTip
	})
end

return var_0_0

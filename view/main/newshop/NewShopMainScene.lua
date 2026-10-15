local var_0_0 = class("NewShopMainScene", import("...base.BaseUI"))

var_0_0.CLOSE_ALL_LAYER = "NewShopMainScene.CLOSE_ALL_LAYER"
var_0_0.SHOW_OR_HIDE_UI = "NewShopMainScene.SHOW_OR_HIDE_UI"
var_0_0.SHOW_OR_HIDE_UI_2 = "NewShopMainScene.SHOW_OR_HIDE_UI_2"
var_0_0.CLOSE_VIEW = "NewShopMainScene.CLOSE_VIEW"
var_0_0.TYPE_CHARGE = "charge"
var_0_0.TYPE_SKIN = "skin"
var_0_0.ON_CLICK_SKIN_SHOP = "NewShopMainScene::ON_CLICK_SKIN_SHOP"

function var_0_0.getUIName(arg_1_0)
	return "NewShopUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = arg_2_0.contextData

	local function var_2_1()
		local var_3_0 = Ship.New({
			configId = 312011
		}):getPainting()

		return "live2d/" .. var_3_0
	end

	local var_2_2 = {
		var_2_1(),
		"ui/ChargeDiamondShopUI",
		"ui/ChargeGiftShopUI",
		"ui/ChargeItemShopUI",
		"ui/ChargePickShopUI",
		"ui/ShopSupplyShopUI",
		"ui/iconcolorful",
		"ui/ShopsUI_atlas",
		"weaponframes",
		"props/medal",
		"shoppainting/buzhihuo_shop"
	}

	local function var_2_3()
		local var_4_0 = {}
		local var_4_1 = pg.pay_data_display.all

		local function var_4_2(arg_5_0)
			if arg_5_0 and arg_5_0 ~= "" and not table.contains(var_4_0, arg_5_0) then
				table.insert(var_4_0, arg_5_0)
			end
		end

		for iter_4_0, iter_4_1 in ipairs(var_4_1) do
			local var_4_3 = pg.pay_data_display[iter_4_1].picture
			local var_4_4 = "chargeicon/" .. var_4_3

			var_4_2(var_4_4)
		end

		return var_4_0
	end

	local function var_2_4(arg_6_0)
		local var_6_0 = {}
		local var_6_1 = getProxy(ShopsProxy):GetAllShowGiftPackages(arg_6_0)

		for iter_6_0, iter_6_1 in ipairs(var_6_1) do
			if iter_6_1:isChargeType() then
				table.insert(var_6_0, "chargeicon/" .. iter_6_1:getConfig("picture"))
			else
				local var_6_2 = iter_6_1:getConfig("effect_args")
				local var_6_3 = Item.getConfigData(var_6_2[1])

				table.insert(var_6_0, var_6_3.icon)
			end
		end

		return var_6_0
	end

	local function var_2_5()
		local var_7_0 = {}
		local var_7_1 = getProxy(PlayerProxy):getData()
		local var_7_2 = var_2_0 and var_2_0.normalGroupList or getProxy(ShopsProxy):GetNormalGroupList()

		local function var_7_3(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
			local var_8_0, var_8_1, var_8_2 = ChargeConst.getGoodsLimitInfo(arg_8_0)
			local var_8_3 = arg_8_1.effect_args
			local var_8_4 = false

			if var_8_3 == "ship_bag_size" and var_8_1 and var_8_2 then
				local var_8_5 = var_7_1:getMaxShipBagExcludeGuild()

				var_8_4 = var_8_1 <= var_8_5 and var_8_5 <= var_8_2
			elseif var_8_3 == "equip_bag_max" and var_8_1 and var_8_2 then
				local var_8_6 = var_7_1:getMaxEquipmentBag()

				var_8_4 = var_8_1 <= var_8_6 and var_8_6 <= var_8_2
			elseif var_8_3 == "commander_bag_size" and var_8_1 and var_8_2 then
				local var_8_7 = var_7_1.commanderBagMax

				var_8_4 = var_8_1 <= var_8_7 and var_8_7 <= var_8_2
			else
				var_8_4 = true
			end

			if not var_8_4 then
				return false
			end

			local var_8_8 = Goods.Create({
				count = 0,
				shop_id = arg_8_0
			}, Goods.TYPE_MILITARY)
			local var_8_9 = ChargeConst.getGroupLimit(arg_8_3, var_8_8:getConfig("group"))

			return var_8_8:IsShowWhenGroupSale(var_8_9)
		end

		for iter_7_0, iter_7_1 in pairs(pg.shop_template.all) do
			local var_7_4 = pg.shop_template[iter_7_1]

			if var_7_4.genre == "gem_shop" and var_7_3(iter_7_1, var_7_4, var_7_1, var_7_2) then
				table.insert(var_7_0, var_0_0.GetShopTemplateDropIcon(var_7_4))
			end
		end

		return var_7_0
	end

	local function var_2_6()
		local var_9_0 = {}
		local var_9_1 = pg.activity_template.get_id_list_by_type[ActivityConst.ACTIVITY_TYPE_SHOP]
		local var_9_2 = pg.activity_template.get_id_list_by_type[ActivityConst.ACTIVITY_TYPE_SHOP_SELECTABLE]

		for iter_9_0, iter_9_1 in ipairs(var_9_1) do
			local var_9_3 = pg.activity_template[iter_9_1].config_client.painting

			if var_9_3 then
				if type(var_9_3) == "table" then
					for iter_9_2, iter_9_3 in ipairs(var_9_3) do
						table.insert(var_9_0, "shoppainting/" .. iter_9_3)
					end
				elseif type(var_9_3) == "string" then
					table.insert(var_9_0, "shoppainting/" .. var_9_3)
				end
			end
		end

		return ResPathSupport.UniqueLuaArr(var_9_0)
	end

	local var_2_7 = var_2_3()
	local var_2_8 = var_2_4(true)
	local var_2_9 = var_2_4(false)
	local var_2_10 = var_2_5()

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0), var_2_2, var_2_7, var_2_8, var_2_9, var_2_10, var_2_6())
end

function var_0_0.GetShopTemplateDropIcon(arg_10_0)
	local var_10_0 = arg_10_0.effect_args
	local var_10_1 = {}

	if var_10_0 == "ship_bag_size" then
		var_10_1 = {
			count = 1,
			type = DROP_TYPE_ITEM,
			id = Goods.SHIP_BAG_SIZE_ITEM
		}
	elseif var_10_0 == "equip_bag_size" then
		var_10_1 = {
			count = 1,
			type = DROP_TYPE_ITEM,
			id = Goods.EQUIP_BAG_SIZE_ITEM
		}
	elseif var_10_0 == "commander_bag_size" then
		var_10_1 = {
			count = 1,
			type = DROP_TYPE_ITEM,
			id = Goods.COMMANDER_BAG_SIZE_ITEM
		}
	elseif var_10_0 == "spweapon_bag_size" then
		var_10_1 = {
			count = 1,
			type = DROP_TYPE_ITEM,
			id = Goods.SPWEAPON_BAG_SIZE_ITEM
		}
	else
		var_10_1 = {
			type = arg_10_0.type,
			id = arg_10_0.effect_args[1],
			count = arg_10_0.num
		}
	end

	return Drop.New(var_10_1):getIcon()
end

function var_0_0.setList(arg_11_0)
	local var_11_0 = getProxy(ShopsProxy)
	local var_11_1 = var_11_0:getFirstChargeList()
	local var_11_2 = var_11_0:getChargedList()
	local var_11_3 = var_11_0:GetNormalList()
	local var_11_4 = var_11_0:GetNormalGroupList()

	if var_11_1 then
		arg_11_0:setFirstChargeIds(var_11_1)
	end

	if var_11_2 then
		arg_11_0:setChargedList(var_11_2)
	end

	if var_11_3 then
		arg_11_0:setNormalList(var_11_3)
	end

	if var_11_4 then
		arg_11_0:setNormalGroupList(var_11_4)
	end
end

function var_0_0.init(arg_12_0)
	local var_12_0 = arg_12_0._tf:Find("buttonList")

	arg_12_0.buttonList = var_12_0
	arg_12_0.backBtn = var_12_0:Find("top/closeBtn")
	arg_12_0.homeBtn = var_12_0:Find("top/homeBtn")
	arg_12_0.resourcePanel = var_12_0:Find("top/resources")

	setActive(arg_12_0.resourcePanel, false)

	arg_12_0.goldBtn = var_12_0:Find("top/resources/gold")
	arg_12_0.goldText = var_12_0:Find("top/resources/gold/Text"):GetComponent(typeof(Text))
	arg_12_0.goldMax = var_12_0:Find("top/resources/gold/max"):GetComponent(typeof(Text))
	arg_12_0.oilBtn = var_12_0:Find("top/resources/oil")
	arg_12_0.oilText = var_12_0:Find("top/resources/oil/Text"):GetComponent(typeof(Text))
	arg_12_0.oilMax = var_12_0:Find("top/resources/oil/max"):GetComponent(typeof(Text))
	arg_12_0.diamondBtn = var_12_0:Find("top/resources/gem")
	arg_12_0.diamondText = var_12_0:Find("top/resources/gem/Text"):GetComponent(typeof(Text))

	setText(var_12_0:Find("top/title/Text"), i18n("shop_title"))
	setText(var_12_0:Find("shop1List/recommendation/shop1Tg/name"), i18n("shop_recommend"))
	setText(var_12_0:Find("shop1List/skinShop/shop1Tg/name"), i18n("shop_skin"))
	setText(var_12_0:Find("shop1List/diamondShop/shop1Tg/name"), i18n("shop_diamond_title"))
	setText(var_12_0:Find("shop1List/specialShop/shop1Tg/name"), i18n("shop_akashi_pick_title"))
	setText(var_12_0:Find("shop1List/giftPackShop/shop1Tg/name"), i18n("shop_gift_title"))
	setText(var_12_0:Find("shop1List/functionalItemShop/shop1Tg/name"), i18n("shop_item_title"))
	setText(var_12_0:Find("shop1List/supplyShop/shop1Tg/name"), i18n("shop_supply_prop"))
	setText(var_12_0:Find("shop1List/recommendation/shop1Tg/name/en"), i18n("shop_recommend_en"))
	setText(var_12_0:Find("shop1List/skinShop/shop1Tg/name/en"), i18n("shop_skin_en"))
	setText(var_12_0:Find("shop1List/diamondShop/shop1Tg/name/en"), i18n("shop_diamond_title_en"))
	setText(var_12_0:Find("shop1List/specialShop/shop1Tg/name/en"), i18n("shop_side_lable_en"))
	setText(var_12_0:Find("shop1List/giftPackShop/shop1Tg/name/en"), i18n("shop_gift_title_en"))
	setText(var_12_0:Find("shop1List/functionalItemShop/shop1Tg/name/en"), i18n("shop_item_title_en"))
	setText(var_12_0:Find("shop1List/supplyShop/shop1Tg/name/en"), i18n("shop_supply_prop_en"))
	setText(var_12_0:Find("shop1List/supplyShop/shop2List/monthShop/name"), i18n("shop_month"))
	setText(var_12_0:Find("shop1List/supplyShop/shop2List/monthShop/selected/name"), i18n("shop_month"))
	setText(var_12_0:Find("shop1List/supplyShop/shop2List/supplyShop/name"), i18n("shop_supply"))
	setText(var_12_0:Find("shop1List/supplyShop/shop2List/supplyShop/selected/name"), i18n("shop_supply"))
	setText(var_12_0:Find("shop1List/supplyShop/shop2List/activityShop/name"), i18n("shop_activity"))
	setText(var_12_0:Find("shop1List/supplyShop/shop2List/activityShop/selected/name"), i18n("shop_activity"))

	arg_12_0.frame = arg_12_0._tf:Find("frame")
	arg_12_0.viewContainer = arg_12_0._tf:Find("viewContainer")
	arg_12_0.painting = arg_12_0._tf:Find("frame/painting")
	arg_12_0.chat = arg_12_0._tf:Find("frame/chat")
	arg_12_0.chatText = arg_12_0.chat:Find("Text")
	arg_12_0.stamp = arg_12_0._tf:Find("frame/stamp")
	arg_12_0.specialTip = var_12_0:Find("shop1List/specialShop/shop1Tg/tip")
	arg_12_0.giftTip = var_12_0:Find("shop1List/giftPackShop/shop1Tg/tip")

	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_12_0.specialTip, {
		"specialShop",
		"Charge_Page_Exposure"
	}, function(arg_13_0)
		getProxy(ShopsProxy):GiftPackageRedDotTip({
			arg_13_0
		}, true)
	end)
	pg.EasyRedDotMgr.GetInstance():RegisterRedDot(arg_12_0.giftTip, {
		"specialShop",
		"Charge_Page_Exposure"
	}, function(arg_14_0)
		getProxy(ShopsProxy):GiftPackageRedDotTip({
			arg_14_0
		}, false)
	end)

	arg_12_0.toggleList = {
		{
			type = ChargeScene.TYPE_DIAMOND,
			go = var_12_0:Find("shop1List/diamondShop/shop1Tg")
		},
		{
			type = ChargeScene.TYPE_GIFT,
			go = var_12_0:Find("shop1List/giftPackShop/shop1Tg")
		},
		{
			type = ChargeScene.TYPE_ITEM,
			go = var_12_0:Find("shop1List/functionalItemShop/shop1Tg")
		},
		{
			type = ChargeScene.TYPE_PICK,
			go = var_12_0:Find("shop1List/specialShop/shop1Tg")
		}
	}
	GetComponent(var_12_0:Find("shop1List/supplyShop/shop2List/supplyShop"), typeof(Toggle)).isOn = true
	arg_12_0.chargeTipWindow = ChargeTipWindow.New(arg_12_0._tf, arg_12_0.event)

	arg_12_0:LoadMingshi()
	arg_12_0:jpUIInit()
	arg_12_0:blurView()
	arg_12_0:initSubView()

	arg_12_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_12_0, arg_12_0.pageContainer, Vector2.New(-35, -90))

	if arg_12_0.bulinTip then
		arg_12_0.bulinTip:RegisterView(arg_12_0)
		arg_12_0.bulinTip:CallbackInvoke(function()
			arg_12_0:OverlayPanel(arg_12_0.bulinTip._tf, {
				groupDelta = 1
			})
		end)

		function arg_12_0.bulinTip.destroyCall()
			if arg_12_0.bulinTip:GetLoaded() then
				arg_12_0:UnOverlayPanel(arg_12_0.bulinTip._tf)
			end
		end
	end
end

function var_0_0.setPlayer(arg_17_0, arg_17_1)
	arg_17_0.player = arg_17_1

	if arg_17_0.subViewList[arg_17_0.curSubViewNum] and arg_17_0.subViewList[arg_17_0.curSubViewNum]:IsSupplyShop() then
		arg_17_0.subViewList[arg_17_0.curSubViewNum]:SetPlayer(arg_17_1)
	end

	if arg_17_0.goldMax then
		PlayerResUI.StaticFlush(arg_17_0.player, arg_17_0.goldMax, arg_17_0.goldText, arg_17_0.oilMax, arg_17_0.oilText, arg_17_0.diamondText)
	end
end

function var_0_0.setFirstChargeIds(arg_18_0, arg_18_1)
	arg_18_0.firstChargeIds = arg_18_1
end

function var_0_0.setChargedList(arg_19_0, arg_19_1)
	arg_19_0.chargedList = arg_19_1
end

function var_0_0.setNormalList(arg_20_0, arg_20_1)
	arg_20_0.normalList = arg_20_1
end

function var_0_0.setNormalGroupList(arg_21_0, arg_21_1)
	arg_21_0.normalGroupList = arg_21_1

	arg_21_0:addRefreshTimer(GetZeroTime())
end

function var_0_0.SetSupplyShopList(arg_22_0, arg_22_1)
	arg_22_0.supplyShopList = arg_22_1

	arg_22_0:SortActivityShops()
end

function var_0_0.SortActivityShops(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.supplyShopList) do
		if #iter_23_1 > 1 then
			table.sort(iter_23_1, function(arg_24_0, arg_24_1)
				return arg_24_0:getStartTime() > arg_24_1:getStartTime()
			end)
		end
	end
end

function var_0_0.OnInitItems(arg_25_0, arg_25_1)
	arg_25_0.items = arg_25_1

	arg_25_0.subViewList[ShopConst.SHOP_ID.MONTH]:OnUpdateItems(arg_25_1)
	arg_25_0.subViewList[ShopConst.SHOP_ID.SUPPLY]:OnUpdateItems(arg_25_1)
	arg_25_0.subViewList[ShopConst.SHOP_ID.ACTIVITY]:OnUpdateItems(arg_25_1)
end

function var_0_0.OnUpdateItems(arg_26_0, arg_26_1)
	arg_26_0.items = arg_26_1

	if arg_26_0.subViewList[arg_26_0.curSubViewNum] and arg_26_0.subViewList[arg_26_0.curSubViewNum]:IsSupplyShop() then
		arg_26_0.subViewList[arg_26_0.curSubViewNum]:OnUpdateItems(arg_26_1)
	end
end

function var_0_0.OnUpdateShop(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0:SetShop(arg_27_1, arg_27_2)

	if arg_27_0.subViewList[arg_27_0.curSubViewNum] and arg_27_0.subViewList[arg_27_0.curSubViewNum]:IsSupplyShop() then
		arg_27_0.subViewList[arg_27_0.curSubViewNum]:OnUpdateShop(arg_27_1, arg_27_2)
	end
end

function var_0_0.OnUpdateCommodity(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	arg_28_0:SetShop(arg_28_1, arg_28_2)

	if arg_28_0.subViewList[arg_28_0.curSubViewNum] and arg_28_0.subViewList[arg_28_0.curSubViewNum]:IsSupplyShop() then
		arg_28_0.subViewList[arg_28_0.curSubViewNum]:OnUpdateCommodity(arg_28_1, arg_28_2, arg_28_3)
	end
end

function var_0_0.OnFragmentSellUpdate(arg_29_0)
	if arg_29_0.subViewList[arg_29_0.curSubViewNum] and arg_29_0.subViewList[arg_29_0.curSubViewNum]:IsSupplyShop() then
		arg_29_0.subViewList[arg_29_0.curSubViewNum]:OnFragmentSellUpdate()
	end
end

function var_0_0.SetShop(arg_30_0, arg_30_1, arg_30_2)
	if not arg_30_0.supplyShopList then
		return
	end

	local var_30_0 = arg_30_0.supplyShopList[arg_30_1]

	if var_30_0 then
		for iter_30_0, iter_30_1 in ipairs(var_30_0) do
			if iter_30_1:IsSameKind(arg_30_2) then
				arg_30_0.supplyShopList[arg_30_1][iter_30_0] = arg_30_2

				break
			end
		end
	end
end

function var_0_0.didEnter(arg_31_0)
	arg_31_0.eventIDList = {
		arg_31_0:bind(var_0_0.ON_CLICK_SKIN_SHOP, handler(arg_31_0, arg_31_0.OnClickSkinShop))
	}

	setActive(arg_31_0.chat, false)
	onButton(arg_31_0, arg_31_0.backBtn, function()
		arg_31_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_31_0, arg_31_0.homeBtn, function()
		arg_31_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_31_0, arg_31_0.goldBtn, function()
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.oilBtn, function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.diamondBtn, function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	onToggle(arg_31_0, arg_31_0.buttonList:Find("shop1List/recommendation/shop1Tg"), function(arg_37_0)
		if arg_37_0 then
			arg_31_0.contextData.shop1 = nil
			arg_31_0.contextData.shop2 = nil

			if arg_31_0.shop1 == "recommendation" then
				return
			end

			arg_31_0.shop1 = "recommendation"
			arg_31_0.shop2 = nil

			arg_31_0:ShowChargeWarp(false)
			pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
			arg_31_0:emit(NewShopMainMediator.OPEN_LAYER, NewRecommendationShopLayer, NewRecommendationShopMediator)
		end
	end, SFX_PANEL)
	arg_31_0:InitSkinToggleList()

	for iter_31_0 = 1, #arg_31_0.toggleList do
		local var_31_0 = arg_31_0.toggleList[iter_31_0]

		onToggle(arg_31_0, var_31_0.go, function(arg_38_0)
			if arg_38_0 then
				arg_31_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_31_0.contextData.shop1 = nil
				arg_31_0.contextData.shop2 = nil
				arg_31_0.shop1 = nil
				arg_31_0.shop2 = nil
				arg_31_0.contextData.type = ShopConst.SHOP_TYPE.CHARGE
				arg_31_0.contextData.warp = var_31_0.type

				local var_38_0 = arg_31_0:GetShopID(ShopConst.SHOP_TYPE.CHARGE, var_31_0.type)

				arg_31_0:switchSubView(var_38_0)
			end

			local var_38_1 = switch(var_31_0.type, {
				[ChargeScene.TYPE_PICK] = function()
					return "payshop_pack_red_dot"
				end,
				[ChargeScene.TYPE_GIFT] = function()
					return "gemshop_pack_red_dot"
				end
			})

			if var_38_1 then
				if arg_38_0 then
					arg_31_0.toggleMark = arg_31_0.toggleMark or {}
					arg_31_0.toggleMark[var_31_0.type] = defaultValue(arg_31_0.toggleMark[var_31_0.type], 0) + 1
				elseif arg_31_0.toggleMark and defaultValue(arg_31_0.toggleMark[var_31_0.type], 0) > 0 then
					arg_31_0.toggleMark[var_31_0.type] = arg_31_0.toggleMark[var_31_0.type] - 1

					PlayerPrefs.SetInt(var_38_1, getGameset(var_38_1)[1])
					pg.EasyRedDotMgr.GetInstance():TriggerMarks("Charge_Page_Exposure")
				end
			end
		end, SFX_PANEL)
	end

	onToggle(arg_31_0, arg_31_0.buttonList:Find("shop1List/supplyShop/shop1Tg"), function(arg_41_0)
		setActive(arg_31_0.buttonList:Find("shop1List/supplyShop/shop2List"), arg_41_0)

		if arg_41_0 then
			triggerToggle(arg_31_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_31_0:GetDefaultSupplyShopName()), true)
		end
	end, SFX_PANEL)

	local var_31_1 = {
		{
			type = ShopConst.CATEGORY_MONTH,
			go = arg_31_0.buttonList:Find("shop1List/supplyShop/shop2List/monthShop")
		},
		{
			type = ShopConst.CATEGORY_SUPPLY,
			go = arg_31_0.buttonList:Find("shop1List/supplyShop/shop2List/supplyShop")
		},
		{
			type = ShopConst.CATEGORY_ACTIVITY,
			go = arg_31_0.buttonList:Find("shop1List/supplyShop/shop2List/activityShop")
		}
	}

	for iter_31_1, iter_31_2 in ipairs(var_31_1) do
		onToggle(arg_31_0, iter_31_2.go, function(arg_42_0)
			if arg_42_0 then
				arg_31_0:ShowChargeWarp(true)
				pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)

				arg_31_0.contextData.shop1 = nil
				arg_31_0.contextData.shop2 = nil
				arg_31_0.shop1 = nil
				arg_31_0.shop2 = nil
				arg_31_0.contextData.type = ShopConst.SHOP_TYPE.SUPPLY
				arg_31_0.contextData.warp = iter_31_2.type

				local var_42_0 = arg_31_0:GetShopID(ShopConst.SHOP_TYPE.SUPPLY, iter_31_2.type)

				arg_31_0:switchSubView(var_42_0)
			end
		end, SFX_PANEL)
	end

	local var_31_2 = "recommendation"

	if arg_31_0.contextData.type == ShopConst.SHOP_TYPE.CHARGE then
		if arg_31_0.contextData.warp == ChargeScene.TYPE_DIAMOND then
			var_31_2 = "diamondShop"
		elseif arg_31_0.contextData.warp == ChargeScene.TYPE_GIFT then
			var_31_2 = "giftPackShop"
		elseif arg_31_0.contextData.warp == ChargeScene.TYPE_ITEM then
			var_31_2 = "functionalItemShop"
		elseif arg_31_0.contextData.warp == ChargeScene.TYPE_PICK then
			var_31_2 = "specialShop"
		else
			var_31_2 = "diamondShop"
		end
	elseif arg_31_0.contextData.type == ShopConst.SHOP_TYPE.SKIN then
		var_31_2 = "skinShop"
	elseif arg_31_0.contextData.type == ShopConst.SHOP_TYPE.SUPPLY then
		var_31_2 = "supplyShop"
	end

	if arg_31_0.contextData.shop1 then
		var_31_2 = arg_31_0.contextData.shop1
	end

	triggerToggle(arg_31_0.buttonList:Find("shop1List/" .. var_31_2 .. "/shop1Tg"), true)

	if var_31_2 == "skinShop" then
		-- block empty
	elseif var_31_2 == "supplyShop" then
		triggerToggle(arg_31_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_31_0:GetDefaultSupplyShopName()), true)
	end

	onButton(arg_31_0, arg_31_0.painting, function()
		arg_31_0:displayShipWord()
		arg_31_0:emit(NewShopMainMediator.CLICK_MING_SHI)
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_0.stamp, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(4)
	end, SFX_CONFIRM)
	arg_31_0:RefreshActivityShop()
	arg_31_0:updateNoRes()
	arg_31_0:jpUIEnter()
end

function var_0_0.GetDefaultSupplyShopName(arg_45_0)
	if arg_45_0.contextData.type ~= ShopConst.SHOP_TYPE.SUPPLY then
		return "supplyShop"
	end

	local var_45_0 = arg_45_0.contextData.warp

	if type(var_45_0) == "string" then
		local var_45_1 = ShopConst.SHOP_NAME_LIST[var_45_0]

		arg_45_0.contextData.warp = var_45_1[1]
		arg_45_0.contextData.shopID = var_45_1[2]
	elseif type(var_45_0) == "number" and arg_45_0.contextData.shopID == nil then
		for iter_45_0, iter_45_1 in pairs(ShopConst.SUPPLY_SHOP_LIST) do
			for iter_45_2, iter_45_3 in pairs(iter_45_1) do
				if iter_45_3 == var_45_0 then
					arg_45_0.contextData.warp = iter_45_0
					arg_45_0.contextData.shopID = iter_45_3

					break
				end
			end
		end
	end

	local var_45_2 = ""

	return arg_45_0.contextData.warp == ShopConst.CATEGORY_MONTH and "monthShop" or arg_45_0.contextData.warp == ShopConst.CATEGORY_SUPPLY and "supplyShop" or arg_45_0.contextData.warp == ShopConst.CATEGORY_ACTIVITY and #arg_45_0.supplyShopList[ShopConst.TYPE_ACTIVITY] > 0 and "activityShop" or "supplyShop"
end

function var_0_0.RefreshActivityShop(arg_46_0)
	local var_46_0 = arg_46_0.supplyShopList[ShopConst.TYPE_ACTIVITY] or {}

	setActive(arg_46_0.buttonList:Find("shop1List/supplyShop/shop2List/activityShop"), #var_46_0 > 0)
end

function var_0_0.RefreshActivityEnd(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0.supplyShopList[ShopConst.TYPE_ACTIVITY] or {}
	local var_47_1 = false

	for iter_47_0, iter_47_1 in pairs(var_47_0) do
		if iter_47_1.id == arg_47_1 then
			table.remove(arg_47_0.supplyShopList[ShopConst.TYPE_ACTIVITY], iter_47_0)

			var_47_1 = true

			break
		end
	end

	if var_47_1 == false then
		return
	end

	arg_47_0:RefreshActivityShop()

	if arg_47_0.contextData.type == ShopConst.SHOP_TYPE.SUPPLY then
		triggerToggle(arg_47_0.buttonList:Find("shop1List/supplyShop/shop2List/" .. arg_47_0:GetDefaultSupplyShopName()), true)
	end
end

function var_0_0.ShowOrHideUI(arg_48_0, arg_48_1)
	arg_48_0:setVisible(arg_48_1)
	setActive(arg_48_0.buttonList, arg_48_1)
end

function var_0_0.ShowOrHideUI2(arg_49_0, arg_49_1)
	for iter_49_0 = 0, arg_49_0._tf.childCount - 1 do
		setActive(arg_49_0._tf:GetChild(iter_49_0), arg_49_1)
	end

	setActive(arg_49_0.buttonList:Find("leftBg"), arg_49_1)
	setActive(arg_49_0.buttonList:Find("shop1List"), arg_49_1)
	setActive(arg_49_0.buttonList:Find("top"), true)
end

function var_0_0.OnChargeSuccess(arg_50_0, arg_50_1)
	arg_50_0.chargeTipWindow:ExecuteAction("Show", arg_50_1, function()
		MainFetchPrevPeriodCrusingSequence.New():Execute(function()
			return
		end)
	end)
end

function var_0_0.LoadMingshi(arg_53_0)
	if Live2dConst.GetLive2DArm32MatchAble() then
		local var_53_0 = Ship.New({
			configId = 312011
		}):getPainting()

		LoadPaintingPrefabAsync(arg_53_0.painting, var_53_0, var_53_0, "mainNormal", function()
			arg_53_0.loading = false
		end)
	else
		arg_53_0:createLive2D()
	end

	arg_53_0:AddLive2dTimer()
end

function var_0_0.AddLive2dTimer(arg_55_0)
	arg_55_0:StopLive2dTimer()

	arg_55_0.live2dTimer = Timer.New(function()
		local var_56_0 = pg.ChargeShipTalkInfo.Actions
		local var_56_1 = var_56_0[math.random(#var_56_0)]

		if arg_55_0:checkBuyDone(var_56_1.action) then
			arg_55_0:displayShipWord(nil, false, var_56_1.dialog_index)
		end
	end, 20, -1)

	arg_55_0.live2dTimer:Start()
end

function var_0_0.StopLive2dTimer(arg_57_0)
	if arg_57_0.live2dTimer then
		arg_57_0.live2dTimer:Stop()

		arg_57_0.live2dTimer = nil
	end
end

function var_0_0.ShowChargeWarp(arg_58_0, arg_58_1)
	setActive(arg_58_0.frame, arg_58_1)
	setActive(arg_58_0.viewContainer, arg_58_1)
	arg_58_0:ShowResourceBar(arg_58_1)

	local var_58_0 = arg_58_0.subViewList[arg_58_0.curSubViewNum]

	if var_58_0 then
		if arg_58_1 == false then
			var_58_0:Destroy()

			arg_58_0.curSubViewNum = 0
		else
			var_58_0:ShowPanel(arg_58_1)
		end
	end
end

function var_0_0.ShowResourceBar(arg_59_0, arg_59_1)
	if arg_59_0.resourceBarFlag == arg_59_1 then
		return
	end

	arg_59_0.resourceBarFlag = arg_59_1

	setActive(arg_59_0.resourcePanel, arg_59_1)
end

function var_0_0.willExit(arg_60_0)
	for iter_60_0, iter_60_1 in ipairs(arg_60_0.eventIDList) do
		arg_60_0:disconnect(iter_60_1)
	end

	arg_60_0.eventIDList = nil

	if arg_60_0.bulinTip then
		arg_60_0.bulinTip:Destroy()

		arg_60_0.bulinTip = nil
	end

	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_60_0.specialTip)
	pg.EasyRedDotMgr.GetInstance():UnRegisterRedDot(arg_60_0.giftTip)

	if arg_60_0.toggleMark then
		for iter_60_2, iter_60_3 in pairs(arg_60_0.toggleMark) do
			if iter_60_3 > 0 then
				local var_60_0 = switch(iter_60_2, {
					[ChargeScene.TYPE_PICK] = function()
						return "payshop_pack_red_dot"
					end,
					[ChargeScene.TYPE_GIFT] = function()
						return "gemshop_pack_red_dot"
					end
				})

				PlayerPrefs.SetInt(var_60_0, getGameset(var_60_0)[1])
			end
		end

		arg_60_0.toggleMark = nil
	end

	arg_60_0:ShowResourceBar()
	arg_60_0:unBlurView()

	if arg_60_0.chargeTipWindow then
		arg_60_0.chargeTipWindow:Destroy()

		arg_60_0.chargeTipWindow = nil
	end

	arg_60_0.contextData.singleWindow:Destroy()
	arg_60_0.contextData.multiWindow:Destroy()
	arg_60_0.contextData.singleWindowForESkin:Destroy()
	arg_60_0.contextData.paintingView:Dispose()

	arg_60_0.contextData.singleWindow = nil
	arg_60_0.contextData.multiWindow = nil
	arg_60_0.contextData.singleWindowForESkin = nil
	arg_60_0.contextData.paintingView = nil
	arg_60_0.bulinTip = nil

	for iter_60_4, iter_60_5 in pairs(arg_60_0.subViewList) do
		iter_60_5:Destroy()
	end

	arg_60_0.subViewList = nil

	if arg_60_0.heartsTimer then
		arg_60_0.heartsTimer:Stop()

		arg_60_0.heartsTimer = nil
	end

	if arg_60_0.live2dChar then
		arg_60_0.live2dChar:Dispose()
	end

	arg_60_0:StopLive2dTimer()
	arg_60_0:stopCV()
	arg_60_0:DisposeSkinToggleList()

	if arg_60_0.giftShopView then
		arg_60_0.giftShopView:OnDestroy()
	end
end

function var_0_0.onBackPressed(arg_63_0)
	if arg_63_0.contextData.singleWindow:GetLoaded() and arg_63_0.contextData.singleWindow:isShowing() then
		arg_63_0.contextData.singleWindow:Close()

		return
	end

	if arg_63_0.contextData.multiWindow:GetLoaded() and arg_63_0.contextData.multiWindow:isShowing() then
		arg_63_0.contextData.multiWindow:Close()

		return
	end

	if arg_63_0.contextData.singleWindowForESkin:GetLoaded() and arg_63_0.contextData.singleWindowForESkin:isShowing() then
		arg_63_0.contextData.singleWindowForESkin:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_63_0)
end

function var_0_0.initSubView(arg_64_0)
	local var_64_0 = ChargeDiamondShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData)
	local var_64_1 = ChargeGiftShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData)
	local var_64_2 = ChargeItemShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData)
	local var_64_3 = ChargePickShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData)
	local var_64_4 = SupplyShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData, ShopConst.CATEGORY_MONTH)
	local var_64_5 = SupplyShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData, ShopConst.CATEGORY_SUPPLY)
	local var_64_6 = SupplyShopView.New(arg_64_0.viewContainer, arg_64_0.event, arg_64_0.contextData, ShopConst.CATEGORY_ACTIVITY)

	arg_64_0.curSubViewNum = 0
	arg_64_0.subViewList = {
		[ShopConst.SHOP_ID.DIAMOND] = var_64_0,
		[ShopConst.SHOP_ID.GIFT] = var_64_1,
		[ShopConst.SHOP_ID.ITEM] = var_64_2,
		[ShopConst.SHOP_ID.PICK] = var_64_3,
		[ShopConst.SHOP_ID.MONTH] = var_64_4,
		[ShopConst.SHOP_ID.SUPPLY] = var_64_5,
		[ShopConst.SHOP_ID.ACTIVITY] = var_64_6
	}

	for iter_64_0, iter_64_1 in pairs(arg_64_0.subViewList) do
		iter_64_1:RegisterView(arg_64_0)
	end

	arg_64_0.contextData.singleWindow = ShopSingleWindow.New(arg_64_0._tf, arg_64_0.event)
	arg_64_0.contextData.multiWindow = ShopMultiWindow.New(arg_64_0._tf, arg_64_0.event)
	arg_64_0.contextData.singleWindowForESkin = EquipmentSkinInfoUIForShopWindow.New(arg_64_0._tf, arg_64_0.event)
	arg_64_0.contextData.paintingView = ShopPaintingView.New(arg_64_0._tf:Find("frame/supplyPaint"), arg_64_0._tf:Find("frame/chat"))

	arg_64_0.contextData.paintingView:setSecretaryPos(arg_64_0._tf:Find("frame/secretaryPos"))
end

function var_0_0.GetShopID(arg_65_0, arg_65_1, arg_65_2)
	return ShopConst.SHOP_LIST[arg_65_1][arg_65_2]
end

function var_0_0.switchSubView(arg_66_0, arg_66_1)
	if arg_66_1 == arg_66_0.curSubViewNum then
		return
	end

	arg_66_0.subViewList[arg_66_1]:setGoodData(arg_66_0.firstChargeIds, arg_66_0.chargedList, arg_66_0.normalList, arg_66_0.normalGroupList)
	arg_66_0.subViewList[arg_66_1]:Reset()
	arg_66_0.subViewList[arg_66_1]:Load()

	if arg_66_0.subViewList[arg_66_1].SetAllShopData then
		arg_66_0.subViewList[arg_66_1]:ActionInvoke("SetAllShopData", arg_66_0.supplyShopList)
	end

	local var_66_0 = arg_66_0.subViewList[arg_66_0.curSubViewNum]

	if var_66_0 then
		var_66_0:Destroy()
	end

	arg_66_0.curSubViewNum = arg_66_1

	arg_66_0:SwitchPainting(arg_66_0.subViewList[arg_66_1]:IsSupplyShop())

	if PLATFORM_CODE == PLATFORM_JP then
		setActive(arg_66_0.userAgreeBtn3, arg_66_1 == ChargeScene.TYPE_DIAMOND)
		setActive(arg_66_0.userAgreeBtn4, arg_66_1 == ChargeScene.TYPE_DIAMOND)
	end
end

function var_0_0.SwitchPainting(arg_67_0, arg_67_1)
	arg_67_0.contextData.paintingView:Show(arg_67_1)
	setActive(arg_67_0.painting, not arg_67_1)

	if arg_67_1 then
		arg_67_0:StopLive2dTimer()

		arg_67_0.chatFlag = nil

		arg_67_0:stopCV()
		setActive(arg_67_0.stamp, getProxy(TaskProxy):mingshiTouchFlagEnabled())

		if LOCK_CLICK_MINGSHI then
			setActive(arg_67_0.stamp, false)
		end
	else
		setActive(arg_67_0.stamp, false)
		arg_67_0:AddLive2dTimer()
	end
end

function var_0_0.switchSubViewByTogger(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0.toggleList[arg_68_1]

	triggerToggle(var_68_0.go, true)
end

function var_0_0.updateCurSubView(arg_69_0)
	if not isActive(arg_69_0.viewContainer) then
		return
	end

	local var_69_0 = arg_69_0.subViewList[arg_69_0.curSubViewNum]

	if var_69_0 == nil then
		return
	end

	var_69_0:ActionInvoke("setGoodData", arg_69_0.firstChargeIds, arg_69_0.chargedList, arg_69_0.normalList, arg_69_0.normalGroupList)
	var_69_0:ActionInvoke("reUpdateAll")
end

function var_0_0.updateNoRes(arg_70_0, arg_70_1)
	if not arg_70_1 then
		arg_70_1 = arg_70_0.contextData.noRes
	else
		arg_70_0.contextData.noRes = arg_70_1
	end

	if not arg_70_1 or #arg_70_1 <= 0 then
		return
	end

	arg_70_0.contextData.noRes = {}

	local var_70_0 = getProxy(BagProxy):getData()
	local var_70_1 = ""

	for iter_70_0, iter_70_1 in ipairs(arg_70_1) do
		if iter_70_1[2] > 0 then
			if iter_70_1[1] == 59001 then
				arg_70_1[iter_70_0][2] = iter_70_1[3] - arg_70_0.player.gold
			else
				arg_70_1[iter_70_0][2] = iter_70_1[3] - (var_70_0[iter_70_1[1]] and var_70_0[iter_70_1[1]].count or 0)
			end
		end

		if arg_70_1[iter_70_0][2] > 0 then
			table.insert(arg_70_0.contextData.noRes, arg_70_1[iter_70_0])
		end
	end

	for iter_70_2, iter_70_3 in ipairs(arg_70_0.contextData.noRes) do
		local var_70_2 = Item.getConfigData(iter_70_3[1]).name

		var_70_1 = var_70_1 .. i18n(iter_70_3[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_70_2, iter_70_3[2])

		if iter_70_2 < #arg_70_0.contextData.noRes then
			var_70_1 = var_70_1 .. i18n("text_noRes_info_tip_link")
		end
	end

	if var_70_1 == "" then
		arg_70_0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
	else
		arg_70_0:displayShipWord(i18n("text_shop_noRes_tip", var_70_1), true)
	end
end

function var_0_0.displayShipWord(arg_71_0, arg_71_1, arg_71_2, arg_71_3)
	if not arg_71_0.chatFlag then
		if not arg_71_1 and arg_71_0.contextData.noRes and #arg_71_0.contextData.noRes > 0 then
			setActive(arg_71_0.chat, false)

			arg_71_0.chat.transform.localScale = Vector3(0, 0, 1)
		end

		arg_71_0.chatFlag = true

		if not arg_71_0.isInitChatPosition then
			arg_71_0.isInitChatPosition = true

			arg_71_0:InitChatPosition()
		end

		setActive(arg_71_0.chat, true)

		local var_71_0 = arg_71_0.player:getChargeLevel()
		local var_71_1 = arg_71_3 or math.random(1, var_71_0)
		local var_71_2

		if arg_71_3 then
			var_71_2 = pg.pay_level_award[var_71_1].dialog
		else
			var_71_2 = arg_71_1 or pg.pay_level_award[var_71_1].dialog
		end

		if not arg_71_1 then
			arg_71_0:playCV(var_71_1)
		end

		setText(arg_71_0.chatText, var_71_2)

		local var_71_3 = arg_71_0.chatText:GetComponent(typeof(Text))

		;(function()
			local var_72_0 = 3
			local var_72_1 = 0.3

			LeanTween.scale(rtf(arg_71_0.chat.gameObject), Vector3.New(1, 1, 1), var_72_1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
				if not arg_71_2 then
					LeanTween.scale(rtf(arg_71_0.chat.gameObject), Vector3.New(0, 0, 1), var_72_1):setEase(LeanTweenType.easeInBack):setDelay(var_72_1 + var_72_0):setOnComplete(System.Action(function()
						arg_71_0.chatFlag = nil

						setActive(arg_71_0.chat, false)

						if arg_71_0.contextData.noRes and #arg_71_0.contextData.noRes > 0 then
							arg_71_0:updateNoRes()
						end
					end))
				else
					arg_71_0.chatFlag = nil
				end
			end))
		end)()
	end
end

function var_0_0.InitChatPosition(arg_75_0)
	return
end

function var_0_0.playHeartEffect(arg_76_0)
	if arg_76_0.heartsTimer then
		arg_76_0.heartsTimer:Stop()
	end

	local var_76_0 = arg_76_0.painting:Find("heartsfly")

	setActive(var_76_0, true)

	arg_76_0.heartsTimer = Timer.New(function()
		setActive(var_76_0, false)
	end, 1, 1)

	arg_76_0.heartsTimer:Start()
end

function var_0_0.createLive2D(arg_78_0)
	local var_78_0 = Live2DPainting.GenerateData({
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
		parent = arg_78_0._tf:Find("frame/painting/live2d")
	})

	arg_78_0.live2dChar = Live2DPainting.New(var_78_0, function(arg_79_0)
		arg_79_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
	end)
end

function var_0_0.checkBuyDone(arg_80_0, arg_80_1)
	if not arg_80_0.live2dChar or not arg_80_0.live2dChar:IsLoaded() then
		return
	end

	local var_80_0

	if type(arg_80_1) == "string" then
		if arg_80_1 == "damonds" then
			var_80_0 = "diamond"
		else
			var_80_0 = arg_80_1
		end
	else
		local var_80_1 = ShopConst.GetShopConfig(arg_80_1)

		if var_80_1 and var_80_1.effect_args and type(var_80_1.effect_args) == "table" then
			for iter_80_0, iter_80_1 in ipairs(var_80_1.effect_args) do
				if iter_80_1 == 1 then
					var_80_0 = "gold"
				end
			end
		end
	end

	local var_80_2 = arg_80_0.preAniName == "gold" or arg_80_0.preAniName == "diamond"
	local var_80_3 = var_80_0 == "gold" or var_80_0 == "diamond"
	local var_80_4 = var_80_2 and var_80_3 or not var_80_2

	var_80_4 = var_80_0 and arg_80_0.preAniName ~= var_80_0 and var_80_4

	if var_80_4 then
		arg_80_0.preAniName = var_80_0

		arg_80_0.live2dChar:TriggerAction(var_80_0, nil, true)
	end

	return var_80_4
end

function var_0_0.playCV(arg_81_0, arg_81_1)
	local var_81_0 = pg.pay_level_award[arg_81_1]
	local var_81_1

	if var_81_0 and var_81_0.cv_key ~= "" then
		var_81_1 = "event:/cv/chargeShop/" .. var_81_0.cv_key
	end

	if var_81_1 then
		arg_81_0:stopCV()

		arg_81_0._currentVoice = var_81_1

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_81_1)
	end
end

function var_0_0.stopCV(arg_82_0)
	if arg_82_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_82_0._currentVoice)
	end

	arg_82_0._currentVoice = nil
end

function var_0_0.blurView(arg_83_0)
	arg_83_0:OverlayPanel(arg_83_0.buttonList, {
		pbList = {
			arg_83_0.buttonList:Find("leftBg")
		}
	})
end

function var_0_0.unBlurView(arg_84_0)
	arg_84_0:UnOverlayPanel(arg_84_0.buttonList, arg_84_0._tf)
end

function var_0_0.jpUIInit(arg_85_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	arg_85_0.userAgreeBtn3 = arg_85_0._tf:Find("frame/raw1Btn")
	arg_85_0.userAgreeBtn4 = arg_85_0._tf:Find("frame/raw2Btn")
end

function var_0_0.jpUIEnter(arg_86_0)
	if PLATFORM_CODE ~= PLATFORM_JP then
		return
	end

	onButton(arg_86_0, arg_86_0.userAgreeBtn3, function()
		local var_87_0 = require("ShareCfg.UserAgreement3")

		arg_86_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_87_0 or "")
	end, SFX_PANEL)
	onButton(arg_86_0, arg_86_0.userAgreeBtn4, function()
		local var_88_0 = require("ShareCfg.UserAgreement4")

		arg_86_0:emit(NewShopMainMediator.OPEN_USER_AGREE, var_88_0 or "")
	end, SFX_PANEL)
end

function var_0_0.addRefreshTimer(arg_89_0, arg_89_1)
	local function var_89_0()
		if arg_89_0.refreshTimer then
			arg_89_0.refreshTimer:Stop()

			arg_89_0.refreshTimer = nil
		end
	end

	var_89_0()

	arg_89_0.refreshTimer = Timer.New(function()
		if arg_89_1 + 1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
			var_89_0()
			arg_89_0:emit(NewShopMainMediator.GET_CHARGE_LIST)
		end
	end, 1, -1)

	arg_89_0.refreshTimer:Start()
	arg_89_0.refreshTimer.func()
end

function var_0_0.InitSkinToggleList(arg_92_0)
	arg_92_0.uiSkinToggleParent = arg_92_0.buttonList:Find("shop1List/skinShop/shop2List")
	arg_92_0.uiSkinToggleItem = arg_92_0.buttonList:Find("shop1List/skinShop/shop2List/skinToggleItem")

	local var_92_0 = getProxy(ShipSkinProxy):GetInTimeSkins()

	setActive(arg_92_0.buttonList:Find("shop1List/skinShop/shop1Tg/timeLimit"), #var_92_0 > 0)

	arg_92_0.skinShopList = arg_92_0:GetSkinShopList()
	arg_92_0.skinShopItemList = {}

	onToggle(arg_92_0, arg_92_0.buttonList:Find("shop1List/skinShop/shop1Tg"), function(arg_93_0)
		setActive(arg_92_0.buttonList:Find("shop1List/skinShop/shop2List"), arg_93_0)

		if arg_93_0 then
			if arg_92_0.shop1 == "skinShop" then
				return
			end

			arg_92_0.shop1 = "skinShop"

			local var_93_0 = arg_92_0.skinShopItemList[table.keyof(arg_92_0.skinShopList, arg_92_0:GetDefaultSkinShop())]

			var_93_0 = arg_92_0.contextData.shop1 and arg_92_0.contextData.shop2 and arg_92_0.skinShopItemList[table.keyof(arg_92_0.skinShopList, arg_92_0.contextData.shop2)] or var_93_0
			arg_92_0.contextData.shop1 = "skinShop"

			var_93_0:TriggerToggle()
		end
	end, SFX_PANEL)

	for iter_92_0, iter_92_1 in ipairs(arg_92_0.skinShopList) do
		arg_92_0.skinShopItemList[iter_92_0] = arg_92_0.skinShopItemList[iter_92_0] or NewShopMainSkinToggleItem.New(Object.Instantiate(arg_92_0.uiSkinToggleItem, arg_92_0.uiSkinToggleParent), arg_92_0)

		arg_92_0.skinShopItemList[iter_92_0]:didEnter(iter_92_1)
	end
end

function var_0_0.OnClickSkinShop(arg_94_0, arg_94_1, arg_94_2)
	arg_94_0.contextData.shop2 = arg_94_2

	if arg_94_0.shop2 == arg_94_2 then
		return
	end

	arg_94_0.shop2 = arg_94_2

	arg_94_0:ShowChargeWarp(false)
	pg.m02:sendNotification(var_0_0.CLOSE_ALL_LAYER)
	arg_94_0:emit(NewShopMainMediator.OPEN_LAYER, LatestSkinShopLayer, LatestSkinShopMediator, {
		type = arg_94_2,
		mode = arg_94_0.contextData.mode
	})
end

function var_0_0.DisposeSkinToggleList(arg_95_0)
	for iter_95_0, iter_95_1 in ipairs(arg_95_0.skinShopItemList) do
		iter_95_1:willExit()
	end

	arg_95_0.skinShopItemList = nil
end

function var_0_0.GetSkinShopList(arg_96_0)
	local var_96_0 = Clone(pg.shop_skin_subsheet.get_id_list_by_type[0])

	for iter_96_0 = #var_96_0, 1, -1 do
		local var_96_1 = var_96_0[iter_96_0]
		local var_96_2 = {}

		if var_96_1 == ShopConst.NEW_SKIN_SHOP_ID then
			var_96_2 = getProxy(ShipSkinProxy):GetInTimeSkins()
		elseif var_96_1 == ShopConst.PERMANANT_SKIN_SHOP_ID then
			var_96_2 = getProxy(ShipSkinProxy):GetPermanentSkins()
		end

		if LOCK_SKIN_US then
			local var_96_3 = pg.gameset.levellimit_skintype.key_value
			local var_96_4 = pg.gameset.levellimit_skintype.description

			if var_96_3 >= getProxy(PlayerProxy):getData().level then
				var_96_2 = _.filter(var_96_2, function(arg_97_0)
					local var_97_0 = pg.ship_skin_template[arg_97_0:getSkinId()].shop_type_id

					return table.contains(var_96_4, var_97_0)
				end)
			end
		end

		if arg_96_0.contextData.mode == nil or arg_96_0.contextData.mode == LatestSkinShopLayer.MODE_OVERVIEW then
			for iter_96_1 = #var_96_2, 1, -1 do
				if var_96_2[iter_96_1]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
					table.remove(var_96_2, iter_96_1)
				end
			end
		end

		if #var_96_2 <= 0 then
			table.remove(var_96_0, 1)
		end
	end

	local var_96_5 = pg.TimeMgr.GetInstance()
	local var_96_6 = getProxy(ShipSkinProxy):GetAllSkins()

	for iter_96_2, iter_96_3 in ipairs(pg.shop_skin_subsheet.get_id_list_by_type[1] or {}) do
		local var_96_7 = pg.shop_skin_subsheet[iter_96_3]

		if var_96_5:inTime(var_96_7.time) then
			for iter_96_4, iter_96_5 in ipairs(var_96_6) do
				if table.keyof(var_96_7.param, iter_96_5.id) then
					table.insert(var_96_0, iter_96_3)

					break
				end
			end
		end
	end

	table.sort(var_96_0, function(arg_98_0, arg_98_1)
		local var_98_0 = pg.shop_skin_subsheet[arg_98_0]
		local var_98_1 = pg.shop_skin_subsheet[arg_98_1]

		return var_98_0.sort == var_98_0.sort and arg_98_0 < arg_98_1 or var_98_0.sort < var_98_1.sort
	end)

	return var_96_0
end

function var_0_0.GetDefaultSkinShop(arg_99_0)
	local var_99_0 = Clone(arg_99_0.skinShopList)

	table.sort(var_99_0, function(arg_100_0, arg_100_1)
		local var_100_0 = pg.shop_skin_subsheet[arg_100_0]
		local var_100_1 = pg.shop_skin_subsheet[arg_100_1]

		if var_100_0.shop_skin_subsheet == var_100_1.shop_skin_subsheet then
			return var_100_0.sort == var_100_1.sort and arg_100_0 < arg_100_1 or var_100_0.sort < var_100_1.sort
		else
			return var_100_0.shop_skin_subsheet < var_100_1.shop_skin_subsheet
		end
	end)

	return var_99_0[1]
end

return var_0_0

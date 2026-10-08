local var_0_0 = class("LatestSkinShopLayer", import("...base.BaseUI"))

var_0_0.MODE_OVERVIEW = 1
var_0_0.MODE_EXPERIENCE = 2
var_0_0.MODE_EXPERIENCE_FOR_ITEM = 3

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 1
local var_0_5 = 2
local var_0_6 = 3
local var_0_7 = 4
local var_0_8 = 5
local var_0_9 = 6
local var_0_10 = 7
local var_0_11 = 8
local var_0_12 = -1
local var_0_13 = -2
local var_0_14 = -3
local var_0_15 = -4
local var_0_16 = 9999
local var_0_17 = 9997
local var_0_18 = 9998

var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW = "NewSkinShopMainView:EVT_SHOW_OR_HIDE_PURCHASE_VIEW"
var_0_0.EVT_ON_PURCHASE = "NewSkinShopMainView:EVT_ON_PURCHASE"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)
end

local function var_0_19(arg_2_0)
	if not var_0_0.obtainBtnSpriteNames then
		var_0_0.obtainBtnSpriteNames = {
			[var_0_4] = "yigoumai_button",
			[var_0_5] = "goumai_button",
			[var_0_6] = "qianwanghuoqu_button",
			[var_0_7] = "item_buy",
			[var_0_8] = "furniture_shop",
			[var_0_9] = "tiyan_btn",
			[var_0_10] = "item_buy",
			[var_0_11] = "buy_with_gift"
		}
	end

	return var_0_0.obtainBtnSpriteNames[arg_2_0]
end

function var_0_0.getUIName(arg_3_0)
	return "LatestSkinShopUI"
end

function var_0_0.getGroupName(arg_4_0)
	return "NewShopMainScene"
end

function var_0_0.getResource(arg_5_0, arg_5_1)
	local var_5_0 = {
		"ui/LatestSkinShopUI",
		"ui/SkinShopUI_atlas",
		"skinicon"
	}
	local var_5_1 = pg.ship_skin_template

	local function var_5_2(arg_6_0)
		local var_6_0 = Goods.Create({
			shop_id = arg_6_0
		}, Goods.TYPE_CHARGE)
		local var_6_1 = getProxy(ShopsProxy):getChargedList() or {}
		local var_6_2 = ChargeConst.getBuyCount(var_6_1, var_6_0.id)

		var_6_0:updateBuyCount(var_6_2)

		return var_6_0
	end

	local function var_5_3()
		if arg_5_1.skinCommodities then
			return arg_5_1.skinCommodities
		end

		if arg_5_1.commodityId or arg_5_1.giftPackCommodity then
			local var_7_0 = (arg_5_1.giftPackCommodity or var_5_2(arg_5_1.commodityId)):GetSkinProbability()

			return getProxy(ShipSkinProxy):GetProbabilitySkins(var_7_0)
		end

		local var_7_1 = arg_5_1.type or var_0_0.TYPE_PERMANANT_SKIN
		local var_7_2 = arg_5_1.mode or var_0_0.MODE_OVERVIEW
		local var_7_3 = {}

		if var_7_1 == var_0_0.TYPE_NEW_SKIN then
			var_7_3 = getProxy(ShipSkinProxy):GetInTimeSkins()
		elseif var_7_1 == var_0_0.TYPE_PERMANANT_SKIN then
			var_7_3 = getProxy(ShipSkinProxy):GetPermanentSkins()
		end

		if LOCK_SKIN_US then
			local var_7_4 = pg.gameset.levellimit_skintype.key_value
			local var_7_5 = pg.gameset.levellimit_skintype.description

			if var_7_4 >= getProxy(PlayerProxy):getData().level then
				var_7_3 = _.filter(var_7_3, function(arg_8_0)
					local var_8_0 = arg_8_0:getSkinId()
					local var_8_1 = var_5_1[var_8_0].shop_type_id

					return table.contains(var_7_5, var_8_1)
				end)
			end
		end

		if var_7_2 == var_0_0.MODE_OVERVIEW then
			for iter_7_0 = #var_7_3, 1, -1 do
				if var_7_3[iter_7_0]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
					table.remove(var_7_3, iter_7_0)
				end
			end
		end

		return var_7_3
	end

	local var_5_4 = (function(arg_9_0)
		local var_9_0 = {}

		for iter_9_0, iter_9_1 in ipairs(arg_9_0) do
			local var_9_1 = iter_9_1:getSkinId()
			local var_9_2 = var_5_1[var_9_1]

			table.insertto(var_9_0, ResPathSupport.GetPaintingShipYardIconListByPaintingName(var_9_2.prefab))
			table.insertto(var_9_0, ResPathSupport.GetSpineQIconListByPrefabName(var_9_2.painting))
			table.insertto(var_9_0, ResPathSupport.GetSpineCharListByPrefabName(var_9_2.prefab))
			table.insertto(var_9_0, ResPathSupport.GetShopPaintingListByPaintingName(var_9_2.painting))
			PaintingGroupConst.AddPaintingNameBySkinID(var_9_0, var_9_1)
			table.insertto(var_9_0, ResPathSupport.GetShipSkinLive2DList(var_9_1))
			table.insertto(var_9_0, ResPathSupport.GetShipSkinSpinePaintingList(var_9_1))
			table.insertto(var_9_0, ResPathSupport.GetShipSkinBgList(var_9_1))

			if iter_9_1.type == Goods.TYPE_SKIN then
				local var_9_3 = iter_9_1:getConfig("resource_type")
				local var_9_4 = Item.getConfigData(id2ItemId(var_9_3))

				table.insert(var_9_0, var_9_4.icon)
			end
		end

		return var_9_0
	end)(var_5_3())

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_5_0, arg_5_1), var_5_0, var_5_4))
end

function var_0_0.init(arg_10_0)
	arg_10_0.bgs = arg_10_0._tf:Find("bgs")
	arg_10_0.adapt = arg_10_0._tf:Find("adapt")
	arg_10_0.top = arg_10_0.adapt:Find("top")
	arg_10_0.bottom = arg_10_0.adapt:Find("bottom")
	arg_10_0.right = arg_10_0.adapt:Find("right")
	arg_10_0.subPage = arg_10_0.adapt:Find("subPage")
	arg_10_0.resources = arg_10_0.adapt:Find("top/resources")
	arg_10_0.limitTime = arg_10_0.adapt:Find("top/title/limit_time/Text")
	arg_10_0.skinName = arg_10_0.adapt:Find("top/title/skin_name_mask/skin_name")
	arg_10_0.shipName = arg_10_0.adapt:Find("top/title/name_mask/name")
	arg_10_0.changeSkin = arg_10_0.adapt:Find("top/change_skin")
	arg_10_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_10_0.changeSkin, "toggle_ui"))
	arg_10_0.showOwnBtn = arg_10_0.adapt:Find("bottom/showOwnBtn")
	arg_10_0.filterBtn = arg_10_0.adapt:Find("bottom/filterBtn")
	arg_10_0.search = arg_10_0.adapt:Find("bottom/search")
	arg_10_0.scrollrect = arg_10_0.adapt:Find("bottom/scroll/content"):GetComponent("LScrollRect")
	arg_10_0.sdTg = arg_10_0.adapt:Find("right/sdTg")
	arg_10_0.hideUITg = arg_10_0.adapt:Find("right/hideUITg")
	arg_10_0.charContainer = arg_10_0.adapt:Find("right/char_container")
	arg_10_0.backChara = arg_10_0.charContainer:Find("bg/back/chara")
	arg_10_0.charTf = arg_10_0.charContainer:Find("char")
	arg_10_0.furnitureContainer = arg_10_0.charContainer:Find("fur")
	arg_10_0.switchPreviewBtn = arg_10_0.charContainer:Find("switch")
	arg_10_0.dynamicToggle = arg_10_0.adapt:Find("right/functionsAndTags/dynamic")
	arg_10_0.dynamicIcon = arg_10_0.adapt:Find("right/functionsAndTags/dynamic/icon")
	arg_10_0.showBgToggle = arg_10_0.adapt:Find("right/functionsAndTags/showBg")
	arg_10_0.dynamicResToggle = arg_10_0.adapt:Find("right/functionsAndTags/dynamic/l2d_res_state")
	arg_10_0.tagList = UIItemList.New(arg_10_0.adapt:Find("right/functionsAndTags/tags"), arg_10_0.adapt:Find("right/functionsAndTags/tags/tag"))
	arg_10_0.giftPackBtn = arg_10_0.adapt:Find("right/giftPackBtn")
	arg_10_0.price = arg_10_0.adapt:Find("right/price")
	arg_10_0.btnsList = {
		arg_10_0.price:Find("normal/btns"),
		arg_10_0.price:Find("charge/btns")
	}
	arg_10_0.filterUI = arg_10_0.adapt:Find("subPage/filterUI")
	arg_10_0.filterContent = arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content")
	arg_10_0.painting = arg_10_0._tf:Find("painting")
	arg_10_0.paintingTF = arg_10_0._tf:Find("painting/paint")
	arg_10_0.defaultPaintingPosition = arg_10_0.paintingTF.anchoredPosition
	arg_10_0.defaultPaintingScale = arg_10_0.paintingTF.localScale
	arg_10_0.live2dContainer = arg_10_0._tf:Find("painting/paint/live2d")
	arg_10_0.spTF = arg_10_0._tf:Find("painting/paint/spinePainting")
	arg_10_0.spBg = arg_10_0._tf:Find("painting/paintBg/spinePainting")

	setActive(arg_10_0.charContainer, false)
	setActive(arg_10_0.filterUI, false)

	arg_10_0.mainTitle = arg_10_0.adapt:Find("top/mainTitle")
	arg_10_0.backBtn = arg_10_0.adapt:Find("top/closeBtn")
	arg_10_0.homeBtn = arg_10_0.adapt:Find("top/homeBtn")
	arg_10_0.giftPack = arg_10_0.adapt:Find("giftPack")

	setActive(arg_10_0.mainTitle, false)
	setActive(arg_10_0.backBtn, false)
	setActive(arg_10_0.homeBtn, false)
	setActive(arg_10_0.giftPack, false)

	arg_10_0.downloads = {}
	arg_10_0.isToggleDynamic = false
	arg_10_0.isToggleShowBg = true
	arg_10_0.isPreviewFurniture = false
	arg_10_0.interactionPreview = BackYardInteractionPreview.New(arg_10_0.furnitureContainer, Vector3(0, 0, 0))
	arg_10_0.voucherMsgBox = SkinVoucherMsgBox.New(pg.UIMgr.GetInstance().OverlayMain)
	arg_10_0.purchaseView = NewSkinShopPurchaseView.New(arg_10_0._tf, arg_10_0.event)

	arg_10_0:RegisterEvent()
	setText(arg_10_0._tf:Find("bgs/empty/Text"), i18n("shop_new_unfound"))
	setText(arg_10_0.adapt:Find("top/mainTitle/Text"), i18n("shop_new_shop"))
	setText(arg_10_0.filterBtn:Find("Text"), i18n("shop_new_sort"))
	setText(arg_10_0.search:Find("holder"), i18n("shop_new_search"))

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.btnsList) do
		setText(iter_10_1:Find("yigoumai_button/Text"), i18n("shop_new_purchased"))
		setText(iter_10_1:Find("goumai_button/Text"), i18n("shop_new_purchase"))
		setText(iter_10_1:Find("qianwanghuoqu_button/Text"), i18n("shop_new_claim"))
		setText(iter_10_1:Find("furniture_shop/Text"), i18n("shop_new_furniture"))
		setText(iter_10_1:Find("item_buy/Text"), i18n("shop_new_discount"))
		setText(iter_10_1:Find("tiyan_btn/Text"), i18n("shop_new_try"))
		setText(iter_10_1:Find("buy_with_gift/Text"), i18n("shop_new_purchase"))
	end

	setText(arg_10_0.btnsList[2]:Find("buy_charge/Text"), i18n("shop_new_purchase"))
	setText(arg_10_0.price:Find("btn/tag/Text"), i18n("shop_new_gift"))
	setText(arg_10_0.giftPack:Find("panel/desc"), i18n("shop_new_gem_transform"))
	setText(arg_10_0.giftPack:Find("price/btns/yigoumai_button/Text"), i18n("shop_new_purchased"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/title"), i18n("shop_new_sort"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/subTitleFrame/subTitle"), i18n("shop_new_review"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/0/Text"), i18n("shop_new_all"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/1/Text"), i18n("shop_new_owned"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/2/Text"), i18n("shop_new_havent_own"))
	setScrollText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/3/mask/Text"), i18n("shop_new_unused"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle"), i18n("shop_new_type"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/0/Text"), i18n("shop_new_all"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/2/Text"), i18n("shop_new_static"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/3/Text"), i18n("shop_new_dynamic"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/4/Text"), i18n("shop_new_static_bg"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/5/Text"), i18n("shop_new_dynamic_bg"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/6/Text"), i18n("shop_new_bgm"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/subTitleFrame/subTitle"), i18n("shop_new_index"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/0/Text"), i18n("shop_new_all"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/1/Text"), i18n("shop_new_ship_owned"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/2/Text"), i18n("shop_new_ship_havent_owned"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/camp/subTitleFrame/subTitle"), i18n("shop_new_nation"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/rarity/subTitleFrame/subTitle"), i18n("shop_new_rarity"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipType/subTitleFrame/subTitle"), i18n("shop_new_category"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/themeType/subTitleFrame/subTitle"), i18n("shop_new_skin_theme"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/subTitleFrame/subTitle"), i18n("skin_shop_tag"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/0/Text"), i18n("skin_shop_tag_0"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/1/Text"), i18n("skin_shop_tag_1"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/2/Text"), i18n("skin_shop_tag_2"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/3/Text"), i18n("skin_shop_tag_3"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/4/Text"), i18n("skin_shop_tag_4"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/5/Text"), i18n("skin_shop_tag_5"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/6/Text"), i18n("skin_shop_tag_6"))
	setText(arg_10_0.filterUI:Find("panelMask/panel/bottom/ok/Text"), i18n("shop_new_confirm"))

	arg_10_0.uiOwnOptions = arg_10_0.filterContent:Find("own/options")
	arg_10_0.uiTypeOptions = arg_10_0.filterContent:Find("type/options")
	arg_10_0.uiShipHaveOptions = arg_10_0.filterContent:Find("shipHave/options")
	arg_10_0.uiCampOptions = arg_10_0.filterContent:Find("camp/options")
	arg_10_0.uiRrarityOptions = arg_10_0.filterContent:Find("rarity/options")
	arg_10_0.uiShipTypeOptions = arg_10_0.filterContent:Find("shipType/options")
	arg_10_0.uiThemeTypeOptions = arg_10_0.filterContent:Find("themeType/options")
	arg_10_0.uiTagTypeOptions = arg_10_0.filterContent:Find("tag/options")

	arg_10_0:Overlay()
end

function var_0_0.Overlay(arg_11_0)
	arg_11_0:OverlayPanel(arg_11_0.adapt, {
		pbList = {
			arg_11_0.top:Find("title"),
			arg_11_0.top:Find("title/limit_time"),
			arg_11_0.top:Find("title/charaNameBg"),
			arg_11_0.showOwnBtn,
			arg_11_0.filterBtn,
			arg_11_0.search,
			arg_11_0.charContainer:Find("bg"),
			arg_11_0.price:Find("normal/consume"),
			arg_11_0.filterUI:Find("panelMask/panel")
		}
	})
end

function var_0_0.UnOverlay(arg_12_0)
	arg_12_0:UnOverlayPanel(arg_12_0.adapt, arg_12_0._tf)
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:InitData()
	arg_13_0:SetFilterPanel()
	arg_13_0:SetResource()

	if arg_13_0.mode == var_0_0.MODE_EXPERIENCE or arg_13_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI_2, false)
		setActive(arg_13_0.showOwnBtn, false)
		setActive(arg_13_0.filterBtn, false)
		setActive(arg_13_0.search, false)

		arg_13_0.top:Find("title").anchoredPosition = Vector2(184.2, -208.3)
		arg_13_0.top:Find("change_skin").anchoredPosition = Vector2(70.7, -337.8)
		arg_13_0.right:Find("giftPackBtn").anchoredPosition = Vector2(-483, -446.4)
		arg_13_0.right:Find("price").anchoredPosition = Vector2(-238.3, -140.7)
		arg_13_0.bottom:Find("scroll").offsetMin = Vector2(17.7, 0)
		arg_13_0.bottom:Find("scroll").offsetMax = Vector2(-718.7, 227.9)
	end

	arg_13_0:SetGiftPackLayer()
	onDelayTick(function()
		local var_14_0 = {}

		table.insert(var_14_0, function(arg_15_0)
			arg_13_0:CheckDownloadSkinList(arg_15_0)
		end)
		seriesAsync(var_14_0, function()
			arg_13_0:SetSkinScroll()
			arg_13_0:Refresh(true)
		end)
	end, 0.001)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.homeBtn, function()
		arg_13_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.filterBtn, function()
		arg_13_0:OpenFilterPanel()
	end, SFX_PANEL)

	if arg_13_0.mode == var_0_0.MODE_EXPERIENCE or arg_13_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		getProxy(SettingsProxy):SetNextTipTimeLimitSkinShop()
	end

	local var_13_0 = getProxy(PlayerProxy):getRawData().id

	onToggle(arg_13_0, arg_13_0.sdTg, function(arg_20_0)
		setActive(arg_13_0.charContainer, arg_20_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_13_0, arg_20_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_13_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_13_0, 0)

	triggerToggle(arg_13_0.sdTg, var_13_1 == 1)
	onToggle(arg_13_0, arg_13_0.hideUITg, function(arg_21_0)
		setActive(arg_13_0.top, not arg_21_0)
		setActive(arg_13_0.bottom, not arg_21_0)
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_21_0)
	end, SFX_PANEL)
	onInputChanged(arg_13_0, arg_13_0.search, function()
		arg_13_0:Refresh(true)

		local var_22_0 = getInputText(arg_13_0.search)

		setActive(arg_13_0.search:Find("holder"), var_22_0 == "")
	end)
	onButton(arg_13_0, arg_13_0.showOwnBtn, function()
		arg_13_0:emit(LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER)
	end, SFX_PANEL)
	getProxy(CommanderManualProxy):TaskProgressAdd(2021, 1)
end

function var_0_0.SetResource(arg_24_0)
	local var_24_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_24_0.resources:Find("gem/Text"), var_24_0:getTotalGem())
	onButton(arg_24_0, arg_24_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.InitData(arg_26_0)
	arg_26_0.type = arg_26_0.contextData.type or ShopConst.PERMANANT_SKIN_SHOP_ID
	arg_26_0.mode = arg_26_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_26_0:GetAllCommodities()
	arg_26_0:GetGiftPackCommodities()

	arg_26_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()

	arg_26_0:GetSkinClassify()

	local var_26_0 = (arg_26_0.mode == var_0_0.MODE_EXPERIENCE or arg_26_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM) and 1 or 0

	arg_26_0.filterValues = {
		ownType = 0,
		shipHaveType = 0,
		typeType = {
			0
		},
		campType = {
			0
		},
		rarityType = {
			0
		},
		shipType = {
			0
		},
		themeType = {
			var_26_0
		},
		tagType = {
			0
		}
	}
	arg_26_0.filterValuesTemp = Clone(arg_26_0.filterValues)
end

function var_0_0.GetAllCommodities(arg_27_0)
	if arg_27_0.type == ShopConst.NEW_SKIN_SHOP_ID then
		arg_27_0.commodities = getProxy(ShipSkinProxy):GetInTimeSkins()
	elseif arg_27_0.type == ShopConst.PERMANANT_SKIN_SHOP_ID then
		arg_27_0.commodities = getProxy(ShipSkinProxy):GetPermanentSkins()
	else
		arg_27_0.commodities = {}

		local var_27_0 = getProxy(ShipSkinProxy):GetAllSkins()

		for iter_27_0, iter_27_1 in ipairs(var_27_0) do
			if table.keyof(pg.shop_skin_subsheet[arg_27_0.type].param, iter_27_1.id) then
				table.insert(arg_27_0.commodities, iter_27_1)
			end
		end
	end

	if LOCK_SKIN_US then
		local var_27_1 = pg.gameset.levellimit_skintype.key_value
		local var_27_2 = pg.gameset.levellimit_skintype.description

		if var_27_1 >= getProxy(PlayerProxy):getData().level then
			arg_27_0.commodities = _.filter(arg_27_0.commodities, function(arg_28_0)
				local var_28_0 = pg.ship_skin_template[arg_28_0:getSkinId()].shop_type_id

				return table.contains(var_27_2, var_28_0)
			end)
		end
	end

	if arg_27_0.mode == var_0_0.MODE_OVERVIEW then
		for iter_27_2 = #arg_27_0.commodities, 1, -1 do
			if arg_27_0.commodities[iter_27_2]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				table.remove(arg_27_0.commodities, iter_27_2)
			end
		end
	end
end

function var_0_0.GetGiftPackCommodities(arg_29_0)
	arg_29_0.giftPackCommodities = {}
	arg_29_0.giftSkinCommodities = {}
	arg_29_0.giftSkinProbabilitys = {}

	for iter_29_0, iter_29_1 in ipairs(pg.pay_data_display.all) do
		local var_29_0 = pg.pay_data_display[iter_29_1]

		if var_29_0.skin_inquire_relation ~= 0 and pg.TimeMgr.GetInstance():inTime(var_29_0.time) then
			local var_29_1 = getProxy(ShopsProxy):GetGiftCommodity(iter_29_1, Goods.TYPE_CHARGE)

			arg_29_0.giftPackCommodities[iter_29_1] = var_29_1

			local var_29_2 = var_29_1:GetSkinProbability()

			arg_29_0.giftSkinCommodities[iter_29_1] = getProxy(ShipSkinProxy):GetProbabilitySkins(var_29_2)
			arg_29_0.giftSkinProbabilitys[iter_29_1] = getProxy(ShipSkinProxy):GetSkinProbabilitys(var_29_2)
		end
	end
end

function var_0_0.SetSkinScroll(arg_30_0)
	arg_30_0.scrollrect.isNewLoadingMethod = true

	function arg_30_0.scrollrect.onInitItem(arg_31_0)
		arg_30_0:OnInitItem(arg_31_0)
	end

	function arg_30_0.scrollrect.onUpdateItem(arg_32_0, arg_32_1)
		arg_30_0:OnUpdateItem(arg_32_0, arg_32_1)
	end

	arg_30_0.scrollrect.enabled = true
end

function var_0_0.Refresh(arg_33_0, arg_33_1)
	arg_33_0:ClearCards()

	arg_33_0.cards = {}
	arg_33_0.displays = {}

	local var_33_0 = getInputText(arg_33_0.search)

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.commodities) do
		if arg_33_0:filterOk(iter_33_1) and arg_33_0:IsSearchType(var_33_0, iter_33_1) then
			table.insert(arg_33_0.displays, iter_33_1)
		end
	end

	local var_33_1 = {}

	for iter_33_2, iter_33_3 in ipairs(arg_33_0.displays) do
		local var_33_2 = iter_33_3.type == Goods.TYPE_ACTIVITY or iter_33_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_33_3 = 0

		if not var_33_2 then
			var_33_3 = iter_33_3:GetPrice()
		end

		var_33_1[iter_33_3.id] = var_33_3
	end

	table.sort(arg_33_0.displays, function(arg_34_0, arg_34_1)
		return arg_33_0:Sort(arg_34_0, arg_34_1, var_33_1)
	end)

	local var_33_4 = #arg_33_0.displays == 0

	setActive(arg_33_0.bgs:Find("default"), var_33_4)
	setActive(arg_33_0.bgs:Find("diffBg"), not var_33_4)
	setActive(arg_33_0.bgs:Find("empty"), var_33_4)
	setActive(arg_33_0._tf:Find("leftMask"), not var_33_4)
	setActive(arg_33_0._tf:Find("bottomMask"), not var_33_4)
	setActive(arg_33_0.painting, not var_33_4)
	setActive(arg_33_0.top:Find("title"), not var_33_4)
	setActive(arg_33_0.changeSkin, not var_33_4)
	setActive(arg_33_0.right, not var_33_4)
	setActive(arg_33_0.right, not var_33_4)
	setActive(arg_33_0.bottom:Find("scroll"), not var_33_4)

	if not var_33_4 then
		if arg_33_1 then
			arg_33_0.triggerFirstCard = true

			arg_33_0.scrollrect:SetTotalCount(#arg_33_0.displays, 0)
		else
			arg_33_0.scrollrect:SetTotalCount(#arg_33_0.displays)
		end
	end
end

function var_0_0.IsSearchType(arg_35_0, arg_35_1, arg_35_2)
	if not arg_35_1 or arg_35_1 == "" then
		return true
	end

	local var_35_0 = arg_35_2:getSkinId()

	return ShipSkin.New({
		id = var_35_0
	}):IsMatchKey(arg_35_1)
end

local function var_0_20(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_2[arg_36_0.id]
	local var_36_1 = arg_36_2[arg_36_1.id]

	if var_36_0 == var_36_1 then
		return arg_36_0.id < arg_36_1.id
	else
		return var_36_1 < var_36_0
	end
end

function var_0_0.Sort(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = arg_37_1.buyCount == 0 and 1 or 0
	local var_37_1 = arg_37_2.buyCount == 0 and 1 or 0

	if var_37_0 == var_37_1 then
		local var_37_2 = arg_37_1:getConfig("order")
		local var_37_3 = arg_37_2:getConfig("order")

		if var_37_2 == var_37_3 then
			return var_0_20(arg_37_1, arg_37_2, arg_37_3)
		else
			return var_37_2 < var_37_3
		end
	else
		return var_37_1 < var_37_0
	end
end

function var_0_0.filterOk(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.filterValues.ownType
	local var_38_1 = arg_38_0.filterValues.typeType
	local var_38_2 = arg_38_0.filterValues.shipHaveType
	local var_38_3 = arg_38_0.filterValues.campType
	local var_38_4 = arg_38_0.filterValues.rarityType
	local var_38_5 = arg_38_0.filterValues.shipType
	local var_38_6 = arg_38_0.filterValues.themeType
	local var_38_7 = arg_38_0.filterValues.tagType
	local var_38_8 = arg_38_1:getSkinId()
	local var_38_9 = ShipSkin.New({
		id = var_38_8
	})
	local var_38_10 = var_38_9:GetDefaultShipConfig()
	local var_38_11 = arg_38_0:ToVShip(var_38_10)

	if var_38_0 ~= 0 then
		local var_38_12 = false
		local var_38_13 = getProxy(ShipSkinProxy):hasSkin(var_38_8)
		local var_38_14 = var_38_9:NoUse()

		if var_38_0 == 1 and var_38_13 then
			var_38_12 = true
		end

		if var_38_0 == 2 and not var_38_13 then
			var_38_12 = true
		end

		if var_38_0 == 3 and var_38_13 and var_38_14 then
			var_38_12 = true
		end

		if not var_38_12 then
			return false
		end
	end

	if var_38_1[1] ~= 0 then
		local var_38_15 = false

		for iter_38_0, iter_38_1 in ipairs(var_38_1) do
			if iter_38_1 == 1 and (var_38_9:IsLive2d() or var_38_9:IsLive2dPlus()) then
				var_38_15 = true
			end

			if iter_38_1 == 2 and not var_38_9:IsLive2d() and not var_38_9:IsLive2dPlus() and not var_38_9:IsSpine() and not var_38_9:IsSpinePlus() then
				var_38_15 = true
			end

			if iter_38_1 == 3 and (var_38_9:IsSpine() or var_38_9:IsSpinePlus()) then
				var_38_15 = true
			end

			if iter_38_1 == 4 and var_38_9:IsBG() then
				var_38_15 = true
			end

			if iter_38_1 == 5 and var_38_9:IsDbg() then
				var_38_15 = true
			end

			if iter_38_1 == 6 and var_38_9:isBgm() then
				var_38_15 = true
			end

			if var_38_15 then
				break
			end
		end

		if not var_38_15 then
			return false
		end
	end

	if var_38_2 ~= 0 then
		local var_38_16 = false
		local var_38_17 = var_38_9:CantUse()

		if var_38_2 == 1 and not var_38_17 then
			var_38_16 = true
		end

		if var_38_2 == 2 and var_38_17 then
			var_38_16 = true
		end

		if not var_38_16 then
			return false
		end
	end

	if var_38_3[1] ~= 0 then
		if not var_38_10 then
			return false
		end

		local var_38_18 = false

		for iter_38_2, iter_38_3 in ipairs(var_38_3) do
			local var_38_19 = ShipIndexCfg.camp

			for iter_38_4, iter_38_5 in ipairs(var_38_19[iter_38_3 + 1].types) do
				if iter_38_5 == Nation.LINK then
					if var_38_11:getNation() >= Nation.LINK then
						var_38_18 = true
					end
				elseif iter_38_5 == var_38_11:getNation() then
					var_38_18 = true
				end
			end

			if var_38_18 then
				break
			end
		end

		if not var_38_18 then
			return false
		end
	end

	if var_38_4[1] ~= 0 then
		if not var_38_10 then
			return false
		end

		local var_38_20 = false

		for iter_38_6, iter_38_7 in ipairs(var_38_4) do
			local var_38_21 = ShipIndexCfg.rarity

			if table.contains(var_38_21[iter_38_7 + 1].types, var_38_11:getRarity()) then
				var_38_20 = true
			end

			if var_38_20 then
				break
			end
		end

		if not var_38_20 then
			return false
		end
	end

	if var_38_5[1] ~= 0 then
		if not var_38_10 then
			return false
		end

		local var_38_22 = false

		for iter_38_8, iter_38_9 in ipairs(var_38_5) do
			local var_38_23 = ShipIndexCfg.type
			local var_38_24 = var_38_23[iter_38_9 + 1].types

			if iter_38_9 + 1 < 4 then
				local var_38_25 = var_38_23[iter_38_9].shipTypes

				if table.contains(var_38_24, var_38_11:getShipType()) then
					var_38_22 = true
				end

				if table.contains(var_38_24, var_38_11:getTeamType()) then
					var_38_22 = true
				end
			elseif table.contains(var_38_24, var_38_11:getShipType()) then
				var_38_22 = true
			end

			if var_38_22 then
				break
			end
		end

		if not var_38_22 then
			return false
		end
	end

	if var_38_6[1] ~= 0 then
		local var_38_26 = false

		for iter_38_10, iter_38_11 in ipairs(var_38_6) do
			local var_38_27 = arg_38_0.classifyIds[iter_38_11 + 1]

			if arg_38_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				if arg_38_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
					var_38_26 = var_38_27 == var_0_15 and arg_38_0:ExitSkinExperienceItem(arg_38_1.id)
				else
					var_38_26 = var_38_27 == var_0_13
				end
			elseif var_38_27 == var_0_12 then
				var_38_26 = true
			elseif var_38_27 == var_0_14 and table.contains(arg_38_0.returnSkins, arg_38_1.id) then
				var_38_26 = true
			else
				local var_38_28 = arg_38_0:GetShopTypeIdBySkinId(var_38_8)

				var_38_26 = (var_38_28 == 0 and var_0_16 or var_38_28) == var_38_27
			end

			if var_38_26 then
				break
			end
		end

		if not var_38_26 then
			return false
		end
	end

	if var_38_7[1] ~= 0 then
		local var_38_29 = false
		local var_38_30 = table.contains(arg_38_0.returnSkins, arg_38_1.id)
		local var_38_31 = NewShopSkinCard.GetTagId(arg_38_1, var_38_30)

		if table.keyof(var_38_7, var_38_31) then
			return true
		else
			return false
		end
	end

	return true
end

function var_0_0.ToVShip(arg_39_0, arg_39_1)
	if not arg_39_0.vship then
		arg_39_0.vship = {}

		function arg_39_0.vship.getNation()
			return arg_39_0.vship.config.nationality
		end

		function arg_39_0.vship.getShipType()
			return arg_39_0.vship.config.type
		end

		function arg_39_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_39_0.vship.config.type)
		end

		function arg_39_0.vship.getRarity()
			return arg_39_0.vship.config.rarity
		end
	end

	arg_39_0.vship.config = arg_39_1

	return arg_39_0.vship
end

function var_0_0.ExitSkinExperienceItem(arg_44_0, arg_44_1)
	if not arg_44_0.cacheSkinExperienceItems then
		arg_44_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(arg_44_0.cacheSkinExperienceItems, function(arg_45_0)
		return arg_45_0:CanUseForShop(arg_44_1)
	end)
end

function var_0_0.RegisterEvent(arg_46_0)
	arg_46_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_47_0, arg_47_1)
		arg_46_0:AdjustPainting(arg_47_1)
		setActive(arg_46_0.top, not arg_47_1)
		setActive(arg_46_0.bottom, not arg_47_1)
		setActive(arg_46_0.right, not arg_47_1)

		if arg_46_0.live2dChar then
			arg_46_0.live2dChar:setPurchaseOffset(arg_47_1)
		end

		if arg_46_0.spineChar then
			if arg_47_1 then
				local var_47_0 = pg.ship_skin_template[arg_46_0.skinId].purchase_offset

				if var_47_0 and #var_47_0 >= 3 then
					arg_46_0.spineChar:SetLocalPosition(Vector3(var_47_0[1], var_47_0[2], var_47_0[3]))
				end

				if var_47_0 and #var_47_0 >= 4 then
					arg_46_0.spineChar:SetLocalScale(Vector3(var_47_0[4], var_47_0[4], var_47_0[4]))
				end
			else
				arg_46_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
				arg_46_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
			end
		end

		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_47_1)
	end)
	arg_46_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_48_0, arg_48_1)
		local var_48_0 = arg_46_0:GetObtainBtnState(arg_48_1)

		arg_46_0:OnClickBtn(var_48_0, arg_48_1)
	end)
	onButton(arg_46_0, arg_46_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_46_0.skinId) then
			arg_46_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_46_0.skinId)

			arg_46_0:UpdateMainView(arg_46_0.showingCommodity)
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_50_0, arg_50_1)
	local var_50_0 = NewShopSkinCard.New(arg_50_1)

	onButton(arg_50_0, var_50_0._go, function()
		if not var_50_0.commodity then
			return
		end

		for iter_51_0, iter_51_1 in pairs(arg_50_0.cards) do
			iter_51_1:UpdateSelected(false)
		end

		arg_50_0.selectedId = var_50_0.commodity.id

		var_50_0:UpdateSelected(true)
		arg_50_0:UpdateMainView(var_50_0.commodity)
		arg_50_0:GCHandle()
	end, SFX_PANEL)

	arg_50_0.cards[arg_50_1] = var_50_0
end

function var_0_0.OnUpdateItem(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_0.cards[arg_52_2]

	if not var_52_0 then
		arg_52_0:OnInitItem(arg_52_2)

		var_52_0 = arg_52_0.cards[arg_52_2]
	end

	local var_52_1 = arg_52_0.displays[arg_52_1 + 1]

	if not var_52_1 then
		return
	end

	local var_52_2 = arg_52_0.selectedId == var_52_1.id
	local var_52_3 = table.contains(arg_52_0.returnSkins, var_52_1.id)

	var_52_0:Update(var_52_1, var_52_2, var_52_3)

	if arg_52_0.pendingSelectId and arg_52_0.pendingSelectId == var_52_1.id then
		arg_52_0.pendingSelectId = nil

		triggerButton(var_52_0._go)
	end

	if arg_52_0.triggerFirstCard and arg_52_1 == 0 then
		arg_52_0.triggerFirstCard = false

		triggerButton(var_52_0._go)
	end
end

function var_0_0.UpdateMainView(arg_53_0, arg_53_1)
	arg_53_0.skinId = arg_53_1:getSkinId()

	local var_53_0 = ShipSkin.IsChangeSkin(arg_53_0.skinId)

	setActive(arg_53_0.changeSkin, var_53_0)

	if var_53_0 then
		arg_53_0:FlushChangeSkin(arg_53_1)
	end

	arg_53_0.shipSkin = ShipSkin.New({
		id = arg_53_0.skinId
	})

	arg_53_0:FlushName()
	arg_53_0:FlushPreviewBtn(arg_53_1)
	arg_53_0:FlushTimeLimit(arg_53_1)
	arg_53_0:SwitchPreview(arg_53_1, arg_53_0.isPreviewFurniture)
	arg_53_0:FlushPaintingToggle(arg_53_1)
	arg_53_0:FlushTag()
	arg_53_0:FlushBG(arg_53_1)
	arg_53_0:FlushPainting(arg_53_1)
	arg_53_0:FlushPrice(arg_53_1)
	arg_53_0:FlushObtainBtn(arg_53_1)
	arg_53_0:FlushGifgPackBtn(arg_53_1)

	arg_53_0.showingCommodity = arg_53_1
end

function var_0_0.FlushChangeSkin(arg_54_0, arg_54_1)
	local var_54_0 = ShipSkin.GetChangeSkinGroupId(arg_54_0.skinId)
	local var_54_1 = ShipSkin.GetChangeSkinCustomDataId(arg_54_0.skinId, "hide_shop")
	local var_54_2 = pg.gameset.changeskin_switch_block
	local var_54_3 = false
	local var_54_4 = false
	local var_54_5 = arg_54_0.changeSkinToggle:IsAsmrSkin() and true or false

	if var_54_2 and var_54_2.description then
		local var_54_6 = var_54_2.description

		if table.contains(var_54_6, var_54_0) and HXSet.isHx() then
			var_54_4 = true
		end
	end

	if var_54_1 and var_54_1 == 1 then
		var_54_3 = true
	end

	if not arg_54_0.changeSkinId then
		arg_54_0.changeSkinId = arg_54_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_54_0.changeSkinId) == var_54_0 then
		arg_54_0.skinId = arg_54_0.changeSkinId
	else
		arg_54_0.changeSkinId = arg_54_0.skinId
	end

	arg_54_0.changeSkinToggle:setSkinData(arg_54_0.skinId)

	if var_54_3 or var_54_4 or var_54_5 then
		setActive(arg_54_0.changeSkin, false)
	else
		setActive(arg_54_0.changeSkin, true)
	end
end

function var_0_0.GCHandle(arg_55_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.FlushName(arg_56_0)
	local var_56_0 = pg.ship_skin_template[arg_56_0.skinId]

	setScrollText(arg_56_0.skinName, SwitchSpecialChar(var_56_0.name, true))

	if var_56_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_56_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_56_0.skinId)))
	else
		local var_56_1 = ShipGroup.getDefaultShipConfig(var_56_0.ship_group)

		setScrollText(arg_56_0.shipName, var_56_1.name)
	end
end

function var_0_0.FlushPreviewBtn(arg_57_0, arg_57_1)
	local var_57_0 = Goods.ExistFurniture(arg_57_1.id)

	removeOnButton(arg_57_0.switchPreviewBtn)

	if not var_57_0 and arg_57_0.isPreviewFurniture then
		arg_57_0.isPreviewFurniture = false
	end

	setActive(arg_57_0.switchPreviewBtn, var_57_0)

	if var_57_0 then
		onButton(arg_57_0, arg_57_0.switchPreviewBtn, function()
			arg_57_0.isPreviewFurniture = not arg_57_0.isPreviewFurniture

			arg_57_0:SwitchPreview(arg_57_1, arg_57_0.isPreviewFurniture)
			arg_57_0:FlushPrice(arg_57_1)
			arg_57_0:FlushObtainBtn(arg_57_1)
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPreview(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = arg_59_0.skinId

	if pg.ship_skin_template[var_59_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_59_0.charContainer, false)

		return
	end

	local var_59_1 = getProxy(PlayerProxy):getRawData().id

	setActive(arg_59_0.charContainer, PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_59_1, 0) == 1)
	setActive(arg_59_0.charTf, not arg_59_2)
	setActive(arg_59_0.furnitureContainer, arg_59_2)

	if not arg_59_2 then
		local var_59_2 = pg.ship_skin_template[var_59_0]

		arg_59_0:FlushChar(var_59_2.prefab, var_59_2.id)
		GetImageSpriteFromAtlasAsync("qicon/" .. var_59_2.painting, "", arg_59_0.backChara)
	else
		local var_59_3 = Goods.Id2FurnitureId(arg_59_1.id)
		local var_59_4 = Goods.GetFurnitureConfig(arg_59_1.id)

		arg_59_0.interactionPreview:Flush(var_59_0, var_59_3, var_59_4.scale[2] or 1, var_59_4.position[2])
	end
end

function var_0_0.FlushChar(arg_60_0, arg_60_1, arg_60_2)
	if arg_60_0.prefabName and arg_60_0.prefabName == arg_60_1 then
		return
	end

	arg_60_0:ReturnChar()

	arg_60_0.prefabName = arg_60_1

	local var_60_0 = SpineAnimChar.New()

	var_60_0:SetPaint(arg_60_1)
	var_60_0:Load(true, function(arg_61_0)
		if arg_60_0.prefabName ~= arg_60_1 then
			arg_61_0:Dispose()

			return
		end

		arg_60_0.spineChar = arg_61_0

		local var_61_0 = pg.skinshop_spine_scale[arg_60_2]

		if var_61_0 then
			arg_60_0.spineChar:SetLocalScale(Vector3(var_61_0.skinshop_scale, var_61_0.skinshop_scale, 1))
		else
			arg_60_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
		end

		arg_60_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
		arg_60_0.spineChar:SetLayer(Layer.UI)
		arg_60_0.spineChar:SetParent(arg_60_0.charTf)
		arg_60_0.spineChar:SetAction("normal", 0)
	end)
end

function var_0_0.ReturnChar(arg_62_0)
	if arg_62_0.spineChar then
		arg_62_0.spineChar:Dispose()

		arg_62_0.spineChar = nil
		arg_62_0.prefabName = nil
	end
end

function var_0_0.ClearCards(arg_63_0)
	if not arg_63_0.cards then
		return
	end

	for iter_63_0, iter_63_1 in pairs(arg_63_0.cards) do
		iter_63_1:Dispose()
	end

	arg_63_0.cards = nil
end

function var_0_0.FlushTimeLimit(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_0.skinId
	local var_64_1 = false
	local var_64_2

	if arg_64_1:IsActivityExtra() and arg_64_1:ShowMaintenanceTime() then
		local var_64_3, var_64_4 = arg_64_1:GetMaintenanceMonthAndDay()

		function var_64_2()
			return i18n("limit_skin_time_before_maintenance", var_64_3, var_64_4)
		end

		var_64_1 = true
	elseif arg_64_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_64_5 = getProxy(ShipSkinProxy):getSkinById(var_64_0)

		var_64_1 = var_64_5 and var_64_5:isExpireType() and not var_64_5:isExpired()

		if var_64_1 then
			function var_64_2()
				return skinTimeStamp(var_64_5:getRemainTime())
			end
		end
	else
		local var_64_6, var_64_7 = pg.TimeMgr.GetInstance():inTime(arg_64_1:getConfig("time"))

		var_64_1 = var_64_7

		if var_64_1 then
			local var_64_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_64_7)

			function var_64_2()
				return skinCommdityTimeStamp(var_64_8)
			end
		end
	end

	setActive(arg_64_0.top:Find("title/limit_time"), var_64_1)
	arg_64_0:ClearTimer()

	if var_64_1 then
		arg_64_0:AddTimer(var_64_2)
	end
end

function var_0_0.AddTimer(arg_68_0, arg_68_1)
	arg_68_0.timer = Timer.New(function()
		setText(arg_68_0.limitTime, arg_68_1())
	end, 1, -1)

	arg_68_0.timer.func()
	arg_68_0.timer:Start()
end

function var_0_0.ClearTimer(arg_70_0)
	if arg_70_0.timer then
		arg_70_0.timer:Stop()

		arg_70_0.timer = nil
	end
end

function var_0_0.FlushPaintingToggle(arg_71_0, arg_71_1)
	removeOnToggle(arg_71_0.dynamicToggle)
	removeOnToggle(arg_71_0.showBgToggle)

	local var_71_0 = checkABExist("painting/" .. arg_71_0.shipSkin:getConfig("painting") .. "_n")

	if arg_71_0.isToggleShowBg and not var_71_0 then
		triggerToggle(arg_71_0.showBgToggle, false)

		arg_71_0.isToggleShowBg = false
	elseif var_71_0 then
		triggerToggle(arg_71_0.showBgToggle, true)

		arg_71_0.isToggleShowBg = true
	end

	local var_71_1 = arg_71_0.shipSkin:IsSpine() or arg_71_0.shipSkin:IsLive2d() or arg_71_0.shipSkin:IsSpinePlus() or arg_71_0.shipSkin:IsLive2dPlus()
	local var_71_2 = arg_71_0.shipSkin:IsHxDynamicPreview()

	if var_71_1 and not var_71_2 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_71_0.isToggleDynamic = true
	end

	if var_71_1 then
		local var_71_3 = 0

		if arg_71_0.shipSkin:IsSpine() then
			var_71_3 = 6
		elseif arg_71_0.shipSkin:IsLive2d() then
			var_71_3 = 1
		elseif arg_71_0.shipSkin:IsSpinePlus() then
			var_71_3 = 7
		elseif arg_71_0.shipSkin:IsLive2dPlus() then
			var_71_3 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_71_3) .. "_off", arg_71_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_71_3), arg_71_0.dynamicToggle:Find("select"))
	end

	if var_71_2 and arg_71_0.isToggleDynamic then
		triggerToggle(arg_71_0.dynamicToggle, false)

		arg_71_0.isToggleDynamic = false
	end

	if arg_71_0.isToggleDynamic and not var_71_1 then
		triggerToggle(arg_71_0.dynamicToggle, false)

		arg_71_0.isToggleDynamic = false
	elseif arg_71_0.isToggleDynamic and not arg_71_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_71_0.shipSkin:IsLive2d() or arg_71_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_71_0.isToggleDynamic = false

			local var_71_4 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_71_4, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_71_0.dynamicToggle, false)
		else
			triggerToggle(arg_71_0.dynamicToggle, true)

			arg_71_0.isToggleDynamic = true
		end
	end

	if var_71_0 then
		onToggle(arg_71_0, arg_71_0.showBgToggle, function(arg_72_0)
			arg_71_0.isToggleShowBg = arg_72_0

			arg_71_0:FlushPainting(arg_71_1)
			arg_71_0:FlushBG(arg_71_1)
		end, SFX_PANEL)
	end

	if arg_71_0.shipSkin:IsSpine() or arg_71_0.shipSkin:IsLive2d() or arg_71_0.shipSkin:IsSpinePlus() or arg_71_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_71_0, arg_71_0.dynamicToggle, function(arg_73_0)
			local var_73_0 = arg_71_0.shipSkin:IsHxDynamicPreview()

			if arg_73_0 and var_73_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_tag_control_tip"))
				triggerToggle(arg_71_0.dynamicToggle, false)
				setActive(arg_71_0.dynamicResToggle, false)

				return
			end

			if arg_73_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_71_0.shipSkin:IsLive2d() or arg_71_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_71_0.dynamicToggle, false)

				return
			end

			arg_71_0.isToggleDynamic = arg_73_0

			setActive(arg_71_0.showBgToggle, not arg_73_0 and var_71_0)
			arg_71_0:FlushPainting(arg_71_1)
			arg_71_0:FlushDynamicPaintingResState(arg_71_1)
			arg_71_0:RecordFlag(arg_73_0)
		end, SFX_PANEL)
	end

	setActive(arg_71_0.dynamicIcon, true)

	if arg_71_0.isToggleDynamic then
		arg_71_0:FlushDynamicPaintingResState(arg_71_1)
	elseif var_71_2 then
		setActive(arg_71_0.dynamicResToggle, false)
		setActive(arg_71_0.dynamicIcon, false)
	end

	setActive(arg_71_0.dynamicToggle, var_71_1)
	setActive(arg_71_0.showBgToggle, not arg_71_0.isToggleDynamic and var_71_0)
end

function var_0_0.FlushTag(arg_74_0)
	local var_74_0 = arg_74_0.skinId
	local var_74_1 = pg.ship_skin_template[var_74_0]
	local var_74_2 = Clone(var_74_1.tag)
	local var_74_3 = false

	for iter_74_0 = #var_74_2, 1, -1 do
		local var_74_4 = var_74_2[iter_74_0]

		if var_74_4 == 1 or var_74_4 == 6 or var_74_4 == 7 or var_74_4 == 9 then
			local var_74_5 = true

			table.remove(var_74_2, iter_74_0)
		end
	end

	local var_74_6 = checkABExist("painting/" .. arg_74_0.shipSkin:getConfig("painting") .. "_n")

	arg_74_0.tagList:make(function(arg_75_0, arg_75_1, arg_75_2)
		if arg_75_0 == UIItemList.EventUpdate then
			local var_75_0 = var_74_2[arg_75_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_74_2[arg_75_1 + 1]), function(arg_76_0)
				if arg_74_0.exited then
					return
				end

				arg_75_2:GetComponent(typeof(Image)).sprite = arg_76_0
			end)
		end
	end)
	setActive(arg_74_0.adapt:Find("right/functionsAndTags/tags"), #var_74_2 > 0)
	arg_74_0.tagList:align(#var_74_2)
end

function var_0_0.FlushPainting(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_0:GetPaintingState(arg_77_1)
	local var_77_1 = pg.ship_skin_template[arg_77_0.skinId].painting
	local var_77_2 = ShipSkin.GetChangeSkinData(arg_77_0.skinId) and true or false

	if var_77_0 == var_0_2 and not arg_77_0:ExistL2dRes(var_77_1) or var_77_0 == var_0_3 and not arg_77_0:ExistSpineRes(var_77_1) then
		var_77_0 = var_0_1
	end

	if arg_77_0.paintingState and arg_77_0.paintingState.state == var_77_0 and arg_77_0.paintingState.id == arg_77_1.id and arg_77_0.paintingState.showBg == arg_77_0.isToggleShowBg and arg_77_0.paintingState.purchaseFlag == arg_77_1.buyCount and not var_77_2 then
		return
	end

	arg_77_0:ClearPainting()

	if var_77_0 == var_0_1 then
		arg_77_0:LoadMeshPainting(arg_77_1, arg_77_0.isToggleShowBg)
	elseif var_77_0 == var_0_2 then
		arg_77_0:LoadL2dPainting(arg_77_1)
	elseif var_77_0 == var_0_3 then
		arg_77_0:LoadSpinePainting(arg_77_1)
	end

	arg_77_0.paintingState = {
		state = var_77_0,
		id = arg_77_1.id,
		showBg = arg_77_0.isToggleShowBg,
		purchaseFlag = arg_77_1.buyCount
	}

	arg_77_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_78_0)
	local var_78_0 = arg_78_0.paintingState

	if not var_78_0 then
		return
	end

	if var_78_0.state == var_0_1 then
		arg_78_0:ClearMeshPainting()
	elseif var_78_0.state == var_0_2 then
		arg_78_0:ClearL2dPainting()
	elseif var_78_0.state == var_0_3 then
		arg_78_0:ClearSpinePainting()
	end

	arg_78_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_79_0, arg_79_1, arg_79_2)
	local var_79_0 = findTF(arg_79_0.paintingTF, "fitter")
	local var_79_1 = GetOrAddComponent(var_79_0, "PaintingScaler")

	var_79_1.FrameName = "chuanwu"
	var_79_1.Tween = 1

	local var_79_2 = pg.ship_skin_template[arg_79_0.skinId].painting
	local var_79_3 = var_79_2

	if not arg_79_2 and checkABExist("painting/" .. var_79_2 .. "_n") then
		var_79_2 = var_79_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_79_2) then
		return
	end

	if PLATFORM_CODE == PLATFORM_CH and checkABExist("painting/" .. var_79_2 .. "_shop") then
		var_79_2 = var_79_2 .. "_shop"
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_79_2, true, function(arg_80_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_80_0, var_79_0, false)
		ShipExpressionHelper.SetExpression(var_79_0:GetChild(0), var_79_3)

		arg_79_0.paintingName = var_79_2

		if arg_79_0.paintingState and arg_79_0.paintingState.id ~= arg_79_1.id then
			arg_79_0:ClearMeshPainting()
		end

		local var_80_0 = arg_80_0.transform:Find("shop_hx")

		arg_79_0:CheckShowShopHx(var_80_0)

		local var_80_1 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_80_2 = arg_80_0.transform:Find("shop_hx_ch" .. var_80_1)

		arg_79_0:CheckShowShopHx(var_80_2)
	end)
end

function var_0_0.ClearMeshPainting(arg_81_0)
	local var_81_0 = arg_81_0.paintingTF:Find("fitter")

	if arg_81_0.paintingName and var_81_0.childCount > 0 then
		local var_81_1 = var_81_0:GetChild(0).gameObject
		local var_81_2 = var_81_1.transform:Find("shop_hx")

		arg_81_0:RevertShopHx(var_81_2)
		PoolMgr.GetInstance():ReturnPainting(arg_81_0.paintingName, var_81_1)
	end

	arg_81_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_0.skinId
	local var_82_1 = pg.ship_skin_template[var_82_0].skin_type
	local var_82_2

	if var_82_1 == ShipSkin.SKIN_TYPE_TB then
		var_82_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_82_0))
	else
		local var_82_3 = pg.ship_skin_template[var_82_0].ship_group
		local var_82_4 = ShipGroup.getDefaultShipConfig(var_82_3)

		var_82_2 = Ship.New({
			noChangeSkin = true,
			configId = var_82_4.id,
			skin_id = var_82_0
		})
	end

	local var_82_5 = Live2DPainting.GenerateData({
		ship = var_82_2,
		position = Vector3(0, 0, -1),
		parent = arg_82_0.live2dContainer,
		offset = var_82_2:GetSkinConfig().shop_offset
	})

	var_82_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_82_0.live2dChar = Live2DPainting.New(var_82_5, function(arg_83_0)
		arg_83_0:IgonreReactPos(true)
		arg_82_0:CheckShowShopHxForL2d(arg_83_0, arg_82_1)

		if arg_82_0.paintingState and arg_82_0.paintingState.id ~= arg_82_1.id then
			arg_82_0:ClearL2dPainting()
		end

		arg_83_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_84_0)
	if arg_84_0.live2dChar then
		arg_84_0:RevertShopHxForL2d(arg_84_0.live2dChar)
		arg_84_0.live2dChar:Dispose()

		arg_84_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_0.skinId
	local var_85_1 = pg.ship_skin_template[var_85_0].skin_type
	local var_85_2

	if var_85_1 == ShipSkin.SKIN_TYPE_TB then
		var_85_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_85_0))
	else
		local var_85_3 = pg.ship_skin_template[var_85_0].ship_group
		local var_85_4 = ShipGroup.getDefaultShipConfig(var_85_3)

		var_85_2 = Ship.New({
			noChangeSkin = true,
			configId = var_85_4.id,
			skin_id = var_85_0
		})
	end

	local var_85_5 = SpinePainting.GenerateData({
		ship = var_85_2,
		position = Vector3(0, 0, 0),
		parent = arg_85_0.spTF,
		effectParent = arg_85_0.spBg,
		offset = var_85_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_85_0.spinePainting = SpinePainting.New(var_85_5, function(arg_86_0)
		arg_86_0:SetShopHx(true)

		if arg_85_0.paintingState and arg_85_0.paintingState.id ~= arg_85_1.id then
			arg_85_0:ClearSpinePainting()
		end

		local var_86_0 = arg_86_0._tf:Find("shop_hx")

		arg_85_0:CheckShowShopHx(var_86_0)

		local var_86_1 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_86_2 = arg_86_0._tf:Find("shop_hx_ch" .. var_86_1)

		arg_85_0:CheckShowShopHx(var_86_2)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_87_0)
	if arg_87_0.spinePainting and arg_87_0.spinePainting._tf then
		local var_87_0 = arg_87_0.spinePainting._tf:Find("shop_hx")

		arg_87_0:RevertShopHx(arg_87_0.shopHx)
		arg_87_0.spinePainting:Dispose()

		arg_87_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHx(arg_88_0, arg_88_1)
	if IsNil(arg_88_1) then
		return
	end

	setActive(arg_88_1, false)

	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	setActive(arg_88_1, true)
end

function var_0_0.RevertShopHx(arg_89_0, arg_89_1)
	if not IsNil(arg_89_1) then
		setActive(arg_89_1, false)
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_90_0, arg_90_1, arg_90_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_90_0 = 1

	arg_90_1:changeParamaterValue("shop_hx", var_90_0)
end

function var_0_0.RevertShopHxForL2d(arg_91_0, arg_91_1)
	arg_91_1:changeParamaterValue("shop_hx", 0)
end

function var_0_0.AdjustPainting(arg_92_0, arg_92_1)
	local var_92_0 = arg_92_0.paintingTF
	local var_92_1 = pg.ship_skin_newmainui_shift[arg_92_0.skinId]

	if var_92_1 then
		local var_92_2 = var_92_1.skin_shop_shift

		if arg_92_1 then
			var_92_0.anchoredPosition = Vector2(var_92_2[1] - 440, var_92_2[2] + arg_92_0.defaultPaintingPosition.y)
		else
			var_92_0.anchoredPosition = Vector2(var_92_2[1] + arg_92_0.defaultPaintingPosition.x, var_92_2[2] + arg_92_0.defaultPaintingPosition.y)
		end

		local var_92_3 = var_92_2[4]

		var_92_0.localScale = Vector3(var_92_3, var_92_3, 1)
	else
		var_92_0.anchoredPosition = Vector2(arg_92_0.defaultPaintingPosition.x, arg_92_0.defaultPaintingPosition.y)
		var_92_0.localScale = arg_92_0.defaultPaintingScale
	end
end

function var_0_0.FlushBG(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = arg_93_0.skinId
	local var_93_1 = pg.ship_skin_template[var_93_0]
	local var_93_2

	if var_93_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_93_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_93_0))
	else
		local var_93_3 = ShipGroup.getDefaultShipConfig(var_93_1.ship_group)

		var_93_2 = Ship.New({
			id = 999,
			configId = var_93_3.id,
			skin_id = var_93_0
		})
	end

	local var_93_4 = var_93_2:getShipBgPrint(true)
	local var_93_5 = pg.ship_skin_template[var_93_0].painting

	if (arg_93_0.isToggleShowBg or not checkABExist("painting/" .. var_93_5 .. "_n")) and var_93_1.bg_sp ~= "" then
		var_93_4 = var_93_1.bg_sp
	end

	local var_93_6 = var_93_4 ~= var_93_2:rarity2bgPrintForGet()

	if var_93_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_93_0, var_93_4, arg_93_0.bgs:Find("diffBg"), arg_93_0.bgs:Find("diffBg/bg"), function(arg_94_0)
			if arg_93_2 then
				arg_93_2()
			end
		end, function(arg_95_0)
			if arg_93_2 then
				arg_93_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_93_0:getUIName())

		if arg_93_2 then
			arg_93_2()
		end
	end

	setActive(arg_93_0.bgs:Find("diffBg"), var_93_6)
	setActive(arg_93_0.bgs:Find("default"), not var_93_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_96_0, arg_96_1)
	if not arg_96_0.isToggleDynamic then
		return
	end

	local var_96_0 = arg_96_0:GetPaintingState(arg_96_1)
	local var_96_1 = false
	local var_96_2 = ""
	local var_96_3 = pg.ship_skin_template[arg_96_0.skinId].painting

	if var_0_2 == var_96_0 then
		var_96_1, var_96_2 = arg_96_0:ExistL2dRes(var_96_3)
	elseif var_0_3 == var_96_0 then
		var_96_1, var_96_2 = arg_96_0:ExistSpineRes(var_96_3)
	end

	setActive(arg_96_0.dynamicResToggle, not var_96_1)
	removeOnButton(arg_96_0.dynamicResToggle)

	if not var_96_1 and var_96_2 ~= "" then
		onButton(arg_96_0, arg_96_0.dynamicResToggle, function()
			arg_96_0:DownloadDynamicPainting(var_96_2, arg_96_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0 = arg_98_0.skinId

	if arg_98_0.downloads[var_98_0] then
		return
	end

	local var_98_1 = SkinShopDownloadRequest.New()

	arg_98_0.downloads[var_98_0] = var_98_1

	var_98_1:Start(arg_98_1, function(arg_99_0)
		if arg_99_0 and arg_98_0.paintingState and arg_98_0.paintingState.id == arg_98_2.id then
			arg_98_0:FlushPainting(arg_98_2)
			arg_98_0:FlushDynamicPaintingResState(arg_98_2)
		end

		var_98_1:Dispose()

		arg_98_0.downloads[var_98_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_100_0, arg_100_1)
	if arg_100_0.isToggleDynamic and (arg_100_0.shipSkin:IsLive2d() or arg_100_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_100_0.isToggleDynamic and (arg_100_0.shipSkin:IsSpine() or arg_100_0.shipSkin:IsSpinePlus()) then
		if arg_100_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_101_0, arg_101_1)
	local var_101_0 = "live2d/" .. string.lower(arg_101_1)
	local var_101_1 = HXSet.autoHxShiftPath(var_101_0, nil, true)

	return checkABExist(var_101_1), var_101_1
end

function var_0_0.ExistSpineRes(arg_102_0, arg_102_1)
	local var_102_0 = "SpinePainting/" .. string.lower(arg_102_1)
	local var_102_1 = HXSet.autoHxShiftPath(var_102_0, nil, true)

	return checkABExist(var_102_1), var_102_1
end

function var_0_0.RecordFlag(arg_103_0, arg_103_1)
	local var_103_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_103_0, arg_103_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_103_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_103_1)
end

function var_0_0.FlushPrice(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_104_1 = arg_104_1.type == Goods.TYPE_ACTIVITY or arg_104_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_104_0 then
		if arg_104_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_104_0:UpdateExperiencePrice4Item(arg_104_1)
		else
			arg_104_0:UpdateExperiencePrice(arg_104_1)
		end
	elseif arg_104_0.isPreviewFurniture then
		arg_104_0:UpdateFurniturePrice(arg_104_1)
	elseif var_104_1 then
		-- block empty
	else
		arg_104_0:UpdateCommodityPrice(arg_104_1)
	end

	local var_104_2 = arg_104_1.type == Goods.TYPE_SKIN

	setActive(arg_104_0.price:Find("timeLimit"), var_104_0 and not var_104_1)
	setActive(arg_104_0.price:Find("normal/consume"), var_104_2 and not var_104_0 and not var_104_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_105_0, arg_105_1)
	local var_105_0 = arg_105_1:getConfig("resource_num")
	local var_105_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_105_2 = _.detect(var_105_1, function(arg_106_0)
		return arg_106_0:CanUseForShop(arg_105_1.id)
	end)
	local var_105_3 = var_105_2 and var_105_2.count or 0
	local var_105_4 = (var_105_3 < var_105_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_105_3 .. (var_105_3 < var_105_0 and "</color>" or "")

	setText(arg_105_0.price:Find("timeLimit/consume/Text"), var_105_4 .. "/" .. var_105_0)
end

function var_0_0.UpdateExperiencePrice(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_1:getConfig("resource_num")
	local var_107_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_107_2 = (var_107_1 < var_107_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_107_1 .. (var_107_1 < var_107_0 and "</color>" or "")

	setText(arg_107_0.price:Find("timeLimit/consume/Text"), var_107_2 .. "/" .. var_107_0)
end

function var_0_0.UpdateCommodityPrice(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_1:GetPrice()
	local var_108_1 = arg_108_1:getConfig("resource_num")

	setText(arg_108_0.price:Find("normal/consume/Text"), var_108_0)
	setText(arg_108_0.price:Find("normal/consume/originalprice/Text"), var_108_1)
	setActive(arg_108_0.price:Find("normal/consume/originalprice"), var_108_0 ~= var_108_1)
end

function var_0_0.UpdateFurniturePrice(arg_109_0, arg_109_1)
	local var_109_0 = Goods.Id2FurnitureId(arg_109_1.id)
	local var_109_1 = Furniture.New({
		id = var_109_0
	})
	local var_109_2 = var_109_1:getConfig("gem_price")

	setText(arg_109_0.price:Find("normal/consume/originalprice/Text"), var_109_2)

	local var_109_3 = var_109_1:getPrice(PlayerConst.ResDiamond)

	setText(arg_109_0.price:Find("normal/consume/Text"), var_109_3)
	setActive(arg_109_0.price:Find("normal/consume/originalprice"), var_109_2 ~= var_109_3)
end

local function var_0_21(arg_110_0, arg_110_1)
	if arg_110_0 == var_0_6 or arg_110_0 == var_0_9 or arg_110_0 == var_0_8 then
		return false
	end

	local var_110_0 = arg_110_1:getSkinId()

	return getProxy(ShopsProxy):CanPurchasedByCharge(var_110_0)
end

function var_0_0.UpdateChargeView(arg_111_0, arg_111_1, arg_111_2, arg_111_3)
	local var_111_0 = arg_111_1 == var_0_4
	local var_111_1 = arg_111_0.btnsList[2]

	setActive(var_111_1:Find("buy_charge"), not var_111_0)

	local var_111_2 = pg.pay_data_display[arg_111_3]

	assert(var_111_2, "pay_data_display>>>>>>>>>>>>>" .. arg_111_3)

	local var_111_3 = GetMoneySymbol() .. GetChargePrice(var_111_2.money)

	setText(arg_111_0.btnsList[2]:Find("buy_charge/value"), var_111_3)

	local var_111_4 = var_111_1.parent:Find("consume")
	local var_111_5 = var_111_1.parent:Find("rmb")

	setText(var_111_5:Find("Text"), var_111_3)
	setActive(var_111_5:Find("originalprice"), var_111_2.cash_show > var_111_2.money)
	setText(var_111_5:Find("originalprice/Text"), GetChargePrice(var_111_2.cash_show))

	local var_111_6 = arg_111_2:GetPrice()
	local var_111_7 = arg_111_2:getConfig("resource_num")

	setActive(var_111_4:Find("originalprice"), var_111_6 ~= var_111_7)
	setText(var_111_4:Find("Text"), var_111_6)
	setText(var_111_4:Find("originalprice/Text"), var_111_7)
end

function var_0_0.FlushObtainBtn(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0:GetObtainBtnState(arg_112_1)
	local var_112_1 = var_0_19(var_112_0)
	local var_112_2, var_112_3 = var_0_21(var_112_0, arg_112_1)

	setActive(arg_112_0.btnsList[1].parent, not var_112_2)
	setActive(arg_112_0.btnsList[2].parent, var_112_2)

	local var_112_4 = var_112_2 and arg_112_0.btnsList[2] or arg_112_0.btnsList[1]

	for iter_112_0 = 0, var_112_4.childCount - 1 do
		local var_112_5 = var_112_4:GetChild(iter_112_0)

		setActive(var_112_5, var_112_5.name == var_112_1)
	end

	if var_112_2 then
		arg_112_0:UpdateChargeView(var_112_0, arg_112_1, var_112_3)
	end

	setActive(arg_112_0.price:Find("btn_charge"), var_112_2 and var_112_0 ~= var_0_4)
	setActive(arg_112_0.price:Find("btn/item"), var_112_0 == var_0_11)
	setActive(arg_112_0.price:Find("btn/tag"), var_112_0 == var_0_11)

	if var_112_0 == var_0_11 then
		arg_112_0:FlushGift(arg_112_1)
	end

	onButton(arg_112_0, arg_112_0.price:Find("btn_charge"), function()
		if not var_112_2 then
			return
		end

		arg_112_0:OpenChargePanel(var_112_3)
	end, SFX_PANEL)
	onButton(arg_112_0, arg_112_0.price:Find("btn"), function()
		local var_114_0 = {}
		local var_114_1 = SkinCouponActivity.StaticEncoreActTip(arg_112_1.id)

		if tobool(var_114_1) then
			table.insert(var_114_0, function(arg_115_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						if var_114_1 and not var_114_1:isEnd() then
							arg_112_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_114_1.id)
						end
					end,
					onNo = arg_115_0
				})
			end)
		end

		if arg_112_1:getConfig("genre") == ShopArgs.SkinShop and not arg_112_1:IsItemDiscountType() and #SkinCouponActivity.GetOvercountEncoreActs(arg_112_1.id) > 0 then
			table.insert(var_114_0, function(arg_117_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Last_Coupon"),
					onYes = arg_117_0
				})
			end)
		end

		seriesAsync(var_114_0, function()
			if var_112_0 == var_0_5 or var_112_0 == var_0_7 or var_112_0 == var_0_11 then
				arg_112_0.purchaseView:ExecuteAction("Show", arg_112_1)
			else
				arg_112_0:OnClickBtn(var_112_0, arg_112_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.OpenChargePanel(arg_119_0, arg_119_1)
	local var_119_0 = Goods.Create({
		shop_id = arg_119_1
	}, Goods.TYPE_CHARGE)

	if ChargeConst.isNeedSetBirth() then
		arg_119_0:emit(LatestSkinShopMediator.OPEN_CHARGE_BIRTHDAY)
	else
		pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = var_119_0.id
		})
	end
end

function var_0_0.GetObtainBtnState(arg_120_0, arg_120_1)
	if arg_120_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_120_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_120_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_120_1.type == Goods.TYPE_ACTIVITY or arg_120_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_120_1.buyCount > 0 then
		return var_0_4
	elseif arg_120_1:isDisCount() and arg_120_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_120_1:CanUseVoucherType() or arg_120_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_120_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.FlushGift(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_1:GetGiftList()[1]

	updateDrop(arg_121_0.price:Find("btn/item/mask/item"), {
		type = var_121_0.type,
		id = var_121_0.id,
		count = var_121_0.count
	})
end

function var_0_0.OnClickBtn(arg_122_0, arg_122_1, arg_122_2)
	if arg_122_1 == var_0_5 or arg_122_1 == var_0_7 or arg_122_1 == var_0_11 then
		arg_122_0:OnPurchase(arg_122_2)
	elseif arg_122_1 == var_0_10 then
		arg_122_0:OnItemPurchase(arg_122_2)
	elseif arg_122_1 == var_0_6 then
		arg_122_0:OnActivity(arg_122_2)
	elseif arg_122_1 == var_0_8 then
		arg_122_0:OnBackyard(arg_122_2)
	elseif arg_122_1 == var_0_9 then
		if arg_122_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_122_0:OnExperience4Item(arg_122_2)
		else
			arg_122_0:OnExperience(arg_122_2)
		end
	end
end

function var_0_0.FlushGifgPackBtn(arg_123_0, arg_123_1)
	local var_123_0 = false
	local var_123_1
	local var_123_2
	local var_123_3

	for iter_123_0, iter_123_1 in pairs(arg_123_0.giftSkinCommodities) do
		for iter_123_2, iter_123_3 in ipairs(iter_123_1) do
			if iter_123_3.id == arg_123_1.id then
				var_123_0 = true

				break
			end
		end

		if var_123_0 then
			var_123_1 = arg_123_0.giftPackCommodities[iter_123_0]
			var_123_2 = arg_123_0.giftSkinCommodities[iter_123_0]
			var_123_3 = arg_123_0.giftSkinProbabilitys[iter_123_0]

			break
		end
	end

	if var_123_0 then
		setText(arg_123_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip_2"))
		onButton(arg_123_0, arg_123_0.giftPackBtn, function()
			if not var_123_1:isChargeType() then
				return
			end

			local var_124_0 = var_123_1:GetSkinProbability()
			local var_124_1 = getProxy(ShipSkinProxy):GetProbabilitySkins(var_124_0)

			if #var_124_0 <= 0 or #var_124_0 ~= #var_124_1 then
				arg_123_0:emit(LatestSkinShopMediator.OPEN_SCENE, {
					SCENE.CHARGE,
					{
						wrap = ChargeScene.TYPE_PICK
					}
				})
			else
				arg_123_0:emit(LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER, var_123_1, var_123_2, var_123_3)
			end
		end, SFX_PANEL)
	else
		var_123_0 = getProxy(ActivityProxy):GetFakeGiftPackActivity(arg_123_1)

		if var_123_0 then
			setText(arg_123_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip"))
			onButton(arg_123_0, arg_123_0.giftPackBtn, function()
				arg_123_0:emit(LatestSkinShopMediator.OPEN_GIFT_ACT_LAYER, var_123_0.id)
			end, SFX_PANEL)
		end
	end

	setActive(arg_123_0.giftPackBtn, var_123_0)
end

function var_0_0.SetGiftPackLayer(arg_126_0)
	return
end

function var_0_0.OnPurchase(arg_127_0, arg_127_1)
	if arg_127_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_127_1:isDisCount() and arg_127_1:IsItemDiscountType() then
		arg_127_0:emit(LatestSkinShopMediator.ON_SHOPPING_BY_ACT, arg_127_1.id, 1)
	else
		arg_127_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_127_1.id, 1)
	end
end

function var_0_0.OnItemPurchase(arg_128_0, arg_128_1)
	if arg_128_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_128_0 = arg_128_1:GetVoucherIdList()
	local var_128_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_128_1.id)

	if #var_128_0 <= 0 and #var_128_1 <= 0 then
		return
	end

	local var_128_2 = {}

	for iter_128_0, iter_128_1 in ipairs(var_128_0) do
		table.insert(var_128_2, iter_128_1)
	end

	for iter_128_2, iter_128_3 in ipairs(var_128_1) do
		table.insert(var_128_2, iter_128_3.id)
	end

	local var_128_3 = arg_128_0.skinId
	local var_128_4 = pg.ship_skin_template[var_128_3]
	local var_128_5 = SwitchSpecialChar(var_128_4.name, true)

	arg_128_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_128_2,
		skinId = var_128_3,
		skinName = var_128_5,
		price = arg_128_1:GetPrice(),
		onYes = function(arg_129_0)
			if arg_129_0 then
				arg_128_0:emit(LatestSkinShopMediator.ON_ITEM_PURCHASE, arg_129_0, arg_128_1.id)
			else
				arg_128_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_128_1.id, 1)
			end
		end
	})
end

function var_0_0.OnActivity(arg_130_0, arg_130_1)
	local var_130_0 = arg_130_1:getConfig("time")
	local var_130_1 = arg_130_1:getConfig("activity")
	local var_130_2 = getProxy(ActivityProxy):getActivityById(var_130_1)

	if var_130_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_130_0) or var_130_2 and not var_130_2:isEnd() then
		if arg_130_1.type == Goods.TYPE_ACTIVITY then
			arg_130_0:emit(LatestSkinShopMediator.GO_SHOPS_LAYER, arg_130_1:getConfig("activity"))
		elseif arg_130_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_130_3 = arg_130_1:getConfig("scene")

			if var_130_3 and #var_130_3 > 0 then
				arg_130_0:emit(LatestSkinShopMediator.OPEN_SCENE, var_130_3)
			else
				arg_130_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_130_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_131_0, arg_131_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_131_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_131_0.name, var_131_0.level))

		return
	end

	arg_131_0:emit(LatestSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0.skinId
	local var_132_1 = getProxy(ShipSkinProxy):getSkinById(var_132_0)

	if var_132_1 and not var_132_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_132_2 = arg_132_1:getConfig("resource_num")
	local var_132_3 = arg_132_1:getConfig("time_second") * var_132_2
	local var_132_4, var_132_5, var_132_6, var_132_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_132_3)
	local var_132_8 = pg.ship_skin_template[arg_132_0.skinId].name

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_132_2, var_132_8, var_132_4, var_132_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_132_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_132_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_132_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_134_0, arg_134_1)
	local var_134_0 = arg_134_0.skinId
	local var_134_1 = getProxy(ShipSkinProxy):getSkinById(var_134_0)

	if var_134_1 and not var_134_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_134_2 = arg_134_1:getConfig("resource_num")
	local var_134_3 = arg_134_1:getConfig("time_second") * var_134_2
	local var_134_4, var_134_5, var_134_6, var_134_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_134_3)
	local var_134_8 = pg.ship_skin_template[arg_134_0.skinId].name
	local var_134_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_134_10 = _.detect(var_134_9, function(arg_135_0)
		return arg_135_0:CanUseForShop(arg_134_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_134_2, var_134_8, var_134_4, var_134_5),
		onYes = function()
			if not var_134_10 or var_134_10.count < var_134_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_134_0:emit(LatestSkinShopMediator.ON_ITEM_EXPERIENCE, var_134_10.id, arg_134_1.id, 1)
		end
	})
end

function var_0_0.SetFilterPanel(arg_137_0)
	local var_137_0 = arg_137_0.filterContent:Find("own/options")
	local var_137_1 = arg_137_0.filterContent:Find("type/options")
	local var_137_2 = arg_137_0.filterContent:Find("shipHave/options")
	local var_137_3 = arg_137_0.filterContent:Find("camp/options")
	local var_137_4 = arg_137_0.filterContent:Find("rarity/options")
	local var_137_5 = arg_137_0.filterContent:Find("shipType/options")
	local var_137_6 = arg_137_0.filterContent:Find("themeType/options")
	local var_137_7 = arg_137_0.filterContent:Find("tag/options")

	arg_137_0:SetOptionList(var_137_3, ShipIndexConst.CampNames, true)
	arg_137_0:SetOptionList(var_137_4, ShipIndexConst.RarityNames, true)
	arg_137_0:SetOptionList(var_137_5, ShipIndexConst.TypeNames, true)
	arg_137_0:SetOptionList(var_137_6, arg_137_0.classifyNames)
	arg_137_0:SetSingleOptions(var_137_0, "ownType")
	arg_137_0:SetMultiOptions(var_137_1, "typeType")
	arg_137_0:SetSingleOptions(var_137_2, "shipHaveType")
	arg_137_0:SetMultiOptions(var_137_3, "campType")
	arg_137_0:SetMultiOptions(var_137_4, "rarityType")
	arg_137_0:SetMultiOptions(var_137_5, "shipType")
	arg_137_0:SetMultiOptions(var_137_6, "themeType")
	arg_137_0:SetMultiOptions(var_137_7, "tagType")
	arg_137_0:HideEmptyOptions()
	onButton(arg_137_0, arg_137_0.filterUI:Find("bg"), function()
		for iter_138_0, iter_138_1 in pairs(arg_137_0.filterValues) do
			arg_137_0.filterValuesTemp[iter_138_0] = Clone(arg_137_0.filterValues[iter_138_0])
		end

		setActive(arg_137_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_137_0, arg_137_0.filterUI:Find("panelMask/panel/closeBtn"), function()
		for iter_139_0, iter_139_1 in pairs(arg_137_0.filterValues) do
			arg_137_0.filterValuesTemp[iter_139_0] = Clone(arg_137_0.filterValues[iter_139_0])
		end

		setActive(arg_137_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_137_0, arg_137_0.filterUI:Find("panelMask/panel/bottom/ok"), function()
		for iter_140_0, iter_140_1 in pairs(arg_137_0.filterValues) do
			arg_137_0.filterValues[iter_140_0] = Clone(arg_137_0.filterValuesTemp[iter_140_0])
		end

		setActive(arg_137_0.filterUI, false)
		arg_137_0:Refresh(true)
	end, SFX_PANEL)
end

function var_0_0.OpenFilterPanel(arg_141_0)
	setActive(arg_141_0.filterUI, true)

	local var_141_0 = arg_141_0.filterContent:Find("own/options")
	local var_141_1 = arg_141_0.filterContent:Find("type/options")
	local var_141_2 = arg_141_0.filterContent:Find("shipHave/options")
	local var_141_3 = arg_141_0.filterContent:Find("camp/options")
	local var_141_4 = arg_141_0.filterContent:Find("rarity/options")
	local var_141_5 = arg_141_0.filterContent:Find("shipType/options")
	local var_141_6 = arg_141_0.filterContent:Find("themeType/options")
	local var_141_7 = arg_141_0.filterContent:Find("tag/options")

	arg_141_0:SetSingleOptions(var_141_0, "ownType", true)
	arg_141_0:SetMultiOptions(var_141_1, "typeType", true)
	arg_141_0:SetSingleOptions(var_141_2, "shipHaveType", true)
	arg_141_0:SetMultiOptions(var_141_3, "campType", true)
	arg_141_0:SetMultiOptions(var_141_4, "rarityType", true)
	arg_141_0:SetMultiOptions(var_141_5, "shipType", true)
	arg_141_0:SetMultiOptions(var_141_6, "themeType", true)
	arg_141_0:SetMultiOptions(var_141_7, "tagType", true)
end

function var_0_0.SetOptionList(arg_142_0, arg_142_1, arg_142_2, arg_142_3)
	local var_142_0 = UIItemList.New(arg_142_1, arg_142_1:GetChild(0))

	var_142_0:make(function(arg_143_0, arg_143_1, arg_143_2)
		if arg_143_0 == UIItemList.EventUpdate then
			local var_143_0 = arg_142_2[arg_143_1 + 1]

			if arg_142_3 then
				var_143_0 = i18n(var_143_0)
			end

			arg_143_2.name = arg_143_1

			setScrollText(arg_143_2:Find("mask/Text"), var_143_0)
		end
	end)
	var_142_0:align(#arg_142_2)
end

function var_0_0.SetSingleOptions(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	for iter_144_0 = 0, arg_144_1.childCount - 1 do
		local var_144_0 = arg_144_1:GetChild(iter_144_0)

		arg_144_0:SetOptionSelect(arg_144_1:GetChild(iter_144_0), iter_144_0 == arg_144_0.filterValuesTemp[arg_144_2])

		if not arg_144_3 then
			onButton(arg_144_0, var_144_0, function()
				arg_144_0.filterValuesTemp[arg_144_2] = iter_144_0

				for iter_145_0 = 0, arg_144_1.childCount - 1 do
					arg_144_0:SetOptionSelect(arg_144_1:GetChild(iter_145_0), iter_145_0 == iter_144_0)
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetMultiOptions(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	for iter_146_0 = 0, arg_146_1.childCount - 1 do
		local var_146_0 = arg_146_1:GetChild(iter_146_0)

		arg_146_0:SetOptionSelect(arg_146_1:GetChild(iter_146_0), table.contains(arg_146_0.filterValuesTemp[arg_146_2], iter_146_0))

		if not arg_146_3 then
			onButton(arg_146_0, var_146_0, function()
				if iter_146_0 == 0 then
					arg_146_0.filterValuesTemp[arg_146_2] = {
						0
					}

					for iter_147_0 = 0, arg_146_1.childCount - 1 do
						arg_146_0:SetOptionSelect(arg_146_1:GetChild(iter_147_0), iter_147_0 == 0)
					end
				else
					table.removebyvalue(arg_146_0.filterValuesTemp[arg_146_2], 0)

					if table.contains(arg_146_0.filterValuesTemp[arg_146_2], iter_146_0) then
						table.removebyvalue(arg_146_0.filterValuesTemp[arg_146_2], iter_146_0)
					else
						table.insert(arg_146_0.filterValuesTemp[arg_146_2], iter_146_0)
					end

					local var_147_0 = true

					for iter_147_1 = 1, arg_146_1.childCount - 1 do
						if not table.contains(arg_146_0.filterValuesTemp[arg_146_2], iter_147_1) and arg_146_1:GetChild(iter_147_1).gameObject.activeSelf then
							var_147_0 = false

							break
						end
					end

					if #arg_146_0.filterValuesTemp[arg_146_2] == 0 then
						var_147_0 = true
					end

					if var_147_0 and arg_146_2 ~= "tagType" then
						arg_146_0.filterValuesTemp[arg_146_2] = {
							0
						}
					end

					for iter_147_2 = 0, arg_146_1.childCount - 1 do
						arg_146_0:SetOptionSelect(arg_146_1:GetChild(iter_147_2), table.contains(arg_146_0.filterValuesTemp[arg_146_2], iter_147_2))
					end
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetOptionSelect(arg_148_0, arg_148_1, arg_148_2)
	setActive(arg_148_1:Find("selectedFrame"), arg_148_2)

	local var_148_0

	if IsNil(arg_148_1:Find("Text")) then
		var_148_0 = arg_148_1:Find("mask/Text"):GetComponent(typeof(Text))
	else
		var_148_0 = arg_148_1:Find("Text"):GetComponent(typeof(Text))
	end

	if arg_148_2 then
		var_148_0.color = Color.New(1, 1, 1, 1)
	else
		var_148_0.color = Color.New(0, 0, 0, 0.5)
	end
end

function var_0_0.HideEmptyOptions(arg_149_0, arg_149_1, arg_149_2)
	local var_149_0 = {
		typeType = {
			0
		},
		shipHaveType = {
			0
		},
		campType = {
			0
		},
		rarityType = {
			0
		},
		shipType = {
			0
		},
		tagType = {
			0
		}
	}

	for iter_149_0, iter_149_1 in ipairs(arg_149_0.commodities) do
		local var_149_1 = iter_149_1:getSkinId()
		local var_149_2 = ShipSkin.New({
			id = var_149_1
		})
		local var_149_3 = arg_149_0:GetSkinType(var_149_2)

		for iter_149_2, iter_149_3 in ipairs(var_149_3) do
			if not table.keyof(var_149_0.typeType, iter_149_3) then
				table.insert(var_149_0.typeType, iter_149_3)
			end
		end

		local var_149_4 = arg_149_0:GetShipHave(var_149_2)

		if not table.keyof(var_149_0.shipHaveType, var_149_4) then
			table.insert(var_149_0.shipHaveType, var_149_4)
		end

		local var_149_5 = arg_149_0:GetCampType(var_149_2)

		if not table.keyof(var_149_0.campType, var_149_5) then
			table.insert(var_149_0.campType, var_149_5)
		end

		local var_149_6 = arg_149_0:GetRarityType(var_149_2)

		if not table.keyof(var_149_0.rarityType, var_149_6) then
			table.insert(var_149_0.rarityType, var_149_6)
		end

		local var_149_7 = arg_149_0:GetShipType(var_149_2)

		if not table.keyof(var_149_0.shipType, var_149_7) then
			table.insert(var_149_0.shipType, var_149_7)
		end

		local var_149_8 = arg_149_0:GetTagType(iter_149_1)

		if not table.keyof(var_149_0.tagType, var_149_8) then
			table.insert(var_149_0.tagType, var_149_8)
		end
	end

	for iter_149_4, iter_149_5 in pairs(var_149_0) do
		table.sort(iter_149_5, function(arg_150_0, arg_150_1)
			return arg_150_0 < arg_150_1
		end)
	end

	for iter_149_6 = 1, arg_149_0.uiTypeOptions.childCount - 1 do
		setActive(arg_149_0.uiTypeOptions:GetChild(iter_149_6), table.contains(var_149_0.typeType, iter_149_6))
	end

	for iter_149_7 = 1, arg_149_0.uiShipHaveOptions.childCount - 1 do
		setActive(arg_149_0.uiShipHaveOptions:GetChild(iter_149_7), table.contains(var_149_0.shipHaveType, iter_149_7))
	end

	for iter_149_8 = 1, arg_149_0.uiCampOptions.childCount - 1 do
		setActive(arg_149_0.uiCampOptions:GetChild(iter_149_8), table.contains(var_149_0.campType, iter_149_8))
	end

	for iter_149_9 = 1, arg_149_0.uiRrarityOptions.childCount - 1 do
		setActive(arg_149_0.uiRrarityOptions:GetChild(iter_149_9), table.contains(var_149_0.rarityType, iter_149_9))
	end

	for iter_149_10 = 1, arg_149_0.uiShipTypeOptions.childCount - 1 do
		setActive(arg_149_0.uiShipTypeOptions:GetChild(iter_149_10), table.contains(var_149_0.shipType, iter_149_10))
	end

	for iter_149_11 = 1, arg_149_0.uiTagTypeOptions.childCount - 1 do
		setActive(arg_149_0.uiTagTypeOptions:GetChild(iter_149_11), table.contains(var_149_0.tagType, iter_149_11))
	end
end

function var_0_0.GetSkinType(arg_151_0, arg_151_1)
	local var_151_0 = {}

	if arg_151_1:IsLive2d() or arg_151_1:IsLive2dPlus() then
		table.insert(var_151_0, 1)
	end

	if not arg_151_1:IsLive2d() and not arg_151_1:IsLive2dPlus() and not arg_151_1:IsSpine() and not arg_151_1:IsSpinePlus() then
		table.insert(var_151_0, 2)
	end

	if arg_151_1:IsSpine() or arg_151_1:IsSpinePlus() then
		table.insert(var_151_0, 3)
	end

	if arg_151_1:IsBG() then
		table.insert(var_151_0, 4)
	end

	if arg_151_1:IsDbg() then
		table.insert(var_151_0, 5)
	end

	if arg_151_1:isBgm() then
		table.insert(var_151_0, 6)
	end

	return var_151_0
end

function var_0_0.GetShipHave(arg_152_0, arg_152_1)
	if arg_152_1:CantUse() then
		return 2
	else
		return 1
	end
end

function var_0_0.GetCampType(arg_153_0, arg_153_1)
	local var_153_0 = arg_153_1:GetDefaultShipConfig()

	if not var_153_0 then
		return 0
	end

	local var_153_1 = arg_153_0:ToVShip(var_153_0):getNation()
	local var_153_2 = ShipIndexCfg.camp

	for iter_153_0, iter_153_1 in ipairs(var_153_2) do
		for iter_153_2, iter_153_3 in ipairs(iter_153_1.types) do
			if iter_153_3 == Nation.LINK then
				if var_153_1 >= Nation.LINK then
					return iter_153_0 - 1
				end
			elseif var_153_1 == iter_153_3 then
				return iter_153_0 - 1
			end
		end
	end

	return 0
end

function var_0_0.GetRarityType(arg_154_0, arg_154_1)
	local var_154_0 = arg_154_1:GetDefaultShipConfig()

	if not var_154_0 then
		return 0
	end

	local var_154_1 = arg_154_0:ToVShip(var_154_0):getRarity()
	local var_154_2 = ShipIndexCfg.rarity

	for iter_154_0, iter_154_1 in ipairs(var_154_2) do
		if table.contains(iter_154_1.types, var_154_1) then
			return iter_154_0 - 1
		end
	end

	return 0
end

function var_0_0.GetShipType(arg_155_0, arg_155_1)
	local var_155_0 = arg_155_1:GetDefaultShipConfig()

	if not var_155_0 then
		return 0
	end

	local var_155_1 = arg_155_0:ToVShip(var_155_0):getShipType()
	local var_155_2 = ShipIndexCfg.type

	for iter_155_0, iter_155_1 in ipairs(var_155_2) do
		for iter_155_2, iter_155_3 in pairs(iter_155_1) do
			if table.keyof(iter_155_3, var_155_1) then
				return iter_155_0 - 1
			end
		end
	end

	return 0
end

function var_0_0.GetTagType(arg_156_0, arg_156_1)
	local var_156_0 = table.contains(arg_156_0.returnSkins, arg_156_1.id)
	local var_156_1 = NewShopSkinCard.GetTagId(arg_156_1, var_156_0)

	if var_156_1 > 0 then
		return var_156_1
	else
		return 0
	end
end

function var_0_0.GetSkinClassify(arg_157_0)
	arg_157_0.classifyIds = {}
	arg_157_0.classifyNames = {}

	local var_157_0 = {}
	local var_157_1 = {}

	for iter_157_0, iter_157_1 in ipairs(arg_157_0.commodities) do
		local var_157_2 = arg_157_0:GetShopTypeIdBySkinId(iter_157_1:getSkinId())
		local var_157_3 = var_157_2 == 0 and var_0_16 or var_157_2

		var_157_1[var_157_3] = (var_157_1[var_157_3] or 0) + 1
	end

	local var_157_4 = {}

	for iter_157_2, iter_157_3 in ipairs(arg_157_0.returnSkins) do
		var_157_4[iter_157_3] = true
	end

	if underscore.any(arg_157_0.commodities, function(arg_158_0)
		return var_157_4[arg_158_0.id]
	end) then
		table.insert(var_157_0, var_0_14)
	end

	for iter_157_4, iter_157_5 in ipairs(pg.skin_page_template.all) do
		if iter_157_5 ~= var_0_17 and iter_157_5 ~= var_0_18 and (var_157_1[iter_157_5] or 0) > 0 then
			table.insert(var_157_0, iter_157_5)
		end
	end

	if arg_157_0.mode == var_0_0.MODE_EXPERIENCE then
		table.insert(var_157_0, 1, var_0_13)
	end

	if arg_157_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_157_0, 1, var_0_15)
	end

	table.insert(var_157_0, 1, var_0_12)

	arg_157_0.classifyIds = var_157_0

	for iter_157_6, iter_157_7 in ipairs(arg_157_0.classifyIds) do
		if iter_157_7 == var_0_12 then
			table.insert(arg_157_0.classifyNames, i18n("shop_filter_all"))
		elseif iter_157_7 == var_0_13 or iter_157_7 == var_0_15 then
			table.insert(arg_157_0.classifyNames, i18n("shop_filter_trial"))
		elseif iter_157_7 == var_0_14 then
			table.insert(arg_157_0.classifyNames, i18n("shop_filter_retro"))
		else
			table.insert(arg_157_0.classifyNames, pg.skin_page_template[iter_157_7].name)
		end
	end
end

function var_0_0.GetShopTypeIdBySkinId(arg_159_0, arg_159_1)
	local var_159_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not arg_159_0.shopTypeIdList then
		arg_159_0.shopTypeIdList = {}
	end

	if arg_159_0.shopTypeIdList[arg_159_1] then
		return arg_159_0.shopTypeIdList[arg_159_1]
	end

	for iter_159_0, iter_159_1 in pairs(var_159_0) do
		for iter_159_2, iter_159_3 in ipairs(iter_159_1) do
			arg_159_0.shopTypeIdList[iter_159_3] = iter_159_0

			if iter_159_3 == arg_159_1 then
				return iter_159_0
			end
		end
	end
end

function var_0_0.OnShopping(arg_160_0, arg_160_1)
	if not arg_160_0.showingCommodity then
		return
	end

	if arg_160_0.purchaseView and arg_160_0.purchaseView:GetLoaded() then
		arg_160_0.purchaseView:Hide()
	end

	if arg_160_0.showingCommodity.id == arg_160_1 then
		arg_160_0.pendingSelectId = arg_160_0:GetNextCommodityIndex(arg_160_1)

		arg_160_0:GetAllCommodities()
		arg_160_0:Refresh(false)
	end
end

function var_0_0.OnFurnitureUpdate(arg_161_0, arg_161_1)
	if not arg_161_0.showingCommodity then
		return
	end

	local var_161_0 = arg_161_0.showingCommodity.id

	if Goods.ExistFurniture(var_161_0) and Goods.Id2FurnitureId(var_161_0) == arg_161_1 then
		arg_161_0:GetAllCommodities()
		arg_161_0:Refresh(true)
	end
end

function var_0_0.CheckDownloadSkinList(arg_162_0, arg_162_1)
	local var_162_0 = {}

	for iter_162_0, iter_162_1 in ipairs(arg_162_0.commodities) do
		PaintingGroupConst.AddPaintingNameBySkinID(var_162_0, iter_162_1:getSkinId())
	end

	local var_162_1 = {
		showMask = true,
		isShowBox = true,
		paintingNameList = var_162_0,
		finishFunc = arg_162_1
	}

	PaintingGroupConst.PaintingDownload(var_162_1)
end

function var_0_0.willExit(arg_163_0)
	arg_163_0:ClearCards()

	arg_163_0.spriteCache = nil

	ClearLScrollrect(arg_163_0.scrollrect)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_163_0:getUIName())

	if arg_163_0.live2dChar then
		arg_163_0.live2dChar:Dispose()

		arg_163_0.live2dChar = nil
	end

	if arg_163_0.voucherMsgBox then
		arg_163_0.voucherMsgBox:Destroy()

		arg_163_0.voucherMsgBox = nil
	end

	if arg_163_0.purchaseView then
		arg_163_0.purchaseView:Destroy()

		arg_163_0.purchaseView = nil
	end

	for iter_163_0, iter_163_1 in pairs(arg_163_0.downloads) do
		iter_163_1:Dispose()
	end

	arg_163_0.downloads = {}

	arg_163_0:ClearPainting()

	if arg_163_0.interactionPreview then
		arg_163_0.interactionPreview:Dispose()

		arg_163_0.interactionPreview = nil
	end

	arg_163_0:disposeEvent()
	arg_163_0:ClearTimer()
	arg_163_0:ReturnChar()
	arg_163_0:UnOverlay()
end

function var_0_0.GetNextCommodityIndex(arg_164_0, arg_164_1)
	for iter_164_0, iter_164_1 in ipairs(arg_164_0.displays) do
		if iter_164_1.id == arg_164_1 then
			if iter_164_0 == #arg_164_0.displays then
				return arg_164_1
			end

			return arg_164_0.displays[iter_164_0 + 1].id
		end
	end
end

function var_0_0.onBackPressed(arg_165_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

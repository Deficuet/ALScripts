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

local function var_0_20(arg_5_0, arg_5_1)
	local var_5_0 = {}

	if arg_5_0 == ShopConst.NEW_SKIN_SHOP_ID then
		var_5_0 = getProxy(ShipSkinProxy):GetInTimeSkins()
	elseif arg_5_0 == ShopConst.PERMANANT_SKIN_SHOP_ID then
		var_5_0 = getProxy(ShipSkinProxy):GetPermanentSkins()
	else
		local var_5_1 = pg.shop_skin_subsheet[arg_5_0]

		for iter_5_0, iter_5_1 in ipairs(getProxy(ShipSkinProxy):GetAllSkins()) do
			if var_5_1 and table.keyof(var_5_1.param, iter_5_1.id) then
				table.insert(var_5_0, iter_5_1)
			end
		end
	end

	if LOCK_SKIN_US then
		local var_5_2 = pg.gameset.levellimit_skintype.key_value
		local var_5_3 = pg.gameset.levellimit_skintype.description

		if var_5_2 >= getProxy(PlayerProxy):getData().level then
			var_5_0 = _.filter(var_5_0, function(arg_6_0)
				local var_6_0 = pg.ship_skin_template[arg_6_0:getSkinId()].shop_type_id

				return table.contains(var_5_3, var_6_0)
			end)
		end
	end

	if arg_5_1 == var_0_0.MODE_OVERVIEW then
		for iter_5_2 = #var_5_0, 1, -1 do
			if var_5_0[iter_5_2]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				table.remove(var_5_0, iter_5_2)
			end
		end
	end

	return var_5_0
end

local function var_0_21(arg_7_0)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0) do
		local var_7_1 = pg.ship_skin_template[iter_7_1:getSkinId()]

		if var_7_1 then
			table.insertto(var_7_0, ResPathSupport.GetPaintingShipYardIconListByPaintingName(var_7_1.prefab))
			table.insertto(var_7_0, ResPathSupport.GetPaintingShipYardIconListByPaintingName(var_7_1.painting))
		end

		if iter_7_1.type == Goods.TYPE_SKIN then
			local var_7_2 = iter_7_1:getConfig("resource_type")
			local var_7_3 = Item.getConfigData(id2ItemId(var_7_2))

			if var_7_3 and var_7_3.icon then
				table.insert(var_7_0, var_7_3.icon)
			end
		end
	end

	return var_7_0
end

local function var_0_22(arg_8_0)
	local var_8_0 = {
		arg_8_0
	}

	if not ShipSkin.IsChangeSkin(arg_8_0) then
		return var_8_0
	end

	local var_8_1 = {
		[arg_8_0] = true
	}
	local var_8_2 = arg_8_0

	for iter_8_0 = 1, 10 do
		local var_8_3 = ShipSkin.GetChangeSkinData(var_8_2)
		local var_8_4 = var_8_3 and var_8_3.next

		if not var_8_4 or var_8_1[var_8_4] or not pg.ship_skin_template[var_8_4] then
			break
		end

		var_8_1[var_8_4] = true

		table.insert(var_8_0, var_8_4)

		var_8_2 = var_8_4
	end

	return var_8_0
end

local function var_0_23(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(var_0_22(arg_9_0)) do
		local var_9_1 = pg.ship_skin_template[iter_9_1]

		if var_9_1 then
			if var_9_1.skin_type ~= ShipSkin.SKIN_TYPE_TB then
				table.insertto(var_9_0, ResPathSupport.GetSpineCharListByPrefabName(var_9_1.prefab))
				table.insertto(var_9_0, ResPathSupport.GetSpineQIconListByPrefabName(var_9_1.painting))
			end

			table.insertto(var_9_0, ResPathSupport.GetPaintingListByPaintingName(var_9_1.painting))

			if var_9_1.painting and #var_9_1.painting > 0 then
				for iter_9_2, iter_9_3 in ipairs({
					"_shop",
					"_n_shop"
				}) do
					table.insert(var_9_0, string.lower(string.format(ResPathSupport.ConstPath.Painting.Base, var_9_1.painting, iter_9_3)))
				end
			end

			table.insertto(var_9_0, ResPathSupport.GetShipSkinPaintingFaceList(iter_9_1))
			table.insertto(var_9_0, ResPathSupport.GetShipSkinBgList(iter_9_1))

			if var_9_1.ship_group and var_9_1.skin_type ~= ShipSkin.SKIN_TYPE_TB then
				local var_9_2 = ShipGroup.getDefaultShipConfig(var_9_1.ship_group)

				if var_9_2 and pg.ship_data_statistics[var_9_2.id] then
					table.insertto(var_9_0, ResPathSupport.GetShipRarityBgList(var_9_2.id))
				end
			end

			if PaintingGroupConst.IsPaintingNeedCheck() and var_9_1.painting and #var_9_1.painting > 0 then
				PaintingGroupConst.AddPaintingNameWithFilteMap(var_9_0, var_9_1.painting)
			end
		end
	end

	return ResPathSupport.UniqueLuaArr(var_9_0)
end

function var_0_0.getResource(arg_10_0)
	local var_10_0 = {
		"ui/LatestSkinShopUI",
		"ui/SkinShopUI_atlas",
		"skinicon"
	}
	local var_10_1 = arg_10_0.contextData

	local function var_10_2(arg_11_0)
		local var_11_0 = Goods.Create({
			shop_id = arg_11_0
		}, Goods.TYPE_CHARGE)
		local var_11_1 = getProxy(ShopsProxy):getChargedList() or {}
		local var_11_2 = ChargeConst.getBuyCount(var_11_1, var_11_0.id)

		var_11_0:updateBuyCount(var_11_2)

		return var_11_0
	end

	local function var_10_3()
		if var_10_1.skinCommodities then
			return var_10_1.skinCommodities
		end

		if var_10_1.commodityId or var_10_1.giftPackCommodity then
			local var_12_0 = (var_10_1.giftPackCommodity or var_10_2(var_10_1.commodityId)):GetSkinProbability()

			return getProxy(ShipSkinProxy):GetProbabilitySkins(var_12_0)
		end

		return var_0_20(var_10_1.type or ShopConst.PERMANANT_SKIN_SHOP_ID, var_10_1.mode or var_0_0.MODE_OVERVIEW)
	end

	local var_10_4 = var_0_21(var_10_3())

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_10_0), var_10_0, var_10_4))
end

function var_0_0.init(arg_13_0)
	arg_13_0.bgs = arg_13_0._tf:Find("bgs")
	arg_13_0.adapt = arg_13_0._tf:Find("adapt")
	arg_13_0.top = arg_13_0.adapt:Find("top")
	arg_13_0.bottom = arg_13_0.adapt:Find("bottom")
	arg_13_0.right = arg_13_0.adapt:Find("right")
	arg_13_0.subPage = arg_13_0.adapt:Find("subPage")
	arg_13_0.resources = arg_13_0.adapt:Find("top/resources")
	arg_13_0.limitTime = arg_13_0.adapt:Find("top/title/limit_time/Text")
	arg_13_0.skinName = arg_13_0.adapt:Find("top/title/skin_name_mask/skin_name")
	arg_13_0.shipName = arg_13_0.adapt:Find("top/title/name_mask/name")
	arg_13_0.changeSkin = arg_13_0.adapt:Find("top/change_skin")
	arg_13_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_13_0.changeSkin, "toggle_ui"))
	arg_13_0.showOwnBtn = arg_13_0.adapt:Find("bottom/showOwnBtn")
	arg_13_0.filterBtn = arg_13_0.adapt:Find("bottom/filterBtn")
	arg_13_0.search = arg_13_0.adapt:Find("bottom/search")
	arg_13_0.scrollrect = arg_13_0.adapt:Find("bottom/scroll/content"):GetComponent("LScrollRect")
	arg_13_0.sdTg = arg_13_0.adapt:Find("right/sdTg")
	arg_13_0.hideUITg = arg_13_0.adapt:Find("right/hideUITg")
	arg_13_0.charContainer = arg_13_0.adapt:Find("right/char_container")
	arg_13_0.backChara = arg_13_0.charContainer:Find("bg/back/chara")
	arg_13_0.charTf = arg_13_0.charContainer:Find("char")
	arg_13_0.furnitureContainer = arg_13_0.charContainer:Find("fur")
	arg_13_0.switchPreviewBtn = arg_13_0.charContainer:Find("switch")
	arg_13_0.dynamicToggle = arg_13_0.adapt:Find("right/functionsAndTags/dynamic")
	arg_13_0.dynamicIcon = arg_13_0.adapt:Find("right/functionsAndTags/dynamic/icon")
	arg_13_0.showBgToggle = arg_13_0.adapt:Find("right/functionsAndTags/showBg")
	arg_13_0.dynamicResToggle = arg_13_0.adapt:Find("right/functionsAndTags/dynamic/l2d_res_state")
	arg_13_0.tagList = UIItemList.New(arg_13_0.adapt:Find("right/functionsAndTags/tags"), arg_13_0.adapt:Find("right/functionsAndTags/tags/tag"))
	arg_13_0.giftPackBtn = arg_13_0.adapt:Find("right/giftPackBtn")
	arg_13_0.price = arg_13_0.adapt:Find("right/price")
	arg_13_0.btnsList = {
		arg_13_0.price:Find("normal/btns"),
		arg_13_0.price:Find("charge/btns")
	}
	arg_13_0.filterUI = arg_13_0.adapt:Find("subPage/filterUI")
	arg_13_0.filterContent = arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content")
	arg_13_0.painting = arg_13_0._tf:Find("painting")
	arg_13_0.paintingTF = arg_13_0._tf:Find("painting/paint")
	arg_13_0.defaultPaintingPosition = arg_13_0.paintingTF.anchoredPosition
	arg_13_0.defaultPaintingScale = arg_13_0.paintingTF.localScale
	arg_13_0.live2dContainer = arg_13_0._tf:Find("painting/paint/live2d")
	arg_13_0.spTF = arg_13_0._tf:Find("painting/paint/spinePainting")
	arg_13_0.spBg = arg_13_0._tf:Find("painting/paintBg/spinePainting")

	setActive(arg_13_0.charContainer, false)
	setActive(arg_13_0.filterUI, false)

	arg_13_0.mainTitle = arg_13_0.adapt:Find("top/mainTitle")
	arg_13_0.backBtn = arg_13_0.adapt:Find("top/closeBtn")
	arg_13_0.homeBtn = arg_13_0.adapt:Find("top/homeBtn")
	arg_13_0.giftPack = arg_13_0.adapt:Find("giftPack")

	setActive(arg_13_0.mainTitle, false)
	setActive(arg_13_0.backBtn, false)
	setActive(arg_13_0.homeBtn, false)
	setActive(arg_13_0.giftPack, false)

	arg_13_0.downloads = {}
	arg_13_0.isToggleDynamic = false
	arg_13_0.isToggleShowBg = true
	arg_13_0.isPreviewFurniture = false
	arg_13_0.interactionPreview = BackYardInteractionPreview.New(arg_13_0.furnitureContainer, Vector3(0, 0, 0))
	arg_13_0.voucherMsgBox = SkinVoucherMsgBox.New(pg.UIMgr.GetInstance().OverlayMain)
	arg_13_0.purchaseView = NewSkinShopPurchaseView.New(arg_13_0._tf, arg_13_0.event)

	arg_13_0:RegisterEvent()
	setText(arg_13_0._tf:Find("bgs/empty/Text"), i18n("shop_new_unfound"))
	setText(arg_13_0.adapt:Find("top/mainTitle/Text"), i18n("shop_new_shop"))
	setText(arg_13_0.filterBtn:Find("Text"), i18n("shop_new_sort"))
	setText(arg_13_0.search:Find("holder"), i18n("shop_new_search"))

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.btnsList) do
		setText(iter_13_1:Find("yigoumai_button/Text"), i18n("shop_new_purchased"))
		setText(iter_13_1:Find("goumai_button/Text"), i18n("shop_new_purchase"))
		setText(iter_13_1:Find("qianwanghuoqu_button/Text"), i18n("shop_new_claim"))
		setText(iter_13_1:Find("furniture_shop/Text"), i18n("shop_new_furniture"))
		setText(iter_13_1:Find("item_buy/Text"), i18n("shop_new_discount"))
		setText(iter_13_1:Find("tiyan_btn/Text"), i18n("shop_new_try"))
		setText(iter_13_1:Find("buy_with_gift/Text"), i18n("shop_new_purchase"))
	end

	setText(arg_13_0.btnsList[2]:Find("buy_charge/Text"), i18n("shop_new_purchase"))
	setText(arg_13_0.price:Find("btn/tag/Text"), i18n("shop_new_gift"))
	setText(arg_13_0.giftPack:Find("panel/desc"), i18n("shop_new_gem_transform"))
	setText(arg_13_0.giftPack:Find("price/btns/yigoumai_button/Text"), i18n("shop_new_purchased"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/title"), i18n("shop_new_sort"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/subTitleFrame/subTitle"), i18n("shop_new_review"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/0/Text"), i18n("shop_new_all"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/1/Text"), i18n("shop_new_owned"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/2/Text"), i18n("shop_new_havent_own"))
	setScrollText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/3/mask/Text"), i18n("shop_new_unused"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle"), i18n("shop_new_type"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/0/Text"), i18n("shop_new_all"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/2/Text"), i18n("shop_new_static"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/3/Text"), i18n("shop_new_dynamic"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/4/Text"), i18n("shop_new_static_bg"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/5/Text"), i18n("shop_new_dynamic_bg"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/6/Text"), i18n("shop_new_bgm"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/subTitleFrame/subTitle"), i18n("shop_new_index"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/0/Text"), i18n("shop_new_all"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/1/Text"), i18n("shop_new_ship_owned"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/2/Text"), i18n("shop_new_ship_havent_owned"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/camp/subTitleFrame/subTitle"), i18n("shop_new_nation"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/rarity/subTitleFrame/subTitle"), i18n("shop_new_rarity"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipType/subTitleFrame/subTitle"), i18n("shop_new_category"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/themeType/subTitleFrame/subTitle"), i18n("shop_new_skin_theme"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/subTitleFrame/subTitle"), i18n("skin_shop_tag"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/0/Text"), i18n("skin_shop_tag_0"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/1/Text"), i18n("skin_shop_tag_1"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/2/Text"), i18n("skin_shop_tag_2"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/3/Text"), i18n("skin_shop_tag_3"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/4/Text"), i18n("skin_shop_tag_4"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/5/Text"), i18n("skin_shop_tag_5"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/tag/options/6/Text"), i18n("skin_shop_tag_6"))
	setText(arg_13_0.filterUI:Find("panelMask/panel/bottom/ok/Text"), i18n("shop_new_confirm"))

	arg_13_0.uiOwnOptions = arg_13_0.filterContent:Find("own/options")
	arg_13_0.uiTypeOptions = arg_13_0.filterContent:Find("type/options")
	arg_13_0.uiShipHaveOptions = arg_13_0.filterContent:Find("shipHave/options")
	arg_13_0.uiCampOptions = arg_13_0.filterContent:Find("camp/options")
	arg_13_0.uiRrarityOptions = arg_13_0.filterContent:Find("rarity/options")
	arg_13_0.uiShipTypeOptions = arg_13_0.filterContent:Find("shipType/options")
	arg_13_0.uiThemeTypeOptions = arg_13_0.filterContent:Find("themeType/options")
	arg_13_0.uiTagTypeOptions = arg_13_0.filterContent:Find("tag/options")

	arg_13_0:Overlay()
end

function var_0_0.Overlay(arg_14_0)
	arg_14_0:OverlayPanel(arg_14_0.adapt, {
		pbList = {
			arg_14_0.top:Find("title"),
			arg_14_0.top:Find("title/limit_time"),
			arg_14_0.top:Find("title/charaNameBg"),
			arg_14_0.showOwnBtn,
			arg_14_0.filterBtn,
			arg_14_0.search,
			arg_14_0.charContainer:Find("bg"),
			arg_14_0.price:Find("normal/consume"),
			arg_14_0.filterUI:Find("panelMask/panel")
		}
	})
end

function var_0_0.UnOverlay(arg_15_0)
	arg_15_0:UnOverlayPanel(arg_15_0.adapt, arg_15_0._tf)
end

function var_0_0.didEnter(arg_16_0)
	arg_16_0:InitData()
	arg_16_0:SetFilterPanel()
	arg_16_0:SetResource()

	if arg_16_0.mode == var_0_0.MODE_EXPERIENCE or arg_16_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI_2, false)
		setActive(arg_16_0.showOwnBtn, false)
		setActive(arg_16_0.filterBtn, false)
		setActive(arg_16_0.search, false)

		arg_16_0.top:Find("title").anchoredPosition = Vector2(184.2, -208.3)
		arg_16_0.top:Find("change_skin").anchoredPosition = Vector2(70.7, -337.8)
		arg_16_0.right:Find("giftPackBtn").anchoredPosition = Vector2(-483, -446.4)
		arg_16_0.right:Find("price").anchoredPosition = Vector2(-238.3, -140.7)
		arg_16_0.bottom:Find("scroll").offsetMin = Vector2(17.7, 0)
		arg_16_0.bottom:Find("scroll").offsetMax = Vector2(-718.7, 227.9)
	end

	arg_16_0:SetGiftPackLayer()
	onDelayTick(function()
		local var_17_0 = {}

		table.insert(var_17_0, function(arg_18_0)
			arg_16_0:CheckDownloadSkinList(arg_18_0)
		end)
		seriesAsync(var_17_0, function()
			arg_16_0:SetSkinScroll()
			arg_16_0:Refresh(true)
		end)
	end, 0.001)
	onButton(arg_16_0, arg_16_0.backBtn, function()
		arg_16_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_16_0, arg_16_0.homeBtn, function()
		arg_16_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_16_0, arg_16_0.filterBtn, function()
		arg_16_0:OpenFilterPanel()
	end, SFX_PANEL)

	if arg_16_0.mode == var_0_0.MODE_EXPERIENCE or arg_16_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		getProxy(SettingsProxy):SetNextTipTimeLimitSkinShop()
	end

	local var_16_0 = getProxy(PlayerProxy):getRawData().id

	onToggle(arg_16_0, arg_16_0.sdTg, function(arg_23_0)
		setActive(arg_16_0.charContainer, arg_23_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_16_0, arg_23_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_16_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_16_0, 0)

	triggerToggle(arg_16_0.sdTg, var_16_1 == 1)
	onToggle(arg_16_0, arg_16_0.hideUITg, function(arg_24_0)
		setActive(arg_16_0.top, not arg_24_0)
		setActive(arg_16_0.bottom, not arg_24_0)
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_24_0)
	end, SFX_PANEL)
	onInputChanged(arg_16_0, arg_16_0.search, function()
		arg_16_0:Refresh(true)

		local var_25_0 = getInputText(arg_16_0.search)

		setActive(arg_16_0.search:Find("holder"), var_25_0 == "")
	end)
	onButton(arg_16_0, arg_16_0.showOwnBtn, function()
		arg_16_0:emit(LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER)
	end, SFX_PANEL)
	getProxy(CommanderManualProxy):TaskProgressAdd(2021, 1)
end

function var_0_0.SetResource(arg_27_0)
	local var_27_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_27_0.resources:Find("gem/Text"), var_27_0:getTotalGem())
	onButton(arg_27_0, arg_27_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.InitData(arg_29_0)
	arg_29_0.type = arg_29_0.contextData.type or ShopConst.PERMANANT_SKIN_SHOP_ID
	arg_29_0.mode = arg_29_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_29_0:GetAllCommodities()
	arg_29_0:GetGiftPackCommodities()

	arg_29_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()

	arg_29_0:GetSkinClassify()

	local var_29_0 = (arg_29_0.mode == var_0_0.MODE_EXPERIENCE or arg_29_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM) and 1 or 0

	arg_29_0.filterValues = {
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
			var_29_0
		},
		tagType = {
			0
		}
	}
	arg_29_0.filterValuesTemp = Clone(arg_29_0.filterValues)
end

function var_0_0.GetAllCommodities(arg_30_0)
	arg_30_0.commodities = var_0_20(arg_30_0.type, arg_30_0.mode)
end

function var_0_0.GetGiftPackCommodities(arg_31_0)
	arg_31_0.giftPackCommodities = {}
	arg_31_0.giftSkinCommodities = {}
	arg_31_0.giftSkinProbabilitys = {}

	for iter_31_0, iter_31_1 in ipairs(pg.pay_data_display.all) do
		local var_31_0 = pg.pay_data_display[iter_31_1]

		if var_31_0.skin_inquire_relation ~= 0 and pg.TimeMgr.GetInstance():inTime(var_31_0.time) then
			local var_31_1 = getProxy(ShopsProxy):GetGiftCommodity(iter_31_1, Goods.TYPE_CHARGE)

			arg_31_0.giftPackCommodities[iter_31_1] = var_31_1

			local var_31_2 = var_31_1:GetSkinProbability()

			arg_31_0.giftSkinCommodities[iter_31_1] = getProxy(ShipSkinProxy):GetProbabilitySkins(var_31_2)
			arg_31_0.giftSkinProbabilitys[iter_31_1] = getProxy(ShipSkinProxy):GetSkinProbabilitys(var_31_2)
		end
	end
end

function var_0_0.SetSkinScroll(arg_32_0)
	arg_32_0.scrollrect.isNewLoadingMethod = true

	function arg_32_0.scrollrect.onInitItem(arg_33_0)
		arg_32_0:OnInitItem(arg_33_0)
	end

	function arg_32_0.scrollrect.onUpdateItem(arg_34_0, arg_34_1)
		arg_32_0:OnUpdateItem(arg_34_0, arg_34_1)
	end

	arg_32_0.scrollrect.enabled = true
end

function var_0_0.Refresh(arg_35_0, arg_35_1)
	arg_35_0:ClearCards()

	arg_35_0.cards = {}
	arg_35_0.displays = {}

	local var_35_0 = getInputText(arg_35_0.search)

	for iter_35_0, iter_35_1 in ipairs(arg_35_0.commodities) do
		if arg_35_0:filterOk(iter_35_1) and arg_35_0:IsSearchType(var_35_0, iter_35_1) then
			table.insert(arg_35_0.displays, iter_35_1)
		end
	end

	local var_35_1 = {}

	for iter_35_2, iter_35_3 in ipairs(arg_35_0.displays) do
		local var_35_2 = iter_35_3.type == Goods.TYPE_ACTIVITY or iter_35_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_35_3 = 0

		if not var_35_2 then
			var_35_3 = iter_35_3:GetPrice()
		end

		var_35_1[iter_35_3.id] = var_35_3
	end

	table.sort(arg_35_0.displays, function(arg_36_0, arg_36_1)
		return arg_35_0:Sort(arg_36_0, arg_36_1, var_35_1)
	end)

	local var_35_4 = #arg_35_0.displays == 0

	setActive(arg_35_0.bgs:Find("default"), var_35_4)
	setActive(arg_35_0.bgs:Find("diffBg"), not var_35_4)
	setActive(arg_35_0.bgs:Find("empty"), var_35_4)
	setActive(arg_35_0._tf:Find("leftMask"), not var_35_4)
	setActive(arg_35_0._tf:Find("bottomMask"), not var_35_4)
	setActive(arg_35_0.painting, not var_35_4)
	setActive(arg_35_0.top:Find("title"), not var_35_4)
	setActive(arg_35_0.changeSkin, not var_35_4)
	setActive(arg_35_0.right, not var_35_4)
	setActive(arg_35_0.right, not var_35_4)
	setActive(arg_35_0.bottom:Find("scroll"), not var_35_4)

	if not var_35_4 then
		if arg_35_1 then
			arg_35_0.triggerFirstCard = true

			arg_35_0.scrollrect:SetTotalCount(#arg_35_0.displays, 0)
		else
			arg_35_0.scrollrect:SetTotalCount(#arg_35_0.displays)
		end
	end
end

function var_0_0.IsSearchType(arg_37_0, arg_37_1, arg_37_2)
	if not arg_37_1 or arg_37_1 == "" then
		return true
	end

	local var_37_0 = arg_37_2:getSkinId()

	return ShipSkin.New({
		id = var_37_0
	}):IsMatchKey(arg_37_1)
end

local function var_0_24(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_2[arg_38_0.id]
	local var_38_1 = arg_38_2[arg_38_1.id]

	if var_38_0 == var_38_1 then
		return arg_38_0.id < arg_38_1.id
	else
		return var_38_1 < var_38_0
	end
end

function var_0_0.Sort(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = arg_39_1.buyCount == 0 and 1 or 0
	local var_39_1 = arg_39_2.buyCount == 0 and 1 or 0

	if var_39_0 == var_39_1 then
		local var_39_2 = arg_39_1:getConfig("order")
		local var_39_3 = arg_39_2:getConfig("order")

		if var_39_2 == var_39_3 then
			return var_0_24(arg_39_1, arg_39_2, arg_39_3)
		else
			return var_39_2 < var_39_3
		end
	else
		return var_39_1 < var_39_0
	end
end

function var_0_0.filterOk(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.filterValues.ownType
	local var_40_1 = arg_40_0.filterValues.typeType
	local var_40_2 = arg_40_0.filterValues.shipHaveType
	local var_40_3 = arg_40_0.filterValues.campType
	local var_40_4 = arg_40_0.filterValues.rarityType
	local var_40_5 = arg_40_0.filterValues.shipType
	local var_40_6 = arg_40_0.filterValues.themeType
	local var_40_7 = arg_40_0.filterValues.tagType
	local var_40_8 = arg_40_1:getSkinId()
	local var_40_9 = ShipSkin.New({
		id = var_40_8
	})
	local var_40_10 = var_40_9:GetDefaultShipConfig()
	local var_40_11 = arg_40_0:ToVShip(var_40_10)

	if var_40_0 ~= 0 then
		local var_40_12 = false
		local var_40_13 = getProxy(ShipSkinProxy):hasSkin(var_40_8)
		local var_40_14 = var_40_9:NoUse()

		if var_40_0 == 1 and var_40_13 then
			var_40_12 = true
		end

		if var_40_0 == 2 and not var_40_13 then
			var_40_12 = true
		end

		if var_40_0 == 3 and var_40_13 and var_40_14 then
			var_40_12 = true
		end

		if not var_40_12 then
			return false
		end
	end

	if var_40_1[1] ~= 0 then
		local var_40_15 = false

		for iter_40_0, iter_40_1 in ipairs(var_40_1) do
			if iter_40_1 == 1 and (var_40_9:IsLive2d() or var_40_9:IsLive2dPlus()) then
				var_40_15 = true
			end

			if iter_40_1 == 2 and not var_40_9:IsLive2d() and not var_40_9:IsLive2dPlus() and not var_40_9:IsSpine() and not var_40_9:IsSpinePlus() then
				var_40_15 = true
			end

			if iter_40_1 == 3 and (var_40_9:IsSpine() or var_40_9:IsSpinePlus()) then
				var_40_15 = true
			end

			if iter_40_1 == 4 and var_40_9:IsBG() then
				var_40_15 = true
			end

			if iter_40_1 == 5 and var_40_9:IsDbg() then
				var_40_15 = true
			end

			if iter_40_1 == 6 and var_40_9:isBgm() then
				var_40_15 = true
			end

			if var_40_15 then
				break
			end
		end

		if not var_40_15 then
			return false
		end
	end

	if var_40_2 ~= 0 then
		local var_40_16 = false
		local var_40_17 = var_40_9:CantUse()

		if var_40_2 == 1 and not var_40_17 then
			var_40_16 = true
		end

		if var_40_2 == 2 and var_40_17 then
			var_40_16 = true
		end

		if not var_40_16 then
			return false
		end
	end

	if var_40_3[1] ~= 0 then
		if not var_40_10 then
			return false
		end

		local var_40_18 = false

		for iter_40_2, iter_40_3 in ipairs(var_40_3) do
			local var_40_19 = ShipIndexCfg.camp

			for iter_40_4, iter_40_5 in ipairs(var_40_19[iter_40_3 + 1].types) do
				if iter_40_5 == Nation.LINK then
					if var_40_11:getNation() >= Nation.LINK then
						var_40_18 = true
					end
				elseif iter_40_5 == var_40_11:getNation() then
					var_40_18 = true
				end
			end

			if var_40_18 then
				break
			end
		end

		if not var_40_18 then
			return false
		end
	end

	if var_40_4[1] ~= 0 then
		if not var_40_10 then
			return false
		end

		local var_40_20 = false

		for iter_40_6, iter_40_7 in ipairs(var_40_4) do
			local var_40_21 = ShipIndexCfg.rarity

			if table.contains(var_40_21[iter_40_7 + 1].types, var_40_11:getRarity()) then
				var_40_20 = true
			end

			if var_40_20 then
				break
			end
		end

		if not var_40_20 then
			return false
		end
	end

	if var_40_5[1] ~= 0 then
		if not var_40_10 then
			return false
		end

		local var_40_22 = false

		for iter_40_8, iter_40_9 in ipairs(var_40_5) do
			local var_40_23 = ShipIndexCfg.type
			local var_40_24 = var_40_23[iter_40_9 + 1].types

			if iter_40_9 + 1 < 4 then
				local var_40_25 = var_40_23[iter_40_9].shipTypes

				if table.contains(var_40_24, var_40_11:getShipType()) then
					var_40_22 = true
				end

				if table.contains(var_40_24, var_40_11:getTeamType()) then
					var_40_22 = true
				end
			elseif table.contains(var_40_24, var_40_11:getShipType()) then
				var_40_22 = true
			end

			if var_40_22 then
				break
			end
		end

		if not var_40_22 then
			return false
		end
	end

	if var_40_6[1] ~= 0 then
		local var_40_26 = false

		for iter_40_10, iter_40_11 in ipairs(var_40_6) do
			local var_40_27 = arg_40_0.classifyIds[iter_40_11 + 1]

			if arg_40_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				if arg_40_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
					var_40_26 = var_40_27 == var_0_15 and arg_40_0:ExitSkinExperienceItem(arg_40_1.id)
				else
					var_40_26 = var_40_27 == var_0_13
				end
			elseif var_40_27 == var_0_12 then
				var_40_26 = true
			elseif var_40_27 == var_0_14 and table.contains(arg_40_0.returnSkins, arg_40_1.id) then
				var_40_26 = true
			else
				local var_40_28 = arg_40_0:GetShopTypeIdBySkinId(var_40_8)

				var_40_26 = (var_40_28 == 0 and var_0_16 or var_40_28) == var_40_27
			end

			if var_40_26 then
				break
			end
		end

		if not var_40_26 then
			return false
		end
	end

	if var_40_7[1] ~= 0 then
		local var_40_29 = false
		local var_40_30 = table.contains(arg_40_0.returnSkins, arg_40_1.id)
		local var_40_31 = NewShopSkinCard.GetTagId(arg_40_1, var_40_30)

		if table.keyof(var_40_7, var_40_31) then
			return true
		else
			return false
		end
	end

	return true
end

function var_0_0.ToVShip(arg_41_0, arg_41_1)
	if not arg_41_0.vship then
		arg_41_0.vship = {}

		function arg_41_0.vship.getNation()
			return arg_41_0.vship.config.nationality
		end

		function arg_41_0.vship.getShipType()
			return arg_41_0.vship.config.type
		end

		function arg_41_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_41_0.vship.config.type)
		end

		function arg_41_0.vship.getRarity()
			return arg_41_0.vship.config.rarity
		end
	end

	arg_41_0.vship.config = arg_41_1

	return arg_41_0.vship
end

function var_0_0.ExitSkinExperienceItem(arg_46_0, arg_46_1)
	if not arg_46_0.cacheSkinExperienceItems then
		arg_46_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(arg_46_0.cacheSkinExperienceItems, function(arg_47_0)
		return arg_47_0:CanUseForShop(arg_46_1)
	end)
end

function var_0_0.RegisterEvent(arg_48_0)
	arg_48_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_49_0, arg_49_1)
		arg_48_0:AdjustPainting(arg_49_1)
		setActive(arg_48_0.top, not arg_49_1)
		setActive(arg_48_0.bottom, not arg_49_1)
		setActive(arg_48_0.right, not arg_49_1)

		if arg_48_0.live2dChar then
			arg_48_0.live2dChar:setPurchaseOffset(arg_49_1)
		end

		if arg_48_0.spineChar then
			if arg_49_1 then
				local var_49_0 = pg.ship_skin_template[arg_48_0.skinId].purchase_offset

				if var_49_0 and #var_49_0 >= 3 then
					arg_48_0.spineChar:SetLocalPosition(Vector3(var_49_0[1], var_49_0[2], var_49_0[3]))
				end

				if var_49_0 and #var_49_0 >= 4 then
					arg_48_0.spineChar:SetLocalScale(Vector3(var_49_0[4], var_49_0[4], var_49_0[4]))
				end
			else
				arg_48_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
				arg_48_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
			end
		end

		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_49_1)
	end)
	arg_48_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_50_0, arg_50_1)
		local var_50_0 = arg_48_0:GetObtainBtnState(arg_50_1)

		arg_48_0:OnClickBtn(var_50_0, arg_50_1)
	end)
	onButton(arg_48_0, arg_48_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_48_0.skinId) then
			arg_48_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_48_0.skinId)

			arg_48_0:UpdateMainView(arg_48_0.showingCommodity)
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_52_0, arg_52_1)
	local var_52_0 = NewShopSkinCard.New(arg_52_1)

	onButton(arg_52_0, var_52_0._go, function()
		if not var_52_0.commodity then
			return
		end

		for iter_53_0, iter_53_1 in pairs(arg_52_0.cards) do
			iter_53_1:UpdateSelected(false)
		end

		arg_52_0.selectedId = var_52_0.commodity.id

		var_52_0:UpdateSelected(true)
		arg_52_0:UpdateMainView(var_52_0.commodity)
		arg_52_0:GCHandle()
	end, SFX_PANEL)

	arg_52_0.cards[arg_52_1] = var_52_0
end

function var_0_0.OnUpdateItem(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_0.cards[arg_54_2]

	if not var_54_0 then
		arg_54_0:OnInitItem(arg_54_2)

		var_54_0 = arg_54_0.cards[arg_54_2]
	end

	local var_54_1 = arg_54_0.displays[arg_54_1 + 1]

	if not var_54_1 then
		return
	end

	local var_54_2 = arg_54_0.selectedId == var_54_1.id
	local var_54_3 = table.contains(arg_54_0.returnSkins, var_54_1.id)

	var_54_0:Update(var_54_1, var_54_2, var_54_3)

	if arg_54_0.pendingSelectId and arg_54_0.pendingSelectId == var_54_1.id then
		arg_54_0.pendingSelectId = nil

		triggerButton(var_54_0._go)
	end

	if arg_54_0.triggerFirstCard and arg_54_1 == 0 then
		arg_54_0.triggerFirstCard = false

		triggerButton(var_54_0._go)
	end
end

function var_0_0.UpdateMainView(arg_55_0, arg_55_1)
	arg_55_0.mainViewToken = (arg_55_0.mainViewToken or 0) + 1

	local var_55_0 = arg_55_0.mainViewToken
	local var_55_1 = var_0_23(arg_55_1:getSkinId())

	SplitPackConst.DownloadByLuaArr(var_55_1, function()
		if arg_55_0.exited or var_55_0 ~= arg_55_0.mainViewToken then
			return
		end

		arg_55_0:RefreshMainView(arg_55_1)
	end)
end

function var_0_0.RefreshMainView(arg_57_0, arg_57_1)
	arg_57_0.skinId = arg_57_1:getSkinId()

	local var_57_0 = ShipSkin.IsChangeSkin(arg_57_0.skinId)

	setActive(arg_57_0.changeSkin, var_57_0)

	if var_57_0 then
		arg_57_0:FlushChangeSkin(arg_57_1)
	end

	arg_57_0.shipSkin = ShipSkin.New({
		id = arg_57_0.skinId
	})

	arg_57_0:FlushName()
	arg_57_0:FlushPreviewBtn(arg_57_1)
	arg_57_0:FlushTimeLimit(arg_57_1)
	arg_57_0:SwitchPreview(arg_57_1, arg_57_0.isPreviewFurniture)
	arg_57_0:FlushPaintingToggle(arg_57_1)
	arg_57_0:FlushTag()
	arg_57_0:FlushBG(arg_57_1)
	arg_57_0:FlushPainting(arg_57_1)
	arg_57_0:FlushPrice(arg_57_1)
	arg_57_0:FlushObtainBtn(arg_57_1)
	arg_57_0:FlushGifgPackBtn(arg_57_1)

	arg_57_0.showingCommodity = arg_57_1
end

function var_0_0.FlushChangeSkin(arg_58_0, arg_58_1)
	local var_58_0 = ShipSkin.GetChangeSkinGroupId(arg_58_0.skinId)
	local var_58_1 = ShipSkin.GetChangeSkinCustomDataId(arg_58_0.skinId, "hide_shop")
	local var_58_2 = pg.gameset.changeskin_switch_block
	local var_58_3 = false
	local var_58_4 = false
	local var_58_5 = arg_58_0.changeSkinToggle:IsAsmrSkin() and true or false

	if var_58_2 and var_58_2.description then
		local var_58_6 = var_58_2.description

		if table.contains(var_58_6, var_58_0) and HXSet.isHx() then
			var_58_4 = true
		end
	end

	if var_58_1 and var_58_1 == 1 then
		var_58_3 = true
	end

	if not arg_58_0.changeSkinId then
		arg_58_0.changeSkinId = arg_58_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_58_0.changeSkinId) == var_58_0 then
		arg_58_0.skinId = arg_58_0.changeSkinId
	else
		arg_58_0.changeSkinId = arg_58_0.skinId
	end

	arg_58_0.changeSkinToggle:setSkinData(arg_58_0.skinId)

	if var_58_3 or var_58_4 or var_58_5 then
		setActive(arg_58_0.changeSkin, false)
	else
		setActive(arg_58_0.changeSkin, true)
	end
end

function var_0_0.GCHandle(arg_59_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.FlushName(arg_60_0)
	local var_60_0 = pg.ship_skin_template[arg_60_0.skinId]

	setScrollText(arg_60_0.skinName, SwitchSpecialChar(var_60_0.name, true))

	if var_60_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_60_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_60_0.skinId)))
	else
		local var_60_1 = ShipGroup.getDefaultShipConfig(var_60_0.ship_group)

		setScrollText(arg_60_0.shipName, var_60_1.name)
	end
end

function var_0_0.FlushPreviewBtn(arg_61_0, arg_61_1)
	local var_61_0 = Goods.ExistFurniture(arg_61_1.id)

	removeOnButton(arg_61_0.switchPreviewBtn)

	if not var_61_0 and arg_61_0.isPreviewFurniture then
		arg_61_0.isPreviewFurniture = false
	end

	setActive(arg_61_0.switchPreviewBtn, var_61_0)

	if var_61_0 then
		onButton(arg_61_0, arg_61_0.switchPreviewBtn, function()
			arg_61_0.isPreviewFurniture = not arg_61_0.isPreviewFurniture

			arg_61_0:SwitchPreview(arg_61_1, arg_61_0.isPreviewFurniture)
			arg_61_0:FlushPrice(arg_61_1)
			arg_61_0:FlushObtainBtn(arg_61_1)
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPreview(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = arg_63_0.skinId

	if pg.ship_skin_template[var_63_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_63_0.charContainer, false)

		return
	end

	local var_63_1 = getProxy(PlayerProxy):getRawData().id

	setActive(arg_63_0.charContainer, PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_63_1, 0) == 1)
	setActive(arg_63_0.charTf, not arg_63_2)
	setActive(arg_63_0.furnitureContainer, arg_63_2)

	if not arg_63_2 then
		local var_63_2 = pg.ship_skin_template[var_63_0]

		arg_63_0:FlushChar(var_63_2.prefab, var_63_2.id)
		GetImageSpriteFromAtlasAsync("qicon/" .. var_63_2.painting, "", arg_63_0.backChara)
	else
		local var_63_3 = Goods.Id2FurnitureId(arg_63_1.id)
		local var_63_4 = Goods.GetFurnitureConfig(arg_63_1.id)

		arg_63_0.interactionPreview:Flush(var_63_0, var_63_3, var_63_4.scale[2] or 1, var_63_4.position[2])
	end
end

function var_0_0.FlushChar(arg_64_0, arg_64_1, arg_64_2)
	if arg_64_0.prefabName and arg_64_0.prefabName == arg_64_1 then
		return
	end

	arg_64_0:ReturnChar()

	arg_64_0.prefabName = arg_64_1

	local var_64_0 = SpineAnimChar.New()

	var_64_0:SetPaint(arg_64_1)
	var_64_0:Load(true, function(arg_65_0)
		if arg_64_0.prefabName ~= arg_64_1 then
			arg_65_0:Dispose()

			return
		end

		arg_64_0.spineChar = arg_65_0

		local var_65_0 = pg.skinshop_spine_scale[arg_64_2]

		if var_65_0 then
			arg_64_0.spineChar:SetLocalScale(Vector3(var_65_0.skinshop_scale, var_65_0.skinshop_scale, 1))
		else
			arg_64_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
		end

		arg_64_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
		arg_64_0.spineChar:SetLayer(Layer.UI)
		arg_64_0.spineChar:SetParent(arg_64_0.charTf)
		arg_64_0.spineChar:SetAction("normal", 0)
	end)
end

function var_0_0.ReturnChar(arg_66_0)
	if arg_66_0.spineChar then
		arg_66_0.spineChar:Dispose()

		arg_66_0.spineChar = nil
		arg_66_0.prefabName = nil
	end
end

function var_0_0.ClearCards(arg_67_0)
	if not arg_67_0.cards then
		return
	end

	for iter_67_0, iter_67_1 in pairs(arg_67_0.cards) do
		iter_67_1:Dispose()
	end

	arg_67_0.cards = nil
end

function var_0_0.FlushTimeLimit(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0.skinId
	local var_68_1 = false
	local var_68_2

	if arg_68_1:IsActivityExtra() and arg_68_1:ShowMaintenanceTime() then
		local var_68_3, var_68_4 = arg_68_1:GetMaintenanceMonthAndDay()

		function var_68_2()
			return i18n("limit_skin_time_before_maintenance", var_68_3, var_68_4)
		end

		var_68_1 = true
	elseif arg_68_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_68_5 = getProxy(ShipSkinProxy):getSkinById(var_68_0)

		var_68_1 = var_68_5 and var_68_5:isExpireType() and not var_68_5:isExpired()

		if var_68_1 then
			function var_68_2()
				return skinTimeStamp(var_68_5:getRemainTime())
			end
		end
	else
		local var_68_6, var_68_7 = pg.TimeMgr.GetInstance():inTime(arg_68_1:getConfig("time"))

		var_68_1 = var_68_7

		if var_68_1 then
			local var_68_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_68_7)

			function var_68_2()
				return skinCommdityTimeStamp(var_68_8)
			end
		end
	end

	setActive(arg_68_0.top:Find("title/limit_time"), var_68_1)
	arg_68_0:ClearTimer()

	if var_68_1 then
		arg_68_0:AddTimer(var_68_2)
	end
end

function var_0_0.AddTimer(arg_72_0, arg_72_1)
	arg_72_0.timer = Timer.New(function()
		setText(arg_72_0.limitTime, arg_72_1())
	end, 1, -1)

	arg_72_0.timer.func()
	arg_72_0.timer:Start()
end

function var_0_0.ClearTimer(arg_74_0)
	if arg_74_0.timer then
		arg_74_0.timer:Stop()

		arg_74_0.timer = nil
	end
end

function var_0_0.FlushPaintingToggle(arg_75_0, arg_75_1)
	removeOnToggle(arg_75_0.dynamicToggle)
	removeOnToggle(arg_75_0.showBgToggle)

	local var_75_0 = checkABExist("painting/" .. arg_75_0.shipSkin:getConfig("painting") .. "_n")

	if arg_75_0.isToggleShowBg and not var_75_0 then
		triggerToggle(arg_75_0.showBgToggle, false)

		arg_75_0.isToggleShowBg = false
	elseif var_75_0 then
		triggerToggle(arg_75_0.showBgToggle, true)

		arg_75_0.isToggleShowBg = true
	end

	local var_75_1 = arg_75_0.shipSkin:IsSpine() or arg_75_0.shipSkin:IsLive2d() or arg_75_0.shipSkin:IsSpinePlus() or arg_75_0.shipSkin:IsLive2dPlus()
	local var_75_2 = arg_75_0.shipSkin:IsHxDynamicPreview()

	if var_75_1 and not var_75_2 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_75_0.isToggleDynamic = true
	end

	if var_75_1 then
		local var_75_3 = 0

		if arg_75_0.shipSkin:IsSpine() then
			var_75_3 = 6
		elseif arg_75_0.shipSkin:IsLive2d() then
			var_75_3 = 1
		elseif arg_75_0.shipSkin:IsSpinePlus() then
			var_75_3 = 7
		elseif arg_75_0.shipSkin:IsLive2dPlus() then
			var_75_3 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_75_3) .. "_off", arg_75_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_75_3), arg_75_0.dynamicToggle:Find("select"))
	end

	if var_75_2 and arg_75_0.isToggleDynamic then
		triggerToggle(arg_75_0.dynamicToggle, false)

		arg_75_0.isToggleDynamic = false
	end

	if arg_75_0.isToggleDynamic and not var_75_1 then
		triggerToggle(arg_75_0.dynamicToggle, false)

		arg_75_0.isToggleDynamic = false
	elseif arg_75_0.isToggleDynamic and not arg_75_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_75_0.shipSkin:IsLive2d() or arg_75_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_75_0.isToggleDynamic = false

			local var_75_4 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_75_4, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_75_0.dynamicToggle, false)
		else
			triggerToggle(arg_75_0.dynamicToggle, true)

			arg_75_0.isToggleDynamic = true
		end
	end

	if var_75_0 then
		onToggle(arg_75_0, arg_75_0.showBgToggle, function(arg_76_0)
			arg_75_0.isToggleShowBg = arg_76_0

			arg_75_0:FlushPainting(arg_75_1)
			arg_75_0:FlushBG(arg_75_1)
		end, SFX_PANEL)
	end

	if arg_75_0.shipSkin:IsSpine() or arg_75_0.shipSkin:IsLive2d() or arg_75_0.shipSkin:IsSpinePlus() or arg_75_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_75_0, arg_75_0.dynamicToggle, function(arg_77_0)
			local var_77_0 = arg_75_0.shipSkin:IsHxDynamicPreview()

			if arg_77_0 and var_77_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_tag_control_tip"))
				triggerToggle(arg_75_0.dynamicToggle, false)
				setActive(arg_75_0.dynamicResToggle, false)

				return
			end

			if arg_77_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_75_0.shipSkin:IsLive2d() or arg_75_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_75_0.dynamicToggle, false)

				return
			end

			arg_75_0.isToggleDynamic = arg_77_0

			setActive(arg_75_0.showBgToggle, not arg_77_0 and var_75_0)
			arg_75_0:FlushPainting(arg_75_1)
			arg_75_0:FlushDynamicPaintingResState(arg_75_1)
			arg_75_0:RecordFlag(arg_77_0)
		end, SFX_PANEL)
	end

	setActive(arg_75_0.dynamicIcon, true)

	if arg_75_0.isToggleDynamic then
		arg_75_0:FlushDynamicPaintingResState(arg_75_1)
	elseif var_75_2 then
		setActive(arg_75_0.dynamicResToggle, false)
		setActive(arg_75_0.dynamicIcon, false)
	end

	setActive(arg_75_0.dynamicToggle, var_75_1)
	setActive(arg_75_0.showBgToggle, not arg_75_0.isToggleDynamic and var_75_0)
end

function var_0_0.FlushTag(arg_78_0)
	local var_78_0 = arg_78_0.skinId
	local var_78_1 = pg.ship_skin_template[var_78_0]
	local var_78_2 = Clone(var_78_1.tag)
	local var_78_3 = false

	for iter_78_0 = #var_78_2, 1, -1 do
		local var_78_4 = var_78_2[iter_78_0]

		if var_78_4 == 1 or var_78_4 == 6 or var_78_4 == 7 or var_78_4 == 9 then
			local var_78_5 = true

			table.remove(var_78_2, iter_78_0)
		end
	end

	local var_78_6 = checkABExist("painting/" .. arg_78_0.shipSkin:getConfig("painting") .. "_n")

	arg_78_0.tagList:make(function(arg_79_0, arg_79_1, arg_79_2)
		if arg_79_0 == UIItemList.EventUpdate then
			local var_79_0 = var_78_2[arg_79_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_78_2[arg_79_1 + 1]), function(arg_80_0)
				if arg_78_0.exited then
					return
				end

				arg_79_2:GetComponent(typeof(Image)).sprite = arg_80_0
			end)
		end
	end)
	setActive(arg_78_0.adapt:Find("right/functionsAndTags/tags"), #var_78_2 > 0)
	arg_78_0.tagList:align(#var_78_2)
end

function var_0_0.FlushPainting(arg_81_0, arg_81_1)
	local var_81_0 = arg_81_0:GetPaintingState(arg_81_1)
	local var_81_1 = pg.ship_skin_template[arg_81_0.skinId].painting
	local var_81_2 = ShipSkin.GetChangeSkinData(arg_81_0.skinId) and true or false

	if var_81_0 == var_0_2 and not arg_81_0:ExistL2dRes(var_81_1) or var_81_0 == var_0_3 and not arg_81_0:ExistSpineRes(var_81_1) then
		var_81_0 = var_0_1
	end

	if arg_81_0.paintingState and arg_81_0.paintingState.state == var_81_0 and arg_81_0.paintingState.id == arg_81_1.id and arg_81_0.paintingState.showBg == arg_81_0.isToggleShowBg and arg_81_0.paintingState.purchaseFlag == arg_81_1.buyCount and not var_81_2 then
		return
	end

	arg_81_0:ClearPainting()

	if var_81_0 == var_0_1 then
		arg_81_0:LoadMeshPainting(arg_81_1, arg_81_0.isToggleShowBg)
	elseif var_81_0 == var_0_2 then
		arg_81_0:LoadL2dPainting(arg_81_1)
	elseif var_81_0 == var_0_3 then
		arg_81_0:LoadSpinePainting(arg_81_1)
	end

	arg_81_0.paintingState = {
		state = var_81_0,
		id = arg_81_1.id,
		showBg = arg_81_0.isToggleShowBg,
		purchaseFlag = arg_81_1.buyCount
	}

	arg_81_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_82_0)
	local var_82_0 = arg_82_0.paintingState

	if not var_82_0 then
		return
	end

	if var_82_0.state == var_0_1 then
		arg_82_0:ClearMeshPainting()
	elseif var_82_0.state == var_0_2 then
		arg_82_0:ClearL2dPainting()
	elseif var_82_0.state == var_0_3 then
		arg_82_0:ClearSpinePainting()
	end

	arg_82_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = findTF(arg_83_0.paintingTF, "fitter")
	local var_83_1 = GetOrAddComponent(var_83_0, "PaintingScaler")

	var_83_1.FrameName = "chuanwu"
	var_83_1.Tween = 1

	local var_83_2 = pg.ship_skin_template[arg_83_0.skinId].painting
	local var_83_3 = var_83_2

	if not arg_83_2 and checkABExist("painting/" .. var_83_2 .. "_n") then
		var_83_2 = var_83_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_83_2) then
		return
	end

	if PLATFORM_CODE == PLATFORM_CH and checkABExist("painting/" .. var_83_2 .. "_shop") then
		var_83_2 = var_83_2 .. "_shop"
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_83_2, true, function(arg_84_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_84_0, var_83_0, false)
		ShipExpressionHelper.SetExpression(var_83_0:GetChild(0), var_83_3)

		arg_83_0.paintingName = var_83_2

		if arg_83_0.paintingState and arg_83_0.paintingState.id ~= arg_83_1.id then
			arg_83_0:ClearMeshPainting()
		end

		local var_84_0 = arg_84_0.transform:Find("shop_hx")

		arg_83_0:CheckShowShopHx(var_84_0)

		local var_84_1 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_84_2 = arg_84_0.transform:Find("shop_hx_ch" .. var_84_1)

		arg_83_0:CheckShowShopHx(var_84_2)
	end)
end

function var_0_0.ClearMeshPainting(arg_85_0)
	local var_85_0 = arg_85_0.paintingTF:Find("fitter")

	if arg_85_0.paintingName and var_85_0.childCount > 0 then
		local var_85_1 = var_85_0:GetChild(0).gameObject
		local var_85_2 = var_85_1.transform:Find("shop_hx")

		arg_85_0:RevertShopHx(var_85_2)
		PoolMgr.GetInstance():ReturnPainting(arg_85_0.paintingName, var_85_1)
	end

	arg_85_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_86_0, arg_86_1)
	local var_86_0 = arg_86_0.skinId
	local var_86_1 = pg.ship_skin_template[var_86_0].skin_type
	local var_86_2

	if var_86_1 == ShipSkin.SKIN_TYPE_TB then
		var_86_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_86_0))
	else
		local var_86_3 = pg.ship_skin_template[var_86_0].ship_group
		local var_86_4 = ShipGroup.getDefaultShipConfig(var_86_3)

		var_86_2 = Ship.New({
			noChangeSkin = true,
			configId = var_86_4.id,
			skin_id = var_86_0
		})
	end

	local var_86_5 = Live2DPainting.GenerateData({
		ship = var_86_2,
		position = Vector3(0, 0, -1),
		parent = arg_86_0.live2dContainer,
		offset = var_86_2:GetSkinConfig().shop_offset
	})

	var_86_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_86_0.live2dChar = Live2DPainting.New(var_86_5, function(arg_87_0)
		arg_87_0:IgonreReactPos(true)
		arg_86_0:CheckShowShopHxForL2d(arg_87_0, arg_86_1)

		if arg_86_0.paintingState and arg_86_0.paintingState.id ~= arg_86_1.id then
			arg_86_0:ClearL2dPainting()
		end

		arg_87_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_88_0)
	if arg_88_0.live2dChar then
		arg_88_0:RevertShopHxForL2d(arg_88_0.live2dChar)
		arg_88_0.live2dChar:Dispose()

		arg_88_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_89_0, arg_89_1)
	local var_89_0 = arg_89_0.skinId
	local var_89_1 = pg.ship_skin_template[var_89_0].skin_type
	local var_89_2

	if var_89_1 == ShipSkin.SKIN_TYPE_TB then
		var_89_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_89_0))
	else
		local var_89_3 = pg.ship_skin_template[var_89_0].ship_group
		local var_89_4 = ShipGroup.getDefaultShipConfig(var_89_3)

		var_89_2 = Ship.New({
			noChangeSkin = true,
			configId = var_89_4.id,
			skin_id = var_89_0
		})
	end

	local var_89_5 = SpinePainting.GenerateData({
		ship = var_89_2,
		position = Vector3(0, 0, 0),
		parent = arg_89_0.spTF,
		effectParent = arg_89_0.spBg,
		offset = var_89_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_89_0.spinePainting = SpinePainting.New(var_89_5, function(arg_90_0)
		arg_90_0:SetShopHx(true)

		if arg_89_0.paintingState and arg_89_0.paintingState.id ~= arg_89_1.id then
			arg_89_0:ClearSpinePainting()
		end

		local var_90_0 = arg_90_0._tf:Find("shop_hx")

		arg_89_0:CheckShowShopHx(var_90_0)

		local var_90_1 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_90_2 = arg_90_0._tf:Find("shop_hx_ch" .. var_90_1)

		arg_89_0:CheckShowShopHx(var_90_2)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_91_0)
	if arg_91_0.spinePainting and arg_91_0.spinePainting._tf then
		local var_91_0 = arg_91_0.spinePainting._tf:Find("shop_hx")

		arg_91_0:RevertShopHx(arg_91_0.shopHx)
		arg_91_0.spinePainting:Dispose()

		arg_91_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHx(arg_92_0, arg_92_1)
	if IsNil(arg_92_1) then
		return
	end

	setActive(arg_92_1, false)

	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	setActive(arg_92_1, true)
end

function var_0_0.RevertShopHx(arg_93_0, arg_93_1)
	if not IsNil(arg_93_1) then
		setActive(arg_93_1, false)
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_94_0, arg_94_1, arg_94_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_94_0 = 1

	arg_94_1:changeParamaterValue("shop_hx", var_94_0)
end

function var_0_0.RevertShopHxForL2d(arg_95_0, arg_95_1)
	arg_95_1:changeParamaterValue("shop_hx", 0)
end

function var_0_0.AdjustPainting(arg_96_0, arg_96_1)
	local var_96_0 = arg_96_0.paintingTF
	local var_96_1 = pg.ship_skin_newmainui_shift[arg_96_0.skinId]

	if var_96_1 then
		local var_96_2 = var_96_1.skin_shop_shift

		if arg_96_1 then
			var_96_0.anchoredPosition = Vector2(var_96_2[1] - 440, var_96_2[2] + arg_96_0.defaultPaintingPosition.y)
		else
			var_96_0.anchoredPosition = Vector2(var_96_2[1] + arg_96_0.defaultPaintingPosition.x, var_96_2[2] + arg_96_0.defaultPaintingPosition.y)
		end

		local var_96_3 = var_96_2[4]

		var_96_0.localScale = Vector3(var_96_3, var_96_3, 1)
	else
		var_96_0.anchoredPosition = Vector2(arg_96_0.defaultPaintingPosition.x, arg_96_0.defaultPaintingPosition.y)
		var_96_0.localScale = arg_96_0.defaultPaintingScale
	end
end

function var_0_0.FlushBG(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = arg_97_0.skinId
	local var_97_1 = pg.ship_skin_template[var_97_0]
	local var_97_2

	if var_97_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_97_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_97_0))
	else
		local var_97_3 = ShipGroup.getDefaultShipConfig(var_97_1.ship_group)

		var_97_2 = Ship.New({
			id = 999,
			configId = var_97_3.id,
			skin_id = var_97_0
		})
	end

	local var_97_4 = var_97_2:getShipBgPrint(true)
	local var_97_5 = pg.ship_skin_template[var_97_0].painting

	if (arg_97_0.isToggleShowBg or not checkABExist("painting/" .. var_97_5 .. "_n")) and var_97_1.bg_sp ~= "" then
		var_97_4 = var_97_1.bg_sp
	end

	local var_97_6 = var_97_4 ~= var_97_2:rarity2bgPrintForGet()

	if var_97_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_97_0, var_97_4, arg_97_0.bgs:Find("diffBg"), arg_97_0.bgs:Find("diffBg/bg"), function(arg_98_0)
			if arg_97_2 then
				arg_97_2()
			end
		end, function(arg_99_0)
			if arg_97_2 then
				arg_97_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_97_0:getUIName())

		if arg_97_2 then
			arg_97_2()
		end
	end

	setActive(arg_97_0.bgs:Find("diffBg"), var_97_6)
	setActive(arg_97_0.bgs:Find("default"), not var_97_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_100_0, arg_100_1)
	if not arg_100_0.isToggleDynamic then
		return
	end

	local var_100_0 = arg_100_0:GetPaintingState(arg_100_1)
	local var_100_1 = false
	local var_100_2 = ""
	local var_100_3 = pg.ship_skin_template[arg_100_0.skinId].painting

	if var_0_2 == var_100_0 then
		var_100_1, var_100_2 = arg_100_0:ExistL2dRes(var_100_3)
	elseif var_0_3 == var_100_0 then
		var_100_1, var_100_2 = arg_100_0:ExistSpineRes(var_100_3)
	end

	setActive(arg_100_0.dynamicResToggle, not var_100_1)
	removeOnButton(arg_100_0.dynamicResToggle)

	if not var_100_1 and var_100_2 ~= "" then
		onButton(arg_100_0, arg_100_0.dynamicResToggle, function()
			arg_100_0:DownloadDynamicPainting(var_100_2, arg_100_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_102_0, arg_102_1, arg_102_2)
	local var_102_0 = arg_102_0.skinId

	if arg_102_0.downloads[var_102_0] then
		return
	end

	local var_102_1 = SkinShopDownloadRequest.New()

	arg_102_0.downloads[var_102_0] = var_102_1

	var_102_1:Start(arg_102_1, function(arg_103_0)
		if arg_103_0 and arg_102_0.paintingState and arg_102_0.paintingState.id == arg_102_2.id then
			arg_102_0:FlushPainting(arg_102_2)
			arg_102_0:FlushDynamicPaintingResState(arg_102_2)
		end

		var_102_1:Dispose()

		arg_102_0.downloads[var_102_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_104_0, arg_104_1)
	if arg_104_0.isToggleDynamic and (arg_104_0.shipSkin:IsLive2d() or arg_104_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_104_0.isToggleDynamic and (arg_104_0.shipSkin:IsSpine() or arg_104_0.shipSkin:IsSpinePlus()) then
		if arg_104_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_105_0, arg_105_1)
	local var_105_0 = "live2d/" .. string.lower(arg_105_1)
	local var_105_1 = HXSet.autoHxShiftPath(var_105_0, nil, true)

	return checkABExist(var_105_1), var_105_1
end

function var_0_0.ExistSpineRes(arg_106_0, arg_106_1)
	local var_106_0 = "SpinePainting/" .. string.lower(arg_106_1)
	local var_106_1 = HXSet.autoHxShiftPath(var_106_0, nil, true)

	return checkABExist(var_106_1), var_106_1
end

function var_0_0.RecordFlag(arg_107_0, arg_107_1)
	local var_107_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_107_0, arg_107_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_107_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_107_1)
end

function var_0_0.FlushPrice(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_108_1 = arg_108_1.type == Goods.TYPE_ACTIVITY or arg_108_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_108_0 then
		if arg_108_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_108_0:UpdateExperiencePrice4Item(arg_108_1)
		else
			arg_108_0:UpdateExperiencePrice(arg_108_1)
		end
	elseif arg_108_0.isPreviewFurniture then
		arg_108_0:UpdateFurniturePrice(arg_108_1)
	elseif var_108_1 then
		-- block empty
	else
		arg_108_0:UpdateCommodityPrice(arg_108_1)
	end

	local var_108_2 = arg_108_1.type == Goods.TYPE_SKIN

	setActive(arg_108_0.price:Find("timeLimit"), var_108_0 and not var_108_1)
	setActive(arg_108_0.price:Find("normal/consume"), var_108_2 and not var_108_0 and not var_108_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_1:getConfig("resource_num")
	local var_109_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_109_2 = _.detect(var_109_1, function(arg_110_0)
		return arg_110_0:CanUseForShop(arg_109_1.id)
	end)
	local var_109_3 = var_109_2 and var_109_2.count or 0
	local var_109_4 = (var_109_3 < var_109_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_109_3 .. (var_109_3 < var_109_0 and "</color>" or "")

	setText(arg_109_0.price:Find("timeLimit/consume/Text"), var_109_4 .. "/" .. var_109_0)
end

function var_0_0.UpdateExperiencePrice(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1:getConfig("resource_num")
	local var_111_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_111_2 = (var_111_1 < var_111_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_111_1 .. (var_111_1 < var_111_0 and "</color>" or "")

	setText(arg_111_0.price:Find("timeLimit/consume/Text"), var_111_2 .. "/" .. var_111_0)
end

function var_0_0.UpdateCommodityPrice(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_1:GetPrice()
	local var_112_1 = arg_112_1:getConfig("resource_num")

	setText(arg_112_0.price:Find("normal/consume/Text"), var_112_0)
	setText(arg_112_0.price:Find("normal/consume/originalprice/Text"), var_112_1)
	setActive(arg_112_0.price:Find("normal/consume/originalprice"), var_112_0 ~= var_112_1)
end

function var_0_0.UpdateFurniturePrice(arg_113_0, arg_113_1)
	local var_113_0 = Goods.Id2FurnitureId(arg_113_1.id)
	local var_113_1 = Furniture.New({
		id = var_113_0
	})
	local var_113_2 = var_113_1:getConfig("gem_price")

	setText(arg_113_0.price:Find("normal/consume/originalprice/Text"), var_113_2)

	local var_113_3 = var_113_1:getPrice(PlayerConst.ResDiamond)

	setText(arg_113_0.price:Find("normal/consume/Text"), var_113_3)
	setActive(arg_113_0.price:Find("normal/consume/originalprice"), var_113_2 ~= var_113_3)
end

local function var_0_25(arg_114_0, arg_114_1)
	if arg_114_0 == var_0_6 or arg_114_0 == var_0_9 or arg_114_0 == var_0_8 then
		return false
	end

	local var_114_0 = arg_114_1:getSkinId()

	return getProxy(ShopsProxy):CanPurchasedByCharge(var_114_0)
end

function var_0_0.UpdateChargeView(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = arg_115_1 == var_0_4
	local var_115_1 = arg_115_0.btnsList[2]

	setActive(var_115_1:Find("buy_charge"), not var_115_0)

	local var_115_2 = pg.pay_data_display[arg_115_3]

	assert(var_115_2, "pay_data_display>>>>>>>>>>>>>" .. arg_115_3)

	local var_115_3 = GetMoneySymbol() .. GetChargePrice(var_115_2.money)

	setText(arg_115_0.btnsList[2]:Find("buy_charge/value"), var_115_3)

	local var_115_4 = var_115_1.parent:Find("consume")
	local var_115_5 = var_115_1.parent:Find("rmb")

	setText(var_115_5:Find("Text"), var_115_3)
	setActive(var_115_5:Find("originalprice"), var_115_2.cash_show > var_115_2.money)
	setText(var_115_5:Find("originalprice/Text"), GetChargePrice(var_115_2.cash_show))

	local var_115_6 = arg_115_2:GetPrice()
	local var_115_7 = arg_115_2:getConfig("resource_num")

	setActive(var_115_4:Find("originalprice"), var_115_6 ~= var_115_7)
	setText(var_115_4:Find("Text"), var_115_6)
	setText(var_115_4:Find("originalprice/Text"), var_115_7)
end

function var_0_0.FlushObtainBtn(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_0:GetObtainBtnState(arg_116_1)
	local var_116_1 = var_0_19(var_116_0)
	local var_116_2, var_116_3 = var_0_25(var_116_0, arg_116_1)

	setActive(arg_116_0.btnsList[1].parent, not var_116_2)
	setActive(arg_116_0.btnsList[2].parent, var_116_2)

	local var_116_4 = var_116_2 and arg_116_0.btnsList[2] or arg_116_0.btnsList[1]

	for iter_116_0 = 0, var_116_4.childCount - 1 do
		local var_116_5 = var_116_4:GetChild(iter_116_0)

		setActive(var_116_5, var_116_5.name == var_116_1)
	end

	if var_116_2 then
		arg_116_0:UpdateChargeView(var_116_0, arg_116_1, var_116_3)
	end

	setActive(arg_116_0.price:Find("btn_charge"), var_116_2 and var_116_0 ~= var_0_4)
	setActive(arg_116_0.price:Find("btn/item"), var_116_0 == var_0_11)
	setActive(arg_116_0.price:Find("btn/tag"), var_116_0 == var_0_11)

	if var_116_0 == var_0_11 then
		arg_116_0:FlushGift(arg_116_1)
	end

	onButton(arg_116_0, arg_116_0.price:Find("btn_charge"), function()
		if not var_116_2 then
			return
		end

		arg_116_0:OpenChargePanel(var_116_3)
	end, SFX_PANEL)
	onButton(arg_116_0, arg_116_0.price:Find("btn"), function()
		local var_118_0 = {}
		local var_118_1 = SkinCouponActivity.StaticEncoreActTip(arg_116_1.id)

		if tobool(var_118_1) then
			table.insert(var_118_0, function(arg_119_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						if var_118_1 and not var_118_1:isEnd() then
							arg_116_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_118_1.id)
						end
					end,
					onNo = arg_119_0
				})
			end)
		end

		if arg_116_1:getConfig("genre") == ShopArgs.SkinShop and not arg_116_1:IsItemDiscountType() and #SkinCouponActivity.GetOvercountEncoreActs(arg_116_1.id) > 0 then
			table.insert(var_118_0, function(arg_121_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Last_Coupon"),
					onYes = arg_121_0
				})
			end)
		end

		seriesAsync(var_118_0, function()
			if var_116_0 == var_0_5 or var_116_0 == var_0_7 or var_116_0 == var_0_11 then
				arg_116_0.purchaseView:ExecuteAction("Show", arg_116_1)
			else
				arg_116_0:OnClickBtn(var_116_0, arg_116_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.OpenChargePanel(arg_123_0, arg_123_1)
	local var_123_0 = Goods.Create({
		shop_id = arg_123_1
	}, Goods.TYPE_CHARGE)

	if ChargeConst.isNeedSetBirth() then
		arg_123_0:emit(LatestSkinShopMediator.OPEN_CHARGE_BIRTHDAY)
	else
		pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = var_123_0.id
		})
	end
end

function var_0_0.GetObtainBtnState(arg_124_0, arg_124_1)
	if arg_124_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_124_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_124_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_124_1.type == Goods.TYPE_ACTIVITY or arg_124_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_124_1.buyCount > 0 then
		return var_0_4
	elseif arg_124_1:isDisCount() and arg_124_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_124_1:CanUseVoucherType() or arg_124_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_124_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.FlushGift(arg_125_0, arg_125_1)
	local var_125_0 = arg_125_1:GetGiftList()[1]

	updateDrop(arg_125_0.price:Find("btn/item/mask/item"), {
		type = var_125_0.type,
		id = var_125_0.id,
		count = var_125_0.count
	})
end

function var_0_0.OnClickBtn(arg_126_0, arg_126_1, arg_126_2)
	if arg_126_1 == var_0_5 or arg_126_1 == var_0_7 or arg_126_1 == var_0_11 then
		arg_126_0:OnPurchase(arg_126_2)
	elseif arg_126_1 == var_0_10 then
		arg_126_0:OnItemPurchase(arg_126_2)
	elseif arg_126_1 == var_0_6 then
		arg_126_0:OnActivity(arg_126_2)
	elseif arg_126_1 == var_0_8 then
		arg_126_0:OnBackyard(arg_126_2)
	elseif arg_126_1 == var_0_9 then
		if arg_126_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_126_0:OnExperience4Item(arg_126_2)
		else
			arg_126_0:OnExperience(arg_126_2)
		end
	end
end

function var_0_0.FlushGifgPackBtn(arg_127_0, arg_127_1)
	local var_127_0 = false
	local var_127_1
	local var_127_2
	local var_127_3

	for iter_127_0, iter_127_1 in pairs(arg_127_0.giftSkinCommodities) do
		for iter_127_2, iter_127_3 in ipairs(iter_127_1) do
			if iter_127_3.id == arg_127_1.id then
				var_127_0 = true

				break
			end
		end

		if var_127_0 then
			var_127_1 = arg_127_0.giftPackCommodities[iter_127_0]
			var_127_2 = arg_127_0.giftSkinCommodities[iter_127_0]
			var_127_3 = arg_127_0.giftSkinProbabilitys[iter_127_0]

			break
		end
	end

	if var_127_0 then
		setText(arg_127_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip_2"))
		onButton(arg_127_0, arg_127_0.giftPackBtn, function()
			if not var_127_1:isChargeType() then
				return
			end

			local var_128_0 = var_127_1:GetSkinProbability()
			local var_128_1 = getProxy(ShipSkinProxy):GetProbabilitySkins(var_128_0)

			if #var_128_0 <= 0 or #var_128_0 ~= #var_128_1 then
				arg_127_0:emit(LatestSkinShopMediator.OPEN_SCENE, {
					SCENE.CHARGE,
					{
						wrap = ChargeScene.TYPE_PICK
					}
				})
			else
				arg_127_0:emit(LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER, var_127_1, var_127_2, var_127_3)
			end
		end, SFX_PANEL)
	else
		var_127_0 = getProxy(ActivityProxy):GetFakeGiftPackActivity(arg_127_1)

		if var_127_0 then
			setText(arg_127_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip"))
			onButton(arg_127_0, arg_127_0.giftPackBtn, function()
				arg_127_0:emit(LatestSkinShopMediator.OPEN_GIFT_ACT_LAYER, var_127_0.id)
			end, SFX_PANEL)
		end
	end

	setActive(arg_127_0.giftPackBtn, var_127_0)
end

function var_0_0.SetGiftPackLayer(arg_130_0)
	return
end

function var_0_0.OnPurchase(arg_131_0, arg_131_1)
	if arg_131_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_131_1:isDisCount() and arg_131_1:IsItemDiscountType() then
		arg_131_0:emit(LatestSkinShopMediator.ON_SHOPPING_BY_ACT, arg_131_1.id, 1)
	else
		arg_131_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_131_1.id, 1)
	end
end

function var_0_0.OnItemPurchase(arg_132_0, arg_132_1)
	if arg_132_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_132_0 = arg_132_1:GetVoucherIdList()
	local var_132_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_132_1.id)

	if #var_132_0 <= 0 and #var_132_1 <= 0 then
		return
	end

	local var_132_2 = {}

	for iter_132_0, iter_132_1 in ipairs(var_132_0) do
		table.insert(var_132_2, iter_132_1)
	end

	for iter_132_2, iter_132_3 in ipairs(var_132_1) do
		table.insert(var_132_2, iter_132_3.id)
	end

	local var_132_3 = arg_132_0.skinId
	local var_132_4 = pg.ship_skin_template[var_132_3]
	local var_132_5 = SwitchSpecialChar(var_132_4.name, true)

	arg_132_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_132_2,
		skinId = var_132_3,
		skinName = var_132_5,
		price = arg_132_1:GetPrice(),
		onYes = function(arg_133_0)
			if arg_133_0 then
				arg_132_0:emit(LatestSkinShopMediator.ON_ITEM_PURCHASE, arg_133_0, arg_132_1.id)
			else
				arg_132_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_132_1.id, 1)
			end
		end
	})
end

function var_0_0.OnActivity(arg_134_0, arg_134_1)
	local var_134_0 = arg_134_1:getConfig("time")
	local var_134_1 = arg_134_1:getConfig("activity")
	local var_134_2 = getProxy(ActivityProxy):getActivityById(var_134_1)

	if var_134_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_134_0) or var_134_2 and not var_134_2:isEnd() then
		if arg_134_1.type == Goods.TYPE_ACTIVITY then
			arg_134_0:emit(LatestSkinShopMediator.GO_SHOPS_LAYER, arg_134_1:getConfig("activity"))
		elseif arg_134_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_134_3 = arg_134_1:getConfig("scene")

			if var_134_3 and #var_134_3 > 0 then
				arg_134_0:emit(LatestSkinShopMediator.OPEN_SCENE, var_134_3)
			else
				arg_134_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_134_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_135_0, arg_135_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_135_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_135_0.name, var_135_0.level))

		return
	end

	arg_135_0:emit(LatestSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_136_0, arg_136_1)
	local var_136_0 = arg_136_0.skinId
	local var_136_1 = getProxy(ShipSkinProxy):getSkinById(var_136_0)

	if var_136_1 and not var_136_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_136_2 = arg_136_1:getConfig("resource_num")
	local var_136_3 = arg_136_1:getConfig("time_second") * var_136_2
	local var_136_4, var_136_5, var_136_6, var_136_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_136_3)
	local var_136_8 = pg.ship_skin_template[arg_136_0.skinId].name

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_136_2, var_136_8, var_136_4, var_136_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_136_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_136_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_136_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_138_0, arg_138_1)
	local var_138_0 = arg_138_0.skinId
	local var_138_1 = getProxy(ShipSkinProxy):getSkinById(var_138_0)

	if var_138_1 and not var_138_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_138_2 = arg_138_1:getConfig("resource_num")
	local var_138_3 = arg_138_1:getConfig("time_second") * var_138_2
	local var_138_4, var_138_5, var_138_6, var_138_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_138_3)
	local var_138_8 = pg.ship_skin_template[arg_138_0.skinId].name
	local var_138_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_138_10 = _.detect(var_138_9, function(arg_139_0)
		return arg_139_0:CanUseForShop(arg_138_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_138_2, var_138_8, var_138_4, var_138_5),
		onYes = function()
			if not var_138_10 or var_138_10.count < var_138_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_138_0:emit(LatestSkinShopMediator.ON_ITEM_EXPERIENCE, var_138_10.id, arg_138_1.id, 1)
		end
	})
end

function var_0_0.SetFilterPanel(arg_141_0)
	local var_141_0 = arg_141_0.filterContent:Find("own/options")
	local var_141_1 = arg_141_0.filterContent:Find("type/options")
	local var_141_2 = arg_141_0.filterContent:Find("shipHave/options")
	local var_141_3 = arg_141_0.filterContent:Find("camp/options")
	local var_141_4 = arg_141_0.filterContent:Find("rarity/options")
	local var_141_5 = arg_141_0.filterContent:Find("shipType/options")
	local var_141_6 = arg_141_0.filterContent:Find("themeType/options")
	local var_141_7 = arg_141_0.filterContent:Find("tag/options")

	arg_141_0:SetOptionList(var_141_3, ShipIndexConst.CampNames, true)
	arg_141_0:SetOptionList(var_141_4, ShipIndexConst.RarityNames, true)
	arg_141_0:SetOptionList(var_141_5, ShipIndexConst.TypeNames, true)
	arg_141_0:SetOptionList(var_141_6, arg_141_0.classifyNames)
	arg_141_0:SetSingleOptions(var_141_0, "ownType")
	arg_141_0:SetMultiOptions(var_141_1, "typeType")
	arg_141_0:SetSingleOptions(var_141_2, "shipHaveType")
	arg_141_0:SetMultiOptions(var_141_3, "campType")
	arg_141_0:SetMultiOptions(var_141_4, "rarityType")
	arg_141_0:SetMultiOptions(var_141_5, "shipType")
	arg_141_0:SetMultiOptions(var_141_6, "themeType")
	arg_141_0:SetMultiOptions(var_141_7, "tagType")
	arg_141_0:HideEmptyOptions()
	onButton(arg_141_0, arg_141_0.filterUI:Find("bg"), function()
		for iter_142_0, iter_142_1 in pairs(arg_141_0.filterValues) do
			arg_141_0.filterValuesTemp[iter_142_0] = Clone(arg_141_0.filterValues[iter_142_0])
		end

		setActive(arg_141_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_141_0, arg_141_0.filterUI:Find("panelMask/panel/closeBtn"), function()
		for iter_143_0, iter_143_1 in pairs(arg_141_0.filterValues) do
			arg_141_0.filterValuesTemp[iter_143_0] = Clone(arg_141_0.filterValues[iter_143_0])
		end

		setActive(arg_141_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_141_0, arg_141_0.filterUI:Find("panelMask/panel/bottom/ok"), function()
		for iter_144_0, iter_144_1 in pairs(arg_141_0.filterValues) do
			arg_141_0.filterValues[iter_144_0] = Clone(arg_141_0.filterValuesTemp[iter_144_0])
		end

		setActive(arg_141_0.filterUI, false)
		arg_141_0:Refresh(true)
	end, SFX_PANEL)
end

function var_0_0.OpenFilterPanel(arg_145_0)
	setActive(arg_145_0.filterUI, true)

	local var_145_0 = arg_145_0.filterContent:Find("own/options")
	local var_145_1 = arg_145_0.filterContent:Find("type/options")
	local var_145_2 = arg_145_0.filterContent:Find("shipHave/options")
	local var_145_3 = arg_145_0.filterContent:Find("camp/options")
	local var_145_4 = arg_145_0.filterContent:Find("rarity/options")
	local var_145_5 = arg_145_0.filterContent:Find("shipType/options")
	local var_145_6 = arg_145_0.filterContent:Find("themeType/options")
	local var_145_7 = arg_145_0.filterContent:Find("tag/options")

	arg_145_0:SetSingleOptions(var_145_0, "ownType", true)
	arg_145_0:SetMultiOptions(var_145_1, "typeType", true)
	arg_145_0:SetSingleOptions(var_145_2, "shipHaveType", true)
	arg_145_0:SetMultiOptions(var_145_3, "campType", true)
	arg_145_0:SetMultiOptions(var_145_4, "rarityType", true)
	arg_145_0:SetMultiOptions(var_145_5, "shipType", true)
	arg_145_0:SetMultiOptions(var_145_6, "themeType", true)
	arg_145_0:SetMultiOptions(var_145_7, "tagType", true)
end

function var_0_0.SetOptionList(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	local var_146_0 = UIItemList.New(arg_146_1, arg_146_1:GetChild(0))

	var_146_0:make(function(arg_147_0, arg_147_1, arg_147_2)
		if arg_147_0 == UIItemList.EventUpdate then
			local var_147_0 = arg_146_2[arg_147_1 + 1]

			if arg_146_3 then
				var_147_0 = i18n(var_147_0)
			end

			arg_147_2.name = arg_147_1

			setScrollText(arg_147_2:Find("mask/Text"), var_147_0)
		end
	end)
	var_146_0:align(#arg_146_2)
end

function var_0_0.SetSingleOptions(arg_148_0, arg_148_1, arg_148_2, arg_148_3)
	for iter_148_0 = 0, arg_148_1.childCount - 1 do
		local var_148_0 = arg_148_1:GetChild(iter_148_0)

		arg_148_0:SetOptionSelect(arg_148_1:GetChild(iter_148_0), iter_148_0 == arg_148_0.filterValuesTemp[arg_148_2])

		if not arg_148_3 then
			onButton(arg_148_0, var_148_0, function()
				arg_148_0.filterValuesTemp[arg_148_2] = iter_148_0

				for iter_149_0 = 0, arg_148_1.childCount - 1 do
					arg_148_0:SetOptionSelect(arg_148_1:GetChild(iter_149_0), iter_149_0 == iter_148_0)
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetMultiOptions(arg_150_0, arg_150_1, arg_150_2, arg_150_3)
	for iter_150_0 = 0, arg_150_1.childCount - 1 do
		local var_150_0 = arg_150_1:GetChild(iter_150_0)

		arg_150_0:SetOptionSelect(arg_150_1:GetChild(iter_150_0), table.contains(arg_150_0.filterValuesTemp[arg_150_2], iter_150_0))

		if not arg_150_3 then
			onButton(arg_150_0, var_150_0, function()
				if iter_150_0 == 0 then
					arg_150_0.filterValuesTemp[arg_150_2] = {
						0
					}

					for iter_151_0 = 0, arg_150_1.childCount - 1 do
						arg_150_0:SetOptionSelect(arg_150_1:GetChild(iter_151_0), iter_151_0 == 0)
					end
				else
					table.removebyvalue(arg_150_0.filterValuesTemp[arg_150_2], 0)

					if table.contains(arg_150_0.filterValuesTemp[arg_150_2], iter_150_0) then
						table.removebyvalue(arg_150_0.filterValuesTemp[arg_150_2], iter_150_0)
					else
						table.insert(arg_150_0.filterValuesTemp[arg_150_2], iter_150_0)
					end

					local var_151_0 = true

					for iter_151_1 = 1, arg_150_1.childCount - 1 do
						if not table.contains(arg_150_0.filterValuesTemp[arg_150_2], iter_151_1) and arg_150_1:GetChild(iter_151_1).gameObject.activeSelf then
							var_151_0 = false

							break
						end
					end

					if #arg_150_0.filterValuesTemp[arg_150_2] == 0 then
						var_151_0 = true
					end

					if var_151_0 and arg_150_2 ~= "tagType" then
						arg_150_0.filterValuesTemp[arg_150_2] = {
							0
						}
					end

					for iter_151_2 = 0, arg_150_1.childCount - 1 do
						arg_150_0:SetOptionSelect(arg_150_1:GetChild(iter_151_2), table.contains(arg_150_0.filterValuesTemp[arg_150_2], iter_151_2))
					end
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetOptionSelect(arg_152_0, arg_152_1, arg_152_2)
	setActive(arg_152_1:Find("selectedFrame"), arg_152_2)

	local var_152_0

	if IsNil(arg_152_1:Find("Text")) then
		var_152_0 = arg_152_1:Find("mask/Text"):GetComponent(typeof(Text))
	else
		var_152_0 = arg_152_1:Find("Text"):GetComponent(typeof(Text))
	end

	if arg_152_2 then
		var_152_0.color = Color.New(1, 1, 1, 1)
	else
		var_152_0.color = Color.New(0, 0, 0, 0.5)
	end
end

function var_0_0.HideEmptyOptions(arg_153_0, arg_153_1, arg_153_2)
	local var_153_0 = {
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

	for iter_153_0, iter_153_1 in ipairs(arg_153_0.commodities) do
		local var_153_1 = iter_153_1:getSkinId()
		local var_153_2 = ShipSkin.New({
			id = var_153_1
		})
		local var_153_3 = arg_153_0:GetSkinType(var_153_2)

		for iter_153_2, iter_153_3 in ipairs(var_153_3) do
			if not table.keyof(var_153_0.typeType, iter_153_3) then
				table.insert(var_153_0.typeType, iter_153_3)
			end
		end

		local var_153_4 = arg_153_0:GetShipHave(var_153_2)

		if not table.keyof(var_153_0.shipHaveType, var_153_4) then
			table.insert(var_153_0.shipHaveType, var_153_4)
		end

		local var_153_5 = arg_153_0:GetCampType(var_153_2)

		if not table.keyof(var_153_0.campType, var_153_5) then
			table.insert(var_153_0.campType, var_153_5)
		end

		local var_153_6 = arg_153_0:GetRarityType(var_153_2)

		if not table.keyof(var_153_0.rarityType, var_153_6) then
			table.insert(var_153_0.rarityType, var_153_6)
		end

		local var_153_7 = arg_153_0:GetShipType(var_153_2)

		if not table.keyof(var_153_0.shipType, var_153_7) then
			table.insert(var_153_0.shipType, var_153_7)
		end

		local var_153_8 = arg_153_0:GetTagType(iter_153_1)

		if not table.keyof(var_153_0.tagType, var_153_8) then
			table.insert(var_153_0.tagType, var_153_8)
		end
	end

	for iter_153_4, iter_153_5 in pairs(var_153_0) do
		table.sort(iter_153_5, function(arg_154_0, arg_154_1)
			return arg_154_0 < arg_154_1
		end)
	end

	for iter_153_6 = 1, arg_153_0.uiTypeOptions.childCount - 1 do
		setActive(arg_153_0.uiTypeOptions:GetChild(iter_153_6), table.contains(var_153_0.typeType, iter_153_6))
	end

	for iter_153_7 = 1, arg_153_0.uiShipHaveOptions.childCount - 1 do
		setActive(arg_153_0.uiShipHaveOptions:GetChild(iter_153_7), table.contains(var_153_0.shipHaveType, iter_153_7))
	end

	for iter_153_8 = 1, arg_153_0.uiCampOptions.childCount - 1 do
		setActive(arg_153_0.uiCampOptions:GetChild(iter_153_8), table.contains(var_153_0.campType, iter_153_8))
	end

	for iter_153_9 = 1, arg_153_0.uiRrarityOptions.childCount - 1 do
		setActive(arg_153_0.uiRrarityOptions:GetChild(iter_153_9), table.contains(var_153_0.rarityType, iter_153_9))
	end

	for iter_153_10 = 1, arg_153_0.uiShipTypeOptions.childCount - 1 do
		setActive(arg_153_0.uiShipTypeOptions:GetChild(iter_153_10), table.contains(var_153_0.shipType, iter_153_10))
	end

	for iter_153_11 = 1, arg_153_0.uiTagTypeOptions.childCount - 1 do
		setActive(arg_153_0.uiTagTypeOptions:GetChild(iter_153_11), table.contains(var_153_0.tagType, iter_153_11))
	end
end

function var_0_0.GetSkinType(arg_155_0, arg_155_1)
	local var_155_0 = {}

	if arg_155_1:IsLive2d() or arg_155_1:IsLive2dPlus() then
		table.insert(var_155_0, 1)
	end

	if not arg_155_1:IsLive2d() and not arg_155_1:IsLive2dPlus() and not arg_155_1:IsSpine() and not arg_155_1:IsSpinePlus() then
		table.insert(var_155_0, 2)
	end

	if arg_155_1:IsSpine() or arg_155_1:IsSpinePlus() then
		table.insert(var_155_0, 3)
	end

	if arg_155_1:IsBG() then
		table.insert(var_155_0, 4)
	end

	if arg_155_1:IsDbg() then
		table.insert(var_155_0, 5)
	end

	if arg_155_1:isBgm() then
		table.insert(var_155_0, 6)
	end

	return var_155_0
end

function var_0_0.GetShipHave(arg_156_0, arg_156_1)
	if arg_156_1:CantUse() then
		return 2
	else
		return 1
	end
end

function var_0_0.GetCampType(arg_157_0, arg_157_1)
	local var_157_0 = arg_157_1:GetDefaultShipConfig()

	if not var_157_0 then
		return 0
	end

	local var_157_1 = arg_157_0:ToVShip(var_157_0):getNation()
	local var_157_2 = ShipIndexCfg.camp

	for iter_157_0, iter_157_1 in ipairs(var_157_2) do
		for iter_157_2, iter_157_3 in ipairs(iter_157_1.types) do
			if iter_157_3 == Nation.LINK then
				if var_157_1 >= Nation.LINK then
					return iter_157_0 - 1
				end
			elseif var_157_1 == iter_157_3 then
				return iter_157_0 - 1
			end
		end
	end

	return 0
end

function var_0_0.GetRarityType(arg_158_0, arg_158_1)
	local var_158_0 = arg_158_1:GetDefaultShipConfig()

	if not var_158_0 then
		return 0
	end

	local var_158_1 = arg_158_0:ToVShip(var_158_0):getRarity()
	local var_158_2 = ShipIndexCfg.rarity

	for iter_158_0, iter_158_1 in ipairs(var_158_2) do
		if table.contains(iter_158_1.types, var_158_1) then
			return iter_158_0 - 1
		end
	end

	return 0
end

function var_0_0.GetShipType(arg_159_0, arg_159_1)
	local var_159_0 = arg_159_1:GetDefaultShipConfig()

	if not var_159_0 then
		return 0
	end

	local var_159_1 = arg_159_0:ToVShip(var_159_0):getShipType()
	local var_159_2 = ShipIndexCfg.type

	for iter_159_0, iter_159_1 in ipairs(var_159_2) do
		for iter_159_2, iter_159_3 in pairs(iter_159_1) do
			if table.keyof(iter_159_3, var_159_1) then
				return iter_159_0 - 1
			end
		end
	end

	return 0
end

function var_0_0.GetTagType(arg_160_0, arg_160_1)
	local var_160_0 = table.contains(arg_160_0.returnSkins, arg_160_1.id)
	local var_160_1 = NewShopSkinCard.GetTagId(arg_160_1, var_160_0)

	if var_160_1 > 0 then
		return var_160_1
	else
		return 0
	end
end

function var_0_0.GetSkinClassify(arg_161_0)
	arg_161_0.classifyIds = {}
	arg_161_0.classifyNames = {}

	local var_161_0 = {}
	local var_161_1 = {}

	for iter_161_0, iter_161_1 in ipairs(arg_161_0.commodities) do
		local var_161_2 = arg_161_0:GetShopTypeIdBySkinId(iter_161_1:getSkinId())
		local var_161_3 = var_161_2 == 0 and var_0_16 or var_161_2

		var_161_1[var_161_3] = (var_161_1[var_161_3] or 0) + 1
	end

	local var_161_4 = {}

	for iter_161_2, iter_161_3 in ipairs(arg_161_0.returnSkins) do
		var_161_4[iter_161_3] = true
	end

	if underscore.any(arg_161_0.commodities, function(arg_162_0)
		return var_161_4[arg_162_0.id]
	end) then
		table.insert(var_161_0, var_0_14)
	end

	for iter_161_4, iter_161_5 in ipairs(pg.skin_page_template.all) do
		if iter_161_5 ~= var_0_17 and iter_161_5 ~= var_0_18 and (var_161_1[iter_161_5] or 0) > 0 then
			table.insert(var_161_0, iter_161_5)
		end
	end

	if arg_161_0.mode == var_0_0.MODE_EXPERIENCE then
		table.insert(var_161_0, 1, var_0_13)
	end

	if arg_161_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_161_0, 1, var_0_15)
	end

	table.insert(var_161_0, 1, var_0_12)

	arg_161_0.classifyIds = var_161_0

	for iter_161_6, iter_161_7 in ipairs(arg_161_0.classifyIds) do
		if iter_161_7 == var_0_12 then
			table.insert(arg_161_0.classifyNames, i18n("shop_filter_all"))
		elseif iter_161_7 == var_0_13 or iter_161_7 == var_0_15 then
			table.insert(arg_161_0.classifyNames, i18n("shop_filter_trial"))
		elseif iter_161_7 == var_0_14 then
			table.insert(arg_161_0.classifyNames, i18n("shop_filter_retro"))
		else
			table.insert(arg_161_0.classifyNames, pg.skin_page_template[iter_161_7].name)
		end
	end
end

function var_0_0.GetShopTypeIdBySkinId(arg_163_0, arg_163_1)
	local var_163_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not arg_163_0.shopTypeIdList then
		arg_163_0.shopTypeIdList = {}
	end

	if arg_163_0.shopTypeIdList[arg_163_1] then
		return arg_163_0.shopTypeIdList[arg_163_1]
	end

	for iter_163_0, iter_163_1 in pairs(var_163_0) do
		for iter_163_2, iter_163_3 in ipairs(iter_163_1) do
			arg_163_0.shopTypeIdList[iter_163_3] = iter_163_0

			if iter_163_3 == arg_163_1 then
				return iter_163_0
			end
		end
	end
end

function var_0_0.OnShopping(arg_164_0, arg_164_1)
	if not arg_164_0.showingCommodity then
		return
	end

	if arg_164_0.purchaseView and arg_164_0.purchaseView:GetLoaded() then
		arg_164_0.purchaseView:Hide()
	end

	if arg_164_0.showingCommodity.id == arg_164_1 then
		arg_164_0.pendingSelectId = arg_164_0:GetNextCommodityIndex(arg_164_1)

		arg_164_0:GetAllCommodities()
		arg_164_0:Refresh(false)
	end
end

function var_0_0.OnFurnitureUpdate(arg_165_0, arg_165_1)
	if not arg_165_0.showingCommodity then
		return
	end

	local var_165_0 = arg_165_0.showingCommodity.id

	if Goods.ExistFurniture(var_165_0) and Goods.Id2FurnitureId(var_165_0) == arg_165_1 then
		arg_165_0:GetAllCommodities()
		arg_165_0:Refresh(true)
	end
end

function var_0_0.CheckDownloadSkinList(arg_166_0, arg_166_1)
	local var_166_0 = {}

	for iter_166_0, iter_166_1 in ipairs(arg_166_0.commodities) do
		PaintingGroupConst.AddPaintingNameBySkinID(var_166_0, iter_166_1:getSkinId())
	end

	local var_166_1 = {
		showMask = true,
		isShowBox = true,
		paintingNameList = var_166_0,
		finishFunc = arg_166_1
	}

	PaintingGroupConst.PaintingDownload(var_166_1)
end

function var_0_0.willExit(arg_167_0)
	arg_167_0:ClearCards()

	arg_167_0.spriteCache = nil

	ClearLScrollrect(arg_167_0.scrollrect)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_167_0:getUIName())

	if arg_167_0.live2dChar then
		arg_167_0.live2dChar:Dispose()

		arg_167_0.live2dChar = nil
	end

	if arg_167_0.voucherMsgBox then
		arg_167_0.voucherMsgBox:Destroy()

		arg_167_0.voucherMsgBox = nil
	end

	if arg_167_0.purchaseView then
		arg_167_0.purchaseView:Destroy()

		arg_167_0.purchaseView = nil
	end

	for iter_167_0, iter_167_1 in pairs(arg_167_0.downloads) do
		iter_167_1:Dispose()
	end

	arg_167_0.downloads = {}

	arg_167_0:ClearPainting()

	if arg_167_0.interactionPreview then
		arg_167_0.interactionPreview:Dispose()

		arg_167_0.interactionPreview = nil
	end

	arg_167_0:disposeEvent()
	arg_167_0:ClearTimer()
	arg_167_0:ReturnChar()
	arg_167_0:UnOverlay()
end

function var_0_0.GetNextCommodityIndex(arg_168_0, arg_168_1)
	for iter_168_0, iter_168_1 in ipairs(arg_168_0.displays) do
		if iter_168_1.id == arg_168_1 then
			if iter_168_0 == #arg_168_0.displays then
				return arg_168_1
			end

			return arg_168_0.displays[iter_168_0 + 1].id
		end
	end
end

function var_0_0.onBackPressed(arg_169_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

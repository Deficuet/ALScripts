local var_0_0 = class("LatestSkinShopLayer", import("...base.BaseUI"))

var_0_0.TYPE_NEW_SKIN = "newSkin"
var_0_0.TYPE_PERMANANT_SKIN = "permanentSkin"
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

local function var_0_19(arg_1_0)
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

	return var_0_0.obtainBtnSpriteNames[arg_1_0]
end

function var_0_0.getUIName(arg_2_0)
	return "LatestSkinShopUI"
end

function var_0_0.init(arg_3_0)
	arg_3_0.bgs = arg_3_0._tf:Find("bgs")
	arg_3_0.adapt = arg_3_0._tf:Find("adapt")
	arg_3_0.top = arg_3_0.adapt:Find("top")
	arg_3_0.bottom = arg_3_0.adapt:Find("bottom")
	arg_3_0.right = arg_3_0.adapt:Find("right")
	arg_3_0.subPage = arg_3_0.adapt:Find("subPage")
	arg_3_0.resources = arg_3_0.adapt:Find("top/resources")
	arg_3_0.limitTime = arg_3_0.adapt:Find("top/title/limit_time/Text")
	arg_3_0.skinName = arg_3_0.adapt:Find("top/title/skin_name_mask/skin_name")
	arg_3_0.shipName = arg_3_0.adapt:Find("top/title/name_mask/name")
	arg_3_0.changeSkin = arg_3_0.adapt:Find("top/change_skin")
	arg_3_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_3_0.changeSkin, "toggle_ui"))
	arg_3_0.showOwnBtn = arg_3_0.adapt:Find("bottom/showOwnBtn")
	arg_3_0.filterBtn = arg_3_0.adapt:Find("bottom/filterBtn")
	arg_3_0.search = arg_3_0.adapt:Find("bottom/search")
	arg_3_0.scrollrect = arg_3_0.adapt:Find("bottom/scroll/content"):GetComponent("LScrollRect")
	arg_3_0.sdTg = arg_3_0.adapt:Find("right/sdTg")
	arg_3_0.hideUITg = arg_3_0.adapt:Find("right/hideUITg")
	arg_3_0.charContainer = arg_3_0.adapt:Find("right/char_container")
	arg_3_0.backChara = arg_3_0.charContainer:Find("bg/back/chara")
	arg_3_0.charTf = arg_3_0.charContainer:Find("char")
	arg_3_0.furnitureContainer = arg_3_0.charContainer:Find("fur")
	arg_3_0.switchPreviewBtn = arg_3_0.charContainer:Find("switch")
	arg_3_0.dynamicToggle = arg_3_0.adapt:Find("right/functionsAndTags/dynamic")
	arg_3_0.showBgToggle = arg_3_0.adapt:Find("right/functionsAndTags/showBg")
	arg_3_0.dynamicResToggle = arg_3_0.adapt:Find("right/functionsAndTags/dynamic/l2d_res_state")
	arg_3_0.tagList = UIItemList.New(arg_3_0.adapt:Find("right/functionsAndTags/tags"), arg_3_0.adapt:Find("right/functionsAndTags/tags/tag"))
	arg_3_0.giftPackBtn = arg_3_0.adapt:Find("right/giftPackBtn")
	arg_3_0.price = arg_3_0.adapt:Find("right/price")
	arg_3_0.btns = arg_3_0.price:Find("btns")
	arg_3_0.filterUI = arg_3_0.adapt:Find("subPage/filterUI")
	arg_3_0.filterContent = arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content")
	arg_3_0.painting = arg_3_0._tf:Find("painting")
	arg_3_0.paintingTF = arg_3_0._tf:Find("painting/paint")
	arg_3_0.defaultPaintingPosition = arg_3_0.paintingTF.anchoredPosition
	arg_3_0.defaultPaintingScale = arg_3_0.paintingTF.localScale
	arg_3_0.live2dContainer = arg_3_0._tf:Find("painting/paint/live2d")
	arg_3_0.spTF = arg_3_0._tf:Find("painting/paint/spinePainting")
	arg_3_0.spBg = arg_3_0._tf:Find("painting/paintBg/spinePainting")

	setActive(arg_3_0.charContainer, false)
	setActive(arg_3_0.filterUI, false)

	arg_3_0.mainTitle = arg_3_0.adapt:Find("top/mainTitle")
	arg_3_0.backBtn = arg_3_0.adapt:Find("top/closeBtn")
	arg_3_0.homeBtn = arg_3_0.adapt:Find("top/homeBtn")
	arg_3_0.giftPack = arg_3_0.adapt:Find("giftPack")

	setActive(arg_3_0.mainTitle, false)
	setActive(arg_3_0.backBtn, false)
	setActive(arg_3_0.homeBtn, false)
	setActive(arg_3_0.giftPack, false)

	arg_3_0.downloads = {}
	arg_3_0.isToggleDynamic = false
	arg_3_0.isToggleShowBg = true
	arg_3_0.isPreviewFurniture = false
	arg_3_0.interactionPreview = BackYardInteractionPreview.New(arg_3_0.furnitureContainer, Vector3(0, 0, 0))
	arg_3_0.voucherMsgBox = SkinVoucherMsgBox.New(pg.UIMgr.GetInstance().OverlayMain)
	arg_3_0.purchaseView = NewSkinShopPurchaseView.New(arg_3_0._tf, arg_3_0.event)

	arg_3_0:RegisterEvent()
	setGray(arg_3_0.btns:Find("yigoumai_button"), true, true)
	setText(arg_3_0._tf:Find("bgs/empty/Text"), i18n("shop_new_unfound"))
	setText(arg_3_0.adapt:Find("top/mainTitle/Text"), i18n("shop_new_shop"))
	setText(arg_3_0.filterBtn:Find("Text"), i18n("shop_new_sort"))
	setText(arg_3_0.search:Find("holder"), i18n("shop_new_search"))
	setText(arg_3_0.btns:Find("yigoumai_button/Text"), i18n("shop_new_purchased"))
	setText(arg_3_0.btns:Find("goumai_button/Text"), i18n("shop_new_purchase"))
	setText(arg_3_0.btns:Find("qianwanghuoqu_button/Text"), i18n("shop_new_claim"))
	setText(arg_3_0.btns:Find("furniture_shop/Text"), i18n("shop_new_furniture"))
	setText(arg_3_0.btns:Find("item_buy/Text"), i18n("shop_new_discount"))
	setText(arg_3_0.btns:Find("tiyan_btn/Text"), i18n("shop_new_try"))
	setText(arg_3_0.btns:Find("buy_with_gift/Text"), i18n("shop_new_purchase"))
	setText(arg_3_0.price:Find("btn/tag/Text"), i18n("shop_new_gift"))
	setText(arg_3_0.giftPack:Find("panel/desc"), i18n("shop_new_gem_transform"))
	setText(arg_3_0.giftPack:Find("price/btns/yigoumai_button/Text"), i18n("shop_new_purchased"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/title"), i18n("shop_new_sort"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/subTitleFrame/subTitle"), i18n("shop_new_review"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/0/Text"), i18n("shop_new_all"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/1/Text"), i18n("shop_new_owned"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/2/Text"), i18n("shop_new_havent_own"))
	setScrollText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/3/mask/Text"), i18n("shop_new_unused"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle"), i18n("shop_new_type"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/0/Text"), i18n("shop_new_all"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/2/Text"), i18n("shop_new_static"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/3/Text"), i18n("shop_new_dynamic"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/4/Text"), i18n("shop_new_static_bg"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/5/Text"), i18n("shop_new_dynamic_bg"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/6/Text"), i18n("shop_new_bgm"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/subTitleFrame/subTitle"), i18n("shop_new_index"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/0/Text"), i18n("shop_new_all"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/1/Text"), i18n("shop_new_ship_owned"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/2/Text"), i18n("shop_new_ship_havent_owned"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/camp/subTitleFrame/subTitle"), i18n("shop_new_nation"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/rarity/subTitleFrame/subTitle"), i18n("shop_new_rarity"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipType/subTitleFrame/subTitle"), i18n("shop_new_category"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/themeType/subTitleFrame/subTitle"), i18n("shop_new_skin_theme"))
	setText(arg_3_0.filterUI:Find("panelMask/panel/bottom/ok/Text"), i18n("shop_new_confirm"))
	arg_3_0:Overlay()
end

function var_0_0.Overlay(arg_4_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_4_0.adapt, {
		groupName = "shop",
		pbList = {
			arg_4_0.top:Find("title"),
			arg_4_0.top:Find("title/limit_time"),
			arg_4_0.top:Find("title/charaNameBg"),
			arg_4_0.showOwnBtn,
			arg_4_0.filterBtn,
			arg_4_0.search,
			arg_4_0.charContainer:Find("bg"),
			arg_4_0.price:Find("consume"),
			arg_4_0.filterUI:Find("panelMask/panel")
		}
	})
end

function var_0_0.UnOverlay(arg_5_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_5_0.adapt, arg_5_0._tf)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:InitData()
	arg_6_0:SetFilterPanel()
	arg_6_0:SetResource()

	if arg_6_0.mode == var_0_0.MODE_EXPERIENCE or arg_6_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI_2, false)
		setActive(arg_6_0.showOwnBtn, false)
		setActive(arg_6_0.filterBtn, false)
		setActive(arg_6_0.search, false)

		arg_6_0.top:Find("title").anchoredPosition = Vector2(184.2, -208.3)
		arg_6_0.top:Find("change_skin").anchoredPosition = Vector2(70.7, -337.8)
		arg_6_0.right:Find("giftPackBtn").anchoredPosition = Vector2(-483, -446.4)
		arg_6_0.right:Find("price").anchoredPosition = Vector2(-238.3, -140.7)
		arg_6_0.bottom:Find("scroll").offsetMin = Vector2(17.7, 0)
		arg_6_0.bottom:Find("scroll").offsetMax = Vector2(-718.7, 227.9)
	end

	arg_6_0:SetGiftPackLayer()
	onDelayTick(function()
		arg_6_0:SetSkinScroll()
		arg_6_0:Refresh(true)
	end, 0.001)
	onButton(arg_6_0, arg_6_0.backBtn, function()
		arg_6_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0.homeBtn, function()
		arg_6_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0.filterBtn, function()
		arg_6_0:OpenFilterPanel()
	end, SFX_PANEL)

	if arg_6_0.mode == var_0_0.MODE_EXPERIENCE or arg_6_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		getProxy(SettingsProxy):SetNextTipTimeLimitSkinShop()
	end

	local var_6_0 = getProxy(PlayerProxy):getRawData().id

	onToggle(arg_6_0, arg_6_0.sdTg, function(arg_11_0)
		setActive(arg_6_0.charContainer, arg_11_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_6_0, arg_11_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_6_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_6_0, 0)

	triggerToggle(arg_6_0.sdTg, var_6_1 == 1)
	onToggle(arg_6_0, arg_6_0.hideUITg, function(arg_12_0)
		setActive(arg_6_0.top, not arg_12_0)
		setActive(arg_6_0.bottom, not arg_12_0)
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_12_0)
	end, SFX_PANEL)
	onInputChanged(arg_6_0, arg_6_0.search, function()
		arg_6_0:Refresh(true)

		local var_13_0 = getInputText(arg_6_0.search)

		setActive(arg_6_0.search:Find("holder"), var_13_0 == "")
	end)
	onButton(arg_6_0, arg_6_0.showOwnBtn, function()
		arg_6_0:emit(LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER)
	end, SFX_PANEL)
	getProxy(CommanderManualProxy):TaskProgressAdd(2021, 1)
end

function var_0_0.SetResource(arg_15_0)
	local var_15_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_15_0.resources:Find("gem/Text"), var_15_0:getTotalGem())
	onButton(arg_15_0, arg_15_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.InitData(arg_17_0)
	arg_17_0.type = arg_17_0.contextData.type or var_0_0.TYPE_PERMANANT_SKIN
	arg_17_0.mode = arg_17_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_17_0:GetAllCommodities()
	arg_17_0:GetGiftPackCommodities()

	arg_17_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()

	arg_17_0:GetSkinClassify()

	local var_17_0 = (arg_17_0.mode == var_0_0.MODE_EXPERIENCE or arg_17_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM) and 1 or 0

	arg_17_0.filterValues = {
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
			var_17_0
		}
	}
	arg_17_0.filterValuesTemp = Clone(arg_17_0.filterValues)
end

function var_0_0.GetAllCommodities(arg_18_0)
	if arg_18_0.type == var_0_0.TYPE_NEW_SKIN then
		arg_18_0.commodities = getProxy(ShipSkinProxy):GetInTimeSkins()
	elseif arg_18_0.type == var_0_0.TYPE_PERMANANT_SKIN then
		arg_18_0.commodities = getProxy(ShipSkinProxy):GetPermanentSkins()
	end

	if LOCK_SKIN_US then
		local var_18_0 = pg.gameset.levellimit_skintype.key_value
		local var_18_1 = pg.gameset.levellimit_skintype.description

		if var_18_0 >= getProxy(PlayerProxy):getData().level then
			arg_18_0.commodities = _.filter(arg_18_0.commodities, function(arg_19_0)
				local var_19_0 = pg.ship_skin_template[arg_19_0:getSkinId()].shop_type_id

				return table.contains(var_18_1, var_19_0)
			end)
		end
	end

	if arg_18_0.mode == var_0_0.MODE_OVERVIEW then
		for iter_18_0 = #arg_18_0.commodities, 1, -1 do
			if arg_18_0.commodities[iter_18_0]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				table.remove(arg_18_0.commodities, iter_18_0)
			end
		end
	end
end

function var_0_0.GetGiftPackCommodities(arg_20_0)
	arg_20_0.giftPackCommodities = {}
	arg_20_0.giftSkinCommodities = {}
	arg_20_0.giftSkinProbabilitys = {}

	for iter_20_0, iter_20_1 in ipairs(pg.pay_data_display.all) do
		local var_20_0 = pg.pay_data_display[iter_20_1]

		if var_20_0.skin_inquire_relation ~= 0 and pg.TimeMgr.GetInstance():inTime(var_20_0.time) then
			local var_20_1 = getProxy(ShopsProxy):GetGiftCommodity(iter_20_1, Goods.TYPE_CHARGE)

			arg_20_0.giftPackCommodities[iter_20_1] = var_20_1

			local var_20_2 = var_20_1:GetSkinProbability()

			arg_20_0.giftSkinCommodities[iter_20_1] = getProxy(ShipSkinProxy):GetProbabilitySkins(var_20_2)
			arg_20_0.giftSkinProbabilitys[iter_20_1] = getProxy(ShipSkinProxy):GetSkinProbabilitys(var_20_2)
		end
	end
end

function var_0_0.SetSkinScroll(arg_21_0)
	arg_21_0.scrollrect.isNewLoadingMethod = true

	function arg_21_0.scrollrect.onInitItem(arg_22_0)
		arg_21_0:OnInitItem(arg_22_0)
	end

	function arg_21_0.scrollrect.onUpdateItem(arg_23_0, arg_23_1)
		arg_21_0:OnUpdateItem(arg_23_0, arg_23_1)
	end

	arg_21_0.scrollrect.enabled = true
end

function var_0_0.Refresh(arg_24_0, arg_24_1)
	arg_24_0:ClearCards()

	arg_24_0.cards = {}
	arg_24_0.displays = {}

	local var_24_0 = getInputText(arg_24_0.search)

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.commodities) do
		if arg_24_0:filterOk(iter_24_1) and arg_24_0:IsSearchType(var_24_0, iter_24_1) then
			table.insert(arg_24_0.displays, iter_24_1)
		end
	end

	local var_24_1 = {}

	for iter_24_2, iter_24_3 in ipairs(arg_24_0.displays) do
		local var_24_2 = iter_24_3.type == Goods.TYPE_ACTIVITY or iter_24_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_24_3 = 0

		if not var_24_2 then
			var_24_3 = iter_24_3:GetPrice()
		end

		var_24_1[iter_24_3.id] = var_24_3
	end

	table.sort(arg_24_0.displays, function(arg_25_0, arg_25_1)
		return arg_24_0:Sort(arg_25_0, arg_25_1, var_24_1)
	end)

	local var_24_4 = #arg_24_0.displays == 0

	setActive(arg_24_0.bgs:Find("default"), var_24_4)
	setActive(arg_24_0.bgs:Find("diffBg"), not var_24_4)
	setActive(arg_24_0.bgs:Find("empty"), var_24_4)
	setActive(arg_24_0._tf:Find("leftMask"), not var_24_4)
	setActive(arg_24_0._tf:Find("bottomMask"), not var_24_4)
	setActive(arg_24_0.painting, not var_24_4)
	setActive(arg_24_0.top:Find("title"), not var_24_4)
	setActive(arg_24_0.changeSkin, not var_24_4)
	setActive(arg_24_0.right, not var_24_4)
	setActive(arg_24_0.right, not var_24_4)
	setActive(arg_24_0.bottom:Find("scroll"), not var_24_4)

	if not var_24_4 then
		if arg_24_1 then
			arg_24_0.triggerFirstCard = true

			arg_24_0.scrollrect:SetTotalCount(#arg_24_0.displays, 0)
		else
			arg_24_0.scrollrect:SetTotalCount(#arg_24_0.displays)
		end
	end
end

function var_0_0.IsSearchType(arg_26_0, arg_26_1, arg_26_2)
	if not arg_26_1 or arg_26_1 == "" then
		return true
	end

	local var_26_0 = arg_26_2:getSkinId()

	return ShipSkin.New({
		id = var_26_0
	}):IsMatchKey(arg_26_1)
end

local function var_0_20(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_2[arg_27_0.id]
	local var_27_1 = arg_27_2[arg_27_1.id]

	if var_27_0 == var_27_1 then
		return arg_27_0.id < arg_27_1.id
	else
		return var_27_1 < var_27_0
	end
end

function var_0_0.Sort(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	local var_28_0 = arg_28_1.buyCount == 0 and 1 or 0
	local var_28_1 = arg_28_2.buyCount == 0 and 1 or 0

	if var_28_0 == var_28_1 then
		local var_28_2 = arg_28_1:getConfig("order")
		local var_28_3 = arg_28_2:getConfig("order")

		if var_28_2 == var_28_3 then
			return var_0_20(arg_28_1, arg_28_2, arg_28_3)
		else
			return var_28_2 < var_28_3
		end
	else
		return var_28_1 < var_28_0
	end
end

function var_0_0.filterOk(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.filterValues.ownType
	local var_29_1 = arg_29_0.filterValues.typeType
	local var_29_2 = arg_29_0.filterValues.shipHaveType
	local var_29_3 = arg_29_0.filterValues.campType
	local var_29_4 = arg_29_0.filterValues.rarityType
	local var_29_5 = arg_29_0.filterValues.shipType
	local var_29_6 = arg_29_0.filterValues.themeType
	local var_29_7 = arg_29_1:getSkinId()
	local var_29_8 = ShipSkin.New({
		id = var_29_7
	})
	local var_29_9 = var_29_8:GetDefaultShipConfig()
	local var_29_10 = arg_29_0:ToVShip(var_29_9)

	if var_29_0 ~= 0 then
		local var_29_11 = false
		local var_29_12 = getProxy(ShipSkinProxy):hasSkin(var_29_7)
		local var_29_13 = var_29_8:NoUse()

		if var_29_0 == 1 and var_29_12 then
			var_29_11 = true
		end

		if var_29_0 == 2 and not var_29_12 then
			var_29_11 = true
		end

		if var_29_0 == 3 and var_29_12 and var_29_13 then
			var_29_11 = true
		end

		if not var_29_11 then
			return false
		end
	end

	if var_29_1[1] ~= 0 then
		local var_29_14 = false

		for iter_29_0, iter_29_1 in ipairs(var_29_1) do
			if iter_29_1 == 1 and (var_29_8:IsLive2d() or var_29_8:IsLive2dPlus()) then
				var_29_14 = true
			end

			if iter_29_1 == 2 and not var_29_8:IsLive2d() and not var_29_8:IsLive2dPlus() and not var_29_8:IsSpine() and not var_29_8:IsSpinePlus() then
				var_29_14 = true
			end

			if iter_29_1 == 3 and (var_29_8:IsSpine() or var_29_8:IsSpinePlus()) then
				var_29_14 = true
			end

			if iter_29_1 == 4 and var_29_8:IsBG() then
				var_29_14 = true
			end

			if iter_29_1 == 5 and var_29_8:IsDbg() then
				var_29_14 = true
			end

			if iter_29_1 == 6 and var_29_8:isBgm() then
				var_29_14 = true
			end

			if var_29_14 then
				break
			end
		end

		if not var_29_14 then
			return false
		end
	end

	if var_29_2 ~= 0 then
		local var_29_15 = false
		local var_29_16 = var_29_8:CantUse()

		if var_29_2 == 1 and not var_29_16 then
			var_29_15 = true
		end

		if var_29_2 == 2 and var_29_16 then
			var_29_15 = true
		end

		if not var_29_15 then
			return false
		end
	end

	if var_29_3[1] ~= 0 then
		local var_29_17 = false

		for iter_29_2, iter_29_3 in ipairs(var_29_3) do
			local var_29_18 = ShipIndexCfg.camp

			for iter_29_4, iter_29_5 in ipairs(var_29_18[iter_29_3 + 1].types) do
				if iter_29_5 == Nation.LINK then
					if var_29_10:getNation() >= Nation.LINK then
						var_29_17 = true
					end
				elseif iter_29_5 == var_29_10:getNation() then
					var_29_17 = true
				end
			end

			if var_29_17 then
				break
			end
		end

		if not var_29_17 then
			return false
		end
	end

	if var_29_4[1] ~= 0 then
		local var_29_19 = false

		for iter_29_6, iter_29_7 in ipairs(var_29_4) do
			local var_29_20 = ShipIndexCfg.rarity

			if table.contains(var_29_20[iter_29_7 + 1].types, var_29_10:getRarity()) then
				var_29_19 = true
			end

			if var_29_19 then
				break
			end
		end

		if not var_29_19 then
			return false
		end
	end

	if var_29_5[1] ~= 0 then
		local var_29_21 = false

		for iter_29_8, iter_29_9 in ipairs(var_29_5) do
			local var_29_22 = ShipIndexCfg.type
			local var_29_23 = var_29_22[iter_29_9 + 1].types

			if iter_29_9 + 1 < 4 then
				local var_29_24 = var_29_22[iter_29_9].shipTypes

				if table.contains(var_29_23, var_29_10:getShipType()) then
					var_29_21 = true
				end

				if table.contains(var_29_23, var_29_10:getTeamType()) then
					var_29_21 = true
				end
			elseif table.contains(var_29_23, var_29_10:getShipType()) then
				var_29_21 = true
			end

			if var_29_21 then
				break
			end
		end

		if not var_29_21 then
			return false
		end
	end

	if var_29_6[1] ~= 0 then
		local var_29_25 = false

		for iter_29_10, iter_29_11 in ipairs(var_29_6) do
			local var_29_26 = arg_29_0.classifyIds[iter_29_11 + 1]

			if arg_29_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				if arg_29_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
					var_29_25 = var_29_26 == var_0_15 and arg_29_0:ExitSkinExperienceItem(arg_29_1.id)
				else
					var_29_25 = var_29_26 == var_0_13
				end
			elseif var_29_26 == var_0_12 then
				var_29_25 = true
			elseif var_29_26 == var_0_14 and table.contains(arg_29_0.returnSkins, arg_29_1.id) then
				var_29_25 = true
			else
				local var_29_27 = arg_29_0:GetShopTypeIdBySkinId(var_29_7)

				var_29_25 = (var_29_27 == 0 and var_0_16 or var_29_27) == var_29_26
			end

			if var_29_25 then
				break
			end
		end

		if not var_29_25 then
			return false
		end
	end

	return true
end

function var_0_0.ToVShip(arg_30_0, arg_30_1)
	if not arg_30_0.vship then
		arg_30_0.vship = {}

		function arg_30_0.vship.getNation()
			return arg_30_0.vship.config.nationality
		end

		function arg_30_0.vship.getShipType()
			return arg_30_0.vship.config.type
		end

		function arg_30_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_30_0.vship.config.type)
		end

		function arg_30_0.vship.getRarity()
			return arg_30_0.vship.config.rarity
		end
	end

	arg_30_0.vship.config = arg_30_1

	return arg_30_0.vship
end

function var_0_0.ExitSkinExperienceItem(arg_35_0, arg_35_1)
	if not arg_35_0.cacheSkinExperienceItems then
		arg_35_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(arg_35_0.cacheSkinExperienceItems, function(arg_36_0)
		return arg_36_0:CanUseForShop(arg_35_1)
	end)
end

function var_0_0.RegisterEvent(arg_37_0)
	arg_37_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_38_0, arg_38_1)
		arg_37_0:AdjustPainting(arg_38_1)
		setActive(arg_37_0.top, not arg_38_1)
		setActive(arg_37_0.bottom, not arg_38_1)
		setActive(arg_37_0.right, not arg_38_1)

		if arg_37_0.live2dChar then
			arg_37_0.live2dChar:setPurchaseOffset(arg_38_1)
		end

		if arg_37_0.spineChar then
			if arg_38_1 then
				local var_38_0 = pg.ship_skin_template[arg_37_0.skinId].purchase_offset

				if var_38_0 and #var_38_0 >= 3 then
					arg_37_0.spineChar.localPosition = Vector3(var_38_0[1], var_38_0[2], var_38_0[3])
				end

				if var_38_0 and #var_38_0 >= 4 then
					arg_37_0.spineChar.localScale = Vector3(var_38_0[4], var_38_0[4], var_38_0[4])
				end
			else
				arg_37_0.spineChar.localScale = Vector3(0.9, 0.9, 1)
				arg_37_0.spineChar.localPosition = Vector3(0, 0, 0)
			end
		end

		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_38_1)
	end)
	arg_37_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_39_0, arg_39_1)
		local var_39_0 = arg_37_0:GetObtainBtnState(arg_39_1)

		arg_37_0:OnClickBtn(var_39_0, arg_39_1)
	end)
	onButton(arg_37_0, arg_37_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_37_0.skinId) then
			arg_37_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_37_0.skinId)

			arg_37_0:UpdateMainView(arg_37_0.showingCommodity)
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_41_0, arg_41_1)
	local var_41_0 = NewShopSkinCard.New(arg_41_1)

	onButton(arg_41_0, var_41_0._go, function()
		if not var_41_0.commodity then
			return
		end

		for iter_42_0, iter_42_1 in pairs(arg_41_0.cards) do
			iter_42_1:UpdateSelected(false)
		end

		arg_41_0.selectedId = var_41_0.commodity.id

		var_41_0:UpdateSelected(true)
		arg_41_0:UpdateMainView(var_41_0.commodity)
		arg_41_0:GCHandle()
	end, SFX_PANEL)

	arg_41_0.cards[arg_41_1] = var_41_0
end

function var_0_0.OnUpdateItem(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.cards[arg_43_2]

	if not var_43_0 then
		arg_43_0:OnInitItem(arg_43_2)

		var_43_0 = arg_43_0.cards[arg_43_2]
	end

	local var_43_1 = arg_43_0.displays[arg_43_1 + 1]

	if not var_43_1 then
		return
	end

	local var_43_2 = arg_43_0.selectedId == var_43_1.id
	local var_43_3 = table.contains(arg_43_0.returnSkins, var_43_1.id)

	var_43_0:Update(var_43_1, var_43_2, var_43_3)

	if arg_43_0.triggerFirstCard and arg_43_1 == 0 then
		arg_43_0.triggerFirstCard = false

		triggerButton(var_43_0._go)
	end
end

function var_0_0.UpdateMainView(arg_44_0, arg_44_1)
	arg_44_0.skinId = arg_44_1:getSkinId()

	local var_44_0 = ShipSkin.IsChangeSkin(arg_44_0.skinId)

	setActive(arg_44_0.changeSkin, var_44_0)

	if var_44_0 then
		arg_44_0:FlushChangeSkin(arg_44_1)
	end

	arg_44_0.shipSkin = ShipSkin.New({
		id = arg_44_0.skinId
	})

	arg_44_0:FlushName()
	arg_44_0:FlushPreviewBtn(arg_44_1)
	arg_44_0:FlushTimeLimit(arg_44_1)
	arg_44_0:SwitchPreview(arg_44_1, arg_44_0.isPreviewFurniture)
	arg_44_0:FlushPaintingToggle(arg_44_1)
	arg_44_0:FlushTag()
	arg_44_0:FlushBG(arg_44_1)
	arg_44_0:FlushPainting(arg_44_1)
	arg_44_0:FlushPrice(arg_44_1)
	arg_44_0:FlushObtainBtn(arg_44_1)
	arg_44_0:FlushGifgPackBtn(arg_44_1)

	arg_44_0.showingCommodity = arg_44_1
end

function var_0_0.FlushChangeSkin(arg_45_0, arg_45_1)
	local var_45_0 = ShipSkin.GetChangeSkinGroupId(arg_45_0.skinId)
	local var_45_1 = ShipSkin.GetChangeSkinCustomDataId(arg_45_0.skinId, "hide_shop")
	local var_45_2 = pg.gameset.changeskin_switch_block

	if var_45_2 and var_45_2.description then
		local var_45_3 = var_45_2.description

		if table.contains(var_45_3, var_45_0) then
			local var_45_4 = HXSet.isHx()

			if arg_45_1.buyCount <= 0 and var_45_4 then
				setActive(arg_45_0.changeSkin, false)
			end
		end
	end

	if var_45_1 and var_45_1 == 1 then
		setActive(arg_45_0.changeSkin, false)
	end

	if not arg_45_0.changeSkinId then
		arg_45_0.changeSkinId = arg_45_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_45_0.changeSkinId) == var_45_0 then
		arg_45_0.skinId = arg_45_0.changeSkinId
	else
		arg_45_0.changeSkinId = arg_45_0.skinId
	end

	arg_45_0.changeSkinToggle:setSkinData(arg_45_0.skinId)
end

function var_0_0.GCHandle(arg_46_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.FlushName(arg_47_0)
	local var_47_0 = pg.ship_skin_template[arg_47_0.skinId]

	setScrollText(arg_47_0.skinName, SwitchSpecialChar(var_47_0.name, true))

	if var_47_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_47_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_47_0.skinId)))
	else
		local var_47_1 = ShipGroup.getDefaultShipConfig(var_47_0.ship_group)

		setScrollText(arg_47_0.shipName, var_47_1.name)
	end
end

function var_0_0.FlushPreviewBtn(arg_48_0, arg_48_1)
	local var_48_0 = Goods.ExistFurniture(arg_48_1.id)

	removeOnButton(arg_48_0.switchPreviewBtn)

	if not var_48_0 and arg_48_0.isPreviewFurniture then
		arg_48_0.isPreviewFurniture = false
	end

	setActive(arg_48_0.switchPreviewBtn, var_48_0)

	if var_48_0 then
		onButton(arg_48_0, arg_48_0.switchPreviewBtn, function()
			arg_48_0.isPreviewFurniture = not arg_48_0.isPreviewFurniture

			arg_48_0:SwitchPreview(arg_48_1, arg_48_0.isPreviewFurniture)
			arg_48_0:FlushPrice(arg_48_1)
			arg_48_0:FlushObtainBtn(arg_48_1)
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPreview(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_0.skinId

	if pg.ship_skin_template[var_50_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_50_0.charContainer, false)

		return
	end

	local var_50_1 = getProxy(PlayerProxy):getRawData().id

	setActive(arg_50_0.charContainer, PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_50_1, 0) == 1)
	setActive(arg_50_0.charTf, not arg_50_2)
	setActive(arg_50_0.furnitureContainer, arg_50_2)

	if not arg_50_2 then
		local var_50_2 = pg.ship_skin_template[var_50_0]

		arg_50_0:FlushChar(var_50_2.prefab, var_50_2.id)
		GetImageSpriteFromAtlasAsync("qicon/" .. var_50_2.painting, "", arg_50_0.backChara)
	else
		local var_50_3 = Goods.Id2FurnitureId(arg_50_1.id)
		local var_50_4 = Goods.GetFurnitureConfig(arg_50_1.id)

		arg_50_0.interactionPreview:Flush(var_50_0, var_50_3, var_50_4.scale[2] or 1, var_50_4.position[2])
	end
end

function var_0_0.FlushChar(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_0.prefabName and arg_51_0.prefabName == arg_51_1 then
		return
	end

	arg_51_0:ReturnChar()

	arg_51_0.prefabName = arg_51_1

	PoolMgr.GetInstance():GetSpineChar(arg_51_1, true, function(arg_52_0)
		if arg_51_0.prefabName ~= arg_51_1 then
			PoolMgr.GetInstance():ReturnSpineChar(arg_51_1, arg_52_0)

			return
		end

		arg_51_0.spineChar = tf(arg_52_0)

		local var_52_0 = pg.skinshop_spine_scale[arg_51_2]

		if var_52_0 then
			arg_51_0.spineChar.localScale = Vector3(var_52_0.skinshop_scale, var_52_0.skinshop_scale, 1)
		else
			arg_51_0.spineChar.localScale = Vector3(0.9, 0.9, 1)
		end

		arg_51_0.spineChar.localPosition = Vector3(0, 0, 0)

		pg.ViewUtils.SetLayer(arg_51_0.spineChar, Layer.UI)
		setParent(arg_51_0.spineChar, arg_51_0.charTf)
		arg_52_0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end)
end

function var_0_0.ReturnChar(arg_53_0)
	if not IsNil(arg_53_0.spineChar) then
		arg_53_0.spineChar.gameObject:GetComponent("SpineAnimUI"):SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(arg_53_0.prefabName, arg_53_0.spineChar.gameObject)

		arg_53_0.spineChar = nil
		arg_53_0.prefabName = nil
	end
end

function var_0_0.ClearCards(arg_54_0)
	if not arg_54_0.cards then
		return
	end

	for iter_54_0, iter_54_1 in pairs(arg_54_0.cards) do
		iter_54_1:Dispose()
	end

	arg_54_0.cards = nil
end

function var_0_0.FlushTimeLimit(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0.skinId
	local var_55_1 = false
	local var_55_2

	if arg_55_1:IsActivityExtra() and arg_55_1:ShowMaintenanceTime() then
		local var_55_3, var_55_4 = arg_55_1:GetMaintenanceMonthAndDay()

		function var_55_2()
			return i18n("limit_skin_time_before_maintenance", var_55_3, var_55_4)
		end

		var_55_1 = true
	elseif arg_55_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_55_5 = getProxy(ShipSkinProxy):getSkinById(var_55_0)

		var_55_1 = var_55_5 and var_55_5:isExpireType() and not var_55_5:isExpired()

		if var_55_1 then
			function var_55_2()
				return skinTimeStamp(var_55_5:getRemainTime())
			end
		end
	else
		local var_55_6, var_55_7 = pg.TimeMgr.GetInstance():inTime(arg_55_1:getConfig("time"))

		var_55_1 = var_55_7

		if var_55_1 then
			local var_55_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_55_7)

			function var_55_2()
				return skinCommdityTimeStamp(var_55_8)
			end
		end
	end

	setActive(arg_55_0.top:Find("title/limit_time"), var_55_1)
	arg_55_0:ClearTimer()

	if var_55_1 then
		arg_55_0:AddTimer(var_55_2)
	end
end

function var_0_0.AddTimer(arg_59_0, arg_59_1)
	arg_59_0.timer = Timer.New(function()
		setText(arg_59_0.limitTime, arg_59_1())
	end, 1, -1)

	arg_59_0.timer.func()
	arg_59_0.timer:Start()
end

function var_0_0.ClearTimer(arg_61_0)
	if arg_61_0.timer then
		arg_61_0.timer:Stop()

		arg_61_0.timer = nil
	end
end

function var_0_0.FlushPaintingToggle(arg_62_0, arg_62_1)
	removeOnToggle(arg_62_0.dynamicToggle)
	removeOnToggle(arg_62_0.showBgToggle)

	local var_62_0 = checkABExist("painting/" .. arg_62_0.shipSkin:getConfig("painting") .. "_n")

	if arg_62_0.isToggleShowBg and not var_62_0 then
		triggerToggle(arg_62_0.showBgToggle, false)

		arg_62_0.isToggleShowBg = false
	elseif var_62_0 then
		triggerToggle(arg_62_0.showBgToggle, true)

		arg_62_0.isToggleShowBg = true
	end

	local var_62_1 = arg_62_0.shipSkin:IsSpine() or arg_62_0.shipSkin:IsLive2d() or arg_62_0.shipSkin:IsSpinePlus() or arg_62_0.shipSkin:IsLive2dPlus()

	if LOCK_SKIN_SHOP_ANIM_PREVIEW == "all" or LOCK_SKIN_SHOP_ANIM_PREVIEW and table.contains(LOCK_SKIN_SHOP_ANIM_PREVIEW, arg_62_0.shipSkin.id) then
		var_62_1 = false
	end

	if var_62_1 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_62_0.isToggleDynamic = true
	end

	if var_62_1 then
		local var_62_2 = 0

		if arg_62_0.shipSkin:IsSpine() then
			var_62_2 = 6
		elseif arg_62_0.shipSkin:IsLive2d() then
			var_62_2 = 1
		elseif arg_62_0.shipSkin:IsSpinePlus() then
			var_62_2 = 7
		elseif arg_62_0.shipSkin:IsLive2dPlus() then
			var_62_2 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_62_2) .. "_off", arg_62_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_62_2), arg_62_0.dynamicToggle:Find("select"))
	end

	if arg_62_0.isToggleDynamic and not var_62_1 then
		triggerToggle(arg_62_0.dynamicToggle, false)

		arg_62_0.isToggleDynamic = false
	elseif arg_62_0.isToggleDynamic and not arg_62_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_62_0.shipSkin:IsLive2d() or arg_62_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_62_0.isToggleDynamic = false

			local var_62_3 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_62_3, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_62_0.dynamicToggle, false)
		else
			triggerToggle(arg_62_0.dynamicToggle, true)

			arg_62_0.isToggleDynamic = true
		end
	end

	if var_62_0 then
		onToggle(arg_62_0, arg_62_0.showBgToggle, function(arg_63_0)
			arg_62_0.isToggleShowBg = arg_63_0

			arg_62_0:FlushPainting(arg_62_1)
			arg_62_0:FlushBG(arg_62_1)
		end, SFX_PANEL)
	end

	if arg_62_0.shipSkin:IsSpine() or arg_62_0.shipSkin:IsLive2d() or arg_62_0.shipSkin:IsSpinePlus() or arg_62_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_62_0, arg_62_0.dynamicToggle, function(arg_64_0)
			if arg_64_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_62_0.shipSkin:IsLive2d() or arg_62_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_62_0.dynamicToggle, false)

				return
			end

			arg_62_0.isToggleDynamic = arg_64_0

			setActive(arg_62_0.showBgToggle, not arg_64_0 and var_62_0)
			arg_62_0:FlushPainting(arg_62_1)
			arg_62_0:FlushDynamicPaintingResState(arg_62_1)
			arg_62_0:RecordFlag(arg_64_0)
		end, SFX_PANEL)
	end

	if arg_62_0.isToggleDynamic then
		arg_62_0:FlushDynamicPaintingResState(arg_62_1)
	end

	setActive(arg_62_0.dynamicToggle, var_62_1)
	setActive(arg_62_0.showBgToggle, not arg_62_0.isToggleDynamic and var_62_0)
end

function var_0_0.FlushTag(arg_65_0)
	local var_65_0 = arg_65_0.skinId
	local var_65_1 = pg.ship_skin_template[var_65_0]
	local var_65_2 = Clone(var_65_1.tag)
	local var_65_3 = false

	for iter_65_0 = #var_65_2, 1, -1 do
		local var_65_4 = var_65_2[iter_65_0]

		if var_65_4 == 1 or var_65_4 == 6 or var_65_4 == 7 or var_65_4 == 9 then
			local var_65_5 = true

			table.remove(var_65_2, iter_65_0)
		end
	end

	local var_65_6 = checkABExist("painting/" .. arg_65_0.shipSkin:getConfig("painting") .. "_n")

	arg_65_0.tagList:make(function(arg_66_0, arg_66_1, arg_66_2)
		if arg_66_0 == UIItemList.EventUpdate then
			local var_66_0 = var_65_2[arg_66_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_65_2[arg_66_1 + 1]), function(arg_67_0)
				if arg_65_0.exited then
					return
				end

				arg_66_2:GetComponent(typeof(Image)).sprite = arg_67_0
			end)
		end
	end)
	arg_65_0.tagList:align(#var_65_2)
end

function var_0_0.FlushPainting(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0:GetPaintingState(arg_68_1)
	local var_68_1 = pg.ship_skin_template[arg_68_0.skinId].painting
	local var_68_2 = ShipSkin.GetChangeSkinData(arg_68_0.skinId) and true or false

	if var_68_0 == var_0_2 and not arg_68_0:ExistL2dRes(var_68_1) or var_68_0 == var_0_3 and not arg_68_0:ExistSpineRes(var_68_1) then
		var_68_0 = var_0_1
	end

	if arg_68_0.paintingState and arg_68_0.paintingState.state == var_68_0 and arg_68_0.paintingState.id == arg_68_1.id and arg_68_0.paintingState.showBg == arg_68_0.isToggleShowBg and arg_68_0.paintingState.purchaseFlag == arg_68_1.buyCount and not var_68_2 then
		return
	end

	arg_68_0:ClearPainting()

	if var_68_0 == var_0_1 then
		arg_68_0:LoadMeshPainting(arg_68_1, arg_68_0.isToggleShowBg)
	elseif var_68_0 == var_0_2 then
		arg_68_0:LoadL2dPainting(arg_68_1)
	elseif var_68_0 == var_0_3 then
		arg_68_0:LoadSpinePainting(arg_68_1)
	end

	arg_68_0.paintingState = {
		state = var_68_0,
		id = arg_68_1.id,
		showBg = arg_68_0.isToggleShowBg,
		purchaseFlag = arg_68_1.buyCount
	}

	arg_68_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_69_0)
	local var_69_0 = arg_69_0.paintingState

	if not var_69_0 then
		return
	end

	if var_69_0.state == var_0_1 then
		arg_69_0:ClearMeshPainting()
	elseif var_69_0.state == var_0_2 then
		arg_69_0:ClearL2dPainting()
	elseif var_69_0.state == var_0_3 then
		arg_69_0:ClearSpinePainting()
	end

	arg_69_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_70_0, arg_70_1, arg_70_2)
	local var_70_0 = findTF(arg_70_0.paintingTF, "fitter")
	local var_70_1 = GetOrAddComponent(var_70_0, "PaintingScaler")

	var_70_1.FrameName = "chuanwu"
	var_70_1.Tween = 1

	local var_70_2 = pg.ship_skin_template[arg_70_0.skinId].painting
	local var_70_3 = var_70_2

	if not arg_70_2 and checkABExist("painting/" .. var_70_2 .. "_n") then
		var_70_2 = var_70_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_70_2) then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_70_2, true, function(arg_71_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_71_0, var_70_0, false)
		ShipExpressionHelper.SetExpression(var_70_0:GetChild(0), var_70_3)

		arg_70_0.paintingName = var_70_2

		if arg_70_0.paintingState and arg_70_0.paintingState.id ~= arg_70_1.id then
			arg_70_0:ClearMeshPainting()
		end

		local var_71_0 = arg_71_0.transform:Find("shop_hx")

		arg_70_0:CheckShowShopHx(var_71_0, arg_70_1)
	end)
end

function var_0_0.ClearMeshPainting(arg_72_0)
	local var_72_0 = arg_72_0.paintingTF:Find("fitter")

	if arg_72_0.paintingName and var_72_0.childCount > 0 then
		local var_72_1 = var_72_0:GetChild(0).gameObject
		local var_72_2 = var_72_1.transform:Find("shop_hx")

		arg_72_0:RevertShopHx(var_72_2)
		PoolMgr.GetInstance():ReturnPainting(arg_72_0.paintingName, var_72_1)
	end

	arg_72_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_0.skinId
	local var_73_1 = pg.ship_skin_template[var_73_0].skin_type
	local var_73_2

	if var_73_1 == ShipSkin.SKIN_TYPE_TB then
		var_73_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_73_0))
	else
		local var_73_3 = pg.ship_skin_template[var_73_0].ship_group
		local var_73_4 = ShipGroup.getDefaultShipConfig(var_73_3)

		var_73_2 = Ship.New({
			noChangeSkin = true,
			configId = var_73_4.id,
			skin_id = var_73_0
		})
	end

	local var_73_5 = Live2D.GenerateData({
		ship = var_73_2,
		position = Vector3(0, 0, -1),
		parent = arg_73_0.live2dContainer,
		offset = var_73_2:GetSkinConfig().shop_offset
	})

	var_73_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_73_0.live2dChar = Live2D.New(var_73_5, function(arg_74_0)
		arg_74_0:IgonreReactPos(true)
		arg_73_0:CheckShowShopHxForL2d(arg_74_0, arg_73_1)

		if arg_73_0.paintingState and arg_73_0.paintingState.id ~= arg_73_1.id then
			arg_73_0:ClearL2dPainting()
		end

		arg_74_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_75_0)
	if arg_75_0.live2dChar then
		arg_75_0:RevertShopHxForL2d(arg_75_0.live2dChar)
		arg_75_0.live2dChar:Dispose()

		arg_75_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_0.skinId
	local var_76_1 = pg.ship_skin_template[var_76_0].skin_type
	local var_76_2

	if var_76_1 == ShipSkin.SKIN_TYPE_TB then
		var_76_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_76_0))
	else
		local var_76_3 = pg.ship_skin_template[var_76_0].ship_group
		local var_76_4 = ShipGroup.getDefaultShipConfig(var_76_3)

		var_76_2 = Ship.New({
			noChangeSkin = true,
			configId = var_76_4.id,
			skin_id = var_76_0
		})
	end

	local var_76_5 = SpinePainting.GenerateData({
		ship = var_76_2,
		position = Vector3(0, 0, 0),
		parent = arg_76_0.spTF,
		effectParent = arg_76_0.spBg,
		offset = var_76_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_76_0.spinePainting = SpinePainting.New(var_76_5, function(arg_77_0)
		if arg_76_0.paintingState and arg_76_0.paintingState.id ~= arg_76_1.id then
			arg_76_0:ClearSpinePainting()
		end

		local var_77_0 = arg_77_0._tf:Find("shop_hx")

		arg_76_0:CheckShowShopHx(var_77_0, arg_76_1)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_78_0)
	if arg_78_0.spinePainting and arg_78_0.spinePainting._tf then
		local var_78_0 = arg_78_0.spinePainting._tf:Find("shop_hx")

		arg_78_0:RevertShopHx(arg_78_0.shopHx)
		arg_78_0.spinePainting:Dispose()

		arg_78_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHx(arg_79_0, arg_79_1, arg_79_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	if not IsNil(arg_79_1) and arg_79_2.buyCount <= 0 then
		setActive(arg_79_1, true)
	end
end

function var_0_0.RevertShopHx(arg_80_0, arg_80_1)
	if not IsNil(arg_80_1) then
		setActive(arg_80_1, false)
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_81_0, arg_81_1, arg_81_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_81_0 = arg_81_2.buyCount <= 0 and 1 or 0

	arg_81_1:changeParamaterValue("shop_hx", var_81_0)
end

function var_0_0.RevertShopHxForL2d(arg_82_0, arg_82_1)
	arg_82_1:changeParamaterValue("shop_hx", 0)
end

function var_0_0.AdjustPainting(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_0.paintingTF
	local var_83_1 = pg.ship_skin_newmainui_shift[arg_83_0.skinId]

	if var_83_1 then
		local var_83_2 = var_83_1.skin_shop_shift

		if arg_83_1 then
			var_83_0.anchoredPosition = Vector2(var_83_2[1] - 440, var_83_2[2] + arg_83_0.defaultPaintingPosition.y)
		else
			var_83_0.anchoredPosition = Vector2(var_83_2[1] + arg_83_0.defaultPaintingPosition.x, var_83_2[2] + arg_83_0.defaultPaintingPosition.y)
		end

		local var_83_3 = var_83_2[4]

		var_83_0.localScale = Vector3(var_83_3, var_83_3, 1)
	else
		var_83_0.anchoredPosition = Vector2(arg_83_0.defaultPaintingPosition.x, arg_83_0.defaultPaintingPosition.y)
		var_83_0.localScale = arg_83_0.defaultPaintingScale
	end
end

function var_0_0.FlushBG(arg_84_0, arg_84_1, arg_84_2)
	local var_84_0 = arg_84_0.skinId
	local var_84_1 = pg.ship_skin_template[var_84_0]
	local var_84_2

	if var_84_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_84_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_84_0))
	else
		local var_84_3 = ShipGroup.getDefaultShipConfig(var_84_1.ship_group)

		var_84_2 = Ship.New({
			id = 999,
			configId = var_84_3.id,
			skin_id = var_84_0
		})
	end

	local var_84_4 = var_84_2:getShipBgPrint(true)
	local var_84_5 = pg.ship_skin_template[var_84_0].painting

	if (arg_84_0.isToggleShowBg or not checkABExist("painting/" .. var_84_5 .. "_n")) and var_84_1.bg_sp ~= "" then
		var_84_4 = var_84_1.bg_sp
	end

	local var_84_6 = var_84_4 ~= var_84_2:rarity2bgPrintForGet()

	if var_84_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_84_0, var_84_4, arg_84_0.bgs:Find("diffBg"), arg_84_0.bgs:Find("diffBg/bg"), function(arg_85_0)
			if arg_84_2 then
				arg_84_2()
			end
		end, function(arg_86_0)
			if arg_84_2 then
				arg_84_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_84_0:getUIName())

		if arg_84_2 then
			arg_84_2()
		end
	end

	setActive(arg_84_0.bgs:Find("diffBg"), var_84_6)
	setActive(arg_84_0.bgs:Find("default"), not var_84_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_87_0, arg_87_1)
	if not arg_87_0.isToggleDynamic then
		return
	end

	local var_87_0 = arg_87_0:GetPaintingState(arg_87_1)
	local var_87_1 = false
	local var_87_2 = ""
	local var_87_3 = pg.ship_skin_template[arg_87_0.skinId].painting

	if var_0_2 == var_87_0 then
		var_87_1, var_87_2 = arg_87_0:ExistL2dRes(var_87_3)
	elseif var_0_3 == var_87_0 then
		var_87_1, var_87_2 = arg_87_0:ExistSpineRes(var_87_3)
	end

	setActive(arg_87_0.dynamicResToggle, not var_87_1)
	removeOnButton(arg_87_0.dynamicResToggle)

	if not var_87_1 and var_87_2 ~= "" then
		onButton(arg_87_0, arg_87_0.dynamicResToggle, function()
			arg_87_0:DownloadDynamicPainting(var_87_2, arg_87_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_89_0, arg_89_1, arg_89_2)
	local var_89_0 = arg_89_0.skinId

	if arg_89_0.downloads[var_89_0] then
		return
	end

	local var_89_1 = SkinShopDownloadRequest.New()

	arg_89_0.downloads[var_89_0] = var_89_1

	var_89_1:Start(arg_89_1, function(arg_90_0)
		if arg_90_0 and arg_89_0.paintingState and arg_89_0.paintingState.id == arg_89_2.id then
			arg_89_0:FlushPainting(arg_89_2)
			arg_89_0:FlushDynamicPaintingResState(arg_89_2)
		end

		var_89_1:Dispose()

		arg_89_0.downloads[var_89_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_91_0, arg_91_1)
	if arg_91_0.isToggleDynamic and (arg_91_0.shipSkin:IsLive2d() or arg_91_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_91_0.isToggleDynamic and (arg_91_0.shipSkin:IsSpine() or arg_91_0.shipSkin:IsSpinePlus()) then
		if arg_91_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_92_0, arg_92_1)
	local var_92_0 = "live2d/" .. string.lower(arg_92_1)
	local var_92_1 = HXSet.autoHxShiftPath(var_92_0, nil, true)

	return checkABExist(var_92_1), var_92_1
end

function var_0_0.ExistSpineRes(arg_93_0, arg_93_1)
	local var_93_0 = "SpinePainting/" .. string.lower(arg_93_1)
	local var_93_1 = HXSet.autoHxShiftPath(var_93_0, nil, true)

	return checkABExist(var_93_1), var_93_1
end

function var_0_0.RecordFlag(arg_94_0, arg_94_1)
	local var_94_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_94_0, arg_94_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_94_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_94_1)
end

function var_0_0.FlushPrice(arg_95_0, arg_95_1)
	local var_95_0 = arg_95_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_95_1 = arg_95_1.type == Goods.TYPE_ACTIVITY or arg_95_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_95_0 then
		if arg_95_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_95_0:UpdateExperiencePrice4Item(arg_95_1)
		else
			arg_95_0:UpdateExperiencePrice(arg_95_1)
		end
	elseif arg_95_0.isPreviewFurniture then
		arg_95_0:UpdateFurniturePrice(arg_95_1)
	elseif var_95_1 then
		-- block empty
	else
		arg_95_0:UpdateCommodityPrice(arg_95_1)
	end

	local var_95_2 = arg_95_1.type == Goods.TYPE_SKIN

	setActive(arg_95_0.price:Find("timeLimit"), var_95_0 and not var_95_1)
	setActive(arg_95_0.price:Find("consume"), var_95_2 and not var_95_0 and not var_95_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_96_0, arg_96_1)
	local var_96_0 = arg_96_1:getConfig("resource_num")
	local var_96_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_96_2 = _.detect(var_96_1, function(arg_97_0)
		return arg_97_0:CanUseForShop(arg_96_1.id)
	end)
	local var_96_3 = var_96_2 and var_96_2.count or 0
	local var_96_4 = (var_96_3 < var_96_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_96_3 .. (var_96_3 < var_96_0 and "</color>" or "")

	setText(arg_96_0.price:Find("timeLimit/consume/Text"), var_96_4 .. "/" .. var_96_0)
end

function var_0_0.UpdateExperiencePrice(arg_98_0, arg_98_1)
	local var_98_0 = arg_98_1:getConfig("resource_num")
	local var_98_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_98_2 = (var_98_1 < var_98_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_98_1 .. (var_98_1 < var_98_0 and "</color>" or "")

	setText(arg_98_0.price:Find("timeLimit/consume/Text"), var_98_2 .. "/" .. var_98_0)
end

function var_0_0.UpdateCommodityPrice(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1:GetPrice()
	local var_99_1 = arg_99_1:getConfig("resource_num")

	setText(arg_99_0.price:Find("consume/Text"), var_99_0)
	setText(arg_99_0.price:Find("consume/originalprice/Text"), var_99_1)
	setActive(arg_99_0.price:Find("consume/originalprice"), var_99_0 ~= var_99_1)
end

function var_0_0.UpdateFurniturePrice(arg_100_0, arg_100_1)
	local var_100_0 = Goods.Id2FurnitureId(arg_100_1.id)
	local var_100_1 = Furniture.New({
		id = var_100_0
	})
	local var_100_2 = var_100_1:getConfig("gem_price")

	setText(arg_100_0.price:Find("consume/originalprice/Text"), var_100_2)

	local var_100_3 = var_100_1:getPrice(PlayerConst.ResDiamond)

	setText(arg_100_0.price:Find("consume/Text"), var_100_3)
	setActive(arg_100_0.price:Find("consume/originalprice"), var_100_2 ~= var_100_3)
end

function var_0_0.FlushObtainBtn(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_0:GetObtainBtnState(arg_101_1)
	local var_101_1 = var_0_19(var_101_0)

	for iter_101_0 = 0, arg_101_0.btns.childCount - 1 do
		local var_101_2 = arg_101_0.btns:GetChild(iter_101_0)

		setActive(var_101_2, var_101_2.name == var_101_1)
	end

	setActive(arg_101_0.price:Find("btn/item"), var_101_0 == var_0_11)
	setActive(arg_101_0.price:Find("btn/tag"), var_101_0 == var_0_11)

	if var_101_0 == var_0_11 then
		arg_101_0:FlushGift(arg_101_1)
	end

	onButton(arg_101_0, arg_101_0.price:Find("btn"), function()
		local var_102_0 = {}

		if SkinCouponActivity.StaticEncoreActTip(arg_101_1.id) then
			table.insert(var_102_0, function(arg_103_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						local var_104_0 = checkExist(SkinCouponActivity.GetSkinCouponEncoreAct(), {
							"id"
						})

						if var_104_0 then
							arg_101_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_104_0)
						end
					end,
					onNo = function()
						arg_103_0()
					end
				})
			end)
		end

		seriesAsync(var_102_0, function()
			if var_101_0 == var_0_5 or var_101_0 == var_0_7 or var_101_0 == var_0_11 then
				arg_101_0.purchaseView:ExecuteAction("Show", arg_101_1)
			else
				arg_101_0:OnClickBtn(var_101_0, arg_101_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.GetObtainBtnState(arg_107_0, arg_107_1)
	if arg_107_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_107_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_107_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_107_1.type == Goods.TYPE_ACTIVITY or arg_107_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_107_1.buyCount > 0 then
		return var_0_4
	elseif arg_107_1:isDisCount() and arg_107_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_107_1:CanUseVoucherType() or arg_107_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_107_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.FlushGift(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_1:GetGiftList()[1]

	updateDrop(arg_108_0.price:Find("btn/item/mask/item"), {
		type = var_108_0.type,
		id = var_108_0.id,
		count = var_108_0.count
	})
end

function var_0_0.OnClickBtn(arg_109_0, arg_109_1, arg_109_2)
	if arg_109_1 == var_0_5 or arg_109_1 == var_0_7 or arg_109_1 == var_0_11 then
		arg_109_0:OnPurchase(arg_109_2)
	elseif arg_109_1 == var_0_10 then
		arg_109_0:OnItemPurchase(arg_109_2)
	elseif arg_109_1 == var_0_6 then
		arg_109_0:OnActivity(arg_109_2)
	elseif arg_109_1 == var_0_8 then
		arg_109_0:OnBackyard(arg_109_2)
	elseif arg_109_1 == var_0_9 then
		if arg_109_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_109_0:OnExperience4Item(arg_109_2)
		else
			arg_109_0:OnExperience(arg_109_2)
		end
	end
end

function var_0_0.FlushGifgPackBtn(arg_110_0, arg_110_1)
	local var_110_0 = false
	local var_110_1
	local var_110_2
	local var_110_3

	for iter_110_0, iter_110_1 in pairs(arg_110_0.giftSkinCommodities) do
		for iter_110_2, iter_110_3 in ipairs(iter_110_1) do
			if iter_110_3.id == arg_110_1.id then
				var_110_0 = true

				break
			end
		end

		if var_110_0 then
			var_110_1 = arg_110_0.giftPackCommodities[iter_110_0]
			var_110_2 = arg_110_0.giftSkinCommodities[iter_110_0]
			var_110_3 = arg_110_0.giftSkinProbabilitys[iter_110_0]

			break
		end
	end

	setActive(arg_110_0.giftPackBtn, var_110_0)

	if var_110_0 then
		onButton(arg_110_0, arg_110_0.giftPackBtn, function()
			arg_110_0:emit(LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER, var_110_1, var_110_2, var_110_3)
		end, SFX_PANEL)
	end
end

function var_0_0.SetGiftPackLayer(arg_112_0)
	return
end

function var_0_0.OnPurchase(arg_113_0, arg_113_1)
	if arg_113_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_113_1:isDisCount() and arg_113_1:IsItemDiscountType() then
		arg_113_0:emit(LatestSkinShopMediator.ON_SHOPPING_BY_ACT, arg_113_1.id, 1)
	else
		arg_113_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_113_1.id, 1)
	end
end

function var_0_0.OnItemPurchase(arg_114_0, arg_114_1)
	if arg_114_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_114_0 = arg_114_1:GetVoucherIdList()
	local var_114_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_114_1.id)

	if #var_114_0 <= 0 and #var_114_1 <= 0 then
		return
	end

	local var_114_2 = {}

	for iter_114_0, iter_114_1 in ipairs(var_114_0) do
		table.insert(var_114_2, iter_114_1)
	end

	for iter_114_2, iter_114_3 in ipairs(var_114_1) do
		table.insert(var_114_2, iter_114_3.id)
	end

	local var_114_3 = arg_114_0.skinId
	local var_114_4 = pg.ship_skin_template[var_114_3]
	local var_114_5 = SwitchSpecialChar(var_114_4.name, true)

	arg_114_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_114_2,
		skinId = var_114_3,
		skinName = var_114_5,
		price = arg_114_1:GetPrice(),
		onYes = function(arg_115_0)
			if arg_115_0 then
				arg_114_0:emit(LatestSkinShopMediator.ON_ITEM_PURCHASE, arg_115_0, arg_114_1.id)
			else
				arg_114_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_114_1.id, 1)
			end
		end
	})
end

function var_0_0.OnActivity(arg_116_0, arg_116_1)
	local var_116_0 = arg_116_1:getConfig("time")
	local var_116_1 = arg_116_1:getConfig("activity")
	local var_116_2 = getProxy(ActivityProxy):getActivityById(var_116_1)

	if var_116_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_116_0) or var_116_2 and not var_116_2:isEnd() then
		if arg_116_1.type == Goods.TYPE_ACTIVITY then
			arg_116_0:emit(LatestSkinShopMediator.GO_SHOPS_LAYER, arg_116_1:getConfig("activity"))
		elseif arg_116_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_116_3 = arg_116_1:getConfig("scene")

			if var_116_3 and #var_116_3 > 0 then
				arg_116_0:emit(LatestSkinShopMediator.OPEN_SCENE, var_116_3)
			else
				arg_116_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_116_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_117_0, arg_117_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_117_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_117_0.name, var_117_0.level))

		return
	end

	arg_117_0:emit(LatestSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_118_0, arg_118_1)
	local var_118_0 = arg_118_0.skinId
	local var_118_1 = getProxy(ShipSkinProxy):getSkinById(var_118_0)

	if var_118_1 and not var_118_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_118_2 = arg_118_1:getConfig("resource_num")
	local var_118_3 = arg_118_1:getConfig("time_second") * var_118_2
	local var_118_4, var_118_5, var_118_6, var_118_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_118_3)
	local var_118_8 = pg.ship_skin_template[arg_118_0.skinId].name

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_118_2, var_118_8, var_118_4, var_118_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_118_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_118_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_118_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_120_0, arg_120_1)
	local var_120_0 = arg_120_0.skinId
	local var_120_1 = getProxy(ShipSkinProxy):getSkinById(var_120_0)

	if var_120_1 and not var_120_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_120_2 = arg_120_1:getConfig("resource_num")
	local var_120_3 = arg_120_1:getConfig("time_second") * var_120_2
	local var_120_4, var_120_5, var_120_6, var_120_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_120_3)
	local var_120_8 = pg.ship_skin_template[arg_120_0.skinId].name
	local var_120_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_120_10 = _.detect(var_120_9, function(arg_121_0)
		return arg_121_0:CanUseForShop(arg_120_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_120_2, var_120_8, var_120_4, var_120_5),
		onYes = function()
			if not var_120_10 or var_120_10.count < var_120_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_120_0:emit(LatestSkinShopMediator.ON_ITEM_EXPERIENCE, var_120_10.id, arg_120_1.id, 1)
		end
	})
end

function var_0_0.SetFilterPanel(arg_123_0)
	local var_123_0 = arg_123_0.filterContent:Find("own/options")
	local var_123_1 = arg_123_0.filterContent:Find("type/options")
	local var_123_2 = arg_123_0.filterContent:Find("shipHave/options")
	local var_123_3 = arg_123_0.filterContent:Find("camp/options")
	local var_123_4 = arg_123_0.filterContent:Find("rarity/options")
	local var_123_5 = arg_123_0.filterContent:Find("shipType/options")
	local var_123_6 = arg_123_0.filterContent:Find("themeType/options")

	arg_123_0:SetOptionList(var_123_3, ShipIndexConst.CampNames, true)
	arg_123_0:SetOptionList(var_123_4, ShipIndexConst.RarityNames, true)
	arg_123_0:SetOptionList(var_123_5, ShipIndexConst.TypeNames, true)
	arg_123_0:SetOptionList(var_123_6, arg_123_0.classifyNames)
	arg_123_0:SetSingleOptions(var_123_0, "ownType")
	arg_123_0:SetMultiOptions(var_123_1, "typeType")
	arg_123_0:SetSingleOptions(var_123_2, "shipHaveType")
	arg_123_0:SetMultiOptions(var_123_3, "campType")
	arg_123_0:SetMultiOptions(var_123_4, "rarityType")
	arg_123_0:SetMultiOptions(var_123_5, "shipType")
	arg_123_0:SetMultiOptions(var_123_6, "themeType")
	onButton(arg_123_0, arg_123_0.filterUI:Find("bg"), function()
		for iter_124_0, iter_124_1 in pairs(arg_123_0.filterValues) do
			arg_123_0.filterValuesTemp[iter_124_0] = Clone(arg_123_0.filterValues[iter_124_0])
		end

		setActive(arg_123_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_123_0, arg_123_0.filterUI:Find("panelMask/panel/closeBtn"), function()
		for iter_125_0, iter_125_1 in pairs(arg_123_0.filterValues) do
			arg_123_0.filterValuesTemp[iter_125_0] = Clone(arg_123_0.filterValues[iter_125_0])
		end

		setActive(arg_123_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_123_0, arg_123_0.filterUI:Find("panelMask/panel/bottom/ok"), function()
		for iter_126_0, iter_126_1 in pairs(arg_123_0.filterValues) do
			arg_123_0.filterValues[iter_126_0] = Clone(arg_123_0.filterValuesTemp[iter_126_0])
		end

		setActive(arg_123_0.filterUI, false)
		arg_123_0:Refresh(true)
	end, SFX_PANEL)
end

function var_0_0.OpenFilterPanel(arg_127_0)
	setActive(arg_127_0.filterUI, true)

	local var_127_0 = arg_127_0.filterContent:Find("own/options")
	local var_127_1 = arg_127_0.filterContent:Find("type/options")
	local var_127_2 = arg_127_0.filterContent:Find("shipHave/options")
	local var_127_3 = arg_127_0.filterContent:Find("camp/options")
	local var_127_4 = arg_127_0.filterContent:Find("rarity/options")
	local var_127_5 = arg_127_0.filterContent:Find("shipType/options")
	local var_127_6 = arg_127_0.filterContent:Find("themeType/options")

	arg_127_0:SetSingleOptions(var_127_0, "ownType", true)
	arg_127_0:SetMultiOptions(var_127_1, "typeType", true)
	arg_127_0:SetSingleOptions(var_127_2, "shipHaveType", true)
	arg_127_0:SetMultiOptions(var_127_3, "campType", true)
	arg_127_0:SetMultiOptions(var_127_4, "rarityType", true)
	arg_127_0:SetMultiOptions(var_127_5, "shipType", true)
	arg_127_0:SetMultiOptions(var_127_6, "themeType", true)
end

function var_0_0.SetOptionList(arg_128_0, arg_128_1, arg_128_2, arg_128_3)
	local var_128_0 = UIItemList.New(arg_128_1, arg_128_1:GetChild(0))

	var_128_0:make(function(arg_129_0, arg_129_1, arg_129_2)
		if arg_129_0 == UIItemList.EventUpdate then
			local var_129_0 = arg_128_2[arg_129_1 + 1]

			if arg_128_3 then
				var_129_0 = i18n(var_129_0)
			end

			arg_129_2.name = arg_129_1

			setScrollText(arg_129_2:Find("mask/Text"), var_129_0)
		end
	end)
	var_128_0:align(#arg_128_2)
end

function var_0_0.SetSingleOptions(arg_130_0, arg_130_1, arg_130_2, arg_130_3)
	for iter_130_0 = 0, arg_130_1.childCount - 1 do
		local var_130_0 = arg_130_1:GetChild(iter_130_0)

		arg_130_0:SetOptionSelect(arg_130_1:GetChild(iter_130_0), iter_130_0 == arg_130_0.filterValuesTemp[arg_130_2])

		if not arg_130_3 then
			onButton(arg_130_0, var_130_0, function()
				arg_130_0.filterValuesTemp[arg_130_2] = iter_130_0

				for iter_131_0 = 0, arg_130_1.childCount - 1 do
					arg_130_0:SetOptionSelect(arg_130_1:GetChild(iter_131_0), iter_131_0 == iter_130_0)
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetMultiOptions(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	for iter_132_0 = 0, arg_132_1.childCount - 1 do
		local var_132_0 = arg_132_1:GetChild(iter_132_0)

		arg_132_0:SetOptionSelect(arg_132_1:GetChild(iter_132_0), table.contains(arg_132_0.filterValuesTemp[arg_132_2], iter_132_0))

		if not arg_132_3 then
			onButton(arg_132_0, var_132_0, function()
				if iter_132_0 == 0 then
					arg_132_0.filterValuesTemp[arg_132_2] = {
						0
					}

					for iter_133_0 = 0, arg_132_1.childCount - 1 do
						arg_132_0:SetOptionSelect(arg_132_1:GetChild(iter_133_0), iter_133_0 == 0)
					end
				else
					table.removebyvalue(arg_132_0.filterValuesTemp[arg_132_2], 0)

					if table.contains(arg_132_0.filterValuesTemp[arg_132_2], iter_132_0) then
						table.removebyvalue(arg_132_0.filterValuesTemp[arg_132_2], iter_132_0)
					else
						table.insert(arg_132_0.filterValuesTemp[arg_132_2], iter_132_0)
					end

					local var_133_0 = true

					for iter_133_1 = 1, arg_132_1.childCount - 1 do
						if not table.contains(arg_132_0.filterValuesTemp[arg_132_2], iter_133_1) then
							var_133_0 = false

							break
						end
					end

					if #arg_132_0.filterValuesTemp[arg_132_2] == 0 then
						var_133_0 = true
					end

					if var_133_0 then
						arg_132_0.filterValuesTemp[arg_132_2] = {
							0
						}
					end

					for iter_133_2 = 0, arg_132_1.childCount - 1 do
						arg_132_0:SetOptionSelect(arg_132_1:GetChild(iter_133_2), table.contains(arg_132_0.filterValuesTemp[arg_132_2], iter_133_2))
					end
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetOptionSelect(arg_134_0, arg_134_1, arg_134_2)
	setActive(arg_134_1:Find("selectedFrame"), arg_134_2)

	local var_134_0

	if IsNil(arg_134_1:Find("Text")) then
		var_134_0 = arg_134_1:Find("mask/Text"):GetComponent(typeof(Text))
	else
		var_134_0 = arg_134_1:Find("Text"):GetComponent(typeof(Text))
	end

	if arg_134_2 then
		var_134_0.color = Color.New(1, 1, 1, 1)
	else
		var_134_0.color = Color.New(0, 0, 0, 0.5)
	end
end

function var_0_0.GetSkinClassify(arg_135_0)
	arg_135_0.classifyIds = {}
	arg_135_0.classifyNames = {}

	local var_135_0 = {}
	local var_135_1 = {}

	for iter_135_0, iter_135_1 in ipairs(arg_135_0.commodities) do
		local var_135_2 = arg_135_0:GetShopTypeIdBySkinId(iter_135_1:getSkinId())
		local var_135_3 = var_135_2 == 0 and var_0_16 or var_135_2

		var_135_1[var_135_3] = (var_135_1[var_135_3] or 0) + 1
	end

	local var_135_4 = {}

	for iter_135_2, iter_135_3 in ipairs(arg_135_0.returnSkins) do
		var_135_4[iter_135_3] = true
	end

	if underscore.any(arg_135_0.commodities, function(arg_136_0)
		return var_135_4[arg_136_0.id]
	end) then
		table.insert(var_135_0, var_0_14)
	end

	for iter_135_4, iter_135_5 in ipairs(pg.skin_page_template.all) do
		if iter_135_5 ~= var_0_17 and iter_135_5 ~= var_0_18 and (var_135_1[iter_135_5] or 0) > 0 then
			table.insert(var_135_0, iter_135_5)
		end
	end

	if arg_135_0.mode == var_0_0.MODE_EXPERIENCE then
		table.insert(var_135_0, 1, var_0_13)
	end

	if arg_135_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_135_0, 1, var_0_15)
	end

	table.insert(var_135_0, 1, var_0_12)

	arg_135_0.classifyIds = var_135_0

	for iter_135_6, iter_135_7 in ipairs(arg_135_0.classifyIds) do
		if iter_135_7 == var_0_12 then
			table.insert(arg_135_0.classifyNames, i18n("shop_filter_all"))
		elseif iter_135_7 == var_0_13 or iter_135_7 == var_0_15 then
			table.insert(arg_135_0.classifyNames, i18n("shop_filter_trial"))
		elseif iter_135_7 == var_0_14 then
			table.insert(arg_135_0.classifyNames, i18n("shop_filter_retro"))
		else
			table.insert(arg_135_0.classifyNames, pg.skin_page_template[iter_135_7].name)
		end
	end
end

function var_0_0.GetShopTypeIdBySkinId(arg_137_0, arg_137_1)
	local var_137_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not arg_137_0.shopTypeIdList then
		arg_137_0.shopTypeIdList = {}
	end

	if arg_137_0.shopTypeIdList[arg_137_1] then
		return arg_137_0.shopTypeIdList[arg_137_1]
	end

	for iter_137_0, iter_137_1 in pairs(var_137_0) do
		for iter_137_2, iter_137_3 in ipairs(iter_137_1) do
			arg_137_0.shopTypeIdList[iter_137_3] = iter_137_0

			if iter_137_3 == arg_137_1 then
				return iter_137_0
			end
		end
	end
end

function var_0_0.OnShopping(arg_138_0, arg_138_1)
	if not arg_138_0.showingCommodity then
		return
	end

	if arg_138_0.purchaseView and arg_138_0.purchaseView:GetLoaded() then
		arg_138_0.purchaseView:Hide()
	end

	if arg_138_0.showingCommodity.id == arg_138_1 then
		arg_138_0:GetAllCommodities()
		arg_138_0:Refresh(true)
	end
end

function var_0_0.OnFurnitureUpdate(arg_139_0, arg_139_1)
	if not arg_139_0.showingCommodity then
		return
	end

	local var_139_0 = arg_139_0.showingCommodity.id

	if Goods.ExistFurniture(var_139_0) and Goods.Id2FurnitureId(var_139_0) == arg_139_1 then
		arg_139_0:GetAllCommodities()
		arg_139_0:Refresh(true)
	end
end

function var_0_0.willExit(arg_140_0)
	arg_140_0:ClearCards()
	ClearLScrollrect(arg_140_0.scrollrect)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_140_0:getUIName())

	if arg_140_0.live2dChar then
		arg_140_0.live2dChar:Dispose()

		arg_140_0.live2dChar = nil
	end

	if arg_140_0.voucherMsgBox then
		arg_140_0.voucherMsgBox:Destroy()

		arg_140_0.voucherMsgBox = nil
	end

	if arg_140_0.purchaseView then
		arg_140_0.purchaseView:Destroy()

		arg_140_0.purchaseView = nil
	end

	for iter_140_0, iter_140_1 in pairs(arg_140_0.downloads) do
		iter_140_1:Dispose()
	end

	arg_140_0.downloads = {}

	arg_140_0:ClearPainting()

	if arg_140_0.interactionPreview then
		arg_140_0.interactionPreview:Dispose()

		arg_140_0.interactionPreview = nil
	end

	arg_140_0:disposeEvent()
	arg_140_0:ClearTimer()
	arg_140_0:ReturnChar()
	arg_140_0:UnOverlay()
end

function var_0_0.onBackPressed(arg_141_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

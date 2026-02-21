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

function var_0_0.getGroupName(arg_3_0)
	return "NewShopMainScene"
end

function var_0_0.init(arg_4_0)
	arg_4_0.bgs = arg_4_0._tf:Find("bgs")
	arg_4_0.adapt = arg_4_0._tf:Find("adapt")
	arg_4_0.top = arg_4_0.adapt:Find("top")
	arg_4_0.bottom = arg_4_0.adapt:Find("bottom")
	arg_4_0.right = arg_4_0.adapt:Find("right")
	arg_4_0.subPage = arg_4_0.adapt:Find("subPage")
	arg_4_0.resources = arg_4_0.adapt:Find("top/resources")
	arg_4_0.limitTime = arg_4_0.adapt:Find("top/title/limit_time/Text")
	arg_4_0.skinName = arg_4_0.adapt:Find("top/title/skin_name_mask/skin_name")
	arg_4_0.shipName = arg_4_0.adapt:Find("top/title/name_mask/name")
	arg_4_0.changeSkin = arg_4_0.adapt:Find("top/change_skin")
	arg_4_0.changeSkinToggle = ChangeSkinToggle.New(findTF(arg_4_0.changeSkin, "toggle_ui"))
	arg_4_0.showOwnBtn = arg_4_0.adapt:Find("bottom/showOwnBtn")
	arg_4_0.filterBtn = arg_4_0.adapt:Find("bottom/filterBtn")
	arg_4_0.search = arg_4_0.adapt:Find("bottom/search")
	arg_4_0.scrollrect = arg_4_0.adapt:Find("bottom/scroll/content"):GetComponent("LScrollRect")
	arg_4_0.sdTg = arg_4_0.adapt:Find("right/sdTg")
	arg_4_0.hideUITg = arg_4_0.adapt:Find("right/hideUITg")
	arg_4_0.charContainer = arg_4_0.adapt:Find("right/char_container")
	arg_4_0.backChara = arg_4_0.charContainer:Find("bg/back/chara")
	arg_4_0.charTf = arg_4_0.charContainer:Find("char")
	arg_4_0.furnitureContainer = arg_4_0.charContainer:Find("fur")
	arg_4_0.switchPreviewBtn = arg_4_0.charContainer:Find("switch")
	arg_4_0.dynamicToggle = arg_4_0.adapt:Find("right/functionsAndTags/dynamic")
	arg_4_0.dynamicIcon = arg_4_0.adapt:Find("right/functionsAndTags/dynamic/icon")
	arg_4_0.showBgToggle = arg_4_0.adapt:Find("right/functionsAndTags/showBg")
	arg_4_0.dynamicResToggle = arg_4_0.adapt:Find("right/functionsAndTags/dynamic/l2d_res_state")
	arg_4_0.tagList = UIItemList.New(arg_4_0.adapt:Find("right/functionsAndTags/tags"), arg_4_0.adapt:Find("right/functionsAndTags/tags/tag"))
	arg_4_0.giftPackBtn = arg_4_0.adapt:Find("right/giftPackBtn")
	arg_4_0.price = arg_4_0.adapt:Find("right/price")
	arg_4_0.btns = arg_4_0.price:Find("btns")
	arg_4_0.filterUI = arg_4_0.adapt:Find("subPage/filterUI")
	arg_4_0.filterContent = arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content")
	arg_4_0.painting = arg_4_0._tf:Find("painting")
	arg_4_0.paintingTF = arg_4_0._tf:Find("painting/paint")
	arg_4_0.defaultPaintingPosition = arg_4_0.paintingTF.anchoredPosition
	arg_4_0.defaultPaintingScale = arg_4_0.paintingTF.localScale
	arg_4_0.live2dContainer = arg_4_0._tf:Find("painting/paint/live2d")
	arg_4_0.spTF = arg_4_0._tf:Find("painting/paint/spinePainting")
	arg_4_0.spBg = arg_4_0._tf:Find("painting/paintBg/spinePainting")

	setActive(arg_4_0.charContainer, false)
	setActive(arg_4_0.filterUI, false)

	arg_4_0.mainTitle = arg_4_0.adapt:Find("top/mainTitle")
	arg_4_0.backBtn = arg_4_0.adapt:Find("top/closeBtn")
	arg_4_0.homeBtn = arg_4_0.adapt:Find("top/homeBtn")
	arg_4_0.giftPack = arg_4_0.adapt:Find("giftPack")

	setActive(arg_4_0.mainTitle, false)
	setActive(arg_4_0.backBtn, false)
	setActive(arg_4_0.homeBtn, false)
	setActive(arg_4_0.giftPack, false)

	arg_4_0.downloads = {}
	arg_4_0.isToggleDynamic = false
	arg_4_0.isToggleShowBg = true
	arg_4_0.isPreviewFurniture = false
	arg_4_0.interactionPreview = BackYardInteractionPreview.New(arg_4_0.furnitureContainer, Vector3(0, 0, 0))
	arg_4_0.voucherMsgBox = SkinVoucherMsgBox.New(pg.UIMgr.GetInstance().OverlayMain)
	arg_4_0.purchaseView = NewSkinShopPurchaseView.New(arg_4_0._tf, arg_4_0.event)

	arg_4_0:RegisterEvent()
	setGray(arg_4_0.btns:Find("yigoumai_button"), true, true)
	setText(arg_4_0._tf:Find("bgs/empty/Text"), i18n("shop_new_unfound"))
	setText(arg_4_0.adapt:Find("top/mainTitle/Text"), i18n("shop_new_shop"))
	setText(arg_4_0.filterBtn:Find("Text"), i18n("shop_new_sort"))
	setText(arg_4_0.search:Find("holder"), i18n("shop_new_search"))
	setText(arg_4_0.btns:Find("yigoumai_button/Text"), i18n("shop_new_purchased"))
	setText(arg_4_0.btns:Find("goumai_button/Text"), i18n("shop_new_purchase"))
	setText(arg_4_0.btns:Find("qianwanghuoqu_button/Text"), i18n("shop_new_claim"))
	setText(arg_4_0.btns:Find("furniture_shop/Text"), i18n("shop_new_furniture"))
	setText(arg_4_0.btns:Find("item_buy/Text"), i18n("shop_new_discount"))
	setText(arg_4_0.btns:Find("tiyan_btn/Text"), i18n("shop_new_try"))
	setText(arg_4_0.btns:Find("buy_with_gift/Text"), i18n("shop_new_purchase"))
	setText(arg_4_0.price:Find("btn/tag/Text"), i18n("shop_new_gift"))
	setText(arg_4_0.giftPack:Find("panel/desc"), i18n("shop_new_gem_transform"))
	setText(arg_4_0.giftPack:Find("price/btns/yigoumai_button/Text"), i18n("shop_new_purchased"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/title"), i18n("shop_new_sort"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/subTitleFrame/subTitle"), i18n("shop_new_review"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/0/Text"), i18n("shop_new_all"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/1/Text"), i18n("shop_new_owned"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/2/Text"), i18n("shop_new_havent_own"))
	setScrollText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/own/options/3/mask/Text"), i18n("shop_new_unused"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle"), i18n("shop_new_type"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/0/Text"), i18n("shop_new_all"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/2/Text"), i18n("shop_new_static"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/3/Text"), i18n("shop_new_dynamic"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/4/Text"), i18n("shop_new_static_bg"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/5/Text"), i18n("shop_new_dynamic_bg"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/type/options/6/Text"), i18n("shop_new_bgm"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/subTitleFrame/subTitle"), i18n("shop_new_index"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/0/Text"), i18n("shop_new_all"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/1/Text"), i18n("shop_new_ship_owned"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipHave/options/2/Text"), i18n("shop_new_ship_havent_owned"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/camp/subTitleFrame/subTitle"), i18n("shop_new_nation"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/rarity/subTitleFrame/subTitle"), i18n("shop_new_rarity"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/shipType/subTitleFrame/subTitle"), i18n("shop_new_category"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/filterScroll/Viewport/Content/themeType/subTitleFrame/subTitle"), i18n("shop_new_skin_theme"))
	setText(arg_4_0.filterUI:Find("panelMask/panel/bottom/ok/Text"), i18n("shop_new_confirm"))
	arg_4_0:Overlay()
end

function var_0_0.Overlay(arg_5_0)
	arg_5_0:OverlayPanel(arg_5_0.adapt, {
		pbList = {
			arg_5_0.top:Find("title"),
			arg_5_0.top:Find("title/limit_time"),
			arg_5_0.top:Find("title/charaNameBg"),
			arg_5_0.showOwnBtn,
			arg_5_0.filterBtn,
			arg_5_0.search,
			arg_5_0.charContainer:Find("bg"),
			arg_5_0.price:Find("consume"),
			arg_5_0.filterUI:Find("panelMask/panel")
		}
	})
end

function var_0_0.UnOverlay(arg_6_0)
	arg_6_0:UnOverlayPanel(arg_6_0.adapt, arg_6_0._tf)
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:InitData()
	arg_7_0:SetFilterPanel()
	arg_7_0:SetResource()

	if arg_7_0.mode == var_0_0.MODE_EXPERIENCE or arg_7_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI_2, false)
		setActive(arg_7_0.showOwnBtn, false)
		setActive(arg_7_0.filterBtn, false)
		setActive(arg_7_0.search, false)

		arg_7_0.top:Find("title").anchoredPosition = Vector2(184.2, -208.3)
		arg_7_0.top:Find("change_skin").anchoredPosition = Vector2(70.7, -337.8)
		arg_7_0.right:Find("giftPackBtn").anchoredPosition = Vector2(-483, -446.4)
		arg_7_0.right:Find("price").anchoredPosition = Vector2(-238.3, -140.7)
		arg_7_0.bottom:Find("scroll").offsetMin = Vector2(17.7, 0)
		arg_7_0.bottom:Find("scroll").offsetMax = Vector2(-718.7, 227.9)
	end

	arg_7_0:SetGiftPackLayer()
	onDelayTick(function()
		arg_7_0:SetSkinScroll()
		arg_7_0:Refresh(true)
	end, 0.001)
	onButton(arg_7_0, arg_7_0.backBtn, function()
		arg_7_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.homeBtn, function()
		arg_7_0:emit(var_0_0.ON_HOME)
	end, SFX_CANCEL)
	onButton(arg_7_0, arg_7_0.filterBtn, function()
		arg_7_0:OpenFilterPanel()
	end, SFX_PANEL)

	if arg_7_0.mode == var_0_0.MODE_EXPERIENCE or arg_7_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		getProxy(SettingsProxy):SetNextTipTimeLimitSkinShop()
	end

	local var_7_0 = getProxy(PlayerProxy):getRawData().id

	onToggle(arg_7_0, arg_7_0.sdTg, function(arg_12_0)
		setActive(arg_7_0.charContainer, arg_12_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_7_0, arg_12_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_7_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_7_0, 0)

	triggerToggle(arg_7_0.sdTg, var_7_1 == 1)
	onToggle(arg_7_0, arg_7_0.hideUITg, function(arg_13_0)
		setActive(arg_7_0.top, not arg_13_0)
		setActive(arg_7_0.bottom, not arg_13_0)
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_13_0)
	end, SFX_PANEL)
	onInputChanged(arg_7_0, arg_7_0.search, function()
		arg_7_0:Refresh(true)

		local var_14_0 = getInputText(arg_7_0.search)

		setActive(arg_7_0.search:Find("holder"), var_14_0 == "")
	end)
	onButton(arg_7_0, arg_7_0.showOwnBtn, function()
		arg_7_0:emit(LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER)
	end, SFX_PANEL)
	getProxy(CommanderManualProxy):TaskProgressAdd(2021, 1)
end

function var_0_0.SetResource(arg_16_0)
	local var_16_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_16_0.resources:Find("gem/Text"), var_16_0:getTotalGem())
	onButton(arg_16_0, arg_16_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.InitData(arg_18_0)
	arg_18_0.type = arg_18_0.contextData.type or var_0_0.TYPE_PERMANANT_SKIN
	arg_18_0.mode = arg_18_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_18_0:GetAllCommodities()
	arg_18_0:GetGiftPackCommodities()

	arg_18_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()

	arg_18_0:GetSkinClassify()

	local var_18_0 = (arg_18_0.mode == var_0_0.MODE_EXPERIENCE or arg_18_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM) and 1 or 0

	arg_18_0.filterValues = {
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
			var_18_0
		}
	}
	arg_18_0.filterValuesTemp = Clone(arg_18_0.filterValues)
end

function var_0_0.GetAllCommodities(arg_19_0)
	if arg_19_0.type == var_0_0.TYPE_NEW_SKIN then
		arg_19_0.commodities = getProxy(ShipSkinProxy):GetInTimeSkins()
	elseif arg_19_0.type == var_0_0.TYPE_PERMANANT_SKIN then
		arg_19_0.commodities = getProxy(ShipSkinProxy):GetPermanentSkins()
	end

	if LOCK_SKIN_US then
		local var_19_0 = pg.gameset.levellimit_skintype.key_value
		local var_19_1 = pg.gameset.levellimit_skintype.description

		if var_19_0 >= getProxy(PlayerProxy):getData().level then
			arg_19_0.commodities = _.filter(arg_19_0.commodities, function(arg_20_0)
				local var_20_0 = pg.ship_skin_template[arg_20_0:getSkinId()].shop_type_id

				return table.contains(var_19_1, var_20_0)
			end)
		end
	end

	if arg_19_0.mode == var_0_0.MODE_OVERVIEW then
		for iter_19_0 = #arg_19_0.commodities, 1, -1 do
			if arg_19_0.commodities[iter_19_0]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				table.remove(arg_19_0.commodities, iter_19_0)
			end
		end
	end
end

function var_0_0.GetGiftPackCommodities(arg_21_0)
	arg_21_0.giftPackCommodities = {}
	arg_21_0.giftSkinCommodities = {}
	arg_21_0.giftSkinProbabilitys = {}

	for iter_21_0, iter_21_1 in ipairs(pg.pay_data_display.all) do
		local var_21_0 = pg.pay_data_display[iter_21_1]

		if var_21_0.skin_inquire_relation ~= 0 and pg.TimeMgr.GetInstance():inTime(var_21_0.time) then
			local var_21_1 = getProxy(ShopsProxy):GetGiftCommodity(iter_21_1, Goods.TYPE_CHARGE)

			arg_21_0.giftPackCommodities[iter_21_1] = var_21_1

			local var_21_2 = var_21_1:GetSkinProbability()

			arg_21_0.giftSkinCommodities[iter_21_1] = getProxy(ShipSkinProxy):GetProbabilitySkins(var_21_2)
			arg_21_0.giftSkinProbabilitys[iter_21_1] = getProxy(ShipSkinProxy):GetSkinProbabilitys(var_21_2)
		end
	end
end

function var_0_0.SetSkinScroll(arg_22_0)
	arg_22_0.scrollrect.isNewLoadingMethod = true

	function arg_22_0.scrollrect.onInitItem(arg_23_0)
		arg_22_0:OnInitItem(arg_23_0)
	end

	function arg_22_0.scrollrect.onUpdateItem(arg_24_0, arg_24_1)
		arg_22_0:OnUpdateItem(arg_24_0, arg_24_1)
	end

	arg_22_0.scrollrect.enabled = true
end

function var_0_0.Refresh(arg_25_0, arg_25_1)
	arg_25_0:ClearCards()

	arg_25_0.cards = {}
	arg_25_0.displays = {}

	local var_25_0 = getInputText(arg_25_0.search)

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.commodities) do
		if arg_25_0:filterOk(iter_25_1) and arg_25_0:IsSearchType(var_25_0, iter_25_1) then
			table.insert(arg_25_0.displays, iter_25_1)
		end
	end

	local var_25_1 = {}

	for iter_25_2, iter_25_3 in ipairs(arg_25_0.displays) do
		local var_25_2 = iter_25_3.type == Goods.TYPE_ACTIVITY or iter_25_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_25_3 = 0

		if not var_25_2 then
			var_25_3 = iter_25_3:GetPrice()
		end

		var_25_1[iter_25_3.id] = var_25_3
	end

	table.sort(arg_25_0.displays, function(arg_26_0, arg_26_1)
		return arg_25_0:Sort(arg_26_0, arg_26_1, var_25_1)
	end)

	local var_25_4 = #arg_25_0.displays == 0

	setActive(arg_25_0.bgs:Find("default"), var_25_4)
	setActive(arg_25_0.bgs:Find("diffBg"), not var_25_4)
	setActive(arg_25_0.bgs:Find("empty"), var_25_4)
	setActive(arg_25_0._tf:Find("leftMask"), not var_25_4)
	setActive(arg_25_0._tf:Find("bottomMask"), not var_25_4)
	setActive(arg_25_0.painting, not var_25_4)
	setActive(arg_25_0.top:Find("title"), not var_25_4)
	setActive(arg_25_0.changeSkin, not var_25_4)
	setActive(arg_25_0.right, not var_25_4)
	setActive(arg_25_0.right, not var_25_4)
	setActive(arg_25_0.bottom:Find("scroll"), not var_25_4)

	if not var_25_4 then
		if arg_25_1 then
			arg_25_0.triggerFirstCard = true

			arg_25_0.scrollrect:SetTotalCount(#arg_25_0.displays, 0)
		else
			arg_25_0.scrollrect:SetTotalCount(#arg_25_0.displays)
		end
	end
end

function var_0_0.IsSearchType(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_1 or arg_27_1 == "" then
		return true
	end

	local var_27_0 = arg_27_2:getSkinId()

	return ShipSkin.New({
		id = var_27_0
	}):IsMatchKey(arg_27_1)
end

local function var_0_20(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_2[arg_28_0.id]
	local var_28_1 = arg_28_2[arg_28_1.id]

	if var_28_0 == var_28_1 then
		return arg_28_0.id < arg_28_1.id
	else
		return var_28_1 < var_28_0
	end
end

function var_0_0.Sort(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = arg_29_1.buyCount == 0 and 1 or 0
	local var_29_1 = arg_29_2.buyCount == 0 and 1 or 0

	if var_29_0 == var_29_1 then
		local var_29_2 = arg_29_1:getConfig("order")
		local var_29_3 = arg_29_2:getConfig("order")

		if var_29_2 == var_29_3 then
			return var_0_20(arg_29_1, arg_29_2, arg_29_3)
		else
			return var_29_2 < var_29_3
		end
	else
		return var_29_1 < var_29_0
	end
end

function var_0_0.filterOk(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.filterValues.ownType
	local var_30_1 = arg_30_0.filterValues.typeType
	local var_30_2 = arg_30_0.filterValues.shipHaveType
	local var_30_3 = arg_30_0.filterValues.campType
	local var_30_4 = arg_30_0.filterValues.rarityType
	local var_30_5 = arg_30_0.filterValues.shipType
	local var_30_6 = arg_30_0.filterValues.themeType
	local var_30_7 = arg_30_1:getSkinId()
	local var_30_8 = ShipSkin.New({
		id = var_30_7
	})
	local var_30_9 = var_30_8:GetDefaultShipConfig()
	local var_30_10 = arg_30_0:ToVShip(var_30_9)

	if var_30_0 ~= 0 then
		local var_30_11 = false
		local var_30_12 = getProxy(ShipSkinProxy):hasSkin(var_30_7)
		local var_30_13 = var_30_8:NoUse()

		if var_30_0 == 1 and var_30_12 then
			var_30_11 = true
		end

		if var_30_0 == 2 and not var_30_12 then
			var_30_11 = true
		end

		if var_30_0 == 3 and var_30_12 and var_30_13 then
			var_30_11 = true
		end

		if not var_30_11 then
			return false
		end
	end

	if var_30_1[1] ~= 0 then
		local var_30_14 = false

		for iter_30_0, iter_30_1 in ipairs(var_30_1) do
			if iter_30_1 == 1 and (var_30_8:IsLive2d() or var_30_8:IsLive2dPlus()) then
				var_30_14 = true
			end

			if iter_30_1 == 2 and not var_30_8:IsLive2d() and not var_30_8:IsLive2dPlus() and not var_30_8:IsSpine() and not var_30_8:IsSpinePlus() then
				var_30_14 = true
			end

			if iter_30_1 == 3 and (var_30_8:IsSpine() or var_30_8:IsSpinePlus()) then
				var_30_14 = true
			end

			if iter_30_1 == 4 and var_30_8:IsBG() then
				var_30_14 = true
			end

			if iter_30_1 == 5 and var_30_8:IsDbg() then
				var_30_14 = true
			end

			if iter_30_1 == 6 and var_30_8:isBgm() then
				var_30_14 = true
			end

			if var_30_14 then
				break
			end
		end

		if not var_30_14 then
			return false
		end
	end

	if var_30_2 ~= 0 then
		local var_30_15 = false
		local var_30_16 = var_30_8:CantUse()

		if var_30_2 == 1 and not var_30_16 then
			var_30_15 = true
		end

		if var_30_2 == 2 and var_30_16 then
			var_30_15 = true
		end

		if not var_30_15 then
			return false
		end
	end

	if var_30_3[1] ~= 0 then
		local var_30_17 = false

		for iter_30_2, iter_30_3 in ipairs(var_30_3) do
			local var_30_18 = ShipIndexCfg.camp

			for iter_30_4, iter_30_5 in ipairs(var_30_18[iter_30_3 + 1].types) do
				if iter_30_5 == Nation.LINK then
					if var_30_10:getNation() >= Nation.LINK then
						var_30_17 = true
					end
				elseif iter_30_5 == var_30_10:getNation() then
					var_30_17 = true
				end
			end

			if var_30_17 then
				break
			end
		end

		if not var_30_17 then
			return false
		end
	end

	if var_30_4[1] ~= 0 then
		local var_30_19 = false

		for iter_30_6, iter_30_7 in ipairs(var_30_4) do
			local var_30_20 = ShipIndexCfg.rarity

			if table.contains(var_30_20[iter_30_7 + 1].types, var_30_10:getRarity()) then
				var_30_19 = true
			end

			if var_30_19 then
				break
			end
		end

		if not var_30_19 then
			return false
		end
	end

	if var_30_5[1] ~= 0 then
		local var_30_21 = false

		for iter_30_8, iter_30_9 in ipairs(var_30_5) do
			local var_30_22 = ShipIndexCfg.type
			local var_30_23 = var_30_22[iter_30_9 + 1].types

			if iter_30_9 + 1 < 4 then
				local var_30_24 = var_30_22[iter_30_9].shipTypes

				if table.contains(var_30_23, var_30_10:getShipType()) then
					var_30_21 = true
				end

				if table.contains(var_30_23, var_30_10:getTeamType()) then
					var_30_21 = true
				end
			elseif table.contains(var_30_23, var_30_10:getShipType()) then
				var_30_21 = true
			end

			if var_30_21 then
				break
			end
		end

		if not var_30_21 then
			return false
		end
	end

	if var_30_6[1] ~= 0 then
		local var_30_25 = false

		for iter_30_10, iter_30_11 in ipairs(var_30_6) do
			local var_30_26 = arg_30_0.classifyIds[iter_30_11 + 1]

			if arg_30_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				if arg_30_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
					var_30_25 = var_30_26 == var_0_15 and arg_30_0:ExitSkinExperienceItem(arg_30_1.id)
				else
					var_30_25 = var_30_26 == var_0_13
				end
			elseif var_30_26 == var_0_12 then
				var_30_25 = true
			elseif var_30_26 == var_0_14 and table.contains(arg_30_0.returnSkins, arg_30_1.id) then
				var_30_25 = true
			else
				local var_30_27 = arg_30_0:GetShopTypeIdBySkinId(var_30_7)

				var_30_25 = (var_30_27 == 0 and var_0_16 or var_30_27) == var_30_26
			end

			if var_30_25 then
				break
			end
		end

		if not var_30_25 then
			return false
		end
	end

	return true
end

function var_0_0.ToVShip(arg_31_0, arg_31_1)
	if not arg_31_0.vship then
		arg_31_0.vship = {}

		function arg_31_0.vship.getNation()
			return arg_31_0.vship.config.nationality
		end

		function arg_31_0.vship.getShipType()
			return arg_31_0.vship.config.type
		end

		function arg_31_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_31_0.vship.config.type)
		end

		function arg_31_0.vship.getRarity()
			return arg_31_0.vship.config.rarity
		end
	end

	arg_31_0.vship.config = arg_31_1

	return arg_31_0.vship
end

function var_0_0.ExitSkinExperienceItem(arg_36_0, arg_36_1)
	if not arg_36_0.cacheSkinExperienceItems then
		arg_36_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(arg_36_0.cacheSkinExperienceItems, function(arg_37_0)
		return arg_37_0:CanUseForShop(arg_36_1)
	end)
end

function var_0_0.RegisterEvent(arg_38_0)
	arg_38_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_39_0, arg_39_1)
		arg_38_0:AdjustPainting(arg_39_1)
		setActive(arg_38_0.top, not arg_39_1)
		setActive(arg_38_0.bottom, not arg_39_1)
		setActive(arg_38_0.right, not arg_39_1)

		if arg_38_0.live2dChar then
			arg_38_0.live2dChar:setPurchaseOffset(arg_39_1)
		end

		if arg_38_0.spineChar then
			if arg_39_1 then
				local var_39_0 = pg.ship_skin_template[arg_38_0.skinId].purchase_offset

				if var_39_0 and #var_39_0 >= 3 then
					arg_38_0.spineChar:SetLocalPosition(Vector3(var_39_0[1], var_39_0[2], var_39_0[3]))
				end

				if var_39_0 and #var_39_0 >= 4 then
					arg_38_0.spineChar:SetLocalScale(Vector3(var_39_0[4], var_39_0[4], var_39_0[4]))
				end
			else
				arg_38_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
				arg_38_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
			end
		end

		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_39_1)
	end)
	arg_38_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_40_0, arg_40_1)
		local var_40_0 = arg_38_0:GetObtainBtnState(arg_40_1)

		arg_38_0:OnClickBtn(var_40_0, arg_40_1)
	end)
	onButton(arg_38_0, arg_38_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_38_0.skinId) then
			arg_38_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_38_0.skinId)

			arg_38_0:UpdateMainView(arg_38_0.showingCommodity)
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_42_0, arg_42_1)
	local var_42_0 = NewShopSkinCard.New(arg_42_1)

	onButton(arg_42_0, var_42_0._go, function()
		if not var_42_0.commodity then
			return
		end

		for iter_43_0, iter_43_1 in pairs(arg_42_0.cards) do
			iter_43_1:UpdateSelected(false)
		end

		arg_42_0.selectedId = var_42_0.commodity.id

		var_42_0:UpdateSelected(true)
		arg_42_0:UpdateMainView(var_42_0.commodity)
		arg_42_0:GCHandle()
	end, SFX_PANEL)

	arg_42_0.cards[arg_42_1] = var_42_0
end

function var_0_0.OnUpdateItem(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_0.cards[arg_44_2]

	if not var_44_0 then
		arg_44_0:OnInitItem(arg_44_2)

		var_44_0 = arg_44_0.cards[arg_44_2]
	end

	local var_44_1 = arg_44_0.displays[arg_44_1 + 1]

	if not var_44_1 then
		return
	end

	local var_44_2 = arg_44_0.selectedId == var_44_1.id
	local var_44_3 = table.contains(arg_44_0.returnSkins, var_44_1.id)

	var_44_0:Update(var_44_1, var_44_2, var_44_3)

	if arg_44_0.triggerFirstCard and arg_44_1 == 0 then
		arg_44_0.triggerFirstCard = false

		triggerButton(var_44_0._go)
	end
end

function var_0_0.UpdateMainView(arg_45_0, arg_45_1)
	arg_45_0.skinId = arg_45_1:getSkinId()

	local var_45_0 = ShipSkin.IsChangeSkin(arg_45_0.skinId)

	setActive(arg_45_0.changeSkin, var_45_0)

	if var_45_0 then
		arg_45_0:FlushChangeSkin(arg_45_1)
	end

	arg_45_0.shipSkin = ShipSkin.New({
		id = arg_45_0.skinId
	})

	arg_45_0:FlushName()
	arg_45_0:FlushPreviewBtn(arg_45_1)
	arg_45_0:FlushTimeLimit(arg_45_1)
	arg_45_0:SwitchPreview(arg_45_1, arg_45_0.isPreviewFurniture)
	arg_45_0:FlushPaintingToggle(arg_45_1)
	arg_45_0:FlushTag()
	arg_45_0:FlushBG(arg_45_1)
	arg_45_0:FlushPainting(arg_45_1)
	arg_45_0:FlushPrice(arg_45_1)
	arg_45_0:FlushObtainBtn(arg_45_1)
	arg_45_0:FlushGifgPackBtn(arg_45_1)

	arg_45_0.showingCommodity = arg_45_1
end

function var_0_0.FlushChangeSkin(arg_46_0, arg_46_1)
	local var_46_0 = ShipSkin.GetChangeSkinGroupId(arg_46_0.skinId)
	local var_46_1 = ShipSkin.GetChangeSkinCustomDataId(arg_46_0.skinId, "hide_shop")
	local var_46_2 = pg.gameset.changeskin_switch_block
	local var_46_3 = false
	local var_46_4 = false
	local var_46_5 = arg_46_0.changeSkinToggle:IsAsmrSkin() and true or false

	if var_46_2 and var_46_2.description then
		local var_46_6 = var_46_2.description

		if table.contains(var_46_6, var_46_0) then
			local var_46_7 = HXSet.isHx()

			if arg_46_1.buyCount <= 0 and var_46_7 then
				var_46_4 = true
			end
		end
	end

	if var_46_1 and var_46_1 == 1 then
		var_46_3 = true
	end

	if not arg_46_0.changeSkinId then
		arg_46_0.changeSkinId = arg_46_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_46_0.changeSkinId) == var_46_0 then
		arg_46_0.skinId = arg_46_0.changeSkinId
	else
		arg_46_0.changeSkinId = arg_46_0.skinId
	end

	arg_46_0.changeSkinToggle:setSkinData(arg_46_0.skinId)

	if var_46_3 or var_46_4 or var_46_5 then
		setActive(arg_46_0.changeSkin, false)
	else
		setActive(arg_46_0.changeSkin, true)
	end
end

function var_0_0.GCHandle(arg_47_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.FlushName(arg_48_0)
	local var_48_0 = pg.ship_skin_template[arg_48_0.skinId]

	setScrollText(arg_48_0.skinName, SwitchSpecialChar(var_48_0.name, true))

	if var_48_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_48_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_48_0.skinId)))
	else
		local var_48_1 = ShipGroup.getDefaultShipConfig(var_48_0.ship_group)

		setScrollText(arg_48_0.shipName, var_48_1.name)
	end
end

function var_0_0.FlushPreviewBtn(arg_49_0, arg_49_1)
	local var_49_0 = Goods.ExistFurniture(arg_49_1.id)

	removeOnButton(arg_49_0.switchPreviewBtn)

	if not var_49_0 and arg_49_0.isPreviewFurniture then
		arg_49_0.isPreviewFurniture = false
	end

	setActive(arg_49_0.switchPreviewBtn, var_49_0)

	if var_49_0 then
		onButton(arg_49_0, arg_49_0.switchPreviewBtn, function()
			arg_49_0.isPreviewFurniture = not arg_49_0.isPreviewFurniture

			arg_49_0:SwitchPreview(arg_49_1, arg_49_0.isPreviewFurniture)
			arg_49_0:FlushPrice(arg_49_1)
			arg_49_0:FlushObtainBtn(arg_49_1)
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPreview(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_0.skinId

	if pg.ship_skin_template[var_51_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_51_0.charContainer, false)

		return
	end

	local var_51_1 = getProxy(PlayerProxy):getRawData().id

	setActive(arg_51_0.charContainer, PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_51_1, 0) == 1)
	setActive(arg_51_0.charTf, not arg_51_2)
	setActive(arg_51_0.furnitureContainer, arg_51_2)

	if not arg_51_2 then
		local var_51_2 = pg.ship_skin_template[var_51_0]

		arg_51_0:FlushChar(var_51_2.prefab, var_51_2.id)
		GetImageSpriteFromAtlasAsync("qicon/" .. var_51_2.painting, "", arg_51_0.backChara)
	else
		local var_51_3 = Goods.Id2FurnitureId(arg_51_1.id)
		local var_51_4 = Goods.GetFurnitureConfig(arg_51_1.id)

		arg_51_0.interactionPreview:Flush(var_51_0, var_51_3, var_51_4.scale[2] or 1, var_51_4.position[2])
	end
end

function var_0_0.FlushChar(arg_52_0, arg_52_1, arg_52_2)
	if arg_52_0.prefabName and arg_52_0.prefabName == arg_52_1 then
		return
	end

	arg_52_0:ReturnChar()

	arg_52_0.prefabName = arg_52_1

	local var_52_0 = SpineAnimChar.New()

	var_52_0:SetPaint(arg_52_1)
	var_52_0:Load(true, function(arg_53_0)
		if arg_52_0.prefabName ~= arg_52_1 then
			arg_53_0:Dispose()

			return
		end

		arg_52_0.spineChar = arg_53_0

		local var_53_0 = pg.skinshop_spine_scale[arg_52_2]

		if var_53_0 then
			arg_52_0.spineChar:SetLocalScale(Vector3(var_53_0.skinshop_scale, var_53_0.skinshop_scale, 1))
		else
			arg_52_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
		end

		arg_52_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
		arg_52_0.spineChar:SetLayer(Layer.UI)
		arg_52_0.spineChar:SetParent(arg_52_0.charTf)
		arg_52_0.spineChar:SetAction("normal", 0)
	end)
end

function var_0_0.ReturnChar(arg_54_0)
	if arg_54_0.spineChar then
		arg_54_0.spineChar:Dispose()

		arg_54_0.spineChar = nil
		arg_54_0.prefabName = nil
	end
end

function var_0_0.ClearCards(arg_55_0)
	if not arg_55_0.cards then
		return
	end

	for iter_55_0, iter_55_1 in pairs(arg_55_0.cards) do
		iter_55_1:Dispose()
	end

	arg_55_0.cards = nil
end

function var_0_0.FlushTimeLimit(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0.skinId
	local var_56_1 = false
	local var_56_2

	if arg_56_1:IsActivityExtra() and arg_56_1:ShowMaintenanceTime() then
		local var_56_3, var_56_4 = arg_56_1:GetMaintenanceMonthAndDay()

		function var_56_2()
			return i18n("limit_skin_time_before_maintenance", var_56_3, var_56_4)
		end

		var_56_1 = true
	elseif arg_56_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_56_5 = getProxy(ShipSkinProxy):getSkinById(var_56_0)

		var_56_1 = var_56_5 and var_56_5:isExpireType() and not var_56_5:isExpired()

		if var_56_1 then
			function var_56_2()
				return skinTimeStamp(var_56_5:getRemainTime())
			end
		end
	else
		local var_56_6, var_56_7 = pg.TimeMgr.GetInstance():inTime(arg_56_1:getConfig("time"))

		var_56_1 = var_56_7

		if var_56_1 then
			local var_56_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_56_7)

			function var_56_2()
				return skinCommdityTimeStamp(var_56_8)
			end
		end
	end

	setActive(arg_56_0.top:Find("title/limit_time"), var_56_1)
	arg_56_0:ClearTimer()

	if var_56_1 then
		arg_56_0:AddTimer(var_56_2)
	end
end

function var_0_0.AddTimer(arg_60_0, arg_60_1)
	arg_60_0.timer = Timer.New(function()
		setText(arg_60_0.limitTime, arg_60_1())
	end, 1, -1)

	arg_60_0.timer.func()
	arg_60_0.timer:Start()
end

function var_0_0.ClearTimer(arg_62_0)
	if arg_62_0.timer then
		arg_62_0.timer:Stop()

		arg_62_0.timer = nil
	end
end

function var_0_0.FlushPaintingToggle(arg_63_0, arg_63_1)
	removeOnToggle(arg_63_0.dynamicToggle)
	removeOnToggle(arg_63_0.showBgToggle)

	local var_63_0 = checkABExist("painting/" .. arg_63_0.shipSkin:getConfig("painting") .. "_n")

	if arg_63_0.isToggleShowBg and not var_63_0 then
		triggerToggle(arg_63_0.showBgToggle, false)

		arg_63_0.isToggleShowBg = false
	elseif var_63_0 then
		triggerToggle(arg_63_0.showBgToggle, true)

		arg_63_0.isToggleShowBg = true
	end

	local var_63_1 = arg_63_0.shipSkin:IsSpine() or arg_63_0.shipSkin:IsLive2d() or arg_63_0.shipSkin:IsSpinePlus() or arg_63_0.shipSkin:IsLive2dPlus()
	local var_63_2 = arg_63_0.shipSkin:IsHxDynamicPreview()

	if var_63_1 and not var_63_2 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_63_0.isToggleDynamic = true
	end

	if var_63_1 then
		local var_63_3 = 0

		if arg_63_0.shipSkin:IsSpine() then
			var_63_3 = 6
		elseif arg_63_0.shipSkin:IsLive2d() then
			var_63_3 = 1
		elseif arg_63_0.shipSkin:IsSpinePlus() then
			var_63_3 = 7
		elseif arg_63_0.shipSkin:IsLive2dPlus() then
			var_63_3 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_63_3) .. "_off", arg_63_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_63_3), arg_63_0.dynamicToggle:Find("select"))
	end

	if var_63_2 and arg_63_0.isToggleDynamic then
		triggerToggle(arg_63_0.dynamicToggle, false)

		arg_63_0.isToggleDynamic = false
	end

	if arg_63_0.isToggleDynamic and not var_63_1 then
		triggerToggle(arg_63_0.dynamicToggle, false)

		arg_63_0.isToggleDynamic = false
	elseif arg_63_0.isToggleDynamic and not arg_63_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_63_0.shipSkin:IsLive2d() or arg_63_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_63_0.isToggleDynamic = false

			local var_63_4 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_63_4, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_63_0.dynamicToggle, false)
		else
			triggerToggle(arg_63_0.dynamicToggle, true)

			arg_63_0.isToggleDynamic = true
		end
	end

	if var_63_0 then
		onToggle(arg_63_0, arg_63_0.showBgToggle, function(arg_64_0)
			arg_63_0.isToggleShowBg = arg_64_0

			arg_63_0:FlushPainting(arg_63_1)
			arg_63_0:FlushBG(arg_63_1)
		end, SFX_PANEL)
	end

	if arg_63_0.shipSkin:IsSpine() or arg_63_0.shipSkin:IsLive2d() or arg_63_0.shipSkin:IsSpinePlus() or arg_63_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_63_0, arg_63_0.dynamicToggle, function(arg_65_0)
			local var_65_0 = arg_63_0.shipSkin:IsHxDynamicPreview()

			if arg_65_0 and var_65_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_tag_control_tip"))
				triggerToggle(arg_63_0.dynamicToggle, false)
				setActive(arg_63_0.dynamicResToggle, false)

				return
			end

			if arg_65_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_63_0.shipSkin:IsLive2d() or arg_63_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_63_0.dynamicToggle, false)

				return
			end

			arg_63_0.isToggleDynamic = arg_65_0

			setActive(arg_63_0.showBgToggle, not arg_65_0 and var_63_0)
			arg_63_0:FlushPainting(arg_63_1)
			arg_63_0:FlushDynamicPaintingResState(arg_63_1)
			arg_63_0:RecordFlag(arg_65_0)
		end, SFX_PANEL)
	end

	setActive(arg_63_0.dynamicIcon, true)

	if arg_63_0.isToggleDynamic then
		arg_63_0:FlushDynamicPaintingResState(arg_63_1)
	elseif var_63_2 then
		setActive(arg_63_0.dynamicResToggle, false)
		setActive(arg_63_0.dynamicIcon, false)
	end

	setActive(arg_63_0.dynamicToggle, var_63_1)
	setActive(arg_63_0.showBgToggle, not arg_63_0.isToggleDynamic and var_63_0)
end

function var_0_0.FlushTag(arg_66_0)
	local var_66_0 = arg_66_0.skinId
	local var_66_1 = pg.ship_skin_template[var_66_0]
	local var_66_2 = Clone(var_66_1.tag)
	local var_66_3 = false

	for iter_66_0 = #var_66_2, 1, -1 do
		local var_66_4 = var_66_2[iter_66_0]

		if var_66_4 == 1 or var_66_4 == 6 or var_66_4 == 7 or var_66_4 == 9 then
			local var_66_5 = true

			table.remove(var_66_2, iter_66_0)
		end
	end

	local var_66_6 = checkABExist("painting/" .. arg_66_0.shipSkin:getConfig("painting") .. "_n")

	arg_66_0.tagList:make(function(arg_67_0, arg_67_1, arg_67_2)
		if arg_67_0 == UIItemList.EventUpdate then
			local var_67_0 = var_66_2[arg_67_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_66_2[arg_67_1 + 1]), function(arg_68_0)
				if arg_66_0.exited then
					return
				end

				arg_67_2:GetComponent(typeof(Image)).sprite = arg_68_0
			end)
		end
	end)
	arg_66_0.tagList:align(#var_66_2)
end

function var_0_0.FlushPainting(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_0:GetPaintingState(arg_69_1)
	local var_69_1 = pg.ship_skin_template[arg_69_0.skinId].painting
	local var_69_2 = ShipSkin.GetChangeSkinData(arg_69_0.skinId) and true or false

	if var_69_0 == var_0_2 and not arg_69_0:ExistL2dRes(var_69_1) or var_69_0 == var_0_3 and not arg_69_0:ExistSpineRes(var_69_1) then
		var_69_0 = var_0_1
	end

	if arg_69_0.paintingState and arg_69_0.paintingState.state == var_69_0 and arg_69_0.paintingState.id == arg_69_1.id and arg_69_0.paintingState.showBg == arg_69_0.isToggleShowBg and arg_69_0.paintingState.purchaseFlag == arg_69_1.buyCount and not var_69_2 then
		return
	end

	arg_69_0:ClearPainting()

	if var_69_0 == var_0_1 then
		arg_69_0:LoadMeshPainting(arg_69_1, arg_69_0.isToggleShowBg)
	elseif var_69_0 == var_0_2 then
		arg_69_0:LoadL2dPainting(arg_69_1)
	elseif var_69_0 == var_0_3 then
		arg_69_0:LoadSpinePainting(arg_69_1)
	end

	arg_69_0.paintingState = {
		state = var_69_0,
		id = arg_69_1.id,
		showBg = arg_69_0.isToggleShowBg,
		purchaseFlag = arg_69_1.buyCount
	}

	arg_69_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_70_0)
	local var_70_0 = arg_70_0.paintingState

	if not var_70_0 then
		return
	end

	if var_70_0.state == var_0_1 then
		arg_70_0:ClearMeshPainting()
	elseif var_70_0.state == var_0_2 then
		arg_70_0:ClearL2dPainting()
	elseif var_70_0.state == var_0_3 then
		arg_70_0:ClearSpinePainting()
	end

	arg_70_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = findTF(arg_71_0.paintingTF, "fitter")
	local var_71_1 = GetOrAddComponent(var_71_0, "PaintingScaler")

	var_71_1.FrameName = "chuanwu"
	var_71_1.Tween = 1

	local var_71_2 = pg.ship_skin_template[arg_71_0.skinId].painting
	local var_71_3 = var_71_2

	if not arg_71_2 and checkABExist("painting/" .. var_71_2 .. "_n") then
		var_71_2 = var_71_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_71_2) then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_71_2, true, function(arg_72_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_72_0, var_71_0, false)
		ShipExpressionHelper.SetExpression(var_71_0:GetChild(0), var_71_3)

		arg_71_0.paintingName = var_71_2

		if arg_71_0.paintingState and arg_71_0.paintingState.id ~= arg_71_1.id then
			arg_71_0:ClearMeshPainting()
		end

		local var_72_0 = arg_72_0.transform:Find("shop_hx")

		arg_71_0:CheckShowShopHx(var_72_0, arg_71_1)
	end)
end

function var_0_0.ClearMeshPainting(arg_73_0)
	local var_73_0 = arg_73_0.paintingTF:Find("fitter")

	if arg_73_0.paintingName and var_73_0.childCount > 0 then
		local var_73_1 = var_73_0:GetChild(0).gameObject
		local var_73_2 = var_73_1.transform:Find("shop_hx")

		arg_73_0:RevertShopHx(var_73_2)
		PoolMgr.GetInstance():ReturnPainting(arg_73_0.paintingName, var_73_1)
	end

	arg_73_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_0.skinId
	local var_74_1 = pg.ship_skin_template[var_74_0].skin_type
	local var_74_2

	if var_74_1 == ShipSkin.SKIN_TYPE_TB then
		var_74_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_74_0))
	else
		local var_74_3 = pg.ship_skin_template[var_74_0].ship_group
		local var_74_4 = ShipGroup.getDefaultShipConfig(var_74_3)

		var_74_2 = Ship.New({
			noChangeSkin = true,
			configId = var_74_4.id,
			skin_id = var_74_0
		})
	end

	local var_74_5 = Live2D.GenerateData({
		ship = var_74_2,
		position = Vector3(0, 0, -1),
		parent = arg_74_0.live2dContainer,
		offset = var_74_2:GetSkinConfig().shop_offset
	})

	var_74_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_74_0.live2dChar = Live2D.New(var_74_5, function(arg_75_0)
		arg_75_0:IgonreReactPos(true)
		arg_74_0:CheckShowShopHxForL2d(arg_75_0, arg_74_1)

		if arg_74_0.paintingState and arg_74_0.paintingState.id ~= arg_74_1.id then
			arg_74_0:ClearL2dPainting()
		end

		arg_75_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_76_0)
	if arg_76_0.live2dChar then
		arg_76_0:RevertShopHxForL2d(arg_76_0.live2dChar)
		arg_76_0.live2dChar:Dispose()

		arg_76_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_0.skinId
	local var_77_1 = pg.ship_skin_template[var_77_0].skin_type
	local var_77_2

	if var_77_1 == ShipSkin.SKIN_TYPE_TB then
		var_77_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_77_0))
	else
		local var_77_3 = pg.ship_skin_template[var_77_0].ship_group
		local var_77_4 = ShipGroup.getDefaultShipConfig(var_77_3)

		var_77_2 = Ship.New({
			noChangeSkin = true,
			configId = var_77_4.id,
			skin_id = var_77_0
		})
	end

	local var_77_5 = SpinePainting.GenerateData({
		ship = var_77_2,
		position = Vector3(0, 0, 0),
		parent = arg_77_0.spTF,
		effectParent = arg_77_0.spBg,
		offset = var_77_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_77_0.spinePainting = SpinePainting.New(var_77_5, function(arg_78_0)
		if arg_77_0.paintingState and arg_77_0.paintingState.id ~= arg_77_1.id then
			arg_77_0:ClearSpinePainting()
		end

		local var_78_0 = arg_78_0._tf:Find("shop_hx")

		arg_77_0:CheckShowShopHx(var_78_0, arg_77_1)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_79_0)
	if arg_79_0.spinePainting and arg_79_0.spinePainting._tf then
		local var_79_0 = arg_79_0.spinePainting._tf:Find("shop_hx")

		arg_79_0:RevertShopHx(arg_79_0.shopHx)
		arg_79_0.spinePainting:Dispose()

		arg_79_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHx(arg_80_0, arg_80_1, arg_80_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	if not IsNil(arg_80_1) and arg_80_2.buyCount <= 0 then
		setActive(arg_80_1, true)
	end
end

function var_0_0.RevertShopHx(arg_81_0, arg_81_1)
	if not IsNil(arg_81_1) then
		setActive(arg_81_1, false)
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_82_0, arg_82_1, arg_82_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_82_0 = arg_82_2.buyCount <= 0 and 1 or 0

	arg_82_1:changeParamaterValue("shop_hx", var_82_0)
end

function var_0_0.RevertShopHxForL2d(arg_83_0, arg_83_1)
	arg_83_1:changeParamaterValue("shop_hx", 0)
end

function var_0_0.AdjustPainting(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_0.paintingTF
	local var_84_1 = pg.ship_skin_newmainui_shift[arg_84_0.skinId]

	if var_84_1 then
		local var_84_2 = var_84_1.skin_shop_shift

		if arg_84_1 then
			var_84_0.anchoredPosition = Vector2(var_84_2[1] - 440, var_84_2[2] + arg_84_0.defaultPaintingPosition.y)
		else
			var_84_0.anchoredPosition = Vector2(var_84_2[1] + arg_84_0.defaultPaintingPosition.x, var_84_2[2] + arg_84_0.defaultPaintingPosition.y)
		end

		local var_84_3 = var_84_2[4]

		var_84_0.localScale = Vector3(var_84_3, var_84_3, 1)
	else
		var_84_0.anchoredPosition = Vector2(arg_84_0.defaultPaintingPosition.x, arg_84_0.defaultPaintingPosition.y)
		var_84_0.localScale = arg_84_0.defaultPaintingScale
	end
end

function var_0_0.FlushBG(arg_85_0, arg_85_1, arg_85_2)
	local var_85_0 = arg_85_0.skinId
	local var_85_1 = pg.ship_skin_template[var_85_0]
	local var_85_2

	if var_85_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_85_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_85_0))
	else
		local var_85_3 = ShipGroup.getDefaultShipConfig(var_85_1.ship_group)

		var_85_2 = Ship.New({
			id = 999,
			configId = var_85_3.id,
			skin_id = var_85_0
		})
	end

	local var_85_4 = var_85_2:getShipBgPrint(true)
	local var_85_5 = pg.ship_skin_template[var_85_0].painting

	if (arg_85_0.isToggleShowBg or not checkABExist("painting/" .. var_85_5 .. "_n")) and var_85_1.bg_sp ~= "" then
		var_85_4 = var_85_1.bg_sp
	end

	local var_85_6 = var_85_4 ~= var_85_2:rarity2bgPrintForGet()

	if var_85_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_85_0, var_85_4, arg_85_0.bgs:Find("diffBg"), arg_85_0.bgs:Find("diffBg/bg"), function(arg_86_0)
			if arg_85_2 then
				arg_85_2()
			end
		end, function(arg_87_0)
			if arg_85_2 then
				arg_85_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_85_0:getUIName())

		if arg_85_2 then
			arg_85_2()
		end
	end

	setActive(arg_85_0.bgs:Find("diffBg"), var_85_6)
	setActive(arg_85_0.bgs:Find("default"), not var_85_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_88_0, arg_88_1)
	if not arg_88_0.isToggleDynamic then
		return
	end

	local var_88_0 = arg_88_0:GetPaintingState(arg_88_1)
	local var_88_1 = false
	local var_88_2 = ""
	local var_88_3 = pg.ship_skin_template[arg_88_0.skinId].painting

	if var_0_2 == var_88_0 then
		var_88_1, var_88_2 = arg_88_0:ExistL2dRes(var_88_3)
	elseif var_0_3 == var_88_0 then
		var_88_1, var_88_2 = arg_88_0:ExistSpineRes(var_88_3)
	end

	setActive(arg_88_0.dynamicResToggle, not var_88_1)
	removeOnButton(arg_88_0.dynamicResToggle)

	if not var_88_1 and var_88_2 ~= "" then
		onButton(arg_88_0, arg_88_0.dynamicResToggle, function()
			arg_88_0:DownloadDynamicPainting(var_88_2, arg_88_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_90_0, arg_90_1, arg_90_2)
	local var_90_0 = arg_90_0.skinId

	if arg_90_0.downloads[var_90_0] then
		return
	end

	local var_90_1 = SkinShopDownloadRequest.New()

	arg_90_0.downloads[var_90_0] = var_90_1

	var_90_1:Start(arg_90_1, function(arg_91_0)
		if arg_91_0 and arg_90_0.paintingState and arg_90_0.paintingState.id == arg_90_2.id then
			arg_90_0:FlushPainting(arg_90_2)
			arg_90_0:FlushDynamicPaintingResState(arg_90_2)
		end

		var_90_1:Dispose()

		arg_90_0.downloads[var_90_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_92_0, arg_92_1)
	if arg_92_0.isToggleDynamic and (arg_92_0.shipSkin:IsLive2d() or arg_92_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_92_0.isToggleDynamic and (arg_92_0.shipSkin:IsSpine() or arg_92_0.shipSkin:IsSpinePlus()) then
		if arg_92_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_93_0, arg_93_1)
	local var_93_0 = "live2d/" .. string.lower(arg_93_1)
	local var_93_1 = HXSet.autoHxShiftPath(var_93_0, nil, true)

	return checkABExist(var_93_1), var_93_1
end

function var_0_0.ExistSpineRes(arg_94_0, arg_94_1)
	local var_94_0 = "SpinePainting/" .. string.lower(arg_94_1)
	local var_94_1 = HXSet.autoHxShiftPath(var_94_0, nil, true)

	return checkABExist(var_94_1), var_94_1
end

function var_0_0.RecordFlag(arg_95_0, arg_95_1)
	local var_95_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_95_0, arg_95_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_95_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_95_1)
end

function var_0_0.FlushPrice(arg_96_0, arg_96_1)
	local var_96_0 = arg_96_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_96_1 = arg_96_1.type == Goods.TYPE_ACTIVITY or arg_96_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_96_0 then
		if arg_96_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_96_0:UpdateExperiencePrice4Item(arg_96_1)
		else
			arg_96_0:UpdateExperiencePrice(arg_96_1)
		end
	elseif arg_96_0.isPreviewFurniture then
		arg_96_0:UpdateFurniturePrice(arg_96_1)
	elseif var_96_1 then
		-- block empty
	else
		arg_96_0:UpdateCommodityPrice(arg_96_1)
	end

	local var_96_2 = arg_96_1.type == Goods.TYPE_SKIN

	setActive(arg_96_0.price:Find("timeLimit"), var_96_0 and not var_96_1)
	setActive(arg_96_0.price:Find("consume"), var_96_2 and not var_96_0 and not var_96_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_97_0, arg_97_1)
	local var_97_0 = arg_97_1:getConfig("resource_num")
	local var_97_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_97_2 = _.detect(var_97_1, function(arg_98_0)
		return arg_98_0:CanUseForShop(arg_97_1.id)
	end)
	local var_97_3 = var_97_2 and var_97_2.count or 0
	local var_97_4 = (var_97_3 < var_97_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_97_3 .. (var_97_3 < var_97_0 and "</color>" or "")

	setText(arg_97_0.price:Find("timeLimit/consume/Text"), var_97_4 .. "/" .. var_97_0)
end

function var_0_0.UpdateExperiencePrice(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1:getConfig("resource_num")
	local var_99_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_99_2 = (var_99_1 < var_99_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_99_1 .. (var_99_1 < var_99_0 and "</color>" or "")

	setText(arg_99_0.price:Find("timeLimit/consume/Text"), var_99_2 .. "/" .. var_99_0)
end

function var_0_0.UpdateCommodityPrice(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_1:GetPrice()
	local var_100_1 = arg_100_1:getConfig("resource_num")

	setText(arg_100_0.price:Find("consume/Text"), var_100_0)
	setText(arg_100_0.price:Find("consume/originalprice/Text"), var_100_1)
	setActive(arg_100_0.price:Find("consume/originalprice"), var_100_0 ~= var_100_1)
end

function var_0_0.UpdateFurniturePrice(arg_101_0, arg_101_1)
	local var_101_0 = Goods.Id2FurnitureId(arg_101_1.id)
	local var_101_1 = Furniture.New({
		id = var_101_0
	})
	local var_101_2 = var_101_1:getConfig("gem_price")

	setText(arg_101_0.price:Find("consume/originalprice/Text"), var_101_2)

	local var_101_3 = var_101_1:getPrice(PlayerConst.ResDiamond)

	setText(arg_101_0.price:Find("consume/Text"), var_101_3)
	setActive(arg_101_0.price:Find("consume/originalprice"), var_101_2 ~= var_101_3)
end

function var_0_0.FlushObtainBtn(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_0:GetObtainBtnState(arg_102_1)
	local var_102_1 = var_0_19(var_102_0)

	for iter_102_0 = 0, arg_102_0.btns.childCount - 1 do
		local var_102_2 = arg_102_0.btns:GetChild(iter_102_0)

		setActive(var_102_2, var_102_2.name == var_102_1)
	end

	setActive(arg_102_0.price:Find("btn/item"), var_102_0 == var_0_11)
	setActive(arg_102_0.price:Find("btn/tag"), var_102_0 == var_0_11)

	if var_102_0 == var_0_11 then
		arg_102_0:FlushGift(arg_102_1)
	end

	onButton(arg_102_0, arg_102_0.price:Find("btn"), function()
		local var_103_0 = {}
		local var_103_1 = SkinCouponActivity.StaticEncoreActTip(arg_102_1.id)

		if tobool(var_103_1) then
			table.insert(var_103_0, function(arg_104_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						if var_103_1 and not var_103_1:isEnd() then
							arg_102_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_103_1.id)
						end
					end,
					onNo = arg_104_0
				})
			end)
		end

		if arg_102_1:getConfig("genre") == ShopArgs.SkinShop and not arg_102_1:IsItemDiscountType() and #SkinCouponActivity.GetOvercountEncoreActs(arg_102_1.id) > 0 then
			table.insert(var_103_0, function(arg_106_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Last_Coupon"),
					onYes = arg_106_0
				})
			end)
		end

		seriesAsync(var_103_0, function()
			if var_102_0 == var_0_5 or var_102_0 == var_0_7 or var_102_0 == var_0_11 then
				arg_102_0.purchaseView:ExecuteAction("Show", arg_102_1)
			else
				arg_102_0:OnClickBtn(var_102_0, arg_102_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.GetObtainBtnState(arg_108_0, arg_108_1)
	if arg_108_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_108_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_108_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_108_1.type == Goods.TYPE_ACTIVITY or arg_108_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_108_1.buyCount > 0 then
		return var_0_4
	elseif arg_108_1:isDisCount() and arg_108_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_108_1:CanUseVoucherType() or arg_108_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_108_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.FlushGift(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_1:GetGiftList()[1]

	updateDrop(arg_109_0.price:Find("btn/item/mask/item"), {
		type = var_109_0.type,
		id = var_109_0.id,
		count = var_109_0.count
	})
end

function var_0_0.OnClickBtn(arg_110_0, arg_110_1, arg_110_2)
	if arg_110_1 == var_0_5 or arg_110_1 == var_0_7 or arg_110_1 == var_0_11 then
		arg_110_0:OnPurchase(arg_110_2)
	elseif arg_110_1 == var_0_10 then
		arg_110_0:OnItemPurchase(arg_110_2)
	elseif arg_110_1 == var_0_6 then
		arg_110_0:OnActivity(arg_110_2)
	elseif arg_110_1 == var_0_8 then
		arg_110_0:OnBackyard(arg_110_2)
	elseif arg_110_1 == var_0_9 then
		if arg_110_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_110_0:OnExperience4Item(arg_110_2)
		else
			arg_110_0:OnExperience(arg_110_2)
		end
	end
end

function var_0_0.FlushGifgPackBtn(arg_111_0, arg_111_1)
	local var_111_0 = false
	local var_111_1
	local var_111_2
	local var_111_3

	for iter_111_0, iter_111_1 in pairs(arg_111_0.giftSkinCommodities) do
		for iter_111_2, iter_111_3 in ipairs(iter_111_1) do
			if iter_111_3.id == arg_111_1.id then
				var_111_0 = true

				break
			end
		end

		if var_111_0 then
			var_111_1 = arg_111_0.giftPackCommodities[iter_111_0]
			var_111_2 = arg_111_0.giftSkinCommodities[iter_111_0]
			var_111_3 = arg_111_0.giftSkinProbabilitys[iter_111_0]

			break
		end
	end

	if var_111_0 then
		setText(arg_111_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip_2"))
		onButton(arg_111_0, arg_111_0.giftPackBtn, function()
			arg_111_0:emit(LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER, var_111_1, var_111_2, var_111_3)
		end, SFX_PANEL)
	else
		for iter_111_4, iter_111_5 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE)) do
			if iter_111_5 and not iter_111_5:isEnd() and iter_111_5.data1 < 1 and underscore.any(iter_111_5:getConfig("config_data")[1], function(arg_113_0)
				return pg.ship_skin_template[arg_113_0].shop_id == arg_111_1.id
			end) then
				var_111_0 = iter_111_5

				break
			end
		end

		if var_111_0 then
			setText(arg_111_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip"))
			onButton(arg_111_0, arg_111_0.giftPackBtn, function()
				arg_111_0:emit(LatestSkinShopMediator.OPEN_GIFT_ACT_LAYER, var_111_0.id)
			end, SFX_PANEL)
		end
	end

	setActive(arg_111_0.giftPackBtn, var_111_0)
end

function var_0_0.SetGiftPackLayer(arg_115_0)
	return
end

function var_0_0.OnPurchase(arg_116_0, arg_116_1)
	if arg_116_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_116_1:isDisCount() and arg_116_1:IsItemDiscountType() then
		arg_116_0:emit(LatestSkinShopMediator.ON_SHOPPING_BY_ACT, arg_116_1.id, 1)
	else
		arg_116_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_116_1.id, 1)
	end
end

function var_0_0.OnItemPurchase(arg_117_0, arg_117_1)
	if arg_117_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_117_0 = arg_117_1:GetVoucherIdList()
	local var_117_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_117_1.id)

	if #var_117_0 <= 0 and #var_117_1 <= 0 then
		return
	end

	local var_117_2 = {}

	for iter_117_0, iter_117_1 in ipairs(var_117_0) do
		table.insert(var_117_2, iter_117_1)
	end

	for iter_117_2, iter_117_3 in ipairs(var_117_1) do
		table.insert(var_117_2, iter_117_3.id)
	end

	local var_117_3 = arg_117_0.skinId
	local var_117_4 = pg.ship_skin_template[var_117_3]
	local var_117_5 = SwitchSpecialChar(var_117_4.name, true)

	arg_117_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_117_2,
		skinId = var_117_3,
		skinName = var_117_5,
		price = arg_117_1:GetPrice(),
		onYes = function(arg_118_0)
			if arg_118_0 then
				arg_117_0:emit(LatestSkinShopMediator.ON_ITEM_PURCHASE, arg_118_0, arg_117_1.id)
			else
				arg_117_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_117_1.id, 1)
			end
		end
	})
end

function var_0_0.OnActivity(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_1:getConfig("time")
	local var_119_1 = arg_119_1:getConfig("activity")
	local var_119_2 = getProxy(ActivityProxy):getActivityById(var_119_1)

	if var_119_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_119_0) or var_119_2 and not var_119_2:isEnd() then
		if arg_119_1.type == Goods.TYPE_ACTIVITY then
			arg_119_0:emit(LatestSkinShopMediator.GO_SHOPS_LAYER, arg_119_1:getConfig("activity"))
		elseif arg_119_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_119_3 = arg_119_1:getConfig("scene")

			if var_119_3 and #var_119_3 > 0 then
				arg_119_0:emit(LatestSkinShopMediator.OPEN_SCENE, var_119_3)
			else
				arg_119_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_119_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_120_0, arg_120_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_120_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_120_0.name, var_120_0.level))

		return
	end

	arg_120_0:emit(LatestSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_0.skinId
	local var_121_1 = getProxy(ShipSkinProxy):getSkinById(var_121_0)

	if var_121_1 and not var_121_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_121_2 = arg_121_1:getConfig("resource_num")
	local var_121_3 = arg_121_1:getConfig("time_second") * var_121_2
	local var_121_4, var_121_5, var_121_6, var_121_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_121_3)
	local var_121_8 = pg.ship_skin_template[arg_121_0.skinId].name

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_121_2, var_121_8, var_121_4, var_121_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_121_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_121_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_121_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_123_0, arg_123_1)
	local var_123_0 = arg_123_0.skinId
	local var_123_1 = getProxy(ShipSkinProxy):getSkinById(var_123_0)

	if var_123_1 and not var_123_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_123_2 = arg_123_1:getConfig("resource_num")
	local var_123_3 = arg_123_1:getConfig("time_second") * var_123_2
	local var_123_4, var_123_5, var_123_6, var_123_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_123_3)
	local var_123_8 = pg.ship_skin_template[arg_123_0.skinId].name
	local var_123_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_123_10 = _.detect(var_123_9, function(arg_124_0)
		return arg_124_0:CanUseForShop(arg_123_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_123_2, var_123_8, var_123_4, var_123_5),
		onYes = function()
			if not var_123_10 or var_123_10.count < var_123_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_123_0:emit(LatestSkinShopMediator.ON_ITEM_EXPERIENCE, var_123_10.id, arg_123_1.id, 1)
		end
	})
end

function var_0_0.SetFilterPanel(arg_126_0)
	local var_126_0 = arg_126_0.filterContent:Find("own/options")
	local var_126_1 = arg_126_0.filterContent:Find("type/options")
	local var_126_2 = arg_126_0.filterContent:Find("shipHave/options")
	local var_126_3 = arg_126_0.filterContent:Find("camp/options")
	local var_126_4 = arg_126_0.filterContent:Find("rarity/options")
	local var_126_5 = arg_126_0.filterContent:Find("shipType/options")
	local var_126_6 = arg_126_0.filterContent:Find("themeType/options")

	arg_126_0:SetOptionList(var_126_3, ShipIndexConst.CampNames, true)
	arg_126_0:SetOptionList(var_126_4, ShipIndexConst.RarityNames, true)
	arg_126_0:SetOptionList(var_126_5, ShipIndexConst.TypeNames, true)
	arg_126_0:SetOptionList(var_126_6, arg_126_0.classifyNames)
	arg_126_0:SetSingleOptions(var_126_0, "ownType")
	arg_126_0:SetMultiOptions(var_126_1, "typeType")
	arg_126_0:SetSingleOptions(var_126_2, "shipHaveType")
	arg_126_0:SetMultiOptions(var_126_3, "campType")
	arg_126_0:SetMultiOptions(var_126_4, "rarityType")
	arg_126_0:SetMultiOptions(var_126_5, "shipType")
	arg_126_0:SetMultiOptions(var_126_6, "themeType")
	onButton(arg_126_0, arg_126_0.filterUI:Find("bg"), function()
		for iter_127_0, iter_127_1 in pairs(arg_126_0.filterValues) do
			arg_126_0.filterValuesTemp[iter_127_0] = Clone(arg_126_0.filterValues[iter_127_0])
		end

		setActive(arg_126_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_126_0, arg_126_0.filterUI:Find("panelMask/panel/closeBtn"), function()
		for iter_128_0, iter_128_1 in pairs(arg_126_0.filterValues) do
			arg_126_0.filterValuesTemp[iter_128_0] = Clone(arg_126_0.filterValues[iter_128_0])
		end

		setActive(arg_126_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_126_0, arg_126_0.filterUI:Find("panelMask/panel/bottom/ok"), function()
		for iter_129_0, iter_129_1 in pairs(arg_126_0.filterValues) do
			arg_126_0.filterValues[iter_129_0] = Clone(arg_126_0.filterValuesTemp[iter_129_0])
		end

		setActive(arg_126_0.filterUI, false)
		arg_126_0:Refresh(true)
	end, SFX_PANEL)
end

function var_0_0.OpenFilterPanel(arg_130_0)
	setActive(arg_130_0.filterUI, true)

	local var_130_0 = arg_130_0.filterContent:Find("own/options")
	local var_130_1 = arg_130_0.filterContent:Find("type/options")
	local var_130_2 = arg_130_0.filterContent:Find("shipHave/options")
	local var_130_3 = arg_130_0.filterContent:Find("camp/options")
	local var_130_4 = arg_130_0.filterContent:Find("rarity/options")
	local var_130_5 = arg_130_0.filterContent:Find("shipType/options")
	local var_130_6 = arg_130_0.filterContent:Find("themeType/options")

	arg_130_0:SetSingleOptions(var_130_0, "ownType", true)
	arg_130_0:SetMultiOptions(var_130_1, "typeType", true)
	arg_130_0:SetSingleOptions(var_130_2, "shipHaveType", true)
	arg_130_0:SetMultiOptions(var_130_3, "campType", true)
	arg_130_0:SetMultiOptions(var_130_4, "rarityType", true)
	arg_130_0:SetMultiOptions(var_130_5, "shipType", true)
	arg_130_0:SetMultiOptions(var_130_6, "themeType", true)
end

function var_0_0.SetOptionList(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	local var_131_0 = UIItemList.New(arg_131_1, arg_131_1:GetChild(0))

	var_131_0:make(function(arg_132_0, arg_132_1, arg_132_2)
		if arg_132_0 == UIItemList.EventUpdate then
			local var_132_0 = arg_131_2[arg_132_1 + 1]

			if arg_131_3 then
				var_132_0 = i18n(var_132_0)
			end

			arg_132_2.name = arg_132_1

			setScrollText(arg_132_2:Find("mask/Text"), var_132_0)
		end
	end)
	var_131_0:align(#arg_131_2)
end

function var_0_0.SetSingleOptions(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	for iter_133_0 = 0, arg_133_1.childCount - 1 do
		local var_133_0 = arg_133_1:GetChild(iter_133_0)

		arg_133_0:SetOptionSelect(arg_133_1:GetChild(iter_133_0), iter_133_0 == arg_133_0.filterValuesTemp[arg_133_2])

		if not arg_133_3 then
			onButton(arg_133_0, var_133_0, function()
				arg_133_0.filterValuesTemp[arg_133_2] = iter_133_0

				for iter_134_0 = 0, arg_133_1.childCount - 1 do
					arg_133_0:SetOptionSelect(arg_133_1:GetChild(iter_134_0), iter_134_0 == iter_133_0)
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetMultiOptions(arg_135_0, arg_135_1, arg_135_2, arg_135_3)
	for iter_135_0 = 0, arg_135_1.childCount - 1 do
		local var_135_0 = arg_135_1:GetChild(iter_135_0)

		arg_135_0:SetOptionSelect(arg_135_1:GetChild(iter_135_0), table.contains(arg_135_0.filterValuesTemp[arg_135_2], iter_135_0))

		if not arg_135_3 then
			onButton(arg_135_0, var_135_0, function()
				if iter_135_0 == 0 then
					arg_135_0.filterValuesTemp[arg_135_2] = {
						0
					}

					for iter_136_0 = 0, arg_135_1.childCount - 1 do
						arg_135_0:SetOptionSelect(arg_135_1:GetChild(iter_136_0), iter_136_0 == 0)
					end
				else
					table.removebyvalue(arg_135_0.filterValuesTemp[arg_135_2], 0)

					if table.contains(arg_135_0.filterValuesTemp[arg_135_2], iter_135_0) then
						table.removebyvalue(arg_135_0.filterValuesTemp[arg_135_2], iter_135_0)
					else
						table.insert(arg_135_0.filterValuesTemp[arg_135_2], iter_135_0)
					end

					local var_136_0 = true

					for iter_136_1 = 1, arg_135_1.childCount - 1 do
						if not table.contains(arg_135_0.filterValuesTemp[arg_135_2], iter_136_1) then
							var_136_0 = false

							break
						end
					end

					if #arg_135_0.filterValuesTemp[arg_135_2] == 0 then
						var_136_0 = true
					end

					if var_136_0 then
						arg_135_0.filterValuesTemp[arg_135_2] = {
							0
						}
					end

					for iter_136_2 = 0, arg_135_1.childCount - 1 do
						arg_135_0:SetOptionSelect(arg_135_1:GetChild(iter_136_2), table.contains(arg_135_0.filterValuesTemp[arg_135_2], iter_136_2))
					end
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetOptionSelect(arg_137_0, arg_137_1, arg_137_2)
	setActive(arg_137_1:Find("selectedFrame"), arg_137_2)

	local var_137_0

	if IsNil(arg_137_1:Find("Text")) then
		var_137_0 = arg_137_1:Find("mask/Text"):GetComponent(typeof(Text))
	else
		var_137_0 = arg_137_1:Find("Text"):GetComponent(typeof(Text))
	end

	if arg_137_2 then
		var_137_0.color = Color.New(1, 1, 1, 1)
	else
		var_137_0.color = Color.New(0, 0, 0, 0.5)
	end
end

function var_0_0.GetSkinClassify(arg_138_0)
	arg_138_0.classifyIds = {}
	arg_138_0.classifyNames = {}

	local var_138_0 = {}
	local var_138_1 = {}

	for iter_138_0, iter_138_1 in ipairs(arg_138_0.commodities) do
		local var_138_2 = arg_138_0:GetShopTypeIdBySkinId(iter_138_1:getSkinId())
		local var_138_3 = var_138_2 == 0 and var_0_16 or var_138_2

		var_138_1[var_138_3] = (var_138_1[var_138_3] or 0) + 1
	end

	local var_138_4 = {}

	for iter_138_2, iter_138_3 in ipairs(arg_138_0.returnSkins) do
		var_138_4[iter_138_3] = true
	end

	if underscore.any(arg_138_0.commodities, function(arg_139_0)
		return var_138_4[arg_139_0.id]
	end) then
		table.insert(var_138_0, var_0_14)
	end

	for iter_138_4, iter_138_5 in ipairs(pg.skin_page_template.all) do
		if iter_138_5 ~= var_0_17 and iter_138_5 ~= var_0_18 and (var_138_1[iter_138_5] or 0) > 0 then
			table.insert(var_138_0, iter_138_5)
		end
	end

	if arg_138_0.mode == var_0_0.MODE_EXPERIENCE then
		table.insert(var_138_0, 1, var_0_13)
	end

	if arg_138_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_138_0, 1, var_0_15)
	end

	table.insert(var_138_0, 1, var_0_12)

	arg_138_0.classifyIds = var_138_0

	for iter_138_6, iter_138_7 in ipairs(arg_138_0.classifyIds) do
		if iter_138_7 == var_0_12 then
			table.insert(arg_138_0.classifyNames, i18n("shop_filter_all"))
		elseif iter_138_7 == var_0_13 or iter_138_7 == var_0_15 then
			table.insert(arg_138_0.classifyNames, i18n("shop_filter_trial"))
		elseif iter_138_7 == var_0_14 then
			table.insert(arg_138_0.classifyNames, i18n("shop_filter_retro"))
		else
			table.insert(arg_138_0.classifyNames, pg.skin_page_template[iter_138_7].name)
		end
	end
end

function var_0_0.GetShopTypeIdBySkinId(arg_140_0, arg_140_1)
	local var_140_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not arg_140_0.shopTypeIdList then
		arg_140_0.shopTypeIdList = {}
	end

	if arg_140_0.shopTypeIdList[arg_140_1] then
		return arg_140_0.shopTypeIdList[arg_140_1]
	end

	for iter_140_0, iter_140_1 in pairs(var_140_0) do
		for iter_140_2, iter_140_3 in ipairs(iter_140_1) do
			arg_140_0.shopTypeIdList[iter_140_3] = iter_140_0

			if iter_140_3 == arg_140_1 then
				return iter_140_0
			end
		end
	end
end

function var_0_0.OnShopping(arg_141_0, arg_141_1)
	if not arg_141_0.showingCommodity then
		return
	end

	if arg_141_0.purchaseView and arg_141_0.purchaseView:GetLoaded() then
		arg_141_0.purchaseView:Hide()
	end

	if arg_141_0.showingCommodity.id == arg_141_1 then
		arg_141_0:GetAllCommodities()
		arg_141_0:Refresh(true)
	end
end

function var_0_0.OnFurnitureUpdate(arg_142_0, arg_142_1)
	if not arg_142_0.showingCommodity then
		return
	end

	local var_142_0 = arg_142_0.showingCommodity.id

	if Goods.ExistFurniture(var_142_0) and Goods.Id2FurnitureId(var_142_0) == arg_142_1 then
		arg_142_0:GetAllCommodities()
		arg_142_0:Refresh(true)
	end
end

function var_0_0.willExit(arg_143_0)
	arg_143_0:ClearCards()
	ClearLScrollrect(arg_143_0.scrollrect)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_143_0:getUIName())

	if arg_143_0.live2dChar then
		arg_143_0.live2dChar:Dispose()

		arg_143_0.live2dChar = nil
	end

	if arg_143_0.voucherMsgBox then
		arg_143_0.voucherMsgBox:Destroy()

		arg_143_0.voucherMsgBox = nil
	end

	if arg_143_0.purchaseView then
		arg_143_0.purchaseView:Destroy()

		arg_143_0.purchaseView = nil
	end

	for iter_143_0, iter_143_1 in pairs(arg_143_0.downloads) do
		iter_143_1:Dispose()
	end

	arg_143_0.downloads = {}

	arg_143_0:ClearPainting()

	if arg_143_0.interactionPreview then
		arg_143_0.interactionPreview:Dispose()

		arg_143_0.interactionPreview = nil
	end

	arg_143_0:disposeEvent()
	arg_143_0:ClearTimer()
	arg_143_0:ReturnChar()
	arg_143_0:UnOverlay()
end

function var_0_0.onBackPressed(arg_144_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

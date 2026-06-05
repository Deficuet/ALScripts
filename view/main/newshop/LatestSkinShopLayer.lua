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
		local var_8_0 = {}

		table.insert(var_8_0, function(arg_9_0)
			arg_7_0:CheckDownloadSkinList(arg_9_0)
		end)
		seriesAsync(var_8_0, function()
			arg_7_0:SetSkinScroll()
			arg_7_0:Refresh(true)
		end)
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

	onToggle(arg_7_0, arg_7_0.sdTg, function(arg_14_0)
		setActive(arg_7_0.charContainer, arg_14_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_7_0, arg_14_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_7_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_7_0, 0)

	triggerToggle(arg_7_0.sdTg, var_7_1 == 1)
	onToggle(arg_7_0, arg_7_0.hideUITg, function(arg_15_0)
		setActive(arg_7_0.top, not arg_15_0)
		setActive(arg_7_0.bottom, not arg_15_0)
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_15_0)
	end, SFX_PANEL)
	onInputChanged(arg_7_0, arg_7_0.search, function()
		arg_7_0:Refresh(true)

		local var_16_0 = getInputText(arg_7_0.search)

		setActive(arg_7_0.search:Find("holder"), var_16_0 == "")
	end)
	onButton(arg_7_0, arg_7_0.showOwnBtn, function()
		arg_7_0:emit(LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER)
	end, SFX_PANEL)
	getProxy(CommanderManualProxy):TaskProgressAdd(2021, 1)
end

function var_0_0.SetResource(arg_18_0)
	local var_18_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_18_0.resources:Find("gem/Text"), var_18_0:getTotalGem())
	onButton(arg_18_0, arg_18_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.InitData(arg_20_0)
	arg_20_0.type = arg_20_0.contextData.type or var_0_0.TYPE_PERMANANT_SKIN
	arg_20_0.mode = arg_20_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_20_0:GetAllCommodities()
	arg_20_0:GetGiftPackCommodities()

	arg_20_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()

	arg_20_0:GetSkinClassify()

	local var_20_0 = (arg_20_0.mode == var_0_0.MODE_EXPERIENCE or arg_20_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM) and 1 or 0

	arg_20_0.filterValues = {
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
			var_20_0
		}
	}
	arg_20_0.filterValuesTemp = Clone(arg_20_0.filterValues)
end

function var_0_0.GetAllCommodities(arg_21_0)
	if arg_21_0.type == var_0_0.TYPE_NEW_SKIN then
		arg_21_0.commodities = getProxy(ShipSkinProxy):GetInTimeSkins()
	elseif arg_21_0.type == var_0_0.TYPE_PERMANANT_SKIN then
		arg_21_0.commodities = getProxy(ShipSkinProxy):GetPermanentSkins()
	end

	if LOCK_SKIN_US then
		local var_21_0 = pg.gameset.levellimit_skintype.key_value
		local var_21_1 = pg.gameset.levellimit_skintype.description

		if var_21_0 >= getProxy(PlayerProxy):getData().level then
			arg_21_0.commodities = _.filter(arg_21_0.commodities, function(arg_22_0)
				local var_22_0 = pg.ship_skin_template[arg_22_0:getSkinId()].shop_type_id

				return table.contains(var_21_1, var_22_0)
			end)
		end
	end

	if arg_21_0.mode == var_0_0.MODE_OVERVIEW then
		for iter_21_0 = #arg_21_0.commodities, 1, -1 do
			if arg_21_0.commodities[iter_21_0]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				table.remove(arg_21_0.commodities, iter_21_0)
			end
		end
	end
end

function var_0_0.GetGiftPackCommodities(arg_23_0)
	arg_23_0.giftPackCommodities = {}
	arg_23_0.giftSkinCommodities = {}
	arg_23_0.giftSkinProbabilitys = {}

	for iter_23_0, iter_23_1 in ipairs(pg.pay_data_display.all) do
		local var_23_0 = pg.pay_data_display[iter_23_1]

		if var_23_0.skin_inquire_relation ~= 0 and pg.TimeMgr.GetInstance():inTime(var_23_0.time) then
			local var_23_1 = getProxy(ShopsProxy):GetGiftCommodity(iter_23_1, Goods.TYPE_CHARGE)

			arg_23_0.giftPackCommodities[iter_23_1] = var_23_1

			local var_23_2 = var_23_1:GetSkinProbability()

			arg_23_0.giftSkinCommodities[iter_23_1] = getProxy(ShipSkinProxy):GetProbabilitySkins(var_23_2)
			arg_23_0.giftSkinProbabilitys[iter_23_1] = getProxy(ShipSkinProxy):GetSkinProbabilitys(var_23_2)
		end
	end
end

function var_0_0.SetSkinScroll(arg_24_0)
	arg_24_0.scrollrect.isNewLoadingMethod = true

	function arg_24_0.scrollrect.onInitItem(arg_25_0)
		arg_24_0:OnInitItem(arg_25_0)
	end

	function arg_24_0.scrollrect.onUpdateItem(arg_26_0, arg_26_1)
		arg_24_0:OnUpdateItem(arg_26_0, arg_26_1)
	end

	arg_24_0.scrollrect.enabled = true
end

function var_0_0.Refresh(arg_27_0, arg_27_1)
	arg_27_0:ClearCards()

	arg_27_0.cards = {}
	arg_27_0.displays = {}

	local var_27_0 = getInputText(arg_27_0.search)

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.commodities) do
		if arg_27_0:filterOk(iter_27_1) and arg_27_0:IsSearchType(var_27_0, iter_27_1) then
			table.insert(arg_27_0.displays, iter_27_1)
		end
	end

	local var_27_1 = {}

	for iter_27_2, iter_27_3 in ipairs(arg_27_0.displays) do
		local var_27_2 = iter_27_3.type == Goods.TYPE_ACTIVITY or iter_27_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_27_3 = 0

		if not var_27_2 then
			var_27_3 = iter_27_3:GetPrice()
		end

		var_27_1[iter_27_3.id] = var_27_3
	end

	table.sort(arg_27_0.displays, function(arg_28_0, arg_28_1)
		return arg_27_0:Sort(arg_28_0, arg_28_1, var_27_1)
	end)

	local var_27_4 = #arg_27_0.displays == 0

	setActive(arg_27_0.bgs:Find("default"), var_27_4)
	setActive(arg_27_0.bgs:Find("diffBg"), not var_27_4)
	setActive(arg_27_0.bgs:Find("empty"), var_27_4)
	setActive(arg_27_0._tf:Find("leftMask"), not var_27_4)
	setActive(arg_27_0._tf:Find("bottomMask"), not var_27_4)
	setActive(arg_27_0.painting, not var_27_4)
	setActive(arg_27_0.top:Find("title"), not var_27_4)
	setActive(arg_27_0.changeSkin, not var_27_4)
	setActive(arg_27_0.right, not var_27_4)
	setActive(arg_27_0.right, not var_27_4)
	setActive(arg_27_0.bottom:Find("scroll"), not var_27_4)

	if not var_27_4 then
		if arg_27_1 then
			arg_27_0.triggerFirstCard = true

			arg_27_0.scrollrect:SetTotalCount(#arg_27_0.displays, 0)
		else
			arg_27_0.scrollrect:SetTotalCount(#arg_27_0.displays)
		end
	end
end

function var_0_0.IsSearchType(arg_29_0, arg_29_1, arg_29_2)
	if not arg_29_1 or arg_29_1 == "" then
		return true
	end

	local var_29_0 = arg_29_2:getSkinId()

	return ShipSkin.New({
		id = var_29_0
	}):IsMatchKey(arg_29_1)
end

local function var_0_20(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_2[arg_30_0.id]
	local var_30_1 = arg_30_2[arg_30_1.id]

	if var_30_0 == var_30_1 then
		return arg_30_0.id < arg_30_1.id
	else
		return var_30_1 < var_30_0
	end
end

function var_0_0.Sort(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = arg_31_1.buyCount == 0 and 1 or 0
	local var_31_1 = arg_31_2.buyCount == 0 and 1 or 0

	if var_31_0 == var_31_1 then
		local var_31_2 = arg_31_1:getConfig("order")
		local var_31_3 = arg_31_2:getConfig("order")

		if var_31_2 == var_31_3 then
			return var_0_20(arg_31_1, arg_31_2, arg_31_3)
		else
			return var_31_2 < var_31_3
		end
	else
		return var_31_1 < var_31_0
	end
end

function var_0_0.filterOk(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.filterValues.ownType
	local var_32_1 = arg_32_0.filterValues.typeType
	local var_32_2 = arg_32_0.filterValues.shipHaveType
	local var_32_3 = arg_32_0.filterValues.campType
	local var_32_4 = arg_32_0.filterValues.rarityType
	local var_32_5 = arg_32_0.filterValues.shipType
	local var_32_6 = arg_32_0.filterValues.themeType
	local var_32_7 = arg_32_1:getSkinId()
	local var_32_8 = ShipSkin.New({
		id = var_32_7
	})
	local var_32_9 = var_32_8:GetDefaultShipConfig()
	local var_32_10 = arg_32_0:ToVShip(var_32_9)

	if var_32_0 ~= 0 then
		local var_32_11 = false
		local var_32_12 = getProxy(ShipSkinProxy):hasSkin(var_32_7)
		local var_32_13 = var_32_8:NoUse()

		if var_32_0 == 1 and var_32_12 then
			var_32_11 = true
		end

		if var_32_0 == 2 and not var_32_12 then
			var_32_11 = true
		end

		if var_32_0 == 3 and var_32_12 and var_32_13 then
			var_32_11 = true
		end

		if not var_32_11 then
			return false
		end
	end

	if var_32_1[1] ~= 0 then
		local var_32_14 = false

		for iter_32_0, iter_32_1 in ipairs(var_32_1) do
			if iter_32_1 == 1 and (var_32_8:IsLive2d() or var_32_8:IsLive2dPlus()) then
				var_32_14 = true
			end

			if iter_32_1 == 2 and not var_32_8:IsLive2d() and not var_32_8:IsLive2dPlus() and not var_32_8:IsSpine() and not var_32_8:IsSpinePlus() then
				var_32_14 = true
			end

			if iter_32_1 == 3 and (var_32_8:IsSpine() or var_32_8:IsSpinePlus()) then
				var_32_14 = true
			end

			if iter_32_1 == 4 and var_32_8:IsBG() then
				var_32_14 = true
			end

			if iter_32_1 == 5 and var_32_8:IsDbg() then
				var_32_14 = true
			end

			if iter_32_1 == 6 and var_32_8:isBgm() then
				var_32_14 = true
			end

			if var_32_14 then
				break
			end
		end

		if not var_32_14 then
			return false
		end
	end

	if var_32_2 ~= 0 then
		local var_32_15 = false
		local var_32_16 = var_32_8:CantUse()

		if var_32_2 == 1 and not var_32_16 then
			var_32_15 = true
		end

		if var_32_2 == 2 and var_32_16 then
			var_32_15 = true
		end

		if not var_32_15 then
			return false
		end
	end

	if var_32_3[1] ~= 0 then
		if not var_32_9 then
			return false
		end

		local var_32_17 = false

		for iter_32_2, iter_32_3 in ipairs(var_32_3) do
			local var_32_18 = ShipIndexCfg.camp

			for iter_32_4, iter_32_5 in ipairs(var_32_18[iter_32_3 + 1].types) do
				if iter_32_5 == Nation.LINK then
					if var_32_10:getNation() >= Nation.LINK then
						var_32_17 = true
					end
				elseif iter_32_5 == var_32_10:getNation() then
					var_32_17 = true
				end
			end

			if var_32_17 then
				break
			end
		end

		if not var_32_17 then
			return false
		end
	end

	if var_32_4[1] ~= 0 then
		if not var_32_9 then
			return false
		end

		local var_32_19 = false

		for iter_32_6, iter_32_7 in ipairs(var_32_4) do
			local var_32_20 = ShipIndexCfg.rarity

			if table.contains(var_32_20[iter_32_7 + 1].types, var_32_10:getRarity()) then
				var_32_19 = true
			end

			if var_32_19 then
				break
			end
		end

		if not var_32_19 then
			return false
		end
	end

	if var_32_5[1] ~= 0 then
		if not var_32_9 then
			return false
		end

		local var_32_21 = false

		for iter_32_8, iter_32_9 in ipairs(var_32_5) do
			local var_32_22 = ShipIndexCfg.type
			local var_32_23 = var_32_22[iter_32_9 + 1].types

			if iter_32_9 + 1 < 4 then
				local var_32_24 = var_32_22[iter_32_9].shipTypes

				if table.contains(var_32_23, var_32_10:getShipType()) then
					var_32_21 = true
				end

				if table.contains(var_32_23, var_32_10:getTeamType()) then
					var_32_21 = true
				end
			elseif table.contains(var_32_23, var_32_10:getShipType()) then
				var_32_21 = true
			end

			if var_32_21 then
				break
			end
		end

		if not var_32_21 then
			return false
		end
	end

	if var_32_6[1] ~= 0 then
		local var_32_25 = false

		for iter_32_10, iter_32_11 in ipairs(var_32_6) do
			local var_32_26 = arg_32_0.classifyIds[iter_32_11 + 1]

			if arg_32_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				if arg_32_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
					var_32_25 = var_32_26 == var_0_15 and arg_32_0:ExitSkinExperienceItem(arg_32_1.id)
				else
					var_32_25 = var_32_26 == var_0_13
				end
			elseif var_32_26 == var_0_12 then
				var_32_25 = true
			elseif var_32_26 == var_0_14 and table.contains(arg_32_0.returnSkins, arg_32_1.id) then
				var_32_25 = true
			else
				local var_32_27 = arg_32_0:GetShopTypeIdBySkinId(var_32_7)

				var_32_25 = (var_32_27 == 0 and var_0_16 or var_32_27) == var_32_26
			end

			if var_32_25 then
				break
			end
		end

		if not var_32_25 then
			return false
		end
	end

	return true
end

function var_0_0.ToVShip(arg_33_0, arg_33_1)
	if not arg_33_0.vship then
		arg_33_0.vship = {}

		function arg_33_0.vship.getNation()
			return arg_33_0.vship.config.nationality
		end

		function arg_33_0.vship.getShipType()
			return arg_33_0.vship.config.type
		end

		function arg_33_0.vship.getTeamType()
			return ShipType.GetTeamFromShipType(arg_33_0.vship.config.type)
		end

		function arg_33_0.vship.getRarity()
			return arg_33_0.vship.config.rarity
		end
	end

	arg_33_0.vship.config = arg_33_1

	return arg_33_0.vship
end

function var_0_0.ExitSkinExperienceItem(arg_38_0, arg_38_1)
	if not arg_38_0.cacheSkinExperienceItems then
		arg_38_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(arg_38_0.cacheSkinExperienceItems, function(arg_39_0)
		return arg_39_0:CanUseForShop(arg_38_1)
	end)
end

function var_0_0.RegisterEvent(arg_40_0)
	arg_40_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_41_0, arg_41_1)
		arg_40_0:AdjustPainting(arg_41_1)
		setActive(arg_40_0.top, not arg_41_1)
		setActive(arg_40_0.bottom, not arg_41_1)
		setActive(arg_40_0.right, not arg_41_1)

		if arg_40_0.live2dChar then
			arg_40_0.live2dChar:setPurchaseOffset(arg_41_1)
		end

		if arg_40_0.spineChar then
			if arg_41_1 then
				local var_41_0 = pg.ship_skin_template[arg_40_0.skinId].purchase_offset

				if var_41_0 and #var_41_0 >= 3 then
					arg_40_0.spineChar:SetLocalPosition(Vector3(var_41_0[1], var_41_0[2], var_41_0[3]))
				end

				if var_41_0 and #var_41_0 >= 4 then
					arg_40_0.spineChar:SetLocalScale(Vector3(var_41_0[4], var_41_0[4], var_41_0[4]))
				end
			else
				arg_40_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
				arg_40_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
			end
		end

		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_41_1)
	end)
	arg_40_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_42_0, arg_42_1)
		local var_42_0 = arg_40_0:GetObtainBtnState(arg_42_1)

		arg_40_0:OnClickBtn(var_42_0, arg_42_1)
	end)
	onButton(arg_40_0, arg_40_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_40_0.skinId) then
			arg_40_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_40_0.skinId)

			arg_40_0:UpdateMainView(arg_40_0.showingCommodity)
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_44_0, arg_44_1)
	local var_44_0 = NewShopSkinCard.New(arg_44_1)

	onButton(arg_44_0, var_44_0._go, function()
		if not var_44_0.commodity then
			return
		end

		for iter_45_0, iter_45_1 in pairs(arg_44_0.cards) do
			iter_45_1:UpdateSelected(false)
		end

		arg_44_0.selectedId = var_44_0.commodity.id

		var_44_0:UpdateSelected(true)
		arg_44_0:UpdateMainView(var_44_0.commodity)
		arg_44_0:GCHandle()
	end, SFX_PANEL)

	arg_44_0.cards[arg_44_1] = var_44_0
end

function var_0_0.OnUpdateItem(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_0.cards[arg_46_2]

	if not var_46_0 then
		arg_46_0:OnInitItem(arg_46_2)

		var_46_0 = arg_46_0.cards[arg_46_2]
	end

	local var_46_1 = arg_46_0.displays[arg_46_1 + 1]

	if not var_46_1 then
		return
	end

	local var_46_2 = arg_46_0.selectedId == var_46_1.id
	local var_46_3 = table.contains(arg_46_0.returnSkins, var_46_1.id)

	var_46_0:Update(var_46_1, var_46_2, var_46_3)

	if arg_46_0.triggerFirstCard and arg_46_1 == 0 then
		arg_46_0.triggerFirstCard = false

		triggerButton(var_46_0._go)
	end
end

function var_0_0.UpdateMainView(arg_47_0, arg_47_1)
	arg_47_0.skinId = arg_47_1:getSkinId()

	local var_47_0 = ShipSkin.IsChangeSkin(arg_47_0.skinId)

	setActive(arg_47_0.changeSkin, var_47_0)

	if var_47_0 then
		arg_47_0:FlushChangeSkin(arg_47_1)
	end

	arg_47_0.shipSkin = ShipSkin.New({
		id = arg_47_0.skinId
	})

	arg_47_0:FlushName()
	arg_47_0:FlushPreviewBtn(arg_47_1)
	arg_47_0:FlushTimeLimit(arg_47_1)
	arg_47_0:SwitchPreview(arg_47_1, arg_47_0.isPreviewFurniture)
	arg_47_0:FlushPaintingToggle(arg_47_1)
	arg_47_0:FlushTag()
	arg_47_0:FlushBG(arg_47_1)
	arg_47_0:FlushPainting(arg_47_1)
	arg_47_0:FlushPrice(arg_47_1)
	arg_47_0:FlushObtainBtn(arg_47_1)
	arg_47_0:FlushGifgPackBtn(arg_47_1)

	arg_47_0.showingCommodity = arg_47_1
end

function var_0_0.FlushChangeSkin(arg_48_0, arg_48_1)
	local var_48_0 = ShipSkin.GetChangeSkinGroupId(arg_48_0.skinId)
	local var_48_1 = ShipSkin.GetChangeSkinCustomDataId(arg_48_0.skinId, "hide_shop")
	local var_48_2 = pg.gameset.changeskin_switch_block
	local var_48_3 = false
	local var_48_4 = false
	local var_48_5 = arg_48_0.changeSkinToggle:IsAsmrSkin() and true or false

	if var_48_2 and var_48_2.description then
		local var_48_6 = var_48_2.description

		if table.contains(var_48_6, var_48_0) and HXSet.isHx() then
			var_48_4 = true
		end
	end

	if var_48_1 and var_48_1 == 1 then
		var_48_3 = true
	end

	if not arg_48_0.changeSkinId then
		arg_48_0.changeSkinId = arg_48_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_48_0.changeSkinId) == var_48_0 then
		arg_48_0.skinId = arg_48_0.changeSkinId
	else
		arg_48_0.changeSkinId = arg_48_0.skinId
	end

	arg_48_0.changeSkinToggle:setSkinData(arg_48_0.skinId)

	if var_48_3 or var_48_4 or var_48_5 then
		setActive(arg_48_0.changeSkin, false)
	else
		setActive(arg_48_0.changeSkin, true)
	end
end

function var_0_0.GCHandle(arg_49_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.FlushName(arg_50_0)
	local var_50_0 = pg.ship_skin_template[arg_50_0.skinId]

	setScrollText(arg_50_0.skinName, SwitchSpecialChar(var_50_0.name, true))

	if var_50_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_50_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_50_0.skinId)))
	else
		local var_50_1 = ShipGroup.getDefaultShipConfig(var_50_0.ship_group)

		setScrollText(arg_50_0.shipName, var_50_1.name)
	end
end

function var_0_0.FlushPreviewBtn(arg_51_0, arg_51_1)
	local var_51_0 = Goods.ExistFurniture(arg_51_1.id)

	removeOnButton(arg_51_0.switchPreviewBtn)

	if not var_51_0 and arg_51_0.isPreviewFurniture then
		arg_51_0.isPreviewFurniture = false
	end

	setActive(arg_51_0.switchPreviewBtn, var_51_0)

	if var_51_0 then
		onButton(arg_51_0, arg_51_0.switchPreviewBtn, function()
			arg_51_0.isPreviewFurniture = not arg_51_0.isPreviewFurniture

			arg_51_0:SwitchPreview(arg_51_1, arg_51_0.isPreviewFurniture)
			arg_51_0:FlushPrice(arg_51_1)
			arg_51_0:FlushObtainBtn(arg_51_1)
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPreview(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_0.skinId

	if pg.ship_skin_template[var_53_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_53_0.charContainer, false)

		return
	end

	local var_53_1 = getProxy(PlayerProxy):getRawData().id

	setActive(arg_53_0.charContainer, PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_53_1, 0) == 1)
	setActive(arg_53_0.charTf, not arg_53_2)
	setActive(arg_53_0.furnitureContainer, arg_53_2)

	if not arg_53_2 then
		local var_53_2 = pg.ship_skin_template[var_53_0]

		arg_53_0:FlushChar(var_53_2.prefab, var_53_2.id)
		GetImageSpriteFromAtlasAsync("qicon/" .. var_53_2.painting, "", arg_53_0.backChara)
	else
		local var_53_3 = Goods.Id2FurnitureId(arg_53_1.id)
		local var_53_4 = Goods.GetFurnitureConfig(arg_53_1.id)

		arg_53_0.interactionPreview:Flush(var_53_0, var_53_3, var_53_4.scale[2] or 1, var_53_4.position[2])
	end
end

function var_0_0.FlushChar(arg_54_0, arg_54_1, arg_54_2)
	if arg_54_0.prefabName and arg_54_0.prefabName == arg_54_1 then
		return
	end

	arg_54_0:ReturnChar()

	arg_54_0.prefabName = arg_54_1

	local var_54_0 = SpineAnimChar.New()

	var_54_0:SetPaint(arg_54_1)
	var_54_0:Load(true, function(arg_55_0)
		if arg_54_0.prefabName ~= arg_54_1 then
			arg_55_0:Dispose()

			return
		end

		arg_54_0.spineChar = arg_55_0

		local var_55_0 = pg.skinshop_spine_scale[arg_54_2]

		if var_55_0 then
			arg_54_0.spineChar:SetLocalScale(Vector3(var_55_0.skinshop_scale, var_55_0.skinshop_scale, 1))
		else
			arg_54_0.spineChar:SetLocalScale(Vector3(0.9, 0.9, 1))
		end

		arg_54_0.spineChar:SetLocalPosition(Vector3(0, 0, 0))
		arg_54_0.spineChar:SetLayer(Layer.UI)
		arg_54_0.spineChar:SetParent(arg_54_0.charTf)
		arg_54_0.spineChar:SetAction("normal", 0)
	end)
end

function var_0_0.ReturnChar(arg_56_0)
	if arg_56_0.spineChar then
		arg_56_0.spineChar:Dispose()

		arg_56_0.spineChar = nil
		arg_56_0.prefabName = nil
	end
end

function var_0_0.ClearCards(arg_57_0)
	if not arg_57_0.cards then
		return
	end

	for iter_57_0, iter_57_1 in pairs(arg_57_0.cards) do
		iter_57_1:Dispose()
	end

	arg_57_0.cards = nil
end

function var_0_0.FlushTimeLimit(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_0.skinId
	local var_58_1 = false
	local var_58_2

	if arg_58_1:IsActivityExtra() and arg_58_1:ShowMaintenanceTime() then
		local var_58_3, var_58_4 = arg_58_1:GetMaintenanceMonthAndDay()

		function var_58_2()
			return i18n("limit_skin_time_before_maintenance", var_58_3, var_58_4)
		end

		var_58_1 = true
	elseif arg_58_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_58_5 = getProxy(ShipSkinProxy):getSkinById(var_58_0)

		var_58_1 = var_58_5 and var_58_5:isExpireType() and not var_58_5:isExpired()

		if var_58_1 then
			function var_58_2()
				return skinTimeStamp(var_58_5:getRemainTime())
			end
		end
	else
		local var_58_6, var_58_7 = pg.TimeMgr.GetInstance():inTime(arg_58_1:getConfig("time"))

		var_58_1 = var_58_7

		if var_58_1 then
			local var_58_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_58_7)

			function var_58_2()
				return skinCommdityTimeStamp(var_58_8)
			end
		end
	end

	setActive(arg_58_0.top:Find("title/limit_time"), var_58_1)
	arg_58_0:ClearTimer()

	if var_58_1 then
		arg_58_0:AddTimer(var_58_2)
	end
end

function var_0_0.AddTimer(arg_62_0, arg_62_1)
	arg_62_0.timer = Timer.New(function()
		setText(arg_62_0.limitTime, arg_62_1())
	end, 1, -1)

	arg_62_0.timer.func()
	arg_62_0.timer:Start()
end

function var_0_0.ClearTimer(arg_64_0)
	if arg_64_0.timer then
		arg_64_0.timer:Stop()

		arg_64_0.timer = nil
	end
end

function var_0_0.FlushPaintingToggle(arg_65_0, arg_65_1)
	removeOnToggle(arg_65_0.dynamicToggle)
	removeOnToggle(arg_65_0.showBgToggle)

	local var_65_0 = checkABExist("painting/" .. arg_65_0.shipSkin:getConfig("painting") .. "_n")

	if arg_65_0.isToggleShowBg and not var_65_0 then
		triggerToggle(arg_65_0.showBgToggle, false)

		arg_65_0.isToggleShowBg = false
	elseif var_65_0 then
		triggerToggle(arg_65_0.showBgToggle, true)

		arg_65_0.isToggleShowBg = true
	end

	local var_65_1 = arg_65_0.shipSkin:IsSpine() or arg_65_0.shipSkin:IsLive2d() or arg_65_0.shipSkin:IsSpinePlus() or arg_65_0.shipSkin:IsLive2dPlus()
	local var_65_2 = arg_65_0.shipSkin:IsHxDynamicPreview()

	if var_65_1 and not var_65_2 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_65_0.isToggleDynamic = true
	end

	if var_65_1 then
		local var_65_3 = 0

		if arg_65_0.shipSkin:IsSpine() then
			var_65_3 = 6
		elseif arg_65_0.shipSkin:IsLive2d() then
			var_65_3 = 1
		elseif arg_65_0.shipSkin:IsSpinePlus() then
			var_65_3 = 7
		elseif arg_65_0.shipSkin:IsLive2dPlus() then
			var_65_3 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_65_3) .. "_off", arg_65_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_65_3), arg_65_0.dynamicToggle:Find("select"))
	end

	if var_65_2 and arg_65_0.isToggleDynamic then
		triggerToggle(arg_65_0.dynamicToggle, false)

		arg_65_0.isToggleDynamic = false
	end

	if arg_65_0.isToggleDynamic and not var_65_1 then
		triggerToggle(arg_65_0.dynamicToggle, false)

		arg_65_0.isToggleDynamic = false
	elseif arg_65_0.isToggleDynamic and not arg_65_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_65_0.shipSkin:IsLive2d() or arg_65_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_65_0.isToggleDynamic = false

			local var_65_4 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_65_4, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_65_0.dynamicToggle, false)
		else
			triggerToggle(arg_65_0.dynamicToggle, true)

			arg_65_0.isToggleDynamic = true
		end
	end

	if var_65_0 then
		onToggle(arg_65_0, arg_65_0.showBgToggle, function(arg_66_0)
			arg_65_0.isToggleShowBg = arg_66_0

			arg_65_0:FlushPainting(arg_65_1)
			arg_65_0:FlushBG(arg_65_1)
		end, SFX_PANEL)
	end

	if arg_65_0.shipSkin:IsSpine() or arg_65_0.shipSkin:IsLive2d() or arg_65_0.shipSkin:IsSpinePlus() or arg_65_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_65_0, arg_65_0.dynamicToggle, function(arg_67_0)
			local var_67_0 = arg_65_0.shipSkin:IsHxDynamicPreview()

			if arg_67_0 and var_67_0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("shop_tag_control_tip"))
				triggerToggle(arg_65_0.dynamicToggle, false)
				setActive(arg_65_0.dynamicResToggle, false)

				return
			end

			if arg_67_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_65_0.shipSkin:IsLive2d() or arg_65_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_65_0.dynamicToggle, false)

				return
			end

			arg_65_0.isToggleDynamic = arg_67_0

			setActive(arg_65_0.showBgToggle, not arg_67_0 and var_65_0)
			arg_65_0:FlushPainting(arg_65_1)
			arg_65_0:FlushDynamicPaintingResState(arg_65_1)
			arg_65_0:RecordFlag(arg_67_0)
		end, SFX_PANEL)
	end

	setActive(arg_65_0.dynamicIcon, true)

	if arg_65_0.isToggleDynamic then
		arg_65_0:FlushDynamicPaintingResState(arg_65_1)
	elseif var_65_2 then
		setActive(arg_65_0.dynamicResToggle, false)
		setActive(arg_65_0.dynamicIcon, false)
	end

	setActive(arg_65_0.dynamicToggle, var_65_1)
	setActive(arg_65_0.showBgToggle, not arg_65_0.isToggleDynamic and var_65_0)
end

function var_0_0.FlushTag(arg_68_0)
	local var_68_0 = arg_68_0.skinId
	local var_68_1 = pg.ship_skin_template[var_68_0]
	local var_68_2 = Clone(var_68_1.tag)
	local var_68_3 = false

	for iter_68_0 = #var_68_2, 1, -1 do
		local var_68_4 = var_68_2[iter_68_0]

		if var_68_4 == 1 or var_68_4 == 6 or var_68_4 == 7 or var_68_4 == 9 then
			local var_68_5 = true

			table.remove(var_68_2, iter_68_0)
		end
	end

	local var_68_6 = checkABExist("painting/" .. arg_68_0.shipSkin:getConfig("painting") .. "_n")

	arg_68_0.tagList:make(function(arg_69_0, arg_69_1, arg_69_2)
		if arg_69_0 == UIItemList.EventUpdate then
			local var_69_0 = var_68_2[arg_69_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_68_2[arg_69_1 + 1]), function(arg_70_0)
				if arg_68_0.exited then
					return
				end

				arg_69_2:GetComponent(typeof(Image)).sprite = arg_70_0
			end)
		end
	end)
	arg_68_0.tagList:align(#var_68_2)
end

function var_0_0.FlushPainting(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_0:GetPaintingState(arg_71_1)
	local var_71_1 = pg.ship_skin_template[arg_71_0.skinId].painting
	local var_71_2 = ShipSkin.GetChangeSkinData(arg_71_0.skinId) and true or false

	if var_71_0 == var_0_2 and not arg_71_0:ExistL2dRes(var_71_1) or var_71_0 == var_0_3 and not arg_71_0:ExistSpineRes(var_71_1) then
		var_71_0 = var_0_1
	end

	if arg_71_0.paintingState and arg_71_0.paintingState.state == var_71_0 and arg_71_0.paintingState.id == arg_71_1.id and arg_71_0.paintingState.showBg == arg_71_0.isToggleShowBg and arg_71_0.paintingState.purchaseFlag == arg_71_1.buyCount and not var_71_2 then
		return
	end

	arg_71_0:ClearPainting()

	if var_71_0 == var_0_1 then
		arg_71_0:LoadMeshPainting(arg_71_1, arg_71_0.isToggleShowBg)
	elseif var_71_0 == var_0_2 then
		arg_71_0:LoadL2dPainting(arg_71_1)
	elseif var_71_0 == var_0_3 then
		arg_71_0:LoadSpinePainting(arg_71_1)
	end

	arg_71_0.paintingState = {
		state = var_71_0,
		id = arg_71_1.id,
		showBg = arg_71_0.isToggleShowBg,
		purchaseFlag = arg_71_1.buyCount
	}

	arg_71_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_72_0)
	local var_72_0 = arg_72_0.paintingState

	if not var_72_0 then
		return
	end

	if var_72_0.state == var_0_1 then
		arg_72_0:ClearMeshPainting()
	elseif var_72_0.state == var_0_2 then
		arg_72_0:ClearL2dPainting()
	elseif var_72_0.state == var_0_3 then
		arg_72_0:ClearSpinePainting()
	end

	arg_72_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = findTF(arg_73_0.paintingTF, "fitter")
	local var_73_1 = GetOrAddComponent(var_73_0, "PaintingScaler")

	var_73_1.FrameName = "chuanwu"
	var_73_1.Tween = 1

	local var_73_2 = pg.ship_skin_template[arg_73_0.skinId].painting
	local var_73_3 = var_73_2

	if not arg_73_2 and checkABExist("painting/" .. var_73_2 .. "_n") then
		var_73_2 = var_73_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_73_2) then
		return
	end

	if PLATFORM_CODE == PLATFORM_CH and checkABExist("painting/" .. var_73_2 .. "_shop") then
		var_73_2 = var_73_2 .. "_shop"
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_73_2, true, function(arg_74_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_74_0, var_73_0, false)
		ShipExpressionHelper.SetExpression(var_73_0:GetChild(0), var_73_3)

		arg_73_0.paintingName = var_73_2

		if arg_73_0.paintingState and arg_73_0.paintingState.id ~= arg_73_1.id then
			arg_73_0:ClearMeshPainting()
		end

		local var_74_0 = arg_74_0.transform:Find("shop_hx")

		arg_73_0:CheckShowShopHx(var_74_0)

		local var_74_1 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()
		local var_74_2 = arg_74_0.transform:Find("shop_hx_ch" .. var_74_1)

		arg_73_0:CheckShowShopHx(var_74_2)
	end)
end

function var_0_0.ClearMeshPainting(arg_75_0)
	local var_75_0 = arg_75_0.paintingTF:Find("fitter")

	if arg_75_0.paintingName and var_75_0.childCount > 0 then
		local var_75_1 = var_75_0:GetChild(0).gameObject
		local var_75_2 = var_75_1.transform:Find("shop_hx")

		arg_75_0:RevertShopHx(var_75_2)
		PoolMgr.GetInstance():ReturnPainting(arg_75_0.paintingName, var_75_1)
	end

	arg_75_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_76_0, arg_76_1)
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

	local var_76_5 = Live2DPainting.GenerateData({
		ship = var_76_2,
		position = Vector3(0, 0, -1),
		parent = arg_76_0.live2dContainer,
		offset = var_76_2:GetSkinConfig().shop_offset
	})

	var_76_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_76_0.live2dChar = Live2DPainting.New(var_76_5, function(arg_77_0)
		arg_77_0:IgonreReactPos(true)
		arg_76_0:CheckShowShopHxForL2d(arg_77_0, arg_76_1)

		if arg_76_0.paintingState and arg_76_0.paintingState.id ~= arg_76_1.id then
			arg_76_0:ClearL2dPainting()
		end

		arg_77_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_78_0)
	if arg_78_0.live2dChar then
		arg_78_0:RevertShopHxForL2d(arg_78_0.live2dChar)
		arg_78_0.live2dChar:Dispose()

		arg_78_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_79_0, arg_79_1)
	local var_79_0 = arg_79_0.skinId
	local var_79_1 = pg.ship_skin_template[var_79_0].skin_type
	local var_79_2

	if var_79_1 == ShipSkin.SKIN_TYPE_TB then
		var_79_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_79_0))
	else
		local var_79_3 = pg.ship_skin_template[var_79_0].ship_group
		local var_79_4 = ShipGroup.getDefaultShipConfig(var_79_3)

		var_79_2 = Ship.New({
			noChangeSkin = true,
			configId = var_79_4.id,
			skin_id = var_79_0
		})
	end

	local var_79_5 = SpinePainting.GenerateData({
		ship = var_79_2,
		position = Vector3(0, 0, 0),
		parent = arg_79_0.spTF,
		effectParent = arg_79_0.spBg,
		offset = var_79_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_79_0.spinePainting = SpinePainting.New(var_79_5, function(arg_80_0)
		arg_80_0:SetShopHx(true)

		if arg_79_0.paintingState and arg_79_0.paintingState.id ~= arg_79_1.id then
			arg_79_0:ClearSpinePainting()
		end

		local var_80_0 = arg_80_0._tf:Find("shop_hx")

		arg_79_0:CheckShowShopHx(var_80_0)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_81_0)
	if arg_81_0.spinePainting and arg_81_0.spinePainting._tf then
		local var_81_0 = arg_81_0.spinePainting._tf:Find("shop_hx")

		arg_81_0:RevertShopHx(arg_81_0.shopHx)
		arg_81_0.spinePainting:Dispose()

		arg_81_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHx(arg_82_0, arg_82_1)
	if IsNil(arg_82_1) then
		return
	end

	setActive(arg_82_1, false)

	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	setActive(arg_82_1, true)
end

function var_0_0.RevertShopHx(arg_83_0, arg_83_1)
	if not IsNil(arg_83_1) then
		setActive(arg_83_1, false)
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_84_0, arg_84_1, arg_84_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_84_0 = 1

	arg_84_1:changeParamaterValue("shop_hx", var_84_0)
end

function var_0_0.RevertShopHxForL2d(arg_85_0, arg_85_1)
	arg_85_1:changeParamaterValue("shop_hx", 0)
end

function var_0_0.AdjustPainting(arg_86_0, arg_86_1)
	local var_86_0 = arg_86_0.paintingTF
	local var_86_1 = pg.ship_skin_newmainui_shift[arg_86_0.skinId]

	if var_86_1 then
		local var_86_2 = var_86_1.skin_shop_shift

		if arg_86_1 then
			var_86_0.anchoredPosition = Vector2(var_86_2[1] - 440, var_86_2[2] + arg_86_0.defaultPaintingPosition.y)
		else
			var_86_0.anchoredPosition = Vector2(var_86_2[1] + arg_86_0.defaultPaintingPosition.x, var_86_2[2] + arg_86_0.defaultPaintingPosition.y)
		end

		local var_86_3 = var_86_2[4]

		var_86_0.localScale = Vector3(var_86_3, var_86_3, 1)
	else
		var_86_0.anchoredPosition = Vector2(arg_86_0.defaultPaintingPosition.x, arg_86_0.defaultPaintingPosition.y)
		var_86_0.localScale = arg_86_0.defaultPaintingScale
	end
end

function var_0_0.FlushBG(arg_87_0, arg_87_1, arg_87_2)
	local var_87_0 = arg_87_0.skinId
	local var_87_1 = pg.ship_skin_template[var_87_0]
	local var_87_2

	if var_87_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_87_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_87_0))
	else
		local var_87_3 = ShipGroup.getDefaultShipConfig(var_87_1.ship_group)

		var_87_2 = Ship.New({
			id = 999,
			configId = var_87_3.id,
			skin_id = var_87_0
		})
	end

	local var_87_4 = var_87_2:getShipBgPrint(true)
	local var_87_5 = pg.ship_skin_template[var_87_0].painting

	if (arg_87_0.isToggleShowBg or not checkABExist("painting/" .. var_87_5 .. "_n")) and var_87_1.bg_sp ~= "" then
		var_87_4 = var_87_1.bg_sp
	end

	local var_87_6 = var_87_4 ~= var_87_2:rarity2bgPrintForGet()

	if var_87_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_87_0, var_87_4, arg_87_0.bgs:Find("diffBg"), arg_87_0.bgs:Find("diffBg/bg"), function(arg_88_0)
			if arg_87_2 then
				arg_87_2()
			end
		end, function(arg_89_0)
			if arg_87_2 then
				arg_87_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_87_0:getUIName())

		if arg_87_2 then
			arg_87_2()
		end
	end

	setActive(arg_87_0.bgs:Find("diffBg"), var_87_6)
	setActive(arg_87_0.bgs:Find("default"), not var_87_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_90_0, arg_90_1)
	if not arg_90_0.isToggleDynamic then
		return
	end

	local var_90_0 = arg_90_0:GetPaintingState(arg_90_1)
	local var_90_1 = false
	local var_90_2 = ""
	local var_90_3 = pg.ship_skin_template[arg_90_0.skinId].painting

	if var_0_2 == var_90_0 then
		var_90_1, var_90_2 = arg_90_0:ExistL2dRes(var_90_3)
	elseif var_0_3 == var_90_0 then
		var_90_1, var_90_2 = arg_90_0:ExistSpineRes(var_90_3)
	end

	setActive(arg_90_0.dynamicResToggle, not var_90_1)
	removeOnButton(arg_90_0.dynamicResToggle)

	if not var_90_1 and var_90_2 ~= "" then
		onButton(arg_90_0, arg_90_0.dynamicResToggle, function()
			arg_90_0:DownloadDynamicPainting(var_90_2, arg_90_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_92_0, arg_92_1, arg_92_2)
	local var_92_0 = arg_92_0.skinId

	if arg_92_0.downloads[var_92_0] then
		return
	end

	local var_92_1 = SkinShopDownloadRequest.New()

	arg_92_0.downloads[var_92_0] = var_92_1

	var_92_1:Start(arg_92_1, function(arg_93_0)
		if arg_93_0 and arg_92_0.paintingState and arg_92_0.paintingState.id == arg_92_2.id then
			arg_92_0:FlushPainting(arg_92_2)
			arg_92_0:FlushDynamicPaintingResState(arg_92_2)
		end

		var_92_1:Dispose()

		arg_92_0.downloads[var_92_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_94_0, arg_94_1)
	if arg_94_0.isToggleDynamic and (arg_94_0.shipSkin:IsLive2d() or arg_94_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_94_0.isToggleDynamic and (arg_94_0.shipSkin:IsSpine() or arg_94_0.shipSkin:IsSpinePlus()) then
		if arg_94_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_95_0, arg_95_1)
	local var_95_0 = "live2d/" .. string.lower(arg_95_1)
	local var_95_1 = HXSet.autoHxShiftPath(var_95_0, nil, true)

	return checkABExist(var_95_1), var_95_1
end

function var_0_0.ExistSpineRes(arg_96_0, arg_96_1)
	local var_96_0 = "SpinePainting/" .. string.lower(arg_96_1)
	local var_96_1 = HXSet.autoHxShiftPath(var_96_0, nil, true)

	return checkABExist(var_96_1), var_96_1
end

function var_0_0.RecordFlag(arg_97_0, arg_97_1)
	local var_97_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_97_0, arg_97_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_97_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_97_1)
end

function var_0_0.FlushPrice(arg_98_0, arg_98_1)
	local var_98_0 = arg_98_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_98_1 = arg_98_1.type == Goods.TYPE_ACTIVITY or arg_98_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_98_0 then
		if arg_98_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_98_0:UpdateExperiencePrice4Item(arg_98_1)
		else
			arg_98_0:UpdateExperiencePrice(arg_98_1)
		end
	elseif arg_98_0.isPreviewFurniture then
		arg_98_0:UpdateFurniturePrice(arg_98_1)
	elseif var_98_1 then
		-- block empty
	else
		arg_98_0:UpdateCommodityPrice(arg_98_1)
	end

	local var_98_2 = arg_98_1.type == Goods.TYPE_SKIN

	setActive(arg_98_0.price:Find("timeLimit"), var_98_0 and not var_98_1)
	setActive(arg_98_0.price:Find("consume"), var_98_2 and not var_98_0 and not var_98_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1:getConfig("resource_num")
	local var_99_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_99_2 = _.detect(var_99_1, function(arg_100_0)
		return arg_100_0:CanUseForShop(arg_99_1.id)
	end)
	local var_99_3 = var_99_2 and var_99_2.count or 0
	local var_99_4 = (var_99_3 < var_99_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_99_3 .. (var_99_3 < var_99_0 and "</color>" or "")

	setText(arg_99_0.price:Find("timeLimit/consume/Text"), var_99_4 .. "/" .. var_99_0)
end

function var_0_0.UpdateExperiencePrice(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_1:getConfig("resource_num")
	local var_101_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_101_2 = (var_101_1 < var_101_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_101_1 .. (var_101_1 < var_101_0 and "</color>" or "")

	setText(arg_101_0.price:Find("timeLimit/consume/Text"), var_101_2 .. "/" .. var_101_0)
end

function var_0_0.UpdateCommodityPrice(arg_102_0, arg_102_1)
	local var_102_0 = arg_102_1:GetPrice()
	local var_102_1 = arg_102_1:getConfig("resource_num")

	setText(arg_102_0.price:Find("consume/Text"), var_102_0)
	setText(arg_102_0.price:Find("consume/originalprice/Text"), var_102_1)
	setActive(arg_102_0.price:Find("consume/originalprice"), var_102_0 ~= var_102_1)
end

function var_0_0.UpdateFurniturePrice(arg_103_0, arg_103_1)
	local var_103_0 = Goods.Id2FurnitureId(arg_103_1.id)
	local var_103_1 = Furniture.New({
		id = var_103_0
	})
	local var_103_2 = var_103_1:getConfig("gem_price")

	setText(arg_103_0.price:Find("consume/originalprice/Text"), var_103_2)

	local var_103_3 = var_103_1:getPrice(PlayerConst.ResDiamond)

	setText(arg_103_0.price:Find("consume/Text"), var_103_3)
	setActive(arg_103_0.price:Find("consume/originalprice"), var_103_2 ~= var_103_3)
end

function var_0_0.FlushObtainBtn(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_0:GetObtainBtnState(arg_104_1)
	local var_104_1 = var_0_19(var_104_0)

	for iter_104_0 = 0, arg_104_0.btns.childCount - 1 do
		local var_104_2 = arg_104_0.btns:GetChild(iter_104_0)

		setActive(var_104_2, var_104_2.name == var_104_1)
	end

	setActive(arg_104_0.price:Find("btn/item"), var_104_0 == var_0_11)
	setActive(arg_104_0.price:Find("btn/tag"), var_104_0 == var_0_11)

	if var_104_0 == var_0_11 then
		arg_104_0:FlushGift(arg_104_1)
	end

	onButton(arg_104_0, arg_104_0.price:Find("btn"), function()
		local var_105_0 = {}
		local var_105_1 = SkinCouponActivity.StaticEncoreActTip(arg_104_1.id)

		if tobool(var_105_1) then
			table.insert(var_105_0, function(arg_106_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						if var_105_1 and not var_105_1:isEnd() then
							arg_104_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_105_1.id)
						end
					end,
					onNo = arg_106_0
				})
			end)
		end

		if arg_104_1:getConfig("genre") == ShopArgs.SkinShop and not arg_104_1:IsItemDiscountType() and #SkinCouponActivity.GetOvercountEncoreActs(arg_104_1.id) > 0 then
			table.insert(var_105_0, function(arg_108_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Last_Coupon"),
					onYes = arg_108_0
				})
			end)
		end

		seriesAsync(var_105_0, function()
			if var_104_0 == var_0_5 or var_104_0 == var_0_7 or var_104_0 == var_0_11 then
				arg_104_0.purchaseView:ExecuteAction("Show", arg_104_1)
			else
				arg_104_0:OnClickBtn(var_104_0, arg_104_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.GetObtainBtnState(arg_110_0, arg_110_1)
	if arg_110_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_110_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_110_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_110_1.type == Goods.TYPE_ACTIVITY or arg_110_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_110_1.buyCount > 0 then
		return var_0_4
	elseif arg_110_1:isDisCount() and arg_110_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_110_1:CanUseVoucherType() or arg_110_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_110_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.FlushGift(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1:GetGiftList()[1]

	updateDrop(arg_111_0.price:Find("btn/item/mask/item"), {
		type = var_111_0.type,
		id = var_111_0.id,
		count = var_111_0.count
	})
end

function var_0_0.OnClickBtn(arg_112_0, arg_112_1, arg_112_2)
	if arg_112_1 == var_0_5 or arg_112_1 == var_0_7 or arg_112_1 == var_0_11 then
		arg_112_0:OnPurchase(arg_112_2)
	elseif arg_112_1 == var_0_10 then
		arg_112_0:OnItemPurchase(arg_112_2)
	elseif arg_112_1 == var_0_6 then
		arg_112_0:OnActivity(arg_112_2)
	elseif arg_112_1 == var_0_8 then
		arg_112_0:OnBackyard(arg_112_2)
	elseif arg_112_1 == var_0_9 then
		if arg_112_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_112_0:OnExperience4Item(arg_112_2)
		else
			arg_112_0:OnExperience(arg_112_2)
		end
	end
end

function var_0_0.FlushGifgPackBtn(arg_113_0, arg_113_1)
	local var_113_0 = false
	local var_113_1
	local var_113_2
	local var_113_3

	for iter_113_0, iter_113_1 in pairs(arg_113_0.giftSkinCommodities) do
		for iter_113_2, iter_113_3 in ipairs(iter_113_1) do
			if iter_113_3.id == arg_113_1.id then
				var_113_0 = true

				break
			end
		end

		if var_113_0 then
			var_113_1 = arg_113_0.giftPackCommodities[iter_113_0]
			var_113_2 = arg_113_0.giftSkinCommodities[iter_113_0]
			var_113_3 = arg_113_0.giftSkinProbabilitys[iter_113_0]

			break
		end
	end

	if var_113_0 then
		setText(arg_113_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip_2"))
		onButton(arg_113_0, arg_113_0.giftPackBtn, function()
			if not var_113_1:isChargeType() then
				return
			end

			local var_114_0 = var_113_1:GetSkinProbability()
			local var_114_1 = getProxy(ShipSkinProxy):GetProbabilitySkins(var_114_0)

			if #var_114_0 <= 0 or #var_114_0 ~= #var_114_1 then
				arg_113_0:emit(LatestSkinShopMediator.OPEN_SCENE, {
					SCENE.CHARGE,
					{
						wrap = ChargeScene.TYPE_PICK
					}
				})
			else
				arg_113_0:emit(LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER, var_113_1, var_113_2, var_113_3)
			end
		end, SFX_PANEL)
	else
		for iter_113_4, iter_113_5 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SKIN_FAKE_PACKAGE)) do
			if iter_113_5 and not iter_113_5:isEnd() and iter_113_5.data1 < 1 and underscore.any(iter_113_5:getConfig("config_data")[1], function(arg_115_0)
				return pg.ship_skin_template[arg_115_0].shop_id == arg_113_1.id
			end) then
				var_113_0 = iter_113_5

				break
			end
		end

		if var_113_0 then
			setText(arg_113_0.giftPackBtn:Find("title"), i18n("skinshop_on_sale_tip"))
			onButton(arg_113_0, arg_113_0.giftPackBtn, function()
				arg_113_0:emit(LatestSkinShopMediator.OPEN_GIFT_ACT_LAYER, var_113_0.id)
			end, SFX_PANEL)
		end
	end

	setActive(arg_113_0.giftPackBtn, var_113_0)
end

function var_0_0.SetGiftPackLayer(arg_117_0)
	return
end

function var_0_0.OnPurchase(arg_118_0, arg_118_1)
	if arg_118_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_118_1:isDisCount() and arg_118_1:IsItemDiscountType() then
		arg_118_0:emit(LatestSkinShopMediator.ON_SHOPPING_BY_ACT, arg_118_1.id, 1)
	else
		arg_118_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_118_1.id, 1)
	end
end

function var_0_0.OnItemPurchase(arg_119_0, arg_119_1)
	if arg_119_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_119_0 = arg_119_1:GetVoucherIdList()
	local var_119_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_119_1.id)

	if #var_119_0 <= 0 and #var_119_1 <= 0 then
		return
	end

	local var_119_2 = {}

	for iter_119_0, iter_119_1 in ipairs(var_119_0) do
		table.insert(var_119_2, iter_119_1)
	end

	for iter_119_2, iter_119_3 in ipairs(var_119_1) do
		table.insert(var_119_2, iter_119_3.id)
	end

	local var_119_3 = arg_119_0.skinId
	local var_119_4 = pg.ship_skin_template[var_119_3]
	local var_119_5 = SwitchSpecialChar(var_119_4.name, true)

	arg_119_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_119_2,
		skinId = var_119_3,
		skinName = var_119_5,
		price = arg_119_1:GetPrice(),
		onYes = function(arg_120_0)
			if arg_120_0 then
				arg_119_0:emit(LatestSkinShopMediator.ON_ITEM_PURCHASE, arg_120_0, arg_119_1.id)
			else
				arg_119_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_119_1.id, 1)
			end
		end
	})
end

function var_0_0.OnActivity(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_1:getConfig("time")
	local var_121_1 = arg_121_1:getConfig("activity")
	local var_121_2 = getProxy(ActivityProxy):getActivityById(var_121_1)

	if var_121_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_121_0) or var_121_2 and not var_121_2:isEnd() then
		if arg_121_1.type == Goods.TYPE_ACTIVITY then
			arg_121_0:emit(LatestSkinShopMediator.GO_SHOPS_LAYER, arg_121_1:getConfig("activity"))
		elseif arg_121_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_121_3 = arg_121_1:getConfig("scene")

			if var_121_3 and #var_121_3 > 0 then
				arg_121_0:emit(LatestSkinShopMediator.OPEN_SCENE, var_121_3)
			else
				arg_121_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_121_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_122_0, arg_122_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_122_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_122_0.name, var_122_0.level))

		return
	end

	arg_122_0:emit(LatestSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_123_0, arg_123_1)
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

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_123_2, var_123_8, var_123_4, var_123_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_123_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_123_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_123_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_125_0, arg_125_1)
	local var_125_0 = arg_125_0.skinId
	local var_125_1 = getProxy(ShipSkinProxy):getSkinById(var_125_0)

	if var_125_1 and not var_125_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_125_2 = arg_125_1:getConfig("resource_num")
	local var_125_3 = arg_125_1:getConfig("time_second") * var_125_2
	local var_125_4, var_125_5, var_125_6, var_125_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_125_3)
	local var_125_8 = pg.ship_skin_template[arg_125_0.skinId].name
	local var_125_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_125_10 = _.detect(var_125_9, function(arg_126_0)
		return arg_126_0:CanUseForShop(arg_125_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_125_2, var_125_8, var_125_4, var_125_5),
		onYes = function()
			if not var_125_10 or var_125_10.count < var_125_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_125_0:emit(LatestSkinShopMediator.ON_ITEM_EXPERIENCE, var_125_10.id, arg_125_1.id, 1)
		end
	})
end

function var_0_0.SetFilterPanel(arg_128_0)
	local var_128_0 = arg_128_0.filterContent:Find("own/options")
	local var_128_1 = arg_128_0.filterContent:Find("type/options")
	local var_128_2 = arg_128_0.filterContent:Find("shipHave/options")
	local var_128_3 = arg_128_0.filterContent:Find("camp/options")
	local var_128_4 = arg_128_0.filterContent:Find("rarity/options")
	local var_128_5 = arg_128_0.filterContent:Find("shipType/options")
	local var_128_6 = arg_128_0.filterContent:Find("themeType/options")

	arg_128_0:SetOptionList(var_128_3, ShipIndexConst.CampNames, true)
	arg_128_0:SetOptionList(var_128_4, ShipIndexConst.RarityNames, true)
	arg_128_0:SetOptionList(var_128_5, ShipIndexConst.TypeNames, true)
	arg_128_0:SetOptionList(var_128_6, arg_128_0.classifyNames)
	arg_128_0:SetSingleOptions(var_128_0, "ownType")
	arg_128_0:SetMultiOptions(var_128_1, "typeType")
	arg_128_0:SetSingleOptions(var_128_2, "shipHaveType")
	arg_128_0:SetMultiOptions(var_128_3, "campType")
	arg_128_0:SetMultiOptions(var_128_4, "rarityType")
	arg_128_0:SetMultiOptions(var_128_5, "shipType")
	arg_128_0:SetMultiOptions(var_128_6, "themeType")
	onButton(arg_128_0, arg_128_0.filterUI:Find("bg"), function()
		for iter_129_0, iter_129_1 in pairs(arg_128_0.filterValues) do
			arg_128_0.filterValuesTemp[iter_129_0] = Clone(arg_128_0.filterValues[iter_129_0])
		end

		setActive(arg_128_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_128_0, arg_128_0.filterUI:Find("panelMask/panel/closeBtn"), function()
		for iter_130_0, iter_130_1 in pairs(arg_128_0.filterValues) do
			arg_128_0.filterValuesTemp[iter_130_0] = Clone(arg_128_0.filterValues[iter_130_0])
		end

		setActive(arg_128_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_128_0, arg_128_0.filterUI:Find("panelMask/panel/bottom/ok"), function()
		for iter_131_0, iter_131_1 in pairs(arg_128_0.filterValues) do
			arg_128_0.filterValues[iter_131_0] = Clone(arg_128_0.filterValuesTemp[iter_131_0])
		end

		setActive(arg_128_0.filterUI, false)
		arg_128_0:Refresh(true)
	end, SFX_PANEL)
end

function var_0_0.OpenFilterPanel(arg_132_0)
	setActive(arg_132_0.filterUI, true)

	local var_132_0 = arg_132_0.filterContent:Find("own/options")
	local var_132_1 = arg_132_0.filterContent:Find("type/options")
	local var_132_2 = arg_132_0.filterContent:Find("shipHave/options")
	local var_132_3 = arg_132_0.filterContent:Find("camp/options")
	local var_132_4 = arg_132_0.filterContent:Find("rarity/options")
	local var_132_5 = arg_132_0.filterContent:Find("shipType/options")
	local var_132_6 = arg_132_0.filterContent:Find("themeType/options")

	arg_132_0:SetSingleOptions(var_132_0, "ownType", true)
	arg_132_0:SetMultiOptions(var_132_1, "typeType", true)
	arg_132_0:SetSingleOptions(var_132_2, "shipHaveType", true)
	arg_132_0:SetMultiOptions(var_132_3, "campType", true)
	arg_132_0:SetMultiOptions(var_132_4, "rarityType", true)
	arg_132_0:SetMultiOptions(var_132_5, "shipType", true)
	arg_132_0:SetMultiOptions(var_132_6, "themeType", true)
end

function var_0_0.SetOptionList(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	local var_133_0 = UIItemList.New(arg_133_1, arg_133_1:GetChild(0))

	var_133_0:make(function(arg_134_0, arg_134_1, arg_134_2)
		if arg_134_0 == UIItemList.EventUpdate then
			local var_134_0 = arg_133_2[arg_134_1 + 1]

			if arg_133_3 then
				var_134_0 = i18n(var_134_0)
			end

			arg_134_2.name = arg_134_1

			setScrollText(arg_134_2:Find("mask/Text"), var_134_0)
		end
	end)
	var_133_0:align(#arg_133_2)
end

function var_0_0.SetSingleOptions(arg_135_0, arg_135_1, arg_135_2, arg_135_3)
	for iter_135_0 = 0, arg_135_1.childCount - 1 do
		local var_135_0 = arg_135_1:GetChild(iter_135_0)

		arg_135_0:SetOptionSelect(arg_135_1:GetChild(iter_135_0), iter_135_0 == arg_135_0.filterValuesTemp[arg_135_2])

		if not arg_135_3 then
			onButton(arg_135_0, var_135_0, function()
				arg_135_0.filterValuesTemp[arg_135_2] = iter_135_0

				for iter_136_0 = 0, arg_135_1.childCount - 1 do
					arg_135_0:SetOptionSelect(arg_135_1:GetChild(iter_136_0), iter_136_0 == iter_135_0)
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetMultiOptions(arg_137_0, arg_137_1, arg_137_2, arg_137_3)
	for iter_137_0 = 0, arg_137_1.childCount - 1 do
		local var_137_0 = arg_137_1:GetChild(iter_137_0)

		arg_137_0:SetOptionSelect(arg_137_1:GetChild(iter_137_0), table.contains(arg_137_0.filterValuesTemp[arg_137_2], iter_137_0))

		if not arg_137_3 then
			onButton(arg_137_0, var_137_0, function()
				if iter_137_0 == 0 then
					arg_137_0.filterValuesTemp[arg_137_2] = {
						0
					}

					for iter_138_0 = 0, arg_137_1.childCount - 1 do
						arg_137_0:SetOptionSelect(arg_137_1:GetChild(iter_138_0), iter_138_0 == 0)
					end
				else
					table.removebyvalue(arg_137_0.filterValuesTemp[arg_137_2], 0)

					if table.contains(arg_137_0.filterValuesTemp[arg_137_2], iter_137_0) then
						table.removebyvalue(arg_137_0.filterValuesTemp[arg_137_2], iter_137_0)
					else
						table.insert(arg_137_0.filterValuesTemp[arg_137_2], iter_137_0)
					end

					local var_138_0 = true

					for iter_138_1 = 1, arg_137_1.childCount - 1 do
						if not table.contains(arg_137_0.filterValuesTemp[arg_137_2], iter_138_1) then
							var_138_0 = false

							break
						end
					end

					if #arg_137_0.filterValuesTemp[arg_137_2] == 0 then
						var_138_0 = true
					end

					if var_138_0 then
						arg_137_0.filterValuesTemp[arg_137_2] = {
							0
						}
					end

					for iter_138_2 = 0, arg_137_1.childCount - 1 do
						arg_137_0:SetOptionSelect(arg_137_1:GetChild(iter_138_2), table.contains(arg_137_0.filterValuesTemp[arg_137_2], iter_138_2))
					end
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetOptionSelect(arg_139_0, arg_139_1, arg_139_2)
	setActive(arg_139_1:Find("selectedFrame"), arg_139_2)

	local var_139_0

	if IsNil(arg_139_1:Find("Text")) then
		var_139_0 = arg_139_1:Find("mask/Text"):GetComponent(typeof(Text))
	else
		var_139_0 = arg_139_1:Find("Text"):GetComponent(typeof(Text))
	end

	if arg_139_2 then
		var_139_0.color = Color.New(1, 1, 1, 1)
	else
		var_139_0.color = Color.New(0, 0, 0, 0.5)
	end
end

function var_0_0.GetSkinClassify(arg_140_0)
	arg_140_0.classifyIds = {}
	arg_140_0.classifyNames = {}

	local var_140_0 = {}
	local var_140_1 = {}

	for iter_140_0, iter_140_1 in ipairs(arg_140_0.commodities) do
		local var_140_2 = arg_140_0:GetShopTypeIdBySkinId(iter_140_1:getSkinId())
		local var_140_3 = var_140_2 == 0 and var_0_16 or var_140_2

		var_140_1[var_140_3] = (var_140_1[var_140_3] or 0) + 1
	end

	local var_140_4 = {}

	for iter_140_2, iter_140_3 in ipairs(arg_140_0.returnSkins) do
		var_140_4[iter_140_3] = true
	end

	if underscore.any(arg_140_0.commodities, function(arg_141_0)
		return var_140_4[arg_141_0.id]
	end) then
		table.insert(var_140_0, var_0_14)
	end

	for iter_140_4, iter_140_5 in ipairs(pg.skin_page_template.all) do
		if iter_140_5 ~= var_0_17 and iter_140_5 ~= var_0_18 and (var_140_1[iter_140_5] or 0) > 0 then
			table.insert(var_140_0, iter_140_5)
		end
	end

	if arg_140_0.mode == var_0_0.MODE_EXPERIENCE then
		table.insert(var_140_0, 1, var_0_13)
	end

	if arg_140_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_140_0, 1, var_0_15)
	end

	table.insert(var_140_0, 1, var_0_12)

	arg_140_0.classifyIds = var_140_0

	for iter_140_6, iter_140_7 in ipairs(arg_140_0.classifyIds) do
		if iter_140_7 == var_0_12 then
			table.insert(arg_140_0.classifyNames, i18n("shop_filter_all"))
		elseif iter_140_7 == var_0_13 or iter_140_7 == var_0_15 then
			table.insert(arg_140_0.classifyNames, i18n("shop_filter_trial"))
		elseif iter_140_7 == var_0_14 then
			table.insert(arg_140_0.classifyNames, i18n("shop_filter_retro"))
		else
			table.insert(arg_140_0.classifyNames, pg.skin_page_template[iter_140_7].name)
		end
	end
end

function var_0_0.GetShopTypeIdBySkinId(arg_142_0, arg_142_1)
	local var_142_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not arg_142_0.shopTypeIdList then
		arg_142_0.shopTypeIdList = {}
	end

	if arg_142_0.shopTypeIdList[arg_142_1] then
		return arg_142_0.shopTypeIdList[arg_142_1]
	end

	for iter_142_0, iter_142_1 in pairs(var_142_0) do
		for iter_142_2, iter_142_3 in ipairs(iter_142_1) do
			arg_142_0.shopTypeIdList[iter_142_3] = iter_142_0

			if iter_142_3 == arg_142_1 then
				return iter_142_0
			end
		end
	end
end

function var_0_0.OnShopping(arg_143_0, arg_143_1)
	if not arg_143_0.showingCommodity then
		return
	end

	if arg_143_0.purchaseView and arg_143_0.purchaseView:GetLoaded() then
		arg_143_0.purchaseView:Hide()
	end

	if arg_143_0.showingCommodity.id == arg_143_1 then
		arg_143_0:GetAllCommodities()
		arg_143_0:Refresh(true)
	end
end

function var_0_0.OnFurnitureUpdate(arg_144_0, arg_144_1)
	if not arg_144_0.showingCommodity then
		return
	end

	local var_144_0 = arg_144_0.showingCommodity.id

	if Goods.ExistFurniture(var_144_0) and Goods.Id2FurnitureId(var_144_0) == arg_144_1 then
		arg_144_0:GetAllCommodities()
		arg_144_0:Refresh(true)
	end
end

function var_0_0.CheckDownloadSkinList(arg_145_0, arg_145_1)
	local var_145_0 = {}

	for iter_145_0, iter_145_1 in ipairs(arg_145_0.commodities) do
		PaintingGroupConst.AddPaintingNameBySkinID(var_145_0, iter_145_1:getSkinId())
	end

	local var_145_1 = {
		isShowBox = true,
		paintingNameList = var_145_0,
		finishFunc = arg_145_1
	}

	PaintingGroupConst.PaintingDownload(var_145_1)
end

function var_0_0.willExit(arg_146_0)
	arg_146_0:ClearCards()
	ClearLScrollrect(arg_146_0.scrollrect)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_146_0:getUIName())

	if arg_146_0.live2dChar then
		arg_146_0.live2dChar:Dispose()

		arg_146_0.live2dChar = nil
	end

	if arg_146_0.voucherMsgBox then
		arg_146_0.voucherMsgBox:Destroy()

		arg_146_0.voucherMsgBox = nil
	end

	if arg_146_0.purchaseView then
		arg_146_0.purchaseView:Destroy()

		arg_146_0.purchaseView = nil
	end

	for iter_146_0, iter_146_1 in pairs(arg_146_0.downloads) do
		iter_146_1:Dispose()
	end

	arg_146_0.downloads = {}

	arg_146_0:ClearPainting()

	if arg_146_0.interactionPreview then
		arg_146_0.interactionPreview:Dispose()

		arg_146_0.interactionPreview = nil
	end

	arg_146_0:disposeEvent()
	arg_146_0:ClearTimer()
	arg_146_0:ReturnChar()
	arg_146_0:UnOverlay()
end

function var_0_0.onBackPressed(arg_147_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

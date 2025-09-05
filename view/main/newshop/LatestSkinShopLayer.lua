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
	arg_3_0.showOwnBtn = arg_3_0.adapt:Find("bottom/showOwnBtn")
	arg_3_0.filterBtn = arg_3_0.adapt:Find("bottom/filterBtn")
	arg_3_0.search = arg_3_0.adapt:Find("bottom/search")
	arg_3_0.scrollrect = arg_3_0.adapt:Find("bottom/scroll"):GetComponent("LScrollRect")
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

	arg_3_0.changeSkinToggles = {}

	for iter_3_0 = 1, 2 do
		local var_3_0 = arg_3_0.changeSkin:Find("toggle_ui/ad/toggle/" .. iter_3_0)
		local var_3_1 = GetComponent(var_3_0, typeof(Toggle))

		var_3_1.isOn = false

		table.insert(arg_3_0.changeSkinToggles, var_3_1)
	end

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
	arg_6_0:SetSkinScroll()
	arg_6_0:Refresh(true)
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

	onToggle(arg_6_0, arg_6_0.sdTg, function(arg_10_0)
		setActive(arg_6_0.charContainer, arg_10_0)
		PlayerPrefs.SetInt("LatestSkinShopLayerSdTg" .. var_6_0, arg_10_0 and 1 or 0)
		PlayerPrefs.Save()
	end, SFX_PANEL)

	local var_6_1 = PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_6_0, 0)

	triggerToggle(arg_6_0.sdTg, var_6_1 == 1)
	onToggle(arg_6_0, arg_6_0.hideUITg, function(arg_11_0)
		setActive(arg_6_0.top, not arg_11_0)
		setActive(arg_6_0.bottom, not arg_11_0)
		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_11_0)
	end, SFX_PANEL)
	onInputChanged(arg_6_0, arg_6_0.search, function()
		arg_6_0:Refresh(true)

		local var_12_0 = getInputText(arg_6_0.search)

		setActive(arg_6_0.search:Find("holder"), var_12_0 == "")
	end)
	onButton(arg_6_0, arg_6_0.showOwnBtn, function()
		arg_6_0:emit(LatestSkinShopMediator.OPEN_OWN_SKIN_LAYER)
	end, SFX_PANEL)
	getProxy(CommanderManualProxy):TaskProgressAdd(2021, 1)
end

function var_0_0.SetResource(arg_14_0)
	local var_14_0 = getProxy(PlayerProxy):getRawData()

	setText(arg_14_0.resources:Find("gem/Text"), var_14_0:getTotalGem())
	onButton(arg_14_0, arg_14_0.resources:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
end

function var_0_0.InitData(arg_16_0)
	arg_16_0.type = arg_16_0.contextData.type or var_0_0.TYPE_PERMANANT_SKIN
	arg_16_0.mode = arg_16_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_16_0:GetAllCommodities()
	arg_16_0:GetGiftPackCommodities()

	arg_16_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()

	arg_16_0:GetSkinClassify()

	local var_16_0 = (arg_16_0.mode == var_0_0.MODE_EXPERIENCE or arg_16_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM) and 1 or 0

	arg_16_0.filterValues = {
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
			var_16_0
		}
	}
	arg_16_0.filterValuesTemp = Clone(arg_16_0.filterValues)
end

function var_0_0.GetAllCommodities(arg_17_0)
	if arg_17_0.type == var_0_0.TYPE_NEW_SKIN then
		arg_17_0.commodities = getProxy(ShipSkinProxy):GetInTimeSkins()
	elseif arg_17_0.type == var_0_0.TYPE_PERMANANT_SKIN then
		arg_17_0.commodities = getProxy(ShipSkinProxy):GetPermanentSkins()
	end

	if LOCK_SKIN_US then
		local var_17_0 = pg.gameset.levellimit_skintype.key_value
		local var_17_1 = pg.gameset.levellimit_skintype.description

		if var_17_0 >= getProxy(PlayerProxy):getData().level then
			arg_17_0.commodities = _.filter(arg_17_0.commodities, function(arg_18_0)
				local var_18_0 = pg.ship_skin_template[arg_18_0:getSkinId()].shop_type_id

				return table.contains(var_17_1, var_18_0)
			end)
		end
	end

	if arg_17_0.mode == var_0_0.MODE_OVERVIEW then
		for iter_17_0 = #arg_17_0.commodities, 1, -1 do
			if arg_17_0.commodities[iter_17_0]:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				table.remove(arg_17_0.commodities, iter_17_0)
			end
		end
	end
end

function var_0_0.GetGiftPackCommodities(arg_19_0)
	arg_19_0.giftPackCommodities = {}
	arg_19_0.giftSkinCommodities = {}
	arg_19_0.giftSkinProbabilitys = {}

	for iter_19_0, iter_19_1 in ipairs(pg.pay_data_display.all) do
		local var_19_0 = pg.pay_data_display[iter_19_1]

		if var_19_0.skin_inquire_relation ~= 0 and pg.TimeMgr.GetInstance():inTime(var_19_0.time) then
			local var_19_1 = getProxy(ShopsProxy):GetGiftCommodity(iter_19_1, Goods.TYPE_CHARGE)

			arg_19_0.giftPackCommodities[iter_19_1] = var_19_1

			local var_19_2 = var_19_1:GetSkinProbability()

			arg_19_0.giftSkinCommodities[iter_19_1] = getProxy(ShipSkinProxy):GetProbabilitySkins(var_19_2)
			arg_19_0.giftSkinProbabilitys[iter_19_1] = getProxy(ShipSkinProxy):GetSkinProbabilitys(var_19_2)
		end
	end
end

function var_0_0.SetSkinScroll(arg_20_0)
	arg_20_0.scrollrect.isNewLoadingMethod = true

	function arg_20_0.scrollrect.onInitItem(arg_21_0)
		arg_20_0:OnInitItem(arg_21_0)
	end

	function arg_20_0.scrollrect.onUpdateItem(arg_22_0, arg_22_1)
		arg_20_0:OnUpdateItem(arg_22_0, arg_22_1)
	end
end

function var_0_0.Refresh(arg_23_0, arg_23_1)
	arg_23_0:ClearCards()

	arg_23_0.cards = {}
	arg_23_0.displays = {}

	local var_23_0 = getInputText(arg_23_0.search)

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.commodities) do
		if arg_23_0:filterOk(iter_23_1) and arg_23_0:IsSearchType(var_23_0, iter_23_1) then
			table.insert(arg_23_0.displays, iter_23_1)
		end
	end

	local var_23_1 = {}

	for iter_23_2, iter_23_3 in ipairs(arg_23_0.displays) do
		local var_23_2 = iter_23_3.type == Goods.TYPE_ACTIVITY or iter_23_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_23_3 = 0

		if not var_23_2 then
			var_23_3 = iter_23_3:GetPrice()
		end

		var_23_1[iter_23_3.id] = var_23_3
	end

	table.sort(arg_23_0.displays, function(arg_24_0, arg_24_1)
		return arg_23_0:Sort(arg_24_0, arg_24_1, var_23_1)
	end)

	local var_23_4 = #arg_23_0.displays == 0

	setActive(arg_23_0.bgs:Find("default"), var_23_4)
	setActive(arg_23_0.bgs:Find("diffBg"), not var_23_4)
	setActive(arg_23_0.bgs:Find("empty"), var_23_4)
	setActive(arg_23_0._tf:Find("leftMask"), not var_23_4)
	setActive(arg_23_0._tf:Find("bottomMask"), not var_23_4)
	setActive(arg_23_0.painting, not var_23_4)
	setActive(arg_23_0.top:Find("title"), not var_23_4)
	setActive(arg_23_0.changeSkin, not var_23_4)
	setActive(arg_23_0.right, not var_23_4)
	setActive(arg_23_0.right, not var_23_4)
	setActive(arg_23_0.bottom:Find("scroll"), not var_23_4)

	if not var_23_4 then
		if arg_23_1 then
			arg_23_0.triggerFirstCard = true

			arg_23_0.scrollrect:SetTotalCount(#arg_23_0.displays, 0)
		else
			arg_23_0.scrollrect:SetTotalCount(#arg_23_0.displays)
		end
	end
end

function var_0_0.IsSearchType(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_1 or arg_25_1 == "" then
		return true
	end

	local var_25_0 = arg_25_2:getSkinId()

	return ShipSkin.New({
		id = var_25_0
	}):IsMatchKey(arg_25_1)
end

local function var_0_20(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_2[arg_26_0.id]
	local var_26_1 = arg_26_2[arg_26_1.id]

	if var_26_0 == var_26_1 then
		return arg_26_0.id < arg_26_1.id
	else
		return var_26_1 < var_26_0
	end
end

function var_0_0.Sort(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	local var_27_0 = arg_27_1.buyCount == 0 and 1 or 0
	local var_27_1 = arg_27_2.buyCount == 0 and 1 or 0

	if var_27_0 == var_27_1 then
		local var_27_2 = arg_27_1:getConfig("order")
		local var_27_3 = arg_27_2:getConfig("order")

		if var_27_2 == var_27_3 then
			return var_0_20(arg_27_1, arg_27_2, arg_27_3)
		else
			return var_27_2 < var_27_3
		end
	else
		return var_27_1 < var_27_0
	end
end

function var_0_0.filterOk(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_0.filterValues.ownType
	local var_28_1 = arg_28_0.filterValues.typeType
	local var_28_2 = arg_28_0.filterValues.shipHaveType
	local var_28_3 = arg_28_0.filterValues.campType
	local var_28_4 = arg_28_0.filterValues.rarityType
	local var_28_5 = arg_28_0.filterValues.shipType
	local var_28_6 = arg_28_0.filterValues.themeType
	local var_28_7 = arg_28_1:getSkinId()
	local var_28_8 = ShipSkin.New({
		id = var_28_7
	})
	local var_28_9 = var_28_8:GetDefaultShipConfig()
	local var_28_10 = arg_28_0:ToVShip(var_28_9)

	if var_28_0 ~= 0 then
		local var_28_11 = false
		local var_28_12 = getProxy(ShipSkinProxy):hasSkin(var_28_7)
		local var_28_13 = var_28_8:NoUse()

		if var_28_0 == 1 and var_28_12 then
			var_28_11 = true
		end

		if var_28_0 == 2 and not var_28_12 then
			var_28_11 = true
		end

		if var_28_0 == 3 and var_28_12 and var_28_13 then
			var_28_11 = true
		end

		if not var_28_11 then
			return false
		end
	end

	if var_28_1[1] ~= 0 then
		local var_28_14 = false

		for iter_28_0, iter_28_1 in ipairs(var_28_1) do
			if iter_28_1 == 1 and (var_28_8:IsLive2d() or var_28_8:IsLive2dPlus()) then
				var_28_14 = true
			end

			if iter_28_1 == 2 and not var_28_8:IsLive2d() and not var_28_8:IsLive2dPlus() and not var_28_8:IsSpine() and not var_28_8:IsSpinePlus() then
				var_28_14 = true
			end

			if iter_28_1 == 3 and (var_28_8:IsSpine() or var_28_8:IsSpinePlus()) then
				var_28_14 = true
			end

			if iter_28_1 == 4 and var_28_8:IsBG() then
				var_28_14 = true
			end

			if iter_28_1 == 5 and var_28_8:IsDbg() then
				var_28_14 = true
			end

			if iter_28_1 == 6 and var_28_8:isBgm() then
				var_28_14 = true
			end

			if var_28_14 then
				break
			end
		end

		if not var_28_14 then
			return false
		end
	end

	if var_28_2 ~= 0 then
		local var_28_15 = false
		local var_28_16 = var_28_8:CantUse()

		if var_28_2 == 1 and not var_28_16 then
			var_28_15 = true
		end

		if var_28_2 == 2 and var_28_16 then
			var_28_15 = true
		end

		if not var_28_15 then
			return false
		end
	end

	if var_28_3[1] ~= 0 then
		local var_28_17 = false

		for iter_28_2, iter_28_3 in ipairs(var_28_3) do
			local var_28_18 = ShipIndexCfg.camp

			for iter_28_4, iter_28_5 in ipairs(var_28_18[iter_28_3 + 1].types) do
				if iter_28_5 == Nation.LINK then
					if var_28_10:getNation() >= Nation.LINK then
						var_28_17 = true
					end
				elseif iter_28_5 == var_28_10:getNation() then
					var_28_17 = true
				end
			end

			if var_28_17 then
				break
			end
		end

		if not var_28_17 then
			return false
		end
	end

	if var_28_4[1] ~= 0 then
		local var_28_19 = false

		for iter_28_6, iter_28_7 in ipairs(var_28_4) do
			local var_28_20 = ShipIndexCfg.rarity

			if table.contains(var_28_20[iter_28_7 + 1].types, var_28_10:getRarity()) then
				var_28_19 = true
			end

			if var_28_19 then
				break
			end
		end

		if not var_28_19 then
			return false
		end
	end

	if var_28_5[1] ~= 0 then
		local var_28_21 = false

		for iter_28_8, iter_28_9 in ipairs(var_28_5) do
			local var_28_22 = ShipIndexCfg.type
			local var_28_23 = var_28_22[iter_28_9 + 1].types

			if iter_28_9 + 1 < 4 then
				local var_28_24 = var_28_22[iter_28_9].shipTypes

				if table.contains(var_28_23, var_28_10:getShipType()) then
					var_28_21 = true
				end

				if table.contains(var_28_23, var_28_10:getTeamType()) then
					var_28_21 = true
				end
			elseif table.contains(var_28_23, var_28_10:getShipType()) then
				var_28_21 = true
			end

			if var_28_21 then
				break
			end
		end

		if not var_28_21 then
			return false
		end
	end

	if var_28_6[1] ~= 0 then
		local var_28_25 = false

		for iter_28_10, iter_28_11 in ipairs(var_28_6) do
			local var_28_26 = arg_28_0.classifyIds[iter_28_11 + 1]

			if arg_28_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
				if arg_28_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
					var_28_25 = var_28_26 == var_0_15 and arg_28_0:ExitSkinExperienceItem(arg_28_1.id)
				else
					var_28_25 = var_28_26 == var_0_13
				end
			elseif var_28_26 == var_0_12 then
				var_28_25 = true
			elseif var_28_26 == var_0_14 and table.contains(arg_28_0.returnSkins, arg_28_1.id) then
				var_28_25 = true
			else
				local var_28_27 = arg_28_0:GetShopTypeIdBySkinId(var_28_7)

				var_28_25 = (var_28_27 == 0 and var_0_16 or var_28_27) == var_28_26
			end

			if var_28_25 then
				break
			end
		end

		if not var_28_25 then
			return false
		end
	end

	return true
end

function var_0_0.ToVShip(arg_29_0, arg_29_1)
	if not arg_29_0.vship then
		arg_29_0.vship = {}

		function arg_29_0.vship.getNation()
			return arg_29_0.vship.config.nationality
		end

		function arg_29_0.vship.getShipType()
			return arg_29_0.vship.config.type
		end

		function arg_29_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_29_0.vship.config.type)
		end

		function arg_29_0.vship.getRarity()
			return arg_29_0.vship.config.rarity
		end
	end

	arg_29_0.vship.config = arg_29_1

	return arg_29_0.vship
end

function var_0_0.ExitSkinExperienceItem(arg_34_0, arg_34_1)
	if not arg_34_0.cacheSkinExperienceItems then
		arg_34_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(arg_34_0.cacheSkinExperienceItems, function(arg_35_0)
		return arg_35_0:CanUseForShop(arg_34_1)
	end)
end

function var_0_0.RegisterEvent(arg_36_0)
	arg_36_0:bind(var_0_0.EVT_SHOW_OR_HIDE_PURCHASE_VIEW, function(arg_37_0, arg_37_1)
		arg_36_0:AdjustPainting(arg_37_1)
		setActive(arg_36_0.top, not arg_37_1)
		setActive(arg_36_0.bottom, not arg_37_1)
		setActive(arg_36_0.right, not arg_37_1)

		if arg_36_0.live2dChar then
			arg_36_0.live2dChar:setPurchaseOffset(arg_37_1)
		end

		if arg_36_0.spineChar then
			if arg_37_1 then
				local var_37_0 = pg.ship_skin_template[arg_36_0.skinId].purchase_offset

				if var_37_0 and #var_37_0 >= 3 then
					arg_36_0.spineChar.localPosition = Vector3(var_37_0[1], var_37_0[2], var_37_0[3])
				end

				if var_37_0 and #var_37_0 >= 4 then
					arg_36_0.spineChar.localScale = Vector3(var_37_0[4], var_37_0[4], var_37_0[4])
				end
			else
				arg_36_0.spineChar.localScale = Vector3(0.9, 0.9, 1)
				arg_36_0.spineChar.localPosition = Vector3(0, 0, 0)
			end
		end

		pg.m02:sendNotification(NewShopMainScene.SHOW_OR_HIDE_UI, not arg_37_1)
	end)
	arg_36_0:bind(var_0_0.EVT_ON_PURCHASE, function(arg_38_0, arg_38_1)
		local var_38_0 = arg_36_0:GetObtainBtnState(arg_38_1)

		arg_36_0:OnClickBtn(var_38_0, arg_38_1)
	end)
	onButton(arg_36_0, arg_36_0.changeSkin, function()
		if ShipSkin.IsChangeSkin(arg_36_0.skinId) then
			arg_36_0.changeSkinId = ShipSkin.GetChangeSkinNextId(arg_36_0.skinId)

			arg_36_0:UpdateMainView(arg_36_0.showingCommodity)
		end
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_40_0, arg_40_1)
	local var_40_0 = NewShopSkinCard.New(arg_40_1)

	onButton(arg_40_0, var_40_0._go, function()
		if not var_40_0.commodity then
			return
		end

		for iter_41_0, iter_41_1 in pairs(arg_40_0.cards) do
			iter_41_1:UpdateSelected(false)
		end

		arg_40_0.selectedId = var_40_0.commodity.id

		var_40_0:UpdateSelected(true)
		arg_40_0:UpdateMainView(var_40_0.commodity)
		arg_40_0:GCHandle()
	end, SFX_PANEL)

	arg_40_0.cards[arg_40_1] = var_40_0
end

function var_0_0.OnUpdateItem(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_0.cards[arg_42_2]

	if not var_42_0 then
		arg_42_0:OnInitItem(arg_42_2)

		var_42_0 = arg_42_0.cards[arg_42_2]
	end

	local var_42_1 = arg_42_0.displays[arg_42_1 + 1]

	if not var_42_1 then
		return
	end

	local var_42_2 = arg_42_0.selectedId == var_42_1.id
	local var_42_3 = table.contains(arg_42_0.returnSkins, var_42_1.id)

	var_42_0:Update(var_42_1, var_42_2, var_42_3)

	if arg_42_0.triggerFirstCard and arg_42_1 == 0 then
		arg_42_0.triggerFirstCard = false

		triggerButton(var_42_0._go)
	end
end

function var_0_0.UpdateMainView(arg_43_0, arg_43_1)
	arg_43_0.skinId = arg_43_1:getSkinId()

	local var_43_0 = ShipSkin.IsChangeSkin(arg_43_0.skinId)

	setActive(arg_43_0.changeSkin, var_43_0)

	if var_43_0 then
		arg_43_0:FlushChangeSkin()
	end

	arg_43_0.shipSkin = ShipSkin.New({
		id = arg_43_0.skinId
	})

	arg_43_0:FlushName()
	arg_43_0:FlushPreviewBtn(arg_43_1)
	arg_43_0:FlushTimeLimit(arg_43_1)
	arg_43_0:SwitchPreview(arg_43_1, arg_43_0.isPreviewFurniture)
	arg_43_0:FlushPaintingToggle(arg_43_1)
	arg_43_0:FlushTag()
	arg_43_0:FlushBG(arg_43_1)
	arg_43_0:FlushPainting(arg_43_1)
	arg_43_0:FlushPrice(arg_43_1)
	arg_43_0:FlushObtainBtn(arg_43_1)
	arg_43_0:FlushGifgPackBtn(arg_43_1)

	arg_43_0.showingCommodity = arg_43_1
end

function var_0_0.FlushChangeSkin(arg_44_0)
	local var_44_0 = ShipSkin.GetChangeSkinGroupId(arg_44_0.skinId)

	if not arg_44_0.changeSkinId then
		arg_44_0.changeSkinId = arg_44_0.skinId
	elseif ShipSkin.GetChangeSkinGroupId(arg_44_0.changeSkinId) == var_44_0 then
		arg_44_0.skinId = arg_44_0.changeSkinId
	else
		arg_44_0.changeSkinId = arg_44_0.skinId
	end

	arg_44_0._toggleIndex = ShipSkin.GetChangeSkinIndex(arg_44_0.skinId)

	for iter_44_0 = 1, 2 do
		arg_44_0.changeSkinToggles[iter_44_0].isOn = iter_44_0 == arg_44_0._toggleIndex and true or false
	end
end

function var_0_0.GCHandle(arg_45_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.FlushName(arg_46_0)
	local var_46_0 = pg.ship_skin_template[arg_46_0.skinId]

	setScrollText(arg_46_0.skinName, SwitchSpecialChar(var_46_0.name, true))

	if var_46_0.skin_type == ShipSkin.SKIN_TYPE_TB then
		setScrollText(arg_46_0.shipName, NewEducateHelper.GetShipNameBySecId(NewEducateHelper.GetSecIdBySkinId(arg_46_0.skinId)))
	else
		local var_46_1 = ShipGroup.getDefaultShipConfig(var_46_0.ship_group)

		setScrollText(arg_46_0.shipName, var_46_1.name)
	end
end

function var_0_0.FlushPreviewBtn(arg_47_0, arg_47_1)
	local var_47_0 = Goods.ExistFurniture(arg_47_1.id)

	removeOnButton(arg_47_0.switchPreviewBtn)

	if not var_47_0 and arg_47_0.isPreviewFurniture then
		arg_47_0.isPreviewFurniture = false
	end

	setActive(arg_47_0.switchPreviewBtn, var_47_0)

	if var_47_0 then
		onButton(arg_47_0, arg_47_0.switchPreviewBtn, function()
			arg_47_0.isPreviewFurniture = not arg_47_0.isPreviewFurniture

			arg_47_0:SwitchPreview(arg_47_1, arg_47_0.isPreviewFurniture)
			arg_47_0:FlushPrice(arg_47_1)
			arg_47_0:FlushObtainBtn(arg_47_1)
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPreview(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = arg_49_0.skinId

	if pg.ship_skin_template[var_49_0].skin_type == ShipSkin.SKIN_TYPE_TB then
		setActive(arg_49_0.charContainer, false)

		return
	end

	local var_49_1 = getProxy(PlayerProxy):getRawData().id

	setActive(arg_49_0.charContainer, PlayerPrefs.GetInt("LatestSkinShopLayerSdTg" .. var_49_1, 0) == 1)
	setActive(arg_49_0.charTf, not arg_49_2)
	setActive(arg_49_0.furnitureContainer, arg_49_2)

	if not arg_49_2 then
		local var_49_2 = pg.ship_skin_template[var_49_0]

		arg_49_0:FlushChar(var_49_2.prefab, var_49_2.id)
		GetImageSpriteFromAtlasAsync("qicon/" .. var_49_2.painting, "", arg_49_0.backChara)
	else
		local var_49_3 = Goods.Id2FurnitureId(arg_49_1.id)
		local var_49_4 = Goods.GetFurnitureConfig(arg_49_1.id)

		arg_49_0.interactionPreview:Flush(var_49_0, var_49_3, var_49_4.scale[2] or 1, var_49_4.position[2])
	end
end

function var_0_0.FlushChar(arg_50_0, arg_50_1, arg_50_2)
	if arg_50_0.prefabName and arg_50_0.prefabName == arg_50_1 then
		return
	end

	arg_50_0:ReturnChar()

	arg_50_0.prefabName = arg_50_1

	PoolMgr.GetInstance():GetSpineChar(arg_50_1, true, function(arg_51_0)
		if arg_50_0.prefabName ~= arg_50_1 then
			PoolMgr.GetInstance():ReturnSpineChar(arg_50_1, arg_51_0)

			return
		end

		arg_50_0.spineChar = tf(arg_51_0)

		local var_51_0 = pg.skinshop_spine_scale[arg_50_2]

		if var_51_0 then
			arg_50_0.spineChar.localScale = Vector3(var_51_0.skinshop_scale, var_51_0.skinshop_scale, 1)
		else
			arg_50_0.spineChar.localScale = Vector3(0.9, 0.9, 1)
		end

		arg_50_0.spineChar.localPosition = Vector3(0, 0, 0)

		pg.ViewUtils.SetLayer(arg_50_0.spineChar, Layer.UI)
		setParent(arg_50_0.spineChar, arg_50_0.charTf)
		arg_51_0:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end)
end

function var_0_0.ReturnChar(arg_52_0)
	if not IsNil(arg_52_0.spineChar) then
		arg_52_0.spineChar.gameObject:GetComponent("SpineAnimUI"):SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(arg_52_0.prefabName, arg_52_0.spineChar.gameObject)

		arg_52_0.spineChar = nil
		arg_52_0.prefabName = nil
	end
end

function var_0_0.ClearCards(arg_53_0)
	if not arg_53_0.cards then
		return
	end

	for iter_53_0, iter_53_1 in pairs(arg_53_0.cards) do
		iter_53_1:Dispose()
	end

	arg_53_0.cards = nil
end

function var_0_0.FlushTimeLimit(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0.skinId
	local var_54_1 = false
	local var_54_2

	if arg_54_1:IsActivityExtra() and arg_54_1:ShowMaintenanceTime() then
		local var_54_3, var_54_4 = arg_54_1:GetMaintenanceMonthAndDay()

		function var_54_2()
			return i18n("limit_skin_time_before_maintenance", var_54_3, var_54_4)
		end

		var_54_1 = true
	elseif arg_54_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		local var_54_5 = getProxy(ShipSkinProxy):getSkinById(var_54_0)

		var_54_1 = var_54_5 and var_54_5:isExpireType() and not var_54_5:isExpired()

		if var_54_1 then
			function var_54_2()
				return skinTimeStamp(var_54_5:getRemainTime())
			end
		end
	else
		local var_54_6, var_54_7 = pg.TimeMgr.GetInstance():inTime(arg_54_1:getConfig("time"))

		var_54_1 = var_54_7

		if var_54_1 then
			local var_54_8 = pg.TimeMgr.GetInstance():Table2ServerTime(var_54_7)

			function var_54_2()
				return skinCommdityTimeStamp(var_54_8)
			end
		end
	end

	setActive(arg_54_0.top:Find("title/limit_time"), var_54_1)
	arg_54_0:ClearTimer()

	if var_54_1 then
		arg_54_0:AddTimer(var_54_2)
	end
end

function var_0_0.AddTimer(arg_58_0, arg_58_1)
	arg_58_0.timer = Timer.New(function()
		setText(arg_58_0.limitTime, arg_58_1())
	end, 1, -1)

	arg_58_0.timer.func()
	arg_58_0.timer:Start()
end

function var_0_0.ClearTimer(arg_60_0)
	if arg_60_0.timer then
		arg_60_0.timer:Stop()

		arg_60_0.timer = nil
	end
end

function var_0_0.FlushPaintingToggle(arg_61_0, arg_61_1)
	removeOnToggle(arg_61_0.dynamicToggle)
	removeOnToggle(arg_61_0.showBgToggle)

	local var_61_0 = checkABExist("painting/" .. arg_61_0.shipSkin:getConfig("painting") .. "_n")

	if arg_61_0.isToggleShowBg and not var_61_0 then
		triggerToggle(arg_61_0.showBgToggle, false)

		arg_61_0.isToggleShowBg = false
	elseif var_61_0 then
		triggerToggle(arg_61_0.showBgToggle, true)

		arg_61_0.isToggleShowBg = true
	end

	local var_61_1 = arg_61_0.shipSkin:IsSpine() or arg_61_0.shipSkin:IsLive2d() or arg_61_0.shipSkin:IsSpinePlus() or arg_61_0.shipSkin:IsLive2dPlus()

	if LOCK_SKIN_SHOP_ANIM_PREVIEW == "all" or LOCK_SKIN_SHOP_ANIM_PREVIEW and table.contains(LOCK_SKIN_SHOP_ANIM_PREVIEW, arg_61_0.shipSkin.id) then
		var_61_1 = false
	end

	if var_61_1 and PlayerPrefs.GetInt("skinShop#l2dPreViewToggle" .. getProxy(PlayerProxy):getRawData().id, 0) == 1 then
		arg_61_0.isToggleDynamic = true
	end

	if var_61_1 then
		local var_61_2 = 0

		if arg_61_0.shipSkin:IsSpine() then
			var_61_2 = 6
		elseif arg_61_0.shipSkin:IsLive2d() then
			var_61_2 = 1
		elseif arg_61_0.shipSkin:IsSpinePlus() then
			var_61_2 = 7
		elseif arg_61_0.shipSkin:IsLive2dPlus() then
			var_61_2 = 9
		end

		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_61_2) .. "_off", arg_61_0.dynamicToggle)
		LoadImageSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_61_2), arg_61_0.dynamicToggle:Find("select"))
	end

	if arg_61_0.isToggleDynamic and not var_61_1 then
		triggerToggle(arg_61_0.dynamicToggle, false)

		arg_61_0.isToggleDynamic = false
	elseif arg_61_0.isToggleDynamic and not arg_61_0.dynamicToggle:GetComponent(typeof(Toggle)).isOn then
		if (arg_61_0.shipSkin:IsLive2d() or arg_61_0.shipSkin:IsLive2dPlus()) and Live2dConst.GetLive2DArm32MatchAble() then
			arg_61_0.isToggleDynamic = false

			local var_61_3 = getProxy(PlayerProxy):getRawData().id

			PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_61_3, 0)
			PlayerPrefs.Save()
			triggerToggle(arg_61_0.dynamicToggle, false)
		else
			triggerToggle(arg_61_0.dynamicToggle, true)

			arg_61_0.isToggleDynamic = true
		end
	end

	if var_61_0 then
		onToggle(arg_61_0, arg_61_0.showBgToggle, function(arg_62_0)
			arg_61_0.isToggleShowBg = arg_62_0

			arg_61_0:FlushPainting(arg_61_1)
			arg_61_0:FlushBG(arg_61_1)
		end, SFX_PANEL)
	end

	if arg_61_0.shipSkin:IsSpine() or arg_61_0.shipSkin:IsLive2d() or arg_61_0.shipSkin:IsSpinePlus() or arg_61_0.shipSkin:IsLive2dPlus() then
		onToggle(arg_61_0, arg_61_0.dynamicToggle, function(arg_63_0)
			if arg_63_0 and Live2dConst.GetLive2DArm32MatchAble() and (arg_61_0.shipSkin:IsLive2d() or arg_61_0.shipSkin:IsLive2dPlus()) then
				Live2dConst.ShowLive2DArm32Tips()
				triggerToggle(arg_61_0.dynamicToggle, false)

				return
			end

			arg_61_0.isToggleDynamic = arg_63_0

			setActive(arg_61_0.showBgToggle, not arg_63_0 and var_61_0)
			arg_61_0:FlushPainting(arg_61_1)
			arg_61_0:FlushDynamicPaintingResState(arg_61_1)
			arg_61_0:RecordFlag(arg_63_0)
		end, SFX_PANEL)
	end

	if arg_61_0.isToggleDynamic then
		arg_61_0:FlushDynamicPaintingResState(arg_61_1)
	end

	setActive(arg_61_0.dynamicToggle, var_61_1)
	setActive(arg_61_0.showBgToggle, not arg_61_0.isToggleDynamic and var_61_0)
end

function var_0_0.FlushTag(arg_64_0)
	local var_64_0 = arg_64_0.skinId
	local var_64_1 = pg.ship_skin_template[var_64_0]
	local var_64_2 = Clone(var_64_1.tag)
	local var_64_3 = false

	for iter_64_0 = #var_64_2, 1, -1 do
		local var_64_4 = var_64_2[iter_64_0]

		if var_64_4 == 1 or var_64_4 == 6 or var_64_4 == 7 or var_64_4 == 9 then
			local var_64_5 = true

			table.remove(var_64_2, iter_64_0)
		end
	end

	local var_64_6 = checkABExist("painting/" .. arg_64_0.shipSkin:getConfig("painting") .. "_n")

	arg_64_0.tagList:make(function(arg_65_0, arg_65_1, arg_65_2)
		if arg_65_0 == UIItemList.EventUpdate then
			local var_65_0 = var_64_2[arg_65_1 + 1]

			LoadSpriteAtlasAsync("SkinIcon", "type_" .. ShipSkin.Tag2Name(var_64_2[arg_65_1 + 1]), function(arg_66_0)
				if arg_64_0.exited then
					return
				end

				arg_65_2:GetComponent(typeof(Image)).sprite = arg_66_0
			end)
		end
	end)
	arg_64_0.tagList:align(#var_64_2)
end

function var_0_0.FlushPainting(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_0:GetPaintingState(arg_67_1)
	local var_67_1 = pg.ship_skin_template[arg_67_0.skinId].painting
	local var_67_2 = ShipSkin.GetChangeSkinData(arg_67_0.skinId) and true or false

	if var_67_0 == var_0_2 and not arg_67_0:ExistL2dRes(var_67_1) or var_67_0 == var_0_3 and not arg_67_0:ExistSpineRes(var_67_1) then
		var_67_0 = var_0_1
	end

	if arg_67_0.paintingState and arg_67_0.paintingState.state == var_67_0 and arg_67_0.paintingState.id == arg_67_1.id and arg_67_0.paintingState.showBg == arg_67_0.isToggleShowBg and arg_67_0.paintingState.purchaseFlag == arg_67_1.buyCount and not var_67_2 then
		return
	end

	arg_67_0:ClearPainting()

	if var_67_0 == var_0_1 then
		arg_67_0:LoadMeshPainting(arg_67_1, arg_67_0.isToggleShowBg)
	elseif var_67_0 == var_0_2 then
		arg_67_0:LoadL2dPainting(arg_67_1)
	elseif var_67_0 == var_0_3 then
		arg_67_0:LoadSpinePainting(arg_67_1)
	end

	arg_67_0.paintingState = {
		state = var_67_0,
		id = arg_67_1.id,
		showBg = arg_67_0.isToggleShowBg,
		purchaseFlag = arg_67_1.buyCount
	}

	arg_67_0:AdjustPainting(false)
end

function var_0_0.ClearPainting(arg_68_0)
	local var_68_0 = arg_68_0.paintingState

	if not var_68_0 then
		return
	end

	if var_68_0.state == var_0_1 then
		arg_68_0:ClearMeshPainting()
	elseif var_68_0.state == var_0_2 then
		arg_68_0:ClearL2dPainting()
	elseif var_68_0.state == var_0_3 then
		arg_68_0:ClearSpinePainting()
	end

	arg_68_0.paintingState = nil
end

function var_0_0.LoadMeshPainting(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = findTF(arg_69_0.paintingTF, "fitter")
	local var_69_1 = GetOrAddComponent(var_69_0, "PaintingScaler")

	var_69_1.FrameName = "chuanwu"
	var_69_1.Tween = 1

	local var_69_2 = pg.ship_skin_template[arg_69_0.skinId].painting
	local var_69_3 = var_69_2

	if not arg_69_2 and checkABExist("painting/" .. var_69_2 .. "_n") then
		var_69_2 = var_69_2 .. "_n"
	end

	if not checkABExist("painting/" .. var_69_2) then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetPainting(var_69_2, true, function(arg_70_0)
		pg.UIMgr.GetInstance():LoadingOff()
		setParent(arg_70_0, var_69_0, false)
		ShipExpressionHelper.SetExpression(var_69_0:GetChild(0), var_69_3)

		arg_69_0.paintingName = var_69_2

		if arg_69_0.paintingState and arg_69_0.paintingState.id ~= arg_69_1.id then
			arg_69_0:ClearMeshPainting()
		end

		local var_70_0 = arg_70_0.transform:Find("shop_hx")

		arg_69_0:CheckShowShopHx(var_70_0, arg_69_1)
	end)
end

function var_0_0.ClearMeshPainting(arg_71_0)
	local var_71_0 = arg_71_0.paintingTF:Find("fitter")

	if arg_71_0.paintingName and var_71_0.childCount > 0 then
		local var_71_1 = var_71_0:GetChild(0).gameObject
		local var_71_2 = var_71_1.transform:Find("shop_hx")

		arg_71_0:RevertShopHx(var_71_2)
		PoolMgr.GetInstance():ReturnPainting(arg_71_0.paintingName, var_71_1)
	end

	arg_71_0.paintingName = nil
end

function var_0_0.LoadL2dPainting(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0.skinId
	local var_72_1 = pg.ship_skin_template[var_72_0].skin_type
	local var_72_2

	if var_72_1 == ShipSkin.SKIN_TYPE_TB then
		var_72_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_72_0))
	else
		local var_72_3 = pg.ship_skin_template[var_72_0].ship_group
		local var_72_4 = ShipGroup.getDefaultShipConfig(var_72_3)

		var_72_2 = Ship.New({
			noChangeSkin = true,
			configId = var_72_4.id,
			skin_id = var_72_0
		})
	end

	local var_72_5 = Live2D.GenerateData({
		ship = var_72_2,
		position = Vector3(0, 0, -1),
		parent = arg_72_0.live2dContainer,
		offset = var_72_2:GetSkinConfig().shop_offset
	})

	var_72_5.shopPreView = true

	pg.UIMgr.GetInstance():LoadingOn()

	arg_72_0.live2dChar = Live2D.New(var_72_5, function(arg_73_0)
		arg_73_0:IgonreReactPos(true)
		arg_72_0:CheckShowShopHxForL2d(arg_73_0, arg_72_1)

		if arg_72_0.paintingState and arg_72_0.paintingState.id ~= arg_72_1.id then
			arg_72_0:ClearL2dPainting()
		end

		arg_73_0:setSortingLayer(LayerWeightConst.L2D_DEFAULT_LAYER)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearL2dPainting(arg_74_0)
	if arg_74_0.live2dChar then
		arg_74_0:RevertShopHxForL2d(arg_74_0.live2dChar)
		arg_74_0.live2dChar:Dispose()

		arg_74_0.live2dChar = nil
	end
end

function var_0_0.LoadSpinePainting(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_0.skinId
	local var_75_1 = pg.ship_skin_template[var_75_0].skin_type
	local var_75_2

	if var_75_1 == ShipSkin.SKIN_TYPE_TB then
		var_75_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_75_0))
	else
		local var_75_3 = pg.ship_skin_template[var_75_0].ship_group
		local var_75_4 = ShipGroup.getDefaultShipConfig(var_75_3)

		var_75_2 = Ship.New({
			noChangeSkin = true,
			configId = var_75_4.id,
			skin_id = var_75_0
		})
	end

	local var_75_5 = SpinePainting.GenerateData({
		ship = var_75_2,
		position = Vector3(0, 0, 0),
		parent = arg_75_0.spTF,
		effectParent = arg_75_0.spBg,
		offset = var_75_2:GetSkinConfig().shop_offset
	})

	pg.UIMgr.GetInstance():LoadingOn()

	arg_75_0.spinePainting = SpinePainting.New(var_75_5, function(arg_76_0)
		if arg_75_0.paintingState and arg_75_0.paintingState.id ~= arg_75_1.id then
			arg_75_0:ClearSpinePainting()
		end

		local var_76_0 = arg_76_0._tf:Find("shop_hx")

		arg_75_0:CheckShowShopHx(var_76_0, arg_75_1)
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.ClearSpinePainting(arg_77_0)
	if arg_77_0.spinePainting and arg_77_0.spinePainting._tf then
		local var_77_0 = arg_77_0.spinePainting._tf:Find("shop_hx")

		arg_77_0:RevertShopHx(arg_77_0.shopHx)
		arg_77_0.spinePainting:Dispose()

		arg_77_0.spinePainting = nil
	end
end

function var_0_0.CheckShowShopHx(arg_78_0, arg_78_1, arg_78_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	if not IsNil(arg_78_1) and arg_78_2.buyCount <= 0 then
		setActive(arg_78_1, true)
	end
end

function var_0_0.RevertShopHx(arg_79_0, arg_79_1)
	if not IsNil(arg_79_1) then
		setActive(arg_79_1, false)
	end
end

function var_0_0.CheckShowShopHxForL2d(arg_80_0, arg_80_1, arg_80_2)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not HXSet.isHx() then
		return
	end

	local var_80_0 = arg_80_2.buyCount <= 0 and 1 or 0

	arg_80_1:changeParamaterValue("shop_hx", var_80_0)
end

function var_0_0.RevertShopHxForL2d(arg_81_0, arg_81_1)
	arg_81_1:changeParamaterValue("shop_hx", 0)
end

function var_0_0.AdjustPainting(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_0.paintingTF
	local var_82_1 = pg.ship_skin_newmainui_shift[arg_82_0.skinId]

	if var_82_1 then
		local var_82_2 = var_82_1.skin_shop_shift

		if arg_82_1 then
			var_82_0.anchoredPosition = Vector2(var_82_2[1] - 440, var_82_2[2] + arg_82_0.defaultPaintingPosition.y)
		else
			var_82_0.anchoredPosition = Vector2(var_82_2[1] + arg_82_0.defaultPaintingPosition.x, var_82_2[2] + arg_82_0.defaultPaintingPosition.y)
		end

		local var_82_3 = var_82_2[4]

		var_82_0.localScale = Vector3(var_82_3, var_82_3, 1)
	else
		var_82_0.anchoredPosition = Vector2(arg_82_0.defaultPaintingPosition.x, arg_82_0.defaultPaintingPosition.y)
		var_82_0.localScale = arg_82_0.defaultPaintingScale
	end
end

function var_0_0.FlushBG(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = arg_83_0.skinId
	local var_83_1 = pg.ship_skin_template[var_83_0]
	local var_83_2

	if var_83_1.skin_type == ShipSkin.SKIN_TYPE_TB then
		var_83_2 = VirtualEducateCharShip.New(NewEducateHelper.GetSecIdBySkinId(var_83_0))
	else
		local var_83_3 = ShipGroup.getDefaultShipConfig(var_83_1.ship_group)

		var_83_2 = Ship.New({
			id = 999,
			configId = var_83_3.id,
			skin_id = var_83_0
		})
	end

	local var_83_4 = var_83_2:getShipBgPrint(true)
	local var_83_5 = pg.ship_skin_template[var_83_0].painting

	if (arg_83_0.isToggleShowBg or not checkABExist("painting/" .. var_83_5 .. "_n")) and var_83_1.bg_sp ~= "" then
		var_83_4 = var_83_1.bg_sp
	end

	local var_83_6 = var_83_4 ~= var_83_2:rarity2bgPrintForGet()

	if var_83_6 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_83_0, var_83_4, arg_83_0.bgs:Find("diffBg"), arg_83_0.bgs:Find("diffBg/bg"), function(arg_84_0)
			if arg_83_2 then
				arg_83_2()
			end
		end, function(arg_85_0)
			if arg_83_2 then
				arg_83_2()
			end
		end)
	else
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_83_0:getUIName())

		if arg_83_2 then
			arg_83_2()
		end
	end

	setActive(arg_83_0.bgs:Find("diffBg"), var_83_6)
	setActive(arg_83_0.bgs:Find("default"), not var_83_6)
end

function var_0_0.FlushDynamicPaintingResState(arg_86_0, arg_86_1)
	if not arg_86_0.isToggleDynamic then
		return
	end

	local var_86_0 = arg_86_0:GetPaintingState(arg_86_1)
	local var_86_1 = false
	local var_86_2 = ""
	local var_86_3 = pg.ship_skin_template[arg_86_0.skinId].painting

	if var_0_2 == var_86_0 then
		var_86_1, var_86_2 = arg_86_0:ExistL2dRes(var_86_3)
	elseif var_0_3 == var_86_0 then
		var_86_1, var_86_2 = arg_86_0:ExistSpineRes(var_86_3)
	end

	setActive(arg_86_0.dynamicResToggle, not var_86_1)
	removeOnButton(arg_86_0.dynamicResToggle)

	if not var_86_1 and var_86_2 ~= "" then
		onButton(arg_86_0, arg_86_0.dynamicResToggle, function()
			arg_86_0:DownloadDynamicPainting(var_86_2, arg_86_1)
		end, SFX_PANEL)
	end
end

function var_0_0.DownloadDynamicPainting(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0 = arg_88_0.skinId

	if arg_88_0.downloads[var_88_0] then
		return
	end

	local var_88_1 = SkinShopDownloadRequest.New()

	arg_88_0.downloads[var_88_0] = var_88_1

	var_88_1:Start(arg_88_1, function(arg_89_0)
		if arg_89_0 and arg_88_0.paintingState and arg_88_0.paintingState.id == arg_88_2.id then
			arg_88_0:FlushPainting(arg_88_2)
			arg_88_0:FlushDynamicPaintingResState(arg_88_2)
		end

		var_88_1:Dispose()

		arg_88_0.downloads[var_88_0] = nil
	end)
end

function var_0_0.GetPaintingState(arg_90_0, arg_90_1)
	if arg_90_0.isToggleDynamic and (arg_90_0.shipSkin:IsLive2d() or arg_90_0.shipSkin:IsLive2dPlus()) then
		return var_0_2
	elseif arg_90_0.isToggleDynamic and (arg_90_0.shipSkin:IsSpine() or arg_90_0.shipSkin:IsSpinePlus()) then
		if arg_90_0.shipSkin:getConfig("spine_use_live2d") == 1 then
			return var_0_2
		end

		return var_0_3
	else
		return var_0_1
	end
end

function var_0_0.ExistL2dRes(arg_91_0, arg_91_1)
	local var_91_0 = "live2d/" .. string.lower(arg_91_1)
	local var_91_1 = HXSet.autoHxShiftPath(var_91_0, nil, true)

	return checkABExist(var_91_1), var_91_1
end

function var_0_0.ExistSpineRes(arg_92_0, arg_92_1)
	local var_92_0 = "SpinePainting/" .. string.lower(arg_92_1)
	local var_92_1 = HXSet.autoHxShiftPath(var_92_0, nil, true)

	return checkABExist(var_92_1), var_92_1
end

function var_0_0.RecordFlag(arg_93_0, arg_93_1)
	local var_93_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("skinShop#l2dPreViewToggle" .. var_93_0, arg_93_1 and 1 or 0)
	PlayerPrefs.Save()
	arg_93_0:emit(LatestSkinShopMediator.ON_RECORD_ANIM_PREVIEW_BTN, arg_93_1)
end

function var_0_0.FlushPrice(arg_94_0, arg_94_1)
	local var_94_0 = arg_94_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit
	local var_94_1 = arg_94_1.type == Goods.TYPE_ACTIVITY or arg_94_1.type == Goods.TYPE_ACTIVITY_EXTRA

	if var_94_0 then
		if arg_94_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_94_0:UpdateExperiencePrice4Item(arg_94_1)
		else
			arg_94_0:UpdateExperiencePrice(arg_94_1)
		end
	elseif arg_94_0.isPreviewFurniture then
		arg_94_0:UpdateFurniturePrice(arg_94_1)
	elseif var_94_1 then
		-- block empty
	else
		arg_94_0:UpdateCommodityPrice(arg_94_1)
	end

	local var_94_2 = arg_94_1.type == Goods.TYPE_SKIN

	setActive(arg_94_0.price:Find("timeLimit"), var_94_0 and not var_94_1)
	setActive(arg_94_0.price:Find("consume"), var_94_2 and not var_94_0 and not var_94_1)
end

function var_0_0.UpdateExperiencePrice4Item(arg_95_0, arg_95_1)
	local var_95_0 = arg_95_1:getConfig("resource_num")
	local var_95_1 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_95_2 = _.detect(var_95_1, function(arg_96_0)
		return arg_96_0:CanUseForShop(arg_95_1.id)
	end)
	local var_95_3 = var_95_2 and var_95_2.count or 0
	local var_95_4 = (var_95_3 < var_95_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_95_3 .. (var_95_3 < var_95_0 and "</color>" or "")

	setText(arg_95_0.price:Find("timeLimit/consume/Text"), var_95_4 .. "/" .. var_95_0)
end

function var_0_0.UpdateExperiencePrice(arg_97_0, arg_97_1)
	local var_97_0 = arg_97_1:getConfig("resource_num")
	local var_97_1 = getProxy(PlayerProxy):getRawData():getSkinTicket()
	local var_97_2 = (var_97_1 < var_97_0 and "<color=" .. COLOR_RED .. ">" or "") .. var_97_1 .. (var_97_1 < var_97_0 and "</color>" or "")

	setText(arg_97_0.price:Find("timeLimit/consume/Text"), var_97_2 .. "/" .. var_97_0)
end

function var_0_0.UpdateCommodityPrice(arg_98_0, arg_98_1)
	local var_98_0 = arg_98_1:GetPrice()
	local var_98_1 = arg_98_1:getConfig("resource_num")

	setText(arg_98_0.price:Find("consume/Text"), var_98_0)
	setText(arg_98_0.price:Find("consume/originalprice/Text"), var_98_1)
	setActive(arg_98_0.price:Find("consume/originalprice"), var_98_0 ~= var_98_1)
end

function var_0_0.UpdateFurniturePrice(arg_99_0, arg_99_1)
	local var_99_0 = Goods.Id2FurnitureId(arg_99_1.id)
	local var_99_1 = Furniture.New({
		id = var_99_0
	})
	local var_99_2 = var_99_1:getConfig("gem_price")

	setText(arg_99_0.price:Find("consume/originalprice/Text"), var_99_2)

	local var_99_3 = var_99_1:getPrice(PlayerConst.ResDiamond)

	setText(arg_99_0.price:Find("consume/Text"), var_99_3)
	setActive(arg_99_0.price:Find("consume/originalprice"), var_99_2 ~= var_99_3)
end

function var_0_0.FlushObtainBtn(arg_100_0, arg_100_1)
	local var_100_0 = arg_100_0:GetObtainBtnState(arg_100_1)
	local var_100_1 = var_0_19(var_100_0)

	for iter_100_0 = 0, arg_100_0.btns.childCount - 1 do
		local var_100_2 = arg_100_0.btns:GetChild(iter_100_0)

		setActive(var_100_2, var_100_2.name == var_100_1)
	end

	setActive(arg_100_0.price:Find("btn/item"), var_100_0 == var_0_11)
	setActive(arg_100_0.price:Find("btn/tag"), var_100_0 == var_0_11)

	if var_100_0 == var_0_11 then
		arg_100_0:FlushGift(arg_100_1)
	end

	onButton(arg_100_0, arg_100_0.price:Find("btn"), function()
		local var_101_0 = {}

		if SkinCouponActivity.StaticEncoreActTip(arg_100_1.id) then
			table.insert(var_101_0, function(arg_102_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("SkinDiscount_Hint"),
					onYes = function()
						local var_103_0 = checkExist(SkinCouponActivity.GetSkinCouponEncoreAct(), {
							"id"
						})

						if var_103_0 then
							arg_100_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_103_0)
						end
					end,
					onNo = function()
						arg_102_0()
					end
				})
			end)
		end

		seriesAsync(var_101_0, function()
			if var_100_0 == var_0_5 or var_100_0 == var_0_7 or var_100_0 == var_0_11 then
				arg_100_0.purchaseView:ExecuteAction("Show", arg_100_1)
			else
				arg_100_0:OnClickBtn(var_100_0, arg_100_1)
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.GetObtainBtnState(arg_106_0, arg_106_1)
	if arg_106_1:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return var_0_9
	elseif arg_106_0.isPreviewFurniture then
		if getProxy(DormProxy):getRawData():HasFurniture(Goods.Id2FurnitureId(arg_106_1.id)) then
			return var_0_4
		else
			return var_0_8
		end
	elseif arg_106_1.type == Goods.TYPE_ACTIVITY or arg_106_1.type == Goods.TYPE_ACTIVITY_EXTRA then
		return var_0_6
	elseif arg_106_1.buyCount > 0 then
		return var_0_4
	elseif arg_106_1:isDisCount() and arg_106_1:IsItemDiscountType() then
		return var_0_7
	elseif arg_106_1:CanUseVoucherType() or arg_106_1:ExistExclusiveDiscountItem() then
		return var_0_10
	elseif #arg_106_1:GetGiftList() > 0 then
		return var_0_11
	else
		return var_0_5
	end
end

function var_0_0.FlushGift(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_1:GetGiftList()[1]

	updateDrop(arg_107_0.price:Find("btn/item/mask/item"), {
		type = var_107_0.type,
		id = var_107_0.id,
		count = var_107_0.count
	})
end

function var_0_0.OnClickBtn(arg_108_0, arg_108_1, arg_108_2)
	if arg_108_1 == var_0_5 or arg_108_1 == var_0_7 or arg_108_1 == var_0_11 then
		arg_108_0:OnPurchase(arg_108_2)
	elseif arg_108_1 == var_0_10 then
		arg_108_0:OnItemPurchase(arg_108_2)
	elseif arg_108_1 == var_0_6 then
		arg_108_0:OnActivity(arg_108_2)
	elseif arg_108_1 == var_0_8 then
		arg_108_0:OnBackyard(arg_108_2)
	elseif arg_108_1 == var_0_9 then
		if arg_108_0.mode == NewSkinShopScene.MODE_EXPERIENCE_FOR_ITEM then
			arg_108_0:OnExperience4Item(arg_108_2)
		else
			arg_108_0:OnExperience(arg_108_2)
		end
	end
end

function var_0_0.FlushGifgPackBtn(arg_109_0, arg_109_1)
	local var_109_0 = false
	local var_109_1
	local var_109_2
	local var_109_3

	for iter_109_0, iter_109_1 in pairs(arg_109_0.giftSkinCommodities) do
		for iter_109_2, iter_109_3 in ipairs(iter_109_1) do
			if iter_109_3.id == arg_109_1.id then
				var_109_0 = true

				break
			end
		end

		if var_109_0 then
			var_109_1 = arg_109_0.giftPackCommodities[iter_109_0]
			var_109_2 = arg_109_0.giftSkinCommodities[iter_109_0]
			var_109_3 = arg_109_0.giftSkinProbabilitys[iter_109_0]

			break
		end
	end

	setActive(arg_109_0.giftPackBtn, var_109_0)

	if var_109_0 then
		onButton(arg_109_0, arg_109_0.giftPackBtn, function()
			arg_109_0:emit(LatestSkinShopMediator.OPEN_GIFT_PACK_LAYER, var_109_1, var_109_2, var_109_3)
		end, SFX_PANEL)
	end
end

function var_0_0.SetGiftPackLayer(arg_111_0)
	return
end

function var_0_0.OnPurchase(arg_112_0, arg_112_1)
	if arg_112_1.type ~= Goods.TYPE_SKIN then
		return
	end

	if arg_112_1:isDisCount() and arg_112_1:IsItemDiscountType() then
		arg_112_0:emit(LatestSkinShopMediator.ON_SHOPPING_BY_ACT, arg_112_1.id, 1)
	else
		arg_112_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_112_1.id, 1)
	end
end

function var_0_0.OnItemPurchase(arg_113_0, arg_113_1)
	if arg_113_1.type ~= Goods.TYPE_SKIN then
		return
	end

	local var_113_0 = arg_113_1:GetVoucherIdList()
	local var_113_1 = getProxy(BagProxy):GetExclusiveDiscountItem4Shop(arg_113_1.id)

	if #var_113_0 <= 0 and #var_113_1 <= 0 then
		return
	end

	local var_113_2 = {}

	for iter_113_0, iter_113_1 in ipairs(var_113_0) do
		table.insert(var_113_2, iter_113_1)
	end

	for iter_113_2, iter_113_3 in ipairs(var_113_1) do
		table.insert(var_113_2, iter_113_3.id)
	end

	local var_113_3 = arg_113_0.skinId
	local var_113_4 = pg.ship_skin_template[var_113_3]
	local var_113_5 = SwitchSpecialChar(var_113_4.name, true)

	arg_113_0.voucherMsgBox:ExecuteAction("Show", {
		itemList = var_113_2,
		skinId = var_113_3,
		skinName = var_113_5,
		price = arg_113_1:GetPrice(),
		onYes = function(arg_114_0)
			if arg_114_0 then
				arg_113_0:emit(LatestSkinShopMediator.ON_ITEM_PURCHASE, arg_114_0, arg_113_1.id)
			else
				arg_113_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_113_1.id, 1)
			end
		end
	})
end

function var_0_0.OnActivity(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_1:getConfig("time")
	local var_115_1 = arg_115_1:getConfig("activity")
	local var_115_2 = getProxy(ActivityProxy):getActivityById(var_115_1)

	if var_115_1 == 0 and pg.TimeMgr.GetInstance():inTime(var_115_0) or var_115_2 and not var_115_2:isEnd() then
		if arg_115_1.type == Goods.TYPE_ACTIVITY then
			arg_115_0:emit(LatestSkinShopMediator.GO_SHOPS_LAYER, arg_115_1:getConfig("activity"))
		elseif arg_115_1.type == Goods.TYPE_ACTIVITY_EXTRA then
			local var_115_3 = arg_115_1:getConfig("scene")

			if var_115_3 and #var_115_3 > 0 then
				arg_115_0:emit(LatestSkinShopMediator.OPEN_SCENE, var_115_3)
			else
				arg_115_0:emit(LatestSkinShopMediator.OPEN_ACTIVITY, var_115_1)
			end
		end
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_not_start"))
	end
end

function var_0_0.OnBackyard(arg_116_0, arg_116_1)
	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getRawData().level, "BackYardMediator") then
		local var_116_0 = pg.open_systems_limited[1]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_116_0.name, var_116_0.level))

		return
	end

	arg_116_0:emit(LatestSkinShopMediator.ON_BACKYARD_SHOP)
end

function var_0_0.OnExperience(arg_117_0, arg_117_1)
	local var_117_0 = arg_117_0.skinId
	local var_117_1 = getProxy(ShipSkinProxy):getSkinById(var_117_0)

	if var_117_1 and not var_117_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_117_2 = arg_117_1:getConfig("resource_num")
	local var_117_3 = arg_117_1:getConfig("time_second") * var_117_2
	local var_117_4, var_117_5, var_117_6, var_117_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_117_3)
	local var_117_8 = pg.ship_skin_template[arg_117_0.skinId].name

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_117_2, var_117_8, var_117_4, var_117_5),
		onYes = function()
			if getProxy(PlayerProxy):getRawData():getSkinTicket() < var_117_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_117_0:emit(LatestSkinShopMediator.ON_SHOPPING, arg_117_1.id, 1)
		end
	})
end

function var_0_0.OnExperience4Item(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_0.skinId
	local var_119_1 = getProxy(ShipSkinProxy):getSkinById(var_119_0)

	if var_119_1 and not var_119_1:isExpireType() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("already_have_the_skin"))

		return
	end

	local var_119_2 = arg_119_1:getConfig("resource_num")
	local var_119_3 = arg_119_1:getConfig("time_second") * var_119_2
	local var_119_4, var_119_5, var_119_6, var_119_7 = pg.TimeMgr.GetInstance():parseTimeFrom(var_119_3)
	local var_119_8 = pg.ship_skin_template[arg_119_0.skinId].name
	local var_119_9 = getProxy(BagProxy):GetSkinExperienceItems()
	local var_119_10 = _.detect(var_119_9, function(arg_120_0)
		return arg_120_0:CanUseForShop(arg_119_1.id)
	end)

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("exchange_limit_skin_tip", var_119_2, var_119_8, var_119_4, var_119_5),
		onYes = function()
			if not var_119_10 or var_119_10.count < var_119_2 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

				return
			end

			arg_119_0:emit(LatestSkinShopMediator.ON_ITEM_EXPERIENCE, var_119_10.id, arg_119_1.id, 1)
		end
	})
end

function var_0_0.SetFilterPanel(arg_122_0)
	local var_122_0 = arg_122_0.filterContent:Find("own/options")
	local var_122_1 = arg_122_0.filterContent:Find("type/options")
	local var_122_2 = arg_122_0.filterContent:Find("shipHave/options")
	local var_122_3 = arg_122_0.filterContent:Find("camp/options")
	local var_122_4 = arg_122_0.filterContent:Find("rarity/options")
	local var_122_5 = arg_122_0.filterContent:Find("shipType/options")
	local var_122_6 = arg_122_0.filterContent:Find("themeType/options")

	arg_122_0:SetOptionList(var_122_3, ShipIndexConst.CampNames, true)
	arg_122_0:SetOptionList(var_122_4, ShipIndexConst.RarityNames, true)
	arg_122_0:SetOptionList(var_122_5, ShipIndexConst.TypeNames, true)
	arg_122_0:SetOptionList(var_122_6, arg_122_0.classifyNames)
	arg_122_0:SetSingleOptions(var_122_0, "ownType")
	arg_122_0:SetMultiOptions(var_122_1, "typeType")
	arg_122_0:SetSingleOptions(var_122_2, "shipHaveType")
	arg_122_0:SetMultiOptions(var_122_3, "campType")
	arg_122_0:SetMultiOptions(var_122_4, "rarityType")
	arg_122_0:SetMultiOptions(var_122_5, "shipType")
	arg_122_0:SetMultiOptions(var_122_6, "themeType")
	onButton(arg_122_0, arg_122_0.filterUI:Find("bg"), function()
		for iter_123_0, iter_123_1 in pairs(arg_122_0.filterValues) do
			arg_122_0.filterValuesTemp[iter_123_0] = Clone(arg_122_0.filterValues[iter_123_0])
		end

		setActive(arg_122_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_122_0, arg_122_0.filterUI:Find("panelMask/panel/closeBtn"), function()
		for iter_124_0, iter_124_1 in pairs(arg_122_0.filterValues) do
			arg_122_0.filterValuesTemp[iter_124_0] = Clone(arg_122_0.filterValues[iter_124_0])
		end

		setActive(arg_122_0.filterUI, false)
	end, SFX_PANEL)
	onButton(arg_122_0, arg_122_0.filterUI:Find("panelMask/panel/bottom/ok"), function()
		for iter_125_0, iter_125_1 in pairs(arg_122_0.filterValues) do
			arg_122_0.filterValues[iter_125_0] = Clone(arg_122_0.filterValuesTemp[iter_125_0])
		end

		setActive(arg_122_0.filterUI, false)
		arg_122_0:Refresh(true)
	end, SFX_PANEL)
end

function var_0_0.OpenFilterPanel(arg_126_0)
	setActive(arg_126_0.filterUI, true)

	local var_126_0 = arg_126_0.filterContent:Find("own/options")
	local var_126_1 = arg_126_0.filterContent:Find("type/options")
	local var_126_2 = arg_126_0.filterContent:Find("shipHave/options")
	local var_126_3 = arg_126_0.filterContent:Find("camp/options")
	local var_126_4 = arg_126_0.filterContent:Find("rarity/options")
	local var_126_5 = arg_126_0.filterContent:Find("shipType/options")
	local var_126_6 = arg_126_0.filterContent:Find("themeType/options")

	arg_126_0:SetSingleOptions(var_126_0, "ownType", true)
	arg_126_0:SetMultiOptions(var_126_1, "typeType", true)
	arg_126_0:SetSingleOptions(var_126_2, "shipHaveType", true)
	arg_126_0:SetMultiOptions(var_126_3, "campType", true)
	arg_126_0:SetMultiOptions(var_126_4, "rarityType", true)
	arg_126_0:SetMultiOptions(var_126_5, "shipType", true)
	arg_126_0:SetMultiOptions(var_126_6, "themeType", true)
end

function var_0_0.SetOptionList(arg_127_0, arg_127_1, arg_127_2, arg_127_3)
	local var_127_0 = UIItemList.New(arg_127_1, arg_127_1:GetChild(0))

	var_127_0:make(function(arg_128_0, arg_128_1, arg_128_2)
		if arg_128_0 == UIItemList.EventUpdate then
			local var_128_0 = arg_127_2[arg_128_1 + 1]

			if arg_127_3 then
				var_128_0 = i18n(var_128_0)
			end

			arg_128_2.name = arg_128_1

			setScrollText(arg_128_2:Find("mask/Text"), var_128_0)
		end
	end)
	var_127_0:align(#arg_127_2)
end

function var_0_0.SetSingleOptions(arg_129_0, arg_129_1, arg_129_2, arg_129_3)
	for iter_129_0 = 0, arg_129_1.childCount - 1 do
		local var_129_0 = arg_129_1:GetChild(iter_129_0)

		arg_129_0:SetOptionSelect(arg_129_1:GetChild(iter_129_0), iter_129_0 == arg_129_0.filterValuesTemp[arg_129_2])

		if not arg_129_3 then
			onButton(arg_129_0, var_129_0, function()
				arg_129_0.filterValuesTemp[arg_129_2] = iter_129_0

				for iter_130_0 = 0, arg_129_1.childCount - 1 do
					arg_129_0:SetOptionSelect(arg_129_1:GetChild(iter_130_0), iter_130_0 == iter_129_0)
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetMultiOptions(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	for iter_131_0 = 0, arg_131_1.childCount - 1 do
		local var_131_0 = arg_131_1:GetChild(iter_131_0)

		arg_131_0:SetOptionSelect(arg_131_1:GetChild(iter_131_0), table.contains(arg_131_0.filterValuesTemp[arg_131_2], iter_131_0))

		if not arg_131_3 then
			onButton(arg_131_0, var_131_0, function()
				if iter_131_0 == 0 then
					arg_131_0.filterValuesTemp[arg_131_2] = {
						0
					}

					for iter_132_0 = 0, arg_131_1.childCount - 1 do
						arg_131_0:SetOptionSelect(arg_131_1:GetChild(iter_132_0), iter_132_0 == 0)
					end
				else
					table.removebyvalue(arg_131_0.filterValuesTemp[arg_131_2], 0)

					if table.contains(arg_131_0.filterValuesTemp[arg_131_2], iter_131_0) then
						table.removebyvalue(arg_131_0.filterValuesTemp[arg_131_2], iter_131_0)
					else
						table.insert(arg_131_0.filterValuesTemp[arg_131_2], iter_131_0)
					end

					local var_132_0 = true

					for iter_132_1 = 1, arg_131_1.childCount - 1 do
						if not table.contains(arg_131_0.filterValuesTemp[arg_131_2], iter_132_1) then
							var_132_0 = false

							break
						end
					end

					if #arg_131_0.filterValuesTemp[arg_131_2] == 0 then
						var_132_0 = true
					end

					if var_132_0 then
						arg_131_0.filterValuesTemp[arg_131_2] = {
							0
						}
					end

					for iter_132_2 = 0, arg_131_1.childCount - 1 do
						arg_131_0:SetOptionSelect(arg_131_1:GetChild(iter_132_2), table.contains(arg_131_0.filterValuesTemp[arg_131_2], iter_132_2))
					end
				end
			end, SFX_PANEL)
		end
	end
end

function var_0_0.SetOptionSelect(arg_133_0, arg_133_1, arg_133_2)
	setActive(arg_133_1:Find("selectedFrame"), arg_133_2)

	local var_133_0

	if IsNil(arg_133_1:Find("Text")) then
		var_133_0 = arg_133_1:Find("mask/Text"):GetComponent(typeof(Text))
	else
		var_133_0 = arg_133_1:Find("Text"):GetComponent(typeof(Text))
	end

	if arg_133_2 then
		var_133_0.color = Color.New(1, 1, 1, 1)
	else
		var_133_0.color = Color.New(0, 0, 0, 0.5)
	end
end

function var_0_0.GetSkinClassify(arg_134_0)
	arg_134_0.classifyIds = {}
	arg_134_0.classifyNames = {}

	local var_134_0 = {}
	local var_134_1 = {}

	for iter_134_0, iter_134_1 in ipairs(arg_134_0.commodities) do
		local var_134_2 = arg_134_0:GetShopTypeIdBySkinId(iter_134_1:getSkinId())
		local var_134_3 = var_134_2 == 0 and var_0_16 or var_134_2

		var_134_1[var_134_3] = (var_134_1[var_134_3] or 0) + 1
	end

	local var_134_4 = {}

	for iter_134_2, iter_134_3 in ipairs(arg_134_0.returnSkins) do
		var_134_4[iter_134_3] = true
	end

	if underscore.any(arg_134_0.commodities, function(arg_135_0)
		return var_134_4[arg_135_0.id]
	end) then
		table.insert(var_134_0, var_0_14)
	end

	for iter_134_4, iter_134_5 in ipairs(pg.skin_page_template.all) do
		if iter_134_5 ~= var_0_17 and iter_134_5 ~= var_0_18 and (var_134_1[iter_134_5] or 0) > 0 then
			table.insert(var_134_0, iter_134_5)
		end
	end

	if arg_134_0.mode == var_0_0.MODE_EXPERIENCE then
		table.insert(var_134_0, 1, var_0_13)
	end

	if arg_134_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_134_0, 1, var_0_15)
	end

	table.insert(var_134_0, 1, var_0_12)

	arg_134_0.classifyIds = var_134_0

	for iter_134_6, iter_134_7 in ipairs(arg_134_0.classifyIds) do
		if iter_134_7 == var_0_12 then
			table.insert(arg_134_0.classifyNames, i18n("shop_filter_all"))
		elseif iter_134_7 == var_0_13 or iter_134_7 == var_0_15 then
			table.insert(arg_134_0.classifyNames, i18n("shop_filter_trial"))
		elseif iter_134_7 == var_0_14 then
			table.insert(arg_134_0.classifyNames, i18n("shop_filter_retro"))
		else
			table.insert(arg_134_0.classifyNames, pg.skin_page_template[iter_134_7].name)
		end
	end
end

function var_0_0.GetShopTypeIdBySkinId(arg_136_0, arg_136_1)
	local var_136_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not arg_136_0.shopTypeIdList then
		arg_136_0.shopTypeIdList = {}
	end

	if arg_136_0.shopTypeIdList[arg_136_1] then
		return arg_136_0.shopTypeIdList[arg_136_1]
	end

	for iter_136_0, iter_136_1 in pairs(var_136_0) do
		for iter_136_2, iter_136_3 in ipairs(iter_136_1) do
			arg_136_0.shopTypeIdList[iter_136_3] = iter_136_0

			if iter_136_3 == arg_136_1 then
				return iter_136_0
			end
		end
	end
end

function var_0_0.OnShopping(arg_137_0, arg_137_1)
	if not arg_137_0.showingCommodity then
		return
	end

	if arg_137_0.purchaseView and arg_137_0.purchaseView:GetLoaded() then
		arg_137_0.purchaseView:Hide()
	end

	if arg_137_0.showingCommodity.id == arg_137_1 then
		arg_137_0:GetAllCommodities()
		arg_137_0:Refresh(true)
	end
end

function var_0_0.OnFurnitureUpdate(arg_138_0, arg_138_1)
	if not arg_138_0.showingCommodity then
		return
	end

	local var_138_0 = arg_138_0.showingCommodity.id

	if Goods.ExistFurniture(var_138_0) and Goods.Id2FurnitureId(var_138_0) == arg_138_1 then
		arg_138_0:GetAllCommodities()
		arg_138_0:Refresh(true)
	end
end

function var_0_0.willExit(arg_139_0)
	arg_139_0:ClearCards()
	ClearLScrollrect(arg_139_0.scrollrect)
	pg.DynamicBgMgr.GetInstance():ClearBg(arg_139_0:getUIName())

	if arg_139_0.live2dChar then
		arg_139_0.live2dChar:Dispose()

		arg_139_0.live2dChar = nil
	end

	if arg_139_0.voucherMsgBox then
		arg_139_0.voucherMsgBox:Destroy()

		arg_139_0.voucherMsgBox = nil
	end

	if arg_139_0.purchaseView then
		arg_139_0.purchaseView:Destroy()

		arg_139_0.purchaseView = nil
	end

	for iter_139_0, iter_139_1 in pairs(arg_139_0.downloads) do
		iter_139_1:Dispose()
	end

	arg_139_0.downloads = {}

	arg_139_0:ClearPainting()

	if arg_139_0.interactionPreview then
		arg_139_0.interactionPreview:Dispose()

		arg_139_0.interactionPreview = nil
	end

	arg_139_0:disposeEvent()
	arg_139_0:ClearTimer()
	arg_139_0:ReturnChar()
	arg_139_0:UnOverlay()
end

function var_0_0.onBackPressed(arg_140_0)
	pg.m02:sendNotification(NewShopMainScene.CLOSE_VIEW)
end

return var_0_0

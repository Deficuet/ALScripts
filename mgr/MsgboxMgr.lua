pg = pg or {}

local var_0_0 = pg
local var_0_1 = singletonClass("MsgboxMgr")

var_0_0.MsgboxMgr = var_0_1
var_0_1.BUTTON_BLUE = 1
var_0_1.BUTTON_GRAY = 2
var_0_1.BUTTON_RED = 3
var_0_1.BUTTON_MEDAL = 4
var_0_1.BUTTON_RETREAT = 5
var_0_1.BUTTON_PREPAGE = 6
var_0_1.BUTTON_NEXTPAGE = 7
var_0_1.BUTTON_BLUE_WITH_ICON = 8
var_0_1.BUTTON_YELLOW = 9
var_0_1.TITLE_INFORMATION = "infomation"
var_0_1.TITLE_SETTING = "setting"
var_0_1.TITLE_WARNING = "warning"
var_0_1.TITLE_OBTAIN = "obtain"
var_0_1.TITLE_CADPA = "cadpa"
var_0_1.TEXT_CANCEL = "text_cancel"
var_0_1.TEXT_CONFIRM = "text_confirm"
MSGBOX_TYPE_NORMAL = 1
MSGBOX_TYPE_INPUT = 2
MSGBOX_TYPE_SINGLE_ITEM = 3
MSGBOX_TYPE_EXCHANGE = 4
MSGBOX_TYPE_DROP_ITEM = 5
MSGBOX_TYPE_ITEM_BOX = 6
MSGBOX_TYPE_HELP = 7
MSGBOX_TYPE_SECONDPWD = 8
MSGBOX_TYPE_OBTAIN = 9
MSGBOX_TYPE_ITEMTIP = 10
MSGBOX_TYPE_JUST_FOR_SHOW = 11
MSGBOX_TYPE_MONTH_CARD_TIP = 12
MSGBOX_TYPE_WORLD_RESET = 13
MSGBOX_TYPE_WORLD_STAMINA_EXCHANGE = 14
MSGBOX_TYPE_STORY_CANCEL_TIP = 15
MSGBOX_TYPE_META_SKILL_UNLOCK = 16
MSGBOX_TYPE_CONFIRM_REFORGE_SPWEAPON = 17
MSGBOX_TYPE_ACCOUNTDELETE = 18
MSGBOX_TYPE_STRENGTHEN_BACK = 19
MSGBOX_TYPE_CONTENT_ITEMS = 20
MSGBOX_TYPE_BLUEPRINT_UNLOCK_ITEM = 21
MSGBOX_TYPE_CONFIRM_DELETE = 22
MSGBOX_TYPE_SUBPATTERN = 23
MSGBOX_TYPE_FILE_DOWNLOAD = 24
MSGBOX_TYPE_LIKN_COLLECT_GUIDE = 25
MSGBOX_TYPE_DROP_ITEM_ESKIN = 26
var_0_1.enable = false

local var_0_2 = require("Mgr.const.MsgboxBtnNameMap")

function var_0_1.Init(arg_1_0, arg_1_1)
	print("initializing msgbox manager...")
	LoadAndInstantiateAsync("ui", "MsgBox", function(arg_2_0)
		arg_1_0._go = arg_2_0

		arg_1_0._go:SetActive(false)

		arg_1_0._tf = arg_1_0._go.transform

		arg_1_0._tf:SetParent(var_0_0.UIMgr.GetInstance().OverlayMain, false)

		arg_1_0._window = arg_1_0._tf:Find("window")

		setActive(arg_1_0._window, true)

		arg_1_0._top = arg_1_0._window:Find("top")
		arg_1_0._titleList = arg_1_0._top:Find("bg")
		arg_1_0._closeBtn = arg_1_0._top:Find("btnBack")

		setText(arg_1_0._titleList:Find("infomation/title"), i18n("words_information"))
		setText(arg_1_0._titleList:Find("cadpa/title"), i18n("cadpa_tip1"))

		arg_1_0._res = arg_1_0._tf:Find("res")
		arg_1_0._msgPanel = arg_1_0._window:Find("msg_panel")
		arg_1_0.contentText = arg_1_0._msgPanel:Find("content"):GetComponent("RichText")

		arg_1_0.contentText:AddSprite("diamond", arg_1_0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		arg_1_0.contentText:AddSprite("gold", arg_1_0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		arg_1_0.contentText:AddSprite("oil", arg_1_0._res:Find("oil"):GetComponent(typeof(Image)).sprite)
		arg_1_0.contentText:AddSprite("world_money", arg_1_0._res:Find("world_money"):GetComponent(typeof(Image)).sprite)
		arg_1_0.contentText:AddSprite("port_money", arg_1_0._res:Find("port_money"):GetComponent(typeof(Image)).sprite)
		arg_1_0.contentText:AddSprite("guildicon", arg_1_0._res:Find("guildicon"):GetComponent(typeof(Image)).sprite)

		arg_1_0._exchangeShipPanel = arg_1_0._window:Find("exchange_ship_panel")
		arg_1_0._itemPanel = arg_1_0._window:Find("item_panel")
		arg_1_0._itemText = arg_1_0._itemPanel:Find("Text"):GetComponent(typeof(Text))
		arg_1_0._itemListItemContainer = arg_1_0._itemPanel:Find("scrollview/list")
		arg_1_0._itemListItemTpl = arg_1_0._itemListItemContainer:Find("item")
		arg_1_0._eskinPanel = arg_1_0._window:Find("eskin_panel")
		arg_1_0._eskinText = arg_1_0._eskinPanel:Find("Text"):GetComponent(typeof(Text))
		arg_1_0._eskinListItemContainer = arg_1_0._eskinPanel:Find("scrollview/list")
		arg_1_0._eskinListItemTpl = arg_1_0._eskinListItemContainer:Find("item")
		arg_1_0._sigleItemPanel = arg_1_0._window:Find("single_item_panel")
		arg_1_0._singleItemshipTypeTF = arg_1_0._sigleItemPanel:Find("display_panel/name_container/shiptype")
		arg_1_0.singleItemIntro = arg_1_0._sigleItemPanel:Find("display_panel/desc/Text")

		local var_2_0 = arg_1_0.singleItemIntro:GetComponent("RichText")

		var_2_0:AddSprite("diamond", arg_1_0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		var_2_0:AddSprite("gold", arg_1_0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		var_2_0:AddSprite("oil", arg_1_0._res:Find("oil"):GetComponent(typeof(Image)).sprite)
		var_2_0:AddSprite("world_money", arg_1_0._res:Find("world_money"):GetComponent(typeof(Image)).sprite)
		var_2_0:AddSprite("port_money", arg_1_0._res:Find("port_money"):GetComponent(typeof(Image)).sprite)
		var_2_0:AddSprite("world_boss", arg_1_0._res:Find("world_boss"):GetComponent(typeof(Image)).sprite)

		arg_1_0._singleItemSubIntroTF = arg_1_0._sigleItemPanel:Find("sub_intro")

		setText(arg_1_0._sigleItemPanel:Find("ship_group/locked/Text"), i18n("tag_ship_locked"))
		setText(arg_1_0._sigleItemPanel:Find("ship_group/unlocked/Text"), i18n("tag_ship_unlocked"))

		arg_1_0._inputPanel = arg_1_0._window:Find("input_panel")
		arg_1_0._inputTitle = arg_1_0._inputPanel:Find("label"):GetComponent(typeof(Text))
		arg_1_0._inputTF = arg_1_0._inputPanel:Find("InputField")
		arg_1_0._inputField = arg_1_0._inputTF:GetComponent(typeof(InputField))
		arg_1_0._placeholderTF = arg_1_0._inputTF:Find("Placeholder"):GetComponent(typeof(Text))
		arg_1_0._inputConfirmBtn = arg_1_0._inputPanel:Find("btns/confirm_btn")
		arg_1_0._inputCancelBtn = arg_1_0._inputPanel:Find("btns/cancel_btn")
		arg_1_0._helpPanel = arg_1_0._window:Find("help_panel")
		arg_1_0._helpBgTF = arg_1_0._tf:Find("bg_help")
		arg_1_0._helpList = arg_1_0._helpPanel:Find("list")
		arg_1_0._helpTpl = arg_1_0._helpPanel:Find("list/help_tpl")
		arg_1_0._worldResetPanel = arg_1_0._window:Find("world_reset_panel")
		arg_1_0._worldShopBtn = arg_1_0._window:Find("world_shop_btn")
		arg_1_0._remasterPanel = arg_1_0._window:Find("remaster_info")
		arg_1_0._obtainPanel = arg_1_0._window:Find("obtain_panel")
		arg_1_0._otherPanel = arg_1_0._window:Find("other_panel")
		arg_1_0._countSelect = arg_1_0._window:Find("count_select")
		arg_1_0._pageUtil = PageUtil.New(arg_1_0._countSelect:Find("value_bg/left"), arg_1_0._countSelect:Find("value_bg/right"), arg_1_0._countSelect:Find("max"), arg_1_0._countSelect:Find("value_bg/value"))
		arg_1_0._countDescTxt = arg_1_0._countSelect:Find("desc_txt")
		arg_1_0._sliders = arg_1_0._window:Find("sliders")
		arg_1_0._discountInfo = arg_1_0._sliders:Find("discountInfo")
		arg_1_0._discountDate = arg_1_0._sliders:Find("discountDate")
		arg_1_0._discount = arg_1_0._sliders:Find("discountInfo/discount")
		arg_1_0._strike = arg_1_0._sliders:Find("strike")
		arg_1_0.stopRemindToggle = arg_1_0._window:Find("stopRemind"):GetComponent(typeof(Toggle))
		arg_1_0.stopRemindText = tf(arg_1_0.stopRemindToggle.gameObject):Find("Label"):GetComponent(typeof(Text))
		arg_1_0._btnContainer = arg_1_0._window:Find("button_container")
		arg_1_0._defaultSize = Vector2(930, 620)
		arg_1_0._defaultHelpSize = Vector2(870, 480)
		arg_1_0._defaultHelpPos = Vector2(0, -40)
		arg_1_0.pools = {}
		arg_1_0.panelDict = {}
		arg_1_0.timers = {}

		arg_1_1()
	end, true, true)
end

function var_0_1.getMsgBoxOb(arg_3_0)
	return arg_3_0._go
end

local function var_0_3(arg_4_0, arg_4_1)
	arg_4_0:commonSetting(arg_4_1)
	SetActive(arg_4_0._msgPanel, true)

	arg_4_0.contentText.alignment = arg_4_0.settings.alignment or TextAnchor.MiddleCenter
	arg_4_0.contentText.fontSize = arg_4_0.settings.fontSize or 36
	arg_4_0.contentText.text = arg_4_0.settings.content or ""

	arg_4_0:Loaded(arg_4_1)
end

local function var_0_4(arg_5_0, arg_5_1)
	arg_5_0:commonSetting(arg_5_1)
	setActive(arg_5_0._inputPanel, true)
	setActive(arg_5_0._btnContainer, false)

	arg_5_0._inputTitle.text = arg_5_1.title or ""
	arg_5_0._placeholderTF.text = arg_5_1.placeholder or ""
	arg_5_0._inputField.characterLimit = arg_5_1.limit or 0

	setActive(arg_5_0._inputCancelBtn, not arg_5_1.hideNo)
	arg_5_0:updateButton(arg_5_0._inputCancelBtn, arg_5_1.noText or var_0_1.TEXT_CANCEL)
	arg_5_0:updateButton(arg_5_0._inputConfirmBtn, arg_5_1.yesText or var_0_1.TEXT_CONFIRM)
	onButton(arg_5_0, arg_5_0._inputCancelBtn, function()
		arg_5_0:hide()
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._inputConfirmBtn, function()
		if arg_5_1.onYes then
			arg_5_1.onYes(arg_5_0._inputField.text)
		end

		arg_5_0:hide()
	end, SFX_CONFIRM)
	arg_5_0:Loaded(arg_5_1)
end

local function var_0_5(arg_8_0, arg_8_1)
	arg_8_0:commonSetting(arg_8_1)
	SetActive(arg_8_0._exchangeShipPanel, true)
	setActive(findTF(arg_8_0._exchangeShipPanel, "icon_bg/own"), false)
	updateDrop(arg_8_0._exchangeShipPanel, arg_8_1.drop)

	local var_8_0 = arg_8_0._exchangeShipPanel:Find("intro_view/Viewport/intro")

	SetActive(var_8_0, arg_8_1.drop.type == DROP_TYPE_SHIP or arg_8_1.drop.type == DROP_TYPE_RESOURCE or arg_8_1.drop.type == DROP_TYPE_ITEM or arg_8_1.drop.type == DROP_TYPE_FURNITURE or arg_8_1.drop.type == DROP_TYPE_STRATEGY or arg_8_1.drop.type == DROP_TYPE_SKIN or arg_8_1.drop.type == DROP_TYPE_SKIN_TIMELIMIT)

	local var_8_1 = arg_8_0.settings.numUpdate

	setActive(arg_8_0.singleItemIntro, var_8_1 == nil)
	setActive(arg_8_0._countDescTxt, var_8_1 ~= nil)
	setText(arg_8_0._exchangeShipPanel:Find("name_mode/name"), arg_8_1.name or arg_8_1.drop:getConfig("name") or "")
	setText(arg_8_0._exchangeShipPanel:Find("name_mode/name/name"), getText(arg_8_0._exchangeShipPanel:Find("name_mode/name")))

	local var_8_2 = var_0_0.ship_data_statistics[arg_8_1.drop.id].skin_id
	local var_8_3, var_8_4, var_8_5 = ShipWordHelper.GetWordAndCV(var_8_2, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)

	setText(var_8_0, var_8_5 or i18n("ship_drop_desc_default"))

	if arg_8_1.intro then
		setText(var_8_0, arg_8_1.intro)
	end

	if arg_8_1.enabelYesBtn ~= nil then
		local var_8_6 = arg_8_0._btnContainer:GetChild(1)

		setButtonEnabled(var_8_6, arg_8_1.enabelYesBtn)
		eachChild(var_8_6, function(arg_9_0)
			local var_9_0 = arg_8_1.enabelYesBtn and 1 or 0.3

			GetOrAddComponent(arg_9_0, typeof(CanvasGroup)).alpha = var_9_0
		end)
	end

	if arg_8_1.show_medal then
		arg_8_0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = arg_8_1.show_medal.desc,
			btnType = var_0_1.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	arg_8_0:Loaded(arg_8_1)
end

local function var_0_6(arg_10_0, arg_10_1)
	arg_10_0:commonSetting(arg_10_1)
	SetActive(arg_10_0._itemPanel, true)
	setActive(arg_10_0._itemText, arg_10_1.content)

	arg_10_0._itemText.text = arg_10_1.content or ""

	local var_10_0 = arg_10_1.items
	local var_10_1 = arg_10_1.itemFunc

	UIItemList.StaticAlign(arg_10_0._itemListItemContainer, arg_10_0._itemListItemTpl, #var_10_0, function(arg_11_0, arg_11_1, arg_11_2)
		arg_11_1 = arg_11_1 + 1

		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = var_10_0[arg_11_1]

			updateDrop(arg_11_2:Find("IconTpl"), var_11_0, {
				anonymous = var_11_0.anonymous,
				hideName = var_11_0.hideName
			})

			local var_11_1 = arg_11_2:Find("IconTpl/name")

			setText(var_11_1, shortenString(getText(var_11_1), 6))
			onButton(arg_10_0, arg_11_2, function()
				if var_11_0.anonymous then
					return
				elseif var_10_1 then
					var_10_1(var_11_0)
				end
			end, SFX_UI_CLICK)
		end
	end)
	arg_10_0:Loaded(arg_10_1)
end

local function var_0_7(arg_13_0, arg_13_1)
	arg_13_0:commonSetting(arg_13_1)
	SetActive(arg_13_0._eskinPanel, true)
	setActive(arg_13_0._eskinText, arg_13_1.content)

	arg_13_0._eskinText.text = arg_13_1.content or ""

	local var_13_0 = arg_13_1.items
	local var_13_1 = arg_13_1.itemFunc

	UIItemList.StaticAlign(arg_13_0._eskinListItemContainer, arg_13_0._eskinListItemTpl, #var_13_0, function(arg_14_0, arg_14_1, arg_14_2)
		arg_14_1 = arg_14_1 + 1

		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = var_13_0[arg_14_1]

			updateDrop(arg_14_2:Find("IconTpl"), var_14_0, {
				anonymous = var_14_0.anonymous,
				hideName = var_14_0.hideName
			})
			setText(arg_14_2:Find("own/Text"), i18n("equip_skin_detail_count") .. var_14_0:getOwnedCount())
			onButton(arg_13_0, arg_14_2, function()
				if var_14_0.anonymous then
					return
				elseif var_13_1 then
					var_13_1(var_14_0)
				end
			end, SFX_UI_CLICK)
		end
	end)
	arg_13_0:Loaded(arg_13_1)
end

local function var_0_8(arg_16_0, arg_16_1)
	arg_16_0:commonSetting(arg_16_1)
	SetActive(arg_16_0._sigleItemPanel, true)
	SetActive(arg_16_0._sigleItemPanel:Find("ship_group"), false)
	SetActive(arg_16_0._singleItemshipTypeTF, false)
	SetActive(arg_16_0._sigleItemPanel:Find("left/detail"), false)

	local var_16_0 = arg_16_0.singleItemIntro

	SetActive(var_16_0, true)
	setText(var_16_0, arg_16_1.content or "")

	local var_16_1 = arg_16_0._sigleItemPanel:Find("left/IconTpl")

	setText(var_16_1:Find("icon_bg/count"), "")
	SetActive(var_16_1:Find("icon_bg/startpl"), false)
	SetCompomentEnabled(var_16_1:Find("icon_bg"), typeof(Image), not arg_16_1.hideIconBG)
	SetCompomentEnabled(var_16_1:Find("icon_bg/frame"), typeof(Image), not arg_16_1.hideIconBG)

	local var_16_2 = var_16_1:Find("icon_bg/frame")

	setFrame(var_16_2, arg_16_1.frame or 1)
	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_16_1.frame or 1), var_16_1:Find("icon_bg"))
	GetImageSpriteFromAtlasAsync(arg_16_1.iconPath[1], arg_16_1.iconPath[2] or "", var_16_1:Find("icon_bg/icon"))
	setText(arg_16_0._sigleItemPanel:Find("display_panel/name_container/name/Text"), arg_16_1.name or "")
	arg_16_0:Loaded(arg_16_1)
end

local function var_0_9(arg_17_0, arg_17_1)
	arg_17_0:commonSetting(arg_17_1)
	SetActive(arg_17_0._sigleItemPanel, true)

	local var_17_0 = arg_17_0._sigleItemPanel:Find("left/IconTpl")

	setActive(var_17_0:Find("timelimit"), arg_17_1.drop.type == DROP_TYPE_SKIN_TIMELIMIT)
	updateDrop(var_17_0, arg_17_1.drop)
	setActive(arg_17_0._singleItemshipTypeTF, arg_17_1.drop.type == DROP_TYPE_SHIP)
	setActive(arg_17_0._sigleItemPanel:Find("combat_skin"), false)

	local var_17_1 = arg_17_0._sigleItemPanel:Find("display_panel"):GetComponent(typeof(RectTransform))

	var_17_1.sizeDelta = Vector2(var_17_1.sizeDelta.x, -114.5)

	if arg_17_1.drop.type == DROP_TYPE_SHIP then
		GetImageSpriteFromAtlasAsync("shiptype", shipType2print(arg_17_1.drop:getConfig("type")), arg_17_0._singleItemshipTypeTF, false)
	elseif arg_17_1.drop.type == DROP_TYPE_COMBAT_UI_STYLE then
		var_17_1.sizeDelta = Vector2(var_17_1.sizeDelta.x, -170.5)

		local var_17_2 = var_0_0.item_data_battleui[arg_17_1.drop.id].rare_display
		local var_17_3 = UIItemList.New(arg_17_0._sigleItemPanel:Find("combat_skin/elementList"), arg_17_0._sigleItemPanel:Find("combat_skin/elementList/main"))

		var_17_3:make(function(arg_18_0, arg_18_1, arg_18_2)
			if arg_18_0 == UIItemList.EventUpdate then
				local var_18_0 = var_17_2[arg_18_1 + 1]

				GetImageSpriteFromAtlasAsync("ui/combatskinrare", CombatSkinConst.TYPE_ICON_NAME[var_18_0], arg_18_2:Find("icon"), true)
				setScrollText(arg_18_2:Find("TextMask/Text"), i18n("battleui_display" .. var_18_0))
			end
		end)
		var_17_3:align(#var_17_2)
		setActive(arg_17_0._sigleItemPanel:Find("combat_skin"), true)
	end

	local var_17_4 = arg_17_1.drop.type == DROP_TYPE_SHIP
	local var_17_5 = arg_17_0._sigleItemPanel:Find("ship_group")

	SetActive(var_17_5, var_17_4)

	if var_17_4 then
		local var_17_6 = tobool(getProxy(CollectionProxy):getShipGroup(var_0_0.ship_data_template[arg_17_1.drop.id].group_type))

		SetActive(var_17_5:Find("unlocked"), var_17_6)
		SetActive(var_17_5:Find("locked"), not var_17_6)
	end

	if arg_17_1.windowSize then
		arg_17_0._window.sizeDelta = Vector2(arg_17_1.windowSize.x or arg_17_0._defaultSize.x, arg_17_1.windowSize.y or arg_17_0._defaultSize.y)
	end

	local var_17_7 = arg_17_0.singleItemIntro
	local var_17_8 = arg_17_0._singleItemSubIntroTF
	local var_17_9 = arg_17_0.settings.numUpdate

	setActive(arg_17_0._countDescTxt, var_17_9 ~= nil)
	SetActive(var_17_7, var_17_9 == nil)

	local var_17_10 = arg_17_1.name or arg_17_1.drop:getConfig("name") or ""

	setText(arg_17_0._sigleItemPanel:Find("display_panel/name_container/name/Text"), var_17_10)
	UpdateOwnDisplay(arg_17_0._sigleItemPanel:Find("left/own"), arg_17_1.drop)
	RegisterDetailButton(arg_17_0, arg_17_0._sigleItemPanel:Find("left/detail"), arg_17_1.drop)

	if arg_17_1.iconPreservedAspect then
		local var_17_11 = var_17_0:Find("icon_bg/icon")
		local var_17_12 = var_17_11:GetComponent(typeof(Image))

		var_17_11.pivot = Vector2(0.5, 1)

		local var_17_13 = var_17_11.rect.width
		local var_17_14 = var_17_12.preferredHeight / var_17_12.preferredWidth * var_17_13

		var_17_11.sizeDelta = Vector2(-4, var_17_14 - var_17_13 - 4)
		var_17_11.anchoredPosition = Vector2(0, -2)
	end

	if arg_17_1.content and arg_17_1.content ~= "" then
		setText(var_17_7, arg_17_1.content)
	elseif arg_17_1.drop.type == DROP_TYPE_WORLD_COLLECTION then
		arg_17_1.drop:MsgboxIntroSet(arg_17_1, var_17_7, arg_17_0._sigleItemPanel:Find("name_mode/name_mask/name"))
	else
		arg_17_1.drop:MsgboxIntroSet(arg_17_1, var_17_7)
	end

	if arg_17_1.intro then
		setText(var_17_7, arg_17_1.intro)
	end

	setText(var_17_8, arg_17_1.subIntro or arg_17_1.extendDesc or "")

	if arg_17_1.enabelYesBtn ~= nil then
		local var_17_15 = arg_17_0._btnContainer:GetChild(1)

		setButtonEnabled(var_17_15, arg_17_1.enabelYesBtn)
		eachChild(var_17_15, function(arg_19_0)
			local var_19_0 = arg_17_1.enabelYesBtn and 1 or 0.3

			GetOrAddComponent(arg_19_0, typeof(CanvasGroup)).alpha = var_19_0
		end)
	end

	if arg_17_1.show_medal then
		arg_17_0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = arg_17_1.show_medal.desc,
			btnType = var_0_1.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	arg_17_0:Loaded(arg_17_1)
end

local function var_0_10(arg_20_0, arg_20_1)
	arg_20_0:commonSetting(arg_20_1)
	setActive(findTF(arg_20_0._helpPanel, "bg"), not arg_20_1.helps.pageMode)
	setActive(arg_20_0._helpBgTF, arg_20_1.helps.pageMode)
	setActive(arg_20_0._helpPanel:Find("btn_blueprint"), arg_20_1.show_blueprint)

	if arg_20_1.show_blueprint then
		onButton(arg_20_0, arg_20_0._helpPanel:Find("btn_blueprint"), function()
			arg_20_0:hide()
			var_0_0.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT, {
				shipGroupId = arg_20_1.show_blueprint
			})
		end, SFX_PANEL)
	end

	if arg_20_1.helps.helpSize then
		arg_20_0._helpPanel.sizeDelta = Vector2(arg_20_1.helps.helpSize.x or arg_20_0._defaultHelpSize.x, arg_20_1.helps.helpSize.y or arg_20_0._defaultHelpSize.y)
	end

	if arg_20_1.helps.helpPos then
		setAnchoredPosition(arg_20_0._helpPanel, {
			x = arg_20_1.helps.helpPos.x or arg_20_0._defaultHelpPos.x,
			y = arg_20_1.helps.helpPos.y or arg_20_0._defaultHelpPos.y
		})
	end

	if arg_20_1.helps.windowSize then
		arg_20_0._window.sizeDelta = Vector2(arg_20_1.helps.windowSize.x or arg_20_0._defaultSize.x, arg_20_1.helps.windowSize.y or arg_20_0._defaultSize.y)
	end

	if arg_20_1.helps.windowPos then
		arg_20_0._window.sizeDelta = Vector2(arg_20_1.helps.windowSize.x or arg_20_0._defaultSize.x, arg_20_1.helps.windowSize.y or arg_20_0._defaultSize.y)

		setAnchoredPosition(arg_20_0._window, {
			x = arg_20_1.helps.windowPos.x or 0,
			y = arg_20_1.helps.windowPos.y or 0
		})
	else
		setAnchoredPosition(arg_20_0._window, {
			x = 0,
			y = 0
		})
	end

	if arg_20_1.helps.buttonsHeight then
		setAnchoredPosition(arg_20_0._btnContainer, {
			y = arg_20_1.helps.buttonsHeight
		})
	end

	if arg_20_1.helps.disableScroll then
		local var_20_0 = arg_20_0._helpPanel:Find("list")

		SetCompomentEnabled(arg_20_0._helpPanel:Find("list"), typeof(ScrollRect), not arg_20_1.helps.disableScroll)
		setAnchoredPosition(var_20_0, Vector2.zero)
		setActive(findTF(arg_20_0._helpPanel, "Scrollbar"), false)
	end

	if arg_20_1.helps.ImageMode then
		setActive(arg_20_0._top, false)
		setActive(findTF(arg_20_0._window, "bg"), false)
	end

	local var_20_1 = arg_20_0.settings.helps

	for iter_20_0 = #var_20_1, arg_20_0._helpList.childCount - 1 do
		Destroy(arg_20_0._helpList:GetChild(iter_20_0))
	end

	for iter_20_1 = arg_20_0._helpList.childCount, #var_20_1 - 1 do
		cloneTplTo(arg_20_0._helpTpl, arg_20_0._helpList)
	end

	for iter_20_2, iter_20_3 in ipairs(var_20_1) do
		local var_20_2 = arg_20_0._helpList:GetChild(iter_20_2 - 1)

		setActive(var_20_2, true)

		local var_20_3 = var_20_2:Find("icon")

		setActive(var_20_3, iter_20_3.icon)
		setActive(findTF(var_20_2, "line"), iter_20_3.line)

		if iter_20_3.icon then
			local var_20_4 = 1

			if arg_20_1.helps.ImageMode then
				var_20_4 = 1.5
			end

			var_20_3.transform.localScale = Vector2(iter_20_3.icon.scale or var_20_4, iter_20_3.icon.scale or var_20_4)

			local var_20_5 = iter_20_3.icon.path
			local var_20_6 = iter_20_3.icon.posX and iter_20_3.icon.posX or -20
			local var_20_7 = iter_20_3.icon.posY and iter_20_3.icon.posY or 0
			local var_20_8 = LoadSprite(iter_20_3.icon.atlas, iter_20_3.icon.path)

			setImageSprite(var_20_3:GetComponent(typeof(Image)), var_20_8, true)
			setAnchoredPosition(var_20_3, {
				x = var_20_6,
				y = var_20_7
			})
			setActive(var_20_3:Find("corner"), arg_20_1.helps.pageMode)
		end

		local var_20_9 = var_20_2:Find("richText"):GetComponent("RichText")

		if iter_20_3.rawIcon then
			local var_20_10 = iter_20_3.rawIcon.name

			var_20_9:AddSprite(var_20_10, GetSpriteFromAtlas(iter_20_3.rawIcon.atlas, var_20_10))

			local var_20_11 = HXSet.hxLan(iter_20_3.info or "")

			setText(var_20_2, "")

			var_20_9.text = string.format("<icon name=%s w=0.7 h=0.7/>%s", var_20_10, var_20_11)
		else
			setText(var_20_2, HXSet.hxLan(iter_20_3.info and SwitchSpecialChar(iter_20_3.info, true) or ""))
		end

		setActive(var_20_9.gameObject, iter_20_3.rawIcon)
	end

	arg_20_0.helpPage = arg_20_1.helps.defaultpage or 1

	if arg_20_1.helps.pageMode then
		arg_20_0:switchHelpPage(arg_20_0.helpPage)
	end

	arg_20_0:Loaded(arg_20_1)
end

local function var_0_11(arg_22_0, arg_22_1)
	arg_22_0:commonSetting(arg_22_1)
	setActive(arg_22_0._otherPanel, true)

	local var_22_0 = tf(arg_22_1.secondaryUI)

	arg_22_0._window.sizeDelta = Vector2(960, arg_22_0._defaultSize.y)

	setActive(var_22_0, true)

	local var_22_1 = arg_22_1.mode
	local var_22_2 = getProxy(SecondaryPWDProxy):getRawData()
	local var_22_3 = var_22_0:Find("showresttime")
	local var_22_4 = var_22_0:Find("settips")

	if var_22_1 == "showresttime" then
		setActive(var_22_3, true)
		setActive(var_22_4, false)

		local var_22_5 = var_22_3:Find("desc"):GetComponent(typeof(Text))

		if arg_22_0.timers.secondaryUItimer then
			arg_22_0.timers.secondaryUItimer:Stop()
		end

		local function var_22_6()
			local var_23_0 = var_0_0.TimeMgr.GetInstance():GetServerTime()
			local var_23_1 = var_22_2.fail_cd and var_22_2.fail_cd - var_23_0 or 0

			var_23_1 = var_23_1 < 0 and 0 or var_23_1

			local var_23_2 = math.floor(var_23_1 / 86400)

			if var_23_2 > 0 then
				var_22_5.text = string.format(i18n("tips_fail_secondarypwd_much_times"), var_23_2 .. i18n("word_date"))
			else
				local var_23_3 = math.floor(var_23_1 / 3600)

				if var_23_3 > 0 then
					var_22_5.text = string.format(i18n("tips_fail_secondarypwd_much_times"), var_23_3 .. i18n("word_hour"))
				else
					local var_23_4 = ""
					local var_23_5 = math.floor(var_23_1 / 60)

					if var_23_5 > 0 then
						var_23_4 = var_23_4 .. var_23_5 .. i18n("word_minute")
					end

					local var_23_6 = math.max(var_23_1 - var_23_5 * 60, 0)

					var_22_5.text = string.format(i18n("tips_fail_secondarypwd_much_times"), var_23_4 .. var_23_6 .. i18n("word_second"))
				end
			end
		end

		var_22_6()

		local var_22_7 = Timer.New(var_22_6, 1, -1)

		var_22_7:Start()

		arg_22_0.timers.secondaryUItimer = var_22_7
	elseif var_22_1 == "settips" then
		setActive(var_22_3, false)
		setActive(var_22_4, true)

		local var_22_8 = var_22_4:Find("InputField"):GetComponent(typeof(InputField))

		arg_22_1.references.inputfield = var_22_8
		var_22_8.text = arg_22_1.references.lasttext or ""

		local var_22_9 = 20

		var_22_8.onValueChanged:AddListener(function()
			local var_24_0, var_24_1 = utf8_to_unicode(var_22_8.text)

			if var_24_1 > var_22_9 then
				var_22_8.text = SecondaryPasswordMediator.ClipUnicodeStr(var_22_8.text, var_22_9)
			end
		end)

		local function var_22_10()
			if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
				return false
			end

			local var_25_0 = var_22_8.text
			local var_25_1, var_25_2 = wordVer(var_25_0, {
				isReplace = true
			})

			if var_25_1 > 0 or var_25_2 ~= var_25_0 then
				var_0_0.TipsMgr.GetInstance():ShowTips(i18n("secondarypassword_illegal_tip"))

				var_22_8.text = var_25_2

				return true
			else
				return false
			end
		end

		arg_22_0:createBtn({
			text = var_0_1.TEXT_CONFIRM,
			btnType = var_0_1.BUTTON_BLUE,
			onCallback = arg_22_0.settings.onYes,
			sound = SFX_CONFIRM,
			noQuit = var_22_10
		})
	end

	arg_22_0:Loaded(arg_22_1)
end

local function var_0_12(arg_26_0, arg_26_1)
	arg_26_0:commonSetting(arg_26_1)
	setActive(arg_26_0._worldResetPanel, true)
	setActive(arg_26_0._worldShopBtn, false)
	setText(arg_26_0._worldResetPanel:Find("content/Text"), arg_26_1.tipWord)

	local var_26_0 = arg_26_0._worldResetPanel:Find("IconTpl")

	setActive(var_26_0, false)

	local var_26_1 = arg_26_0._worldResetPanel:Find("content/item_list")

	removeAllChildren(var_26_1)

	for iter_26_0, iter_26_1 in ipairs(arg_26_1.drops) do
		local var_26_2 = cloneTplTo(var_26_0, var_26_1)

		updateDrop(var_26_2, iter_26_1)

		local var_26_3 = findTF(var_26_2, "name")

		changeToScrollText(var_26_3, getText(var_26_3))

		if arg_26_1.itemFunc then
			onButton(arg_26_0, var_26_2, function()
				arg_26_1.itemFunc(iter_26_1)
			end, SFX_PANEL)
		end
	end

	onButton(arg_26_0, arg_26_0._worldShopBtn, function()
		arg_26_0:hide()

		return existCall(arg_26_1.goShop)
	end, SFX_MAIN)
	arg_26_0:Loaded(arg_26_1)
end

local function var_0_13(arg_29_0, arg_29_1)
	arg_29_0:commonSetting(arg_29_1)

	arg_29_0._window.sizeDelta = Vector2(arg_29_0._defaultSize.x, 520)

	setActive(arg_29_0._obtainPanel, true)
	setActive(arg_29_0._btnContainer, false)

	local var_29_0 = {
		type = DROP_TYPE_SHIP,
		id = arg_29_1.shipId
	}

	updateDrop(arg_29_0._obtainPanel, var_29_0, arg_29_1)

	local var_29_1
	local var_29_4

	if Ship.isMetaShipByConfigID(arg_29_1.shipId) then
		local var_29_2 = MetaCharacterConst.GetMetaShipGroupIDByConfigID(arg_29_1.shipId)
		local var_29_3 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(var_29_2)

		if var_29_3 and (var_29_3:isInAct() or var_29_3:isInArchive()) then
			var_29_4 = true
		else
			var_29_4 = false
		end
	else
		var_29_4 = true
	end

	arg_29_0.obtainSkipList = arg_29_0.obtainSkipList or UIItemList.New(arg_29_0._obtainPanel:Find("skipable_list"), arg_29_0._obtainPanel:Find("skipable_list/tpl"))

	arg_29_0.obtainSkipList:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			local var_30_0 = arg_29_1.list[arg_30_1 + 1]
			local var_30_1 = var_30_0[1]
			local var_30_2 = var_30_0[2]
			local var_30_3 = var_30_0[3]
			local var_30_4 = HXSet.hxLan(var_30_1)

			arg_30_2:Find("mask/title"):GetComponent("ScrollText"):SetText(var_30_4)
			setActive(arg_30_2:Find("skip_btn"), var_29_4 and var_30_2[1] ~= "" and var_30_2[1] ~= "COLLECTSHIP")

			if var_30_2[1] ~= "" then
				onButton(arg_29_0, arg_30_2:Find("skip_btn"), function()
					if var_30_3 and var_30_3 ~= 0 then
						local var_31_0 = getProxy(ActivityProxy):getActivityById(var_30_3)

						if not var_31_0 or var_31_0:isEnd() then
							var_0_0.TipsMgr.GetInstance():ShowTips(i18n("collection_way_is_unopen"))

							return
						end
					elseif var_30_2[1] == "SHOP" and var_30_2[2].warp == NewShopsScene.TYPE_MILITARY_SHOP and not var_0_0.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "MilitaryExerciseMediator") then
						var_0_0.TipsMgr.GetInstance():ShowTips(i18n("military_shop_no_open_tip"))

						return
					elseif var_30_2[1] == "LEVEL" and var_30_2[2] then
						local var_31_1 = var_30_2[2].chapterid
						local var_31_2 = getProxy(ChapterProxy)
						local var_31_3 = var_31_2:getChapterById(var_31_1)

						if var_31_3:isUnlock() then
							local var_31_4 = var_31_2:getActiveChapter()

							if var_31_4 and var_31_4.id ~= var_31_1 then
								arg_29_0:ShowMsgBox({
									content = i18n("collect_chapter_is_activation"),
									onYes = function()
										var_0_0.m02:sendNotification(GAME.CHAPTER_OP, {
											type = ChapterConst.OpRetreat
										})
									end
								})

								return
							else
								local var_31_5 = {
									mapIdx = var_31_3:getConfig("map")
								}

								if var_31_3.active then
									var_31_5.chapterId = var_31_3.id
								else
									var_31_5.openChapterId = var_31_1
								end

								var_0_0.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, var_31_5)
							end
						else
							var_0_0.TipsMgr.GetInstance():ShowTips(i18n("acquisitionmode_is_not_open"))

							return
						end
					elseif var_30_2[1] == "COLLECTSHIP" then
						if arg_29_1.mediatorName == CollectionMediator.__cname then
							var_0_0.m02:sendNotification(CollectionMediator.EVENT_OBTAIN_SKIP, {
								toggle = 2,
								displayGroupId = var_30_2[2].shipGroupId
							})
						else
							var_0_0.m02:sendNotification(GAME.GO_SCENE, SCENE.COLLECTSHIP, {
								toggle = 2,
								displayGroupId = var_30_2[2].shipGroupId
							})
						end
					elseif var_30_2[1] == "SHOP" then
						var_0_0.m02:sendNotification(GAME.GO_SCENE, SCENE[var_30_2[1]], var_30_2[2])
					else
						var_0_0.m02:sendNotification(GAME.GO_SCENE, SCENE[var_30_2[1]], var_30_2[2])
					end

					arg_29_0:hide()
				end, SFX_PANEL)
			end
		end
	end)
	arg_29_0.obtainSkipList:align(#arg_29_1.list)
	arg_29_0:Loaded(arg_29_1)
end

function var_0_1.nextPage(arg_33_0)
	arg_33_0.helpPage = arg_33_0.helpPage + 1

	if arg_33_0.helpPage < 1 then
		arg_33_0.helpPage = 1
	end

	if arg_33_0.helpPage > arg_33_0._helpList.childCount then
		arg_33_0.helpPage = 1
	end

	arg_33_0:switchHelpPage(arg_33_0.helpPage)
end

function var_0_1.prePage(arg_34_0)
	arg_34_0.helpPage = arg_34_0.helpPage - 1

	if arg_34_0.helpPage < 1 then
		arg_34_0.helpPage = arg_34_0._helpList.childCount
	end

	if arg_34_0.helpPage > arg_34_0._helpList.childCount then
		arg_34_0.helpPage = arg_34_0._helpList.childCount
	end

	arg_34_0:switchHelpPage(arg_34_0.helpPage)
end

function var_0_1.switchHelpPage(arg_35_0, arg_35_1)
	for iter_35_0 = 1, arg_35_0._helpList.childCount do
		local var_35_0 = arg_35_0._helpList:GetChild(iter_35_0 - 1)

		setActive(var_35_0, arg_35_1 == iter_35_0)
		setText(var_35_0:Find("icon/corner/Text"), iter_35_0)
	end
end

function var_0_1.commonSetting(arg_36_0, arg_36_1)
	rtf(arg_36_0._window).sizeDelta = arg_36_0._defaultSize
	rtf(arg_36_0._helpPanel).sizeDelta = arg_36_0._defaultHelpSize
	arg_36_0.enable = true

	var_0_0.DelegateInfo.New(arg_36_0)
	setActive(arg_36_0._msgPanel, false)
	setActive(arg_36_0._exchangeShipPanel, false)
	setActive(arg_36_0._itemPanel, false)
	setActive(arg_36_0._eskinPanel, false)
	setActive(arg_36_0._sigleItemPanel, false)
	setActive(arg_36_0._inputPanel, false)
	setActive(arg_36_0._obtainPanel, false)
	setActive(arg_36_0._otherPanel, false)
	setActive(arg_36_0._worldResetPanel, false)
	setActive(arg_36_0._worldShopBtn, false)
	setActive(arg_36_0._helpBgTF, false)
	setActive(arg_36_0._helpPanel, arg_36_1.helps)

	for iter_36_0, iter_36_1 in pairs(arg_36_0.panelDict) do
		iter_36_1.buffer:Hide()
	end

	setActive(arg_36_0._btnContainer, true)

	arg_36_0.stopRemindToggle.isOn = arg_36_1.toggleStatus or false

	setActive(go(arg_36_0.stopRemindToggle), arg_36_1.showStopRemind)

	arg_36_0.stopRemindText.text = arg_36_1.stopRamindContent or i18n("dont_remind_today")

	removeAllChildren(arg_36_0._btnContainer)

	arg_36_0.settings = arg_36_1

	SetActive(arg_36_0._go, true)

	local var_36_0 = arg_36_0.settings.needCounter or false

	setActive(arg_36_0._countSelect, var_36_0)

	local var_36_1 = arg_36_0.settings.numUpdate
	local var_36_2 = arg_36_0.settings.addNum or 1
	local var_36_3 = arg_36_0.settings.maxNum or -1
	local var_36_4 = arg_36_0.settings.defaultNum or 1

	arg_36_0._pageUtil:setNumUpdate(function(arg_37_0)
		if var_36_1 ~= nil then
			var_36_1(arg_36_0._countDescTxt, arg_37_0)
		end
	end)
	arg_36_0._pageUtil:setAddNum(var_36_2)
	arg_36_0._pageUtil:setMaxNum(var_36_3)
	arg_36_0._pageUtil:setDefaultNum(var_36_4)
	setActive(arg_36_0._sliders, arg_36_0.settings.discount)

	if arg_36_0.settings.discount then
		arg_36_0._discount:GetComponent(typeof(Text)).text = arg_36_0.settings.discount.discount .. "%OFF"
		arg_36_0._discountDate:GetComponent(typeof(Text)).text = arg_36_0.settings.discount.date
	end

	setActive(arg_36_0._remasterPanel, arg_36_0.settings.remaster)

	if arg_36_0.settings.remaster then
		local var_36_5 = arg_36_0.settings.remaster

		setText(arg_36_0._remasterPanel:Find("content/Text"), var_36_5.word)
		setText(arg_36_0._remasterPanel:Find("content/count"), var_36_5.number or "")
		setText(arg_36_0._remasterPanel:Find("btn/pic"), var_36_5.btn_text)
		onButton(arg_36_0, arg_36_0._remasterPanel:Find("btn"), function()
			if var_36_5.btn_call then
				var_36_5.btn_call()
			end

			arg_36_0:hide()
		end)
	end

	local var_36_6 = arg_36_0.settings.hideNo or false
	local var_36_7 = arg_36_0.settings.hideYes or false
	local var_36_8 = arg_36_0.settings.modal or false
	local var_36_9 = arg_36_0.settings.onYes or function()
		return
	end
	local var_36_10 = arg_36_0.settings.onNo or function()
		return
	end

	onButton(arg_36_0, tf(arg_36_0._go):Find("bg"), function()
		if arg_36_0.settings.onClose then
			arg_36_0.settings.onClose()
		else
			var_36_10()
		end

		arg_36_0:hide()
	end, SFX_CANCEL)
	SetCompomentEnabled(tf(arg_36_0._go):Find("bg"), typeof(Button), not var_36_8)

	local var_36_11
	local var_36_12

	if not var_36_6 then
		local var_36_13 = arg_36_0:createBtn({
			text = arg_36_0.settings.noText or var_0_1.TEXT_CANCEL,
			btnType = arg_36_0.settings.noBtnType or var_0_1.BUTTON_GRAY,
			onCallback = var_36_10,
			sound = arg_36_1.noSound or SFX_CANCEL
		})
	end

	if not var_36_7 then
		var_36_12 = arg_36_0:createBtn({
			text = arg_36_0.settings.yesText or var_0_1.TEXT_CONFIRM,
			btnType = arg_36_0.settings.yesBtnType or var_0_1.BUTTON_BLUE,
			onCallback = var_36_9,
			sound = arg_36_1.yesSound or SFX_CONFIRM,
			alignment = arg_36_0.settings.yesSize and TextAnchor.MiddleCenter,
			gray = arg_36_0.settings.yesGray,
			delayButton = arg_36_0.settings.delayConfirm
		})

		if arg_36_0.settings.yesSize then
			var_36_12.sizeDelta = arg_36_0.settings.yesSize
		end
	end

	if arg_36_0.settings.yseBtnLetf then
		var_36_12:SetAsFirstSibling()
	end

	local var_36_14

	if arg_36_0.settings.type == MSGBOX_TYPE_HELP and arg_36_0.settings.helps.pageMode and #arg_36_0.settings.helps > 1 then
		arg_36_0:createBtn({
			noQuit = true,
			btnType = var_0_1.BUTTON_PREPAGE,
			onCallback = function()
				arg_36_0:prePage()
			end,
			sound = SFX_CANCEL
		})

		var_36_14 = #arg_36_0.settings.helps
	end

	if arg_36_0.settings.custom ~= nil then
		for iter_36_2, iter_36_3 in ipairs(arg_36_0.settings.custom) do
			arg_36_0:createBtn(iter_36_3)
		end
	end

	if not var_36_14 then
		-- block empty
	elseif var_36_14 > 1 then
		arg_36_0:createBtn({
			noQuit = true,
			btnType = var_0_1.BUTTON_NEXTPAGE,
			onCallback = function()
				arg_36_0:nextPage()
			end,
			sound = SFX_CONFIRM
		})
	end

	setActive(arg_36_0._closeBtn, not arg_36_1.hideClose)
	onButton(arg_36_0, arg_36_0._closeBtn, function()
		local var_44_0 = arg_36_0.settings.onClose

		if arg_36_0.settings and arg_36_0.settings.hideClose and not var_44_0 and arg_36_0.settings.onYes then
			arg_36_0.settings.onYes()
		end

		arg_36_0:hide()

		if var_44_0 then
			var_44_0()
		else
			var_36_10()
		end
	end, SFX_CANCEL)

	local var_36_15 = arg_36_0.settings.title or var_0_1.TITLE_INFORMATION
	local var_36_16 = 0
	local var_36_17 = arg_36_0._titleList.transform.childCount

	while var_36_16 < var_36_17 do
		local var_36_18 = arg_36_0._titleList.transform:GetChild(var_36_16)

		SetActive(var_36_18, var_36_18.name == var_36_15)

		var_36_16 = var_36_16 + 1
	end

	local var_36_19 = arg_36_0._go.transform.localPosition

	arg_36_0._go.transform.localPosition = Vector3(var_36_19.x, var_36_19.y, arg_36_0.settings.zIndex or 0)
	arg_36_0.locked = arg_36_0.settings.locked or false
end

function var_0_1.createBtn(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_1.btnType or var_0_1.BUTTON_BLUE
	local var_45_1 = arg_45_1.noQuit
	local var_45_2 = arg_45_0._go.transform:Find("custom_btn_list/custom_button_" .. var_45_0)
	local var_45_3 = cloneTplTo(var_45_2, arg_45_0._btnContainer)

	if arg_45_1.label then
		go(var_45_3).name = arg_45_1.label
	end

	SetActive(var_45_3, true)

	if arg_45_1.scale then
		local var_45_4 = arg_45_1.scale.x or 1
		local var_45_5 = arg_45_1.scale.y or 1

		var_45_3.localScale = Vector2(var_45_4, var_45_5)
	end

	local var_45_6

	if var_45_0 == var_0_1.BUTTON_MEDAL then
		setText(var_45_3:Find("text"), arg_45_1.text)

		var_45_6 = var_45_3:Find("text")
	elseif var_45_0 ~= var_0_1.BUTTON_RETREAT and var_45_0 ~= var_0_1.BUTTON_PREPAGE and var_45_0 ~= var_0_1.BUTTON_NEXTPAGE then
		arg_45_0:updateButton(var_45_3, arg_45_1.text, arg_45_1.alignment)

		var_45_6 = var_45_3:Find("pic")
	end

	if var_45_0 == var_0_1.BUTTON_BLUE_WITH_ICON and arg_45_1.iconName then
		local var_45_7 = var_45_3:Find("ticket/icon")

		setImageSprite(var_45_7, LoadSprite(arg_45_1.iconName[1], arg_45_1.iconName[2]))
	end

	local var_45_8

	if arg_45_1.delayButton then
		local var_45_9 = arg_45_1.delayButton
		local var_45_10 = getText(var_45_6)

		var_45_8 = Timer.New(function()
			var_45_9 = var_45_9 - 1

			if var_45_9 > 0 then
				setText(var_45_6, var_45_10 .. string.format("(%d)", var_45_9))
			else
				setText(var_45_6, var_45_10)
				setGray(var_45_3, arg_45_1.gray, true)

				var_45_8 = nil
			end
		end, 1, var_45_9)
		arg_45_0.timers[var_45_3] = var_45_8

		var_45_8:Start()
		setText(var_45_6, var_45_10 .. string.format("(%d)", var_45_9))
		setGray(var_45_3, true, true)
	else
		setGray(var_45_3, arg_45_1.gray, true)
	end

	if not arg_45_1.hideEvent then
		onButton(arg_45_0, var_45_3, function()
			if var_45_8 then
				return
			end

			if type(var_45_1) == "function" then
				if var_45_1() then
					return
				else
					arg_45_0:hide()
				end
			elseif not var_45_1 then
				arg_45_0:hide()
			end

			return existCall(arg_45_1.onCallback)
		end, arg_45_1.sound or SFX_CONFIRM)
	end

	if arg_45_1.sibling then
		var_45_3:SetSiblingIndex(arg_45_1.sibling)
	end

	return var_45_3
end

function var_0_1.updateButton(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = var_0_2[arg_48_2]
	local var_48_1 = arg_48_1:Find("pic")

	if IsNil(var_48_1) then
		return
	end

	if var_48_0 then
		setText(var_48_1, i18n(var_48_0))
	else
		if string.len(arg_48_2) > 12 then
			GetComponent(var_48_1, typeof(Text)).resizeTextForBestFit = true
		end

		setText(var_48_1, arg_48_2)
	end

	if arg_48_3 then
		var_48_1:GetComponent(typeof(Text)).alignment = arg_48_3
	end
end

function var_0_1.Loaded(arg_49_0, arg_49_1)
	var_0_0.UIMgr.GetInstance():BlurPanel(arg_49_0._tf, false, {
		groupName = arg_49_1.groupName,
		weight = arg_49_1.weight or LayerWeightConst.SECOND_LAYER,
		blurLevelCamera = arg_49_1.blurLevelCamera,
		parent = arg_49_1.parent
	})
	var_0_0.m02:sendNotification(GAME.OPEN_MSGBOX_DONE)
end

function var_0_1.Clear(arg_50_0)
	for iter_50_0, iter_50_1 in pairs(arg_50_0.panelDict) do
		iter_50_1:Destroy()
	end

	table.clear(arg_50_0.panelDict)

	rtf(arg_50_0._window).sizeDelta = arg_50_0._defaultSize
	rtf(arg_50_0._helpPanel).sizeDelta = arg_50_0._defaultHelpSize

	setAnchoredPosition(arg_50_0._window, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(arg_50_0._btnContainer, {
		y = 15
	})
	setAnchoredPosition(arg_50_0._helpPanel, {
		x = arg_50_0._defaultHelpPos.x,
		y = arg_50_0._defaultHelpPos.y
	})
	SetCompomentEnabled(arg_50_0._helpPanel:Find("list"), typeof(ScrollRect), true)
	setActive(arg_50_0._top, true)
	setActive(findTF(arg_50_0._window, "bg"), true)
	setActive(arg_50_0._sigleItemPanel:Find("left/own"), false)

	local var_50_0 = arg_50_0._sigleItemPanel:Find("left/IconTpl")

	SetCompomentEnabled(var_50_0:Find("icon_bg"), typeof(Image), true)
	SetCompomentEnabled(var_50_0:Find("icon_bg/frame"), typeof(Image), true)
	setActive(var_50_0:Find("icon_bg/slv"), false)

	local var_50_1 = findTF(var_50_0, "icon_bg/icon")

	var_50_1.pivot = Vector2(0.5, 0.5)
	var_50_1.sizeDelta = Vector2(-4, -4)
	var_50_1.anchoredPosition = Vector2(0, 0)

	setActive(arg_50_0.singleItemIntro, false)
	setText(arg_50_0._singleItemSubIntroTF, "")

	for iter_50_2 = 0, arg_50_0._helpList.childCount - 1 do
		arg_50_0._helpList:GetChild(iter_50_2):Find("icon"):GetComponent(typeof(Image)).sprite = nil
	end

	for iter_50_3, iter_50_4 in pairs(arg_50_0.pools) do
		if iter_50_4 then
			PoolMgr.GetInstance():ReturnUI(iter_50_4.name, iter_50_4)
		end
	end

	arg_50_0.pools = {}

	for iter_50_5, iter_50_6 in pairs(arg_50_0.timers) do
		iter_50_6:Stop()
	end

	arg_50_0.timers = {}

	var_0_0.DelegateInfo.Dispose(arg_50_0)
	removeAllChildren(arg_50_0._btnContainer)
	var_0_0.UIMgr.GetInstance():UnblurPanel(arg_50_0._tf, var_0_0.UIMgr.GetInstance().OverlayMain)
	arg_50_0.contentText:RemoveAllListeners()

	arg_50_0.settings = nil
	arg_50_0.enable = false
	arg_50_0.locked = nil
end

function var_0_1.ShowMsgBox(arg_51_0, arg_51_1)
	if arg_51_0.locked then
		return
	end

	local var_51_0 = arg_51_1.type or MSGBOX_TYPE_NORMAL

	switch(var_51_0, {
		[MSGBOX_TYPE_NORMAL] = function()
			var_0_3(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_INPUT] = function()
			var_0_4(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_SINGLE_ITEM] = function()
			var_0_9(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_EXCHANGE] = function()
			var_0_5(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_DROP_ITEM] = function()
			var_0_8(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_ITEM_BOX] = function()
			var_0_6(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_DROP_ITEM_ESKIN] = function()
			var_0_7(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_HELP] = function()
			arg_51_1.hideNo = defaultValue(arg_51_1.hideNo, true)
			arg_51_1.hideYes = defaultValue(arg_51_1.hideYes, true)

			var_0_10(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_SECONDPWD] = function()
			PoolMgr.GetInstance():GetUI("Msgbox4SECPWD", true, function(arg_61_0)
				arg_51_0.pools.SedondaryUI = arg_61_0

				if arg_51_1.onPreShow then
					arg_51_1.onPreShow()
				end

				arg_51_1.secondaryUI = arg_61_0

				SetParent(arg_61_0, arg_51_0._otherPanel, false)
				var_0_11(arg_51_0, arg_51_1)
			end)
		end,
		[MSGBOX_TYPE_WORLD_RESET] = function()
			var_0_12(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_OBTAIN] = function()
			arg_51_1.title = arg_51_1.title or var_0_1.TITLE_OBTAIN

			var_0_13(arg_51_0, arg_51_1)
		end,
		[MSGBOX_TYPE_ITEMTIP] = function()
			arg_51_0:GetPanel(ItemTipPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_JUST_FOR_SHOW] = function()
			arg_51_0:GetPanel(ItemShowPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_MONTH_CARD_TIP] = function()
			arg_51_0:GetPanel(MonthCardOutDateTipPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_STORY_CANCEL_TIP] = function()
			arg_51_0:GetPanel(StoryCancelTipPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_META_SKILL_UNLOCK] = function()
			arg_51_0:GetPanel(MetaSkillUnlockPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_ACCOUNTDELETE] = function()
			arg_51_0:GetPanel(AccountDeletePanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_STRENGTHEN_BACK] = function()
			arg_51_0:GetPanel(StrengthenBackPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_CONTENT_ITEMS] = function()
			arg_51_0:GetPanel(Msgbox4ContentItems).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_BLUEPRINT_UNLOCK_ITEM] = function()
			arg_51_0:GetPanel(Msgbox4BlueprintUnlockItem).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_CONFIRM_DELETE] = function()
			arg_51_0:GetPanel(ConfirmEquipmentDeletePanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_CONFIRM_REFORGE_SPWEAPON] = function()
			arg_51_0:GetPanel(Msgbox4SpweaponConfirm).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_SUBPATTERN] = function()
			arg_51_0:GetPanel(arg_51_1.patternClass).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_FILE_DOWNLOAD] = function()
			arg_51_0:GetPanel(FileDownloadPanel).buffer:UpdateView(arg_51_1)
		end,
		[MSGBOX_TYPE_LIKN_COLLECT_GUIDE] = function()
			arg_51_0:GetPanel(Msgbox4LinkCollectGuide).buffer:UpdateView(arg_51_1)
		end
	})
end

function var_0_1.GetPanel(arg_78_0, arg_78_1)
	if not arg_78_0.panelDict[arg_78_1] then
		arg_78_0.panelDict[arg_78_1] = arg_78_1.New(arg_78_0)

		arg_78_0.panelDict[arg_78_1]:Load()
		arg_78_0.panelDict[arg_78_1].buffer:SetParent(arg_78_0._window)
	end

	return arg_78_0.panelDict[arg_78_1]
end

function var_0_1.CloseAndHide(arg_79_0)
	if not arg_79_0.enable then
		return
	end

	local var_79_0 = arg_79_0.settings
	local var_79_1 = var_79_0.onClose or not var_79_0.hideNo and var_79_0.onNo or nil

	existCall(var_79_1)
	arg_79_0:hide()
end

function var_0_1.hide(arg_80_0)
	if not arg_80_0.enable then
		return
	end

	arg_80_0._go:SetActive(false)
	arg_80_0:Clear()
	var_0_0.m02:sendNotification(GAME.CLOSE_MSGBOX_DONE)
end

function var_0_1.emit(arg_81_0, arg_81_1, ...)
	if not arg_81_0.analogyMediator then
		arg_81_0.analogyMediator = {
			addSubLayers = function(arg_82_0, arg_82_1)
				var_0_0.m02:sendNotification(GAME.LOAD_LAYERS, {
					parentContext = getProxy(ContextProxy):getCurrentContext(),
					context = arg_82_1
				})
			end,
			sendNotification = function(arg_83_0, ...)
				var_0_0.m02:sendNotification(...)
			end,
			viewComponent = arg_81_0
		}
	end

	return ContextMediator.CommonBindDic[arg_81_1](arg_81_0.analogyMediator, arg_81_1, ...)
end

function var_0_1.closeView(arg_84_0)
	arg_84_0:hide()
end

return var_0_1

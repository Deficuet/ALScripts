local var_0_0 = class("PlayerVitaeShipsPage", import("...base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 1
local var_0_5 = 2

var_0_0.RANDOM_FLAG_SHIP_PAGE = var_0_5
var_0_0.EDUCATE_CHAR_SLOT_ID = 6
var_0_0.ON_BEGIN_DRAG_CARD = "PlayerVitaeShipsPage:ON_BEGIN_DRAG_CARD"
var_0_0.ON_DRAGING_CARD = "PlayerVitaeShipsPage:ON_DRAGING_CARD"
var_0_0.ON_DRAG_END_CARD = "PlayerVitaeShipsPage:ON_DRAG_END_CARD"

function var_0_0.GetSlotIndexList()
	local var_1_0, var_1_1 = var_0_0.GetSlotMaxCnt()
	local var_1_2 = {}

	for iter_1_0 = 1, var_1_1 do
		table.insert(var_1_2, iter_1_0)
	end

	if NewEducateHelper.GetEducateCharSlotMaxCnt() > 0 then
		table.insert(var_1_2, var_0_0.EDUCATE_CHAR_SLOT_ID)
	end

	return var_1_2
end

function var_0_0.GetAllUnlockSlotCnt()
	local var_2_0, var_2_1 = var_0_0.GetSlotMaxCnt()

	return var_2_1 + NewEducateHelper.GetEducateCharSlotMaxCnt()
end

function var_0_0.GetSlotMaxCnt()
	local var_3_0 = pg.gameset.secretary_group_unlock.description
	local var_3_1 = var_3_0[#var_3_0][2]
	local var_3_2 = 1

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if getProxy(ChapterProxy):isClear(iter_3_1[1]) then
			var_3_2 = iter_3_1[2]
		end
	end

	return var_3_1, var_3_2
end

function var_0_0.getUIName(arg_4_0)
	return "PlayerVitaeShipsPage"
end

function var_0_0.getResource(arg_5_0, arg_5_1)
	local var_5_0 = {
		"ui/proposeShipCard"
	}
	local var_5_1 = var_0_0.super.getResource(arg_5_0)
	local var_5_2 = arg_5_1 and arg_5_1.showTrans

	local function var_5_3(arg_6_0)
		local var_6_0 = getProxy(BayProxy):GetShipPhantom(arg_6_0)
		local var_6_1 = getProxy(ShipSkinProxy):GetAllSkinForShip(var_6_0)
		local var_6_2 = getProxy(ShipSkinProxy):GetShareSkinsForShip(var_6_0)
		local var_6_3 = _.map(var_6_2, function(arg_7_0)
			return pg.ship_skin_template[arg_7_0.id]
		end)

		table.insertto(var_6_1, var_6_3)

		for iter_6_0, iter_6_1 in ipairs(var_6_1) do
			local var_6_4 = iter_6_1 and iter_6_1.painting or "unknown"

			if var_6_4 ~= "unknown" then
				local var_6_5 = ResPathSupport.GetPaintingListByPaintingName(var_6_4)

				table.insertto(var_5_1, var_6_5)
			end
		end
	end

	local function var_5_4(arg_8_0)
		if not arg_8_0 then
			return
		end

		local var_8_0 = arg_8_0:rarity2bgPrint(var_5_2)

		table.insert(var_5_1, string.format(ResPathSupport.ConstPath.BG.ShipCard, var_8_0))

		local var_8_1, var_8_2 = arg_8_0:GetFrameAndEffect(true)

		if noEmptyStr(var_8_2) then
			table.insert(var_5_1, ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_8_2))
		end
	end

	local function var_5_5(arg_9_0)
		local var_9_0 = getProxy(BayProxy):GetShipPhantom(arg_9_0)

		var_5_4(var_9_0)
	end

	for iter_5_0, iter_5_1 in ipairs(getProxy(PlayerProxy):getRawData():GetShipPhantomMarks()) do
		var_5_5(iter_5_1)
		var_5_3(iter_5_1)
	end

	for iter_5_2, iter_5_3 in ipairs(getProxy(SettingsProxy):GetRandomFlagShipList()) do
		var_5_5(iter_5_3)
		var_5_3(iter_5_3)
	end

	local var_5_6 = getProxy(PlayerProxy):getRawData()

	if var_5_6:ExistEducateChar() then
		local var_5_7 = VirtualEducateCharShip.New(var_5_6:GetEducateCharacter())

		table.insert(var_5_1, "painting/" .. var_5_7:getPainting())
	end

	return ResPathSupport.UniqueLuaArr(ResPathSupport.MergeLuaArr(var_5_1, var_5_0))
end

function var_0_0.UpdateCard(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.cards[var_0_1]

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		if isActive(iter_10_1._tf) and iter_10_1.displayShip and iter_10_1.displayShip:GetShipPhantomMark() == arg_10_1 then
			iter_10_1:Refresh()

			break
		end
	end
end

function var_0_0.UpdateCardPaintingTag(arg_11_0)
	local var_11_0 = arg_11_0.cards[var_0_1]

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		iter_11_1:updatePaintingTag()
	end
end

function var_0_0.RefreshShips(arg_12_0)
	arg_12_0:Update()
end

function var_0_0.OnLoaded(arg_13_0)
	arg_13_0.cardContainer = arg_13_0._tf:Find("frame")
	arg_13_0.shipTpl = arg_13_0._tf:Find("frame/shipCard")
	arg_13_0.emptyTpl = arg_13_0._tf:Find("frame/addCard")
	arg_13_0.lockTpl = arg_13_0._tf:Find("frame/lockCard")
	arg_13_0.helpBtn = arg_13_0._tf:Find("help_btn")
	arg_13_0.settingBtn = arg_13_0._tf:Find("setting_btn")
	arg_13_0.settingBtnSlider = arg_13_0.settingBtn:Find("toggle/on")
	arg_13_0.randomBtn = arg_13_0._tf:Find("ran_setting_btn")
	arg_13_0.randomBtnSlider = arg_13_0.randomBtn:Find("toggle/on")
	arg_13_0.settingSeceneBtn = arg_13_0._tf:Find("setting_scene_btn")
	arg_13_0.nativeBtn = arg_13_0._tf:Find("native_setting_btn")
	arg_13_0.nativeBtnOn = arg_13_0.nativeBtn:Find("on")
	arg_13_0.nativeBtnOff = arg_13_0.nativeBtn:Find("off")
	arg_13_0.getMailBtn = arg_13_0._tf:Find("get_mail")
	arg_13_0.educateCharTr = arg_13_0._tf:Find("educate_char")
	arg_13_0.educateCharSettingList = UIItemList.New(arg_13_0._tf:Find("educate_char/shipCard/settings/panel"), arg_13_0._tf:Find("educate_char/shipCard/settings/panel/tpl"))
	arg_13_0.educateCharSettingBtn = arg_13_0._tf:Find("educate_char/shipCard/settings/tpl")
	arg_13_0.educateCharTrTip = arg_13_0.educateCharTr:Find("tip")

	if LOCK_EDUCATE_SYSTEM then
		setActive(arg_13_0.educateCharTr, false)
		setAnchoredPosition(arg_13_0.cardContainer, {
			x = 0
		})
		setAnchoredPosition(arg_13_0._tf:Find("flagship"), {
			x = -720
		})
		setAnchoredPosition(arg_13_0._tf:Find("zs"), {
			x = 763
		})
		setAnchoredPosition(arg_13_0._tf:Find("line"), {
			x = 740
		})
	end

	arg_13_0.educateCharCards = {
		[var_0_1] = PlayerVitaeEducateShipCard.New(arg_13_0._tf:Find("educate_char/shipCard"), arg_13_0.event),
		[var_0_2] = PlayerVitaeEducateAddCard.New(arg_13_0._tf:Find("educate_char/addCard"), arg_13_0.event),
		[var_0_3] = PlayerVitaeEducateLockCard.New(arg_13_0._tf:Find("educate_char/lockCard"), arg_13_0.event)
	}
	arg_13_0.tip = arg_13_0._tf:Find("tip"):GetComponent(typeof(Text))
	arg_13_0.flagShipMark = arg_13_0._tf:Find("flagship")

	arg_13_0:bind(var_0_0.ON_BEGIN_DRAG_CARD, function(arg_14_0, arg_14_1)
		arg_13_0:OnBeginDragCard(arg_14_1)
	end)
	arg_13_0:bind(var_0_0.ON_DRAGING_CARD, function(arg_15_0, arg_15_1)
		arg_13_0:OnDragingCard(arg_15_1)
	end)
	arg_13_0:bind(var_0_0.ON_DRAG_END_CARD, function(arg_16_0)
		arg_13_0:OnEndDragCard()
	end)
	setText(arg_13_0.nativeBtnOn:Find("Text"), i18n("random_ship_before"))
	setText(arg_13_0.nativeBtnOff:Find("Text"), i18n("random_ship_now"))
	setText(arg_13_0.settingBtn:Find("Text"), i18n("player_vitae_skin_setting"))
	setText(arg_13_0.randomBtn:Find("Text"), i18n("random_ship_label"))
	setText(arg_13_0.settingSeceneBtn:Find("Text"), i18n("playervtae_setting_btn_label"))
	setText(arg_13_0.getMailBtn:Find("Text"), i18n("spring_present_tips_btn"))
	setText(arg_13_0.getMailBtn:Find("time"), i18n("spring_present_tips_time"))

	arg_13_0.cardContainerCG = GetOrAddComponent(arg_13_0.cardContainer, typeof(CanvasGroup))
end

function var_0_0.OnBeginDragCard(arg_17_0, arg_17_1)
	arg_17_0.dragIndex = arg_17_1
	arg_17_0.displayCards = {}
	arg_17_0.displayPos = {}

	local var_17_0 = arg_17_0.cards[var_0_1]

	for iter_17_0, iter_17_1 in ipairs(var_17_0) do
		if isActive(iter_17_1._tf) then
			arg_17_0.displayCards[iter_17_0] = iter_17_1
			arg_17_0.displayPos[iter_17_0] = iter_17_1._tf.localPosition
		end
	end

	for iter_17_2, iter_17_3 in pairs(arg_17_0.displayCards) do
		if iter_17_2 ~= arg_17_1 then
			iter_17_3:DisableDrag()
		end
	end
end

function var_0_0.OnDragingCard(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.displayCards[arg_18_0.dragIndex - 1]
	local var_18_1 = arg_18_0.displayCards[arg_18_0.dragIndex + 1]

	if var_18_0 and arg_18_0:ShouldSwap(arg_18_1, arg_18_0.dragIndex - 1) then
		arg_18_0:Swap(arg_18_0.dragIndex, arg_18_0.dragIndex - 1)
	elseif var_18_1 and arg_18_0:ShouldSwap(arg_18_1, arg_18_0.dragIndex + 1) then
		arg_18_0:Swap(arg_18_0.dragIndex, arg_18_0.dragIndex + 1)
	end
end

function var_0_0.Swap(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_0.displayCards[arg_19_1]
	local var_19_1 = arg_19_0.displayPos[arg_19_1]
	local var_19_2 = arg_19_0.displayCards[arg_19_2]

	var_19_2._tf.localPosition = var_19_1
	arg_19_0.displayCards[arg_19_1], arg_19_0.displayCards[arg_19_2] = arg_19_0.displayCards[arg_19_2], arg_19_0.displayCards[arg_19_1]
	arg_19_0.dragIndex = arg_19_2
	var_19_0.slotIndex = arg_19_2
	var_19_2.slotIndex = arg_19_1
	var_19_0.typeIndex, var_19_2.typeIndex = var_19_2.typeIndex, var_19_0.typeIndex

	local var_19_3 = arg_19_0.cards[var_0_1]

	var_19_3[arg_19_1], var_19_3[arg_19_2] = var_19_3[arg_19_2], var_19_3[arg_19_1]
end

function var_0_0.ShouldSwap(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.displayPos[arg_20_2]

	return math.abs(var_20_0.x - arg_20_1.x) <= 130
end

function var_0_0.OnEndDragCard(arg_21_0)
	local var_21_0 = arg_21_0.displayPos[arg_21_0.dragIndex]

	arg_21_0.displayCards[arg_21_0.dragIndex]._tf.localPosition = var_21_0

	local var_21_1 = {}
	local var_21_2 = getProxy(PlayerProxy):getRawData():GetShipPhantomMarks()
	local var_21_3 = false

	for iter_21_0, iter_21_1 in pairs(arg_21_0.displayCards) do
		iter_21_1:EnableDrag()
		table.insert(var_21_1, iter_21_1.displayShip:GetShipPhantomMark())

		if not var_21_3 and var_21_2[#var_21_1] ~= var_21_1[#var_21_1] then
			var_21_3 = true
		end
	end

	arg_21_0.dragIndex = nil
	arg_21_0.displayCards = nil
	arg_21_0.displayPos = nil
	arg_21_0.cardContainerCG.blocksRaycasts = false

	if var_21_3 then
		arg_21_0:emit(PlayerVitaeMediator.CHANGE_PAINTS, var_21_1, function()
			Timer.New(function()
				if arg_21_0.cardContainerCG then
					arg_21_0.cardContainerCG.blocksRaycasts = true
				end
			end, 0.3, 1):Start()
		end)
	else
		arg_21_0.cardContainerCG.blocksRaycasts = true
	end
end

function var_0_0.OnInit(arg_24_0)
	onButton(arg_24_0, arg_24_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("secretary_help")
		})
	end, SFX_PANEL)

	local var_24_0 = false

	local function var_24_1()
		local var_26_0 = {
			68,
			-68
		}

		setAnchoredPosition(arg_24_0.settingBtnSlider, {
			x = var_26_0[var_24_0 and 1 or 2]
		})
	end

	onButton(arg_24_0, arg_24_0.settingBtn, function()
		var_24_0 = not var_24_0

		arg_24_0:EditCards(var_24_0)
		var_24_1()
	end, SFX_PANEL)
	var_24_1()

	local var_24_2 = getProxy(SettingsProxy)

	arg_24_0.randomFlag = var_24_2:IsOpenRandomFlagShip()
	arg_24_0.nativeFlag = false

	local function var_24_3()
		local var_28_0 = {
			68,
			-68
		}

		setAnchoredPosition(arg_24_0.randomBtnSlider, {
			x = var_28_0[arg_24_0.randomFlag and 1 or 2]
		})
		setActive(arg_24_0.nativeBtn, arg_24_0.randomFlag)
		setActive(arg_24_0.flagShipMark, not arg_24_0.randomFlag or arg_24_0.nativeFlag)

		if arg_24_0.randomFlag and var_24_0 then
			triggerButton(arg_24_0.settingBtn)
		end
	end

	local function var_24_4()
		setActive(arg_24_0.nativeBtnOn, arg_24_0.nativeFlag)
		setActive(arg_24_0.nativeBtnOff, not arg_24_0.nativeFlag)
		setActive(arg_24_0.flagShipMark, not arg_24_0.randomFlag or arg_24_0.nativeFlag)

		if var_24_0 then
			triggerButton(arg_24_0.settingBtn)
		end
	end

	onButton(arg_24_0, arg_24_0.randomBtn, function()
		arg_24_0.randomFlag = not arg_24_0.randomFlag

		if arg_24_0.randomFlag then
			local var_30_0 = MainRandomFlagShipSequence.New():Random()

			if not var_30_0 or #var_30_0 <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("random_ship_off_0"))

				arg_24_0.randomFlag = not arg_24_0.randomFlag

				return
			end

			var_24_2:UpdateRandomFlagShipList(var_30_0)
		else
			var_24_2:UpdateRandomFlagShipList({})

			arg_24_0.nativeFlag = false

			var_24_4()
		end

		arg_24_0:SwitchToPage(arg_24_0.randomFlag and var_0_5 or var_0_4)
		var_24_3()

		local var_30_1 = arg_24_0.randomFlag and i18n("random_ship_on") or i18n("random_ship_off")

		pg.TipsMgr.GetInstance():ShowTips(var_30_1)
		arg_24_0:emit(PlayerVitaeMediator.ON_SWITCH_RANDOM_FLAG_SHIP_BTN, arg_24_0.randomFlag)
	end, SFX_PANEL)
	var_24_3()
	onButton(arg_24_0, arg_24_0.nativeBtn, function()
		arg_24_0.nativeFlag = not arg_24_0.nativeFlag

		var_24_4()
		arg_24_0:SwitchToPage(arg_24_0.nativeFlag and var_0_4 or var_0_5)
	end, SFX_PANEL)
	var_24_4()
	onButton(arg_24_0, arg_24_0.getMailBtn, function()
		if arg_24_0.randomFlag then
			pg.TipsMgr.GetInstance():ShowTips(i18n("spring_present_tips0"))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("spring_present_tips1"),
			onYes = function()
				local var_33_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_MAIL)

				if not var_33_0 then
					setActive(arg_24_0.getMailBtn, false)
					pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

					return
				end

				arg_24_0:emit(PlayerVitaeMediator.ON_GET_LOVE_LETTER_MAIL, var_33_0.id)
			end
		})
	end)
	arg_24_0:UpdateGetMailBtn()
	onButton(arg_24_0, arg_24_0.educateCharSettingBtn, function()
		local var_34_0 = isActive(arg_24_0.educateCharSettingList.container)

		setActive(arg_24_0.educateCharSettingList.container, not var_34_0)
	end, SFX_PANEL)
	onButton(arg_24_0, arg_24_0.settingSeceneBtn, function()
		arg_24_0.contextData.showSelectCharacters = true

		arg_24_0:emit(PlayerVitaeMediator.GO_SCENE, SCENE.SETTINGS, {
			page = NewSettingsScene.PAGE_OPTION,
			scroll = SettingsRandomFlagShipAndSkinPanel
		})
	end, SFX_PANEL)

	arg_24_0.cards = {
		{},
		{},
		{}
	}

	table.insert(arg_24_0.cards[var_0_1], PlayerVitaeShipCard.New(arg_24_0.shipTpl, arg_24_0.event))
	table.insert(arg_24_0.cards[var_0_2], PlayerVitaeAddCard.New(arg_24_0.emptyTpl, arg_24_0.event))
	table.insert(arg_24_0.cards[var_0_3], PlayerVitaeLockCard.New(arg_24_0.lockTpl, arg_24_0.event))
end

function var_0_0.UpdateGetMailBtn(arg_36_0)
	local var_36_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOVE_LETTER_MAIL)

	setActive(arg_36_0.getMailBtn, var_36_0 and not var_36_0:isEnd() and var_36_0:readyToAchieve())
end

function var_0_0.Update(arg_37_0)
	local var_37_0 = getProxy(SettingsProxy)
	local var_37_1

	if arg_37_0.randomFlag and arg_37_0.nativeFlag then
		var_37_1 = var_0_4
	else
		var_37_1 = var_37_0:IsOpenRandomFlagShip() and var_0_5 or var_0_4
	end

	arg_37_0:SwitchToPage(var_37_1)
	arg_37_0:UpdateEducateChar()
	arg_37_0:UpdateGetMailBtn()
	arg_37_0:Show()
end

function var_0_0.UpdateEducateChar(arg_38_0)
	arg_38_0:UpdateEducateCharSettings()
	arg_38_0:UpdateEducateSlot()
	arg_38_0:UpdateEducateCharTrTip()
end

function var_0_0.UpdateEducateCharTrTip(arg_39_0)
	setActive(arg_39_0.educateCharTrTip, getProxy(SettingsProxy):ShouldEducateCharTip())
end

local function var_0_6()
	if NewEducateHelper.GetEducateCharSlotMaxCnt() <= 0 then
		return var_0_3
	end

	if getProxy(PlayerProxy):getRawData():ExistEducateChar() then
		return var_0_1
	end

	return var_0_2
end

function var_0_0.UpdateEducateSlot(arg_41_0)
	local var_41_0 = var_0_6()
	local var_41_1

	for iter_41_0, iter_41_1 in pairs(arg_41_0.educateCharCards) do
		local var_41_2 = iter_41_0 == var_41_0

		iter_41_1:ShowOrHide(var_41_2)

		if var_41_2 then
			var_41_1 = iter_41_1
		end
	end

	var_41_1:Flush()
end

function var_0_0.UpdateEducateCharSettings(arg_42_0)
	local var_42_0 = getProxy(SettingsProxy)

	local function var_42_1()
		local var_43_0 = var_42_0:GetFlagShipDisplayMode()

		setText(arg_42_0.educateCharSettingBtn:Find("Text"), i18n("flagship_display_mode_" .. var_43_0))
	end

	local var_42_2 = {
		FlAG_SHIP_DISPLAY_ONLY_SHIP,
		FlAG_SHIP_DISPLAY_ONLY_EDUCATECHAR,
		FlAG_SHIP_DISPLAY_ALL
	}

	arg_42_0.educateCharSettingList:make(function(arg_44_0, arg_44_1, arg_44_2)
		if arg_44_0 == UIItemList.EventUpdate then
			local var_44_0 = var_42_2[arg_44_1 + 1]

			setText(arg_44_2:Find("Text"), i18n("flagship_display_mode_" .. var_44_0))
			onButton(arg_42_0, arg_44_2, function()
				var_42_0:SetFlagShipDisplayMode(var_44_0)
				var_42_1()
				setActive(arg_42_0.educateCharSettingList.container, false)
			end, SFX_PANEL)
			setActive(arg_44_2:Find("line"), arg_44_1 + 1 ~= #var_42_2)
		end
	end)
	arg_42_0.educateCharSettingList:align(#var_42_2)
	var_42_1()
end

function var_0_0.SwitchToPage(arg_46_0, arg_46_1)
	local var_46_0

	if arg_46_1 == var_0_5 then
		var_46_0 = _.select(getProxy(SettingsProxy):GetRandomFlagShipList(), function(arg_47_0)
			return getProxy(BayProxy):GetShipPhantom(arg_47_0) ~= nil
		end)
		arg_46_0.tip.text = i18n("random_ship_tips1")

		arg_46_0:emit(PlayerVitaeScene.ON_PAGE_SWTICH, PlayerVitaeScene.PAGE_RANDOM_SHIPS)
	elseif arg_46_1 == var_0_4 then
		var_46_0 = getProxy(PlayerProxy):getRawData():GetShipPhantomMarks()
		arg_46_0.tip.text = i18n("random_ship_tips2")

		arg_46_0:emit(PlayerVitaeScene.ON_PAGE_SWTICH, PlayerVitaeScene.PAGE_NATIVE_SHIPS)
	end

	arg_46_0:Flush(var_46_0, arg_46_1)
	setActive(arg_46_0.tip.gameObject, arg_46_0.randomFlag)
end

function var_0_0.Flush(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0, var_48_1 = var_0_0.GetSlotMaxCnt()

	arg_48_0.max = var_48_0
	arg_48_0.unlockCnt = var_48_1

	local var_48_2 = arg_48_0:GetUnlockShipCnt(arg_48_1)

	arg_48_0:UpdateCards(arg_48_2, arg_48_1, var_48_2)
end

function var_0_0.UpdateCards(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0 = {
		0
	}
	local var_49_1 = {}

	for iter_49_0, iter_49_1 in ipairs(arg_49_3) do
		table.insert(var_49_1, function(arg_50_0)
			arg_49_0:UpdateTypeCards(arg_49_1, arg_49_2, iter_49_0, iter_49_1, var_49_0, arg_50_0)
		end)
	end

	seriesAsync(var_49_1)
end

function var_0_0.UpdateTypeCards(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5, arg_51_6)
	local var_51_0 = {}
	local var_51_1 = arg_51_0.cards[arg_51_3]

	local function var_51_2(arg_52_0)
		local var_52_0 = var_51_1[arg_52_0]

		if not var_52_0 then
			var_52_0 = var_51_1[1]:Clone()
			var_51_1[arg_52_0] = var_52_0
		end

		arg_51_5[1] = arg_51_5[1] + 1

		var_52_0:Enable()
		var_52_0:Update(arg_51_5[1], arg_52_0, arg_51_2, arg_51_1, arg_51_0.nativeFlag)
	end

	for iter_51_0 = 1, arg_51_4 do
		table.insert(var_51_0, function(arg_53_0)
			if arg_51_0.exited then
				return
			end

			var_51_2(iter_51_0)
			onNextTick(arg_53_0)
		end)
	end

	for iter_51_1 = #var_51_1, arg_51_4 + 1, -1 do
		var_51_1[iter_51_1]:Disable()
	end

	seriesAsync(var_51_0, arg_51_6)
end

function var_0_0.GetUnlockShipCnt(arg_54_0, arg_54_1)
	local var_54_0 = 0
	local var_54_1 = 0
	local var_54_2 = 0
	local var_54_3 = #arg_54_1
	local var_54_4 = arg_54_0.unlockCnt - var_54_3
	local var_54_5 = arg_54_0.max - arg_54_0.unlockCnt

	return {
		var_54_3,
		var_54_4,
		var_54_5
	}
end

function var_0_0.EditCards(arg_55_0, arg_55_1)
	local var_55_0 = {
		var_0_1,
		var_0_2
	}

	for iter_55_0, iter_55_1 in ipairs(var_55_0) do
		local var_55_1 = arg_55_0.cards[iter_55_1]

		for iter_55_2, iter_55_3 in ipairs(var_55_1) do
			if isActive(iter_55_3._tf) then
				iter_55_3:EditCard(arg_55_1)
			end
		end
	end

	arg_55_0.IsOpenEdit = arg_55_1
end

function var_0_0.EditCardsForRandom(arg_56_0, arg_56_1)
	local var_56_0 = {}
	local var_56_1 = arg_56_0.cards[var_0_1]

	for iter_56_0, iter_56_1 in ipairs(var_56_1) do
		if isActive(iter_56_1._tf) then
			if not arg_56_1 then
				var_56_0[iter_56_1.slotIndex] = iter_56_1:GetRandomFlagValue()
			end

			iter_56_1:EditCardForRandom(arg_56_1)
		end
	end

	arg_56_0.IsOpenEditForRandom = arg_56_1

	if #var_56_0 > 0 then
		arg_56_0:SaveRandomSettings(var_56_0)
	end

	local var_56_2 = arg_56_0.cards[var_0_2]

	for iter_56_2, iter_56_3 in ipairs(var_56_2) do
		if isActive(iter_56_3._tf) then
			iter_56_3:EditCard(arg_56_1)
		end
	end
end

function var_0_0.SaveRandomSettings(arg_57_0, arg_57_1)
	local var_57_0 = getProxy(PlayerProxy):getRawData()

	for iter_57_0 = 1, arg_57_0.max do
		if not arg_57_1[iter_57_0] then
			arg_57_1[iter_57_0] = var_57_0:RawGetRandomShipAndSkinValueInpos(iter_57_0)
		end
	end

	arg_57_0:emit(PlayerVitaeMediator.CHANGE_RANDOM_SETTING, arg_57_1)
end

function var_0_0.Show(arg_58_0)
	var_0_0.super.Show(arg_58_0)

	Input.multiTouchEnabled = false
end

function var_0_0.Hide(arg_59_0)
	var_0_0.super.Hide(arg_59_0)

	if arg_59_0.IsOpenEdit then
		triggerButton(arg_59_0.settingBtn)
	end

	if arg_59_0.IsOpenEditForRandom then
		triggerButton(arg_59_0.randomBtn)
	end

	Input.multiTouchEnabled = true

	arg_59_0:emit(PlayerVitaeScene.ON_PAGE_SWTICH, PlayerVitaeScene.PAGE_DEFAULT)
end

function var_0_0.OnDestroy(arg_60_0)
	arg_60_0:Hide()

	for iter_60_0, iter_60_1 in pairs(arg_60_0.cards) do
		for iter_60_2, iter_60_3 in pairs(iter_60_1) do
			iter_60_3:Dispose()
		end
	end

	arg_60_0.exited = true
end

return var_0_0

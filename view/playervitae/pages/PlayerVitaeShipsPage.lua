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

function var_0_0.UpdateCard(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.cards[var_0_1]

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		if isActive(iter_5_1._tf) and iter_5_1.displayShip and iter_5_1.displayShip:GetShipPhantomMark() == arg_5_1 then
			iter_5_1:Refresh()

			break
		end
	end
end

function var_0_0.UpdateCardPaintingTag(arg_6_0)
	local var_6_0 = arg_6_0.cards[var_0_1]

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		iter_6_1:updatePaintingTag()
	end
end

function var_0_0.RefreshShips(arg_7_0)
	arg_7_0:Update()
end

function var_0_0.OnLoaded(arg_8_0)
	arg_8_0.cardContainer = arg_8_0._tf:Find("frame")
	arg_8_0.shipTpl = arg_8_0._tf:Find("frame/shipCard")
	arg_8_0.emptyTpl = arg_8_0._tf:Find("frame/addCard")
	arg_8_0.lockTpl = arg_8_0._tf:Find("frame/lockCard")
	arg_8_0.helpBtn = arg_8_0._tf:Find("help_btn")
	arg_8_0.settingBtn = arg_8_0._tf:Find("setting_btn")
	arg_8_0.settingBtnSlider = arg_8_0.settingBtn:Find("toggle/on")
	arg_8_0.randomBtn = arg_8_0._tf:Find("ran_setting_btn")
	arg_8_0.randomBtnSlider = arg_8_0.randomBtn:Find("toggle/on")
	arg_8_0.settingSeceneBtn = arg_8_0._tf:Find("setting_scene_btn")
	arg_8_0.nativeBtn = arg_8_0._tf:Find("native_setting_btn")
	arg_8_0.nativeBtnOn = arg_8_0.nativeBtn:Find("on")
	arg_8_0.nativeBtnOff = arg_8_0.nativeBtn:Find("off")
	arg_8_0.educateCharTr = arg_8_0._tf:Find("educate_char")
	arg_8_0.educateCharSettingList = UIItemList.New(arg_8_0._tf:Find("educate_char/shipCard/settings/panel"), arg_8_0._tf:Find("educate_char/shipCard/settings/panel/tpl"))
	arg_8_0.educateCharSettingBtn = arg_8_0._tf:Find("educate_char/shipCard/settings/tpl")
	arg_8_0.educateCharTrTip = arg_8_0.educateCharTr:Find("tip")

	if LOCK_EDUCATE_SYSTEM then
		setActive(arg_8_0.educateCharTr, false)
		setAnchoredPosition(arg_8_0.cardContainer, {
			x = 0
		})
		setAnchoredPosition(arg_8_0._tf:Find("flagship"), {
			x = -720
		})
		setAnchoredPosition(arg_8_0._tf:Find("zs"), {
			x = 763
		})
		setAnchoredPosition(arg_8_0._tf:Find("line"), {
			x = 740
		})
	end

	arg_8_0.educateCharCards = {
		[var_0_1] = PlayerVitaeEducateShipCard.New(arg_8_0._tf:Find("educate_char/shipCard"), arg_8_0.event),
		[var_0_2] = PlayerVitaeEducateAddCard.New(arg_8_0._tf:Find("educate_char/addCard"), arg_8_0.event),
		[var_0_3] = PlayerVitaeEducateLockCard.New(arg_8_0._tf:Find("educate_char/lockCard"), arg_8_0.event)
	}
	arg_8_0.tip = arg_8_0._tf:Find("tip"):GetComponent(typeof(Text))
	arg_8_0.flagShipMark = arg_8_0._tf:Find("flagship")

	arg_8_0:bind(var_0_0.ON_BEGIN_DRAG_CARD, function(arg_9_0, arg_9_1)
		arg_8_0:OnBeginDragCard(arg_9_1)
	end)
	arg_8_0:bind(var_0_0.ON_DRAGING_CARD, function(arg_10_0, arg_10_1)
		arg_8_0:OnDragingCard(arg_10_1)
	end)
	arg_8_0:bind(var_0_0.ON_DRAG_END_CARD, function(arg_11_0)
		arg_8_0:OnEndDragCard()
	end)
	setText(arg_8_0.nativeBtnOn:Find("Text"), i18n("random_ship_before"))
	setText(arg_8_0.nativeBtnOff:Find("Text"), i18n("random_ship_now"))
	setText(arg_8_0.settingBtn:Find("Text"), i18n("player_vitae_skin_setting"))
	setText(arg_8_0.randomBtn:Find("Text"), i18n("random_ship_label"))
	setText(arg_8_0.settingSeceneBtn:Find("Text"), i18n("playervtae_setting_btn_label"))

	arg_8_0.cardContainerCG = GetOrAddComponent(arg_8_0.cardContainer, typeof(CanvasGroup))
end

function var_0_0.OnBeginDragCard(arg_12_0, arg_12_1)
	arg_12_0.dragIndex = arg_12_1
	arg_12_0.displayCards = {}
	arg_12_0.displayPos = {}

	local var_12_0 = arg_12_0.cards[var_0_1]

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		if isActive(iter_12_1._tf) then
			arg_12_0.displayCards[iter_12_0] = iter_12_1
			arg_12_0.displayPos[iter_12_0] = iter_12_1._tf.localPosition
		end
	end

	for iter_12_2, iter_12_3 in pairs(arg_12_0.displayCards) do
		if iter_12_2 ~= arg_12_1 then
			iter_12_3:DisableDrag()
		end
	end
end

function var_0_0.OnDragingCard(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.displayCards[arg_13_0.dragIndex - 1]
	local var_13_1 = arg_13_0.displayCards[arg_13_0.dragIndex + 1]

	if var_13_0 and arg_13_0:ShouldSwap(arg_13_1, arg_13_0.dragIndex - 1) then
		arg_13_0:Swap(arg_13_0.dragIndex, arg_13_0.dragIndex - 1)
	elseif var_13_1 and arg_13_0:ShouldSwap(arg_13_1, arg_13_0.dragIndex + 1) then
		arg_13_0:Swap(arg_13_0.dragIndex, arg_13_0.dragIndex + 1)
	end
end

function var_0_0.Swap(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.displayCards[arg_14_1]
	local var_14_1 = arg_14_0.displayPos[arg_14_1]
	local var_14_2 = arg_14_0.displayCards[arg_14_2]

	var_14_2._tf.localPosition = var_14_1
	arg_14_0.displayCards[arg_14_1], arg_14_0.displayCards[arg_14_2] = arg_14_0.displayCards[arg_14_2], arg_14_0.displayCards[arg_14_1]
	arg_14_0.dragIndex = arg_14_2
	var_14_0.slotIndex = arg_14_2
	var_14_2.slotIndex = arg_14_1
	var_14_0.typeIndex, var_14_2.typeIndex = var_14_2.typeIndex, var_14_0.typeIndex

	local var_14_3 = arg_14_0.cards[var_0_1]

	var_14_3[arg_14_1], var_14_3[arg_14_2] = var_14_3[arg_14_2], var_14_3[arg_14_1]
end

function var_0_0.ShouldSwap(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.displayPos[arg_15_2]

	return math.abs(var_15_0.x - arg_15_1.x) <= 130
end

function var_0_0.OnEndDragCard(arg_16_0)
	local var_16_0 = arg_16_0.displayPos[arg_16_0.dragIndex]

	arg_16_0.displayCards[arg_16_0.dragIndex]._tf.localPosition = var_16_0

	local var_16_1 = {}
	local var_16_2 = getProxy(PlayerProxy):getRawData():GetShipPhantomMarks()
	local var_16_3 = false

	for iter_16_0, iter_16_1 in pairs(arg_16_0.displayCards) do
		iter_16_1:EnableDrag()
		table.insert(var_16_1, iter_16_1.displayShip:GetShipPhantomMark())

		if not var_16_3 and var_16_2[#var_16_1] ~= var_16_1[#var_16_1] then
			var_16_3 = true
		end
	end

	arg_16_0.dragIndex = nil
	arg_16_0.displayCards = nil
	arg_16_0.displayPos = nil
	arg_16_0.cardContainerCG.blocksRaycasts = false

	if var_16_3 then
		arg_16_0:emit(PlayerVitaeMediator.CHANGE_PAINTS, var_16_1, function()
			Timer.New(function()
				if arg_16_0.cardContainerCG then
					arg_16_0.cardContainerCG.blocksRaycasts = true
				end
			end, 0.3, 1):Start()
		end)
	else
		arg_16_0.cardContainerCG.blocksRaycasts = true
	end
end

function var_0_0.OnInit(arg_19_0)
	onButton(arg_19_0, arg_19_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("secretary_help")
		})
	end, SFX_PANEL)

	local var_19_0 = false

	local function var_19_1()
		local var_21_0 = {
			68,
			-68
		}

		setAnchoredPosition(arg_19_0.settingBtnSlider, {
			x = var_21_0[var_19_0 and 1 or 2]
		})
	end

	onButton(arg_19_0, arg_19_0.settingBtn, function()
		var_19_0 = not var_19_0

		arg_19_0:EditCards(var_19_0)
		var_19_1()
	end, SFX_PANEL)
	var_19_1()

	local var_19_2 = getProxy(SettingsProxy)

	arg_19_0.randomFlag = var_19_2:IsOpenRandomFlagShip()
	arg_19_0.nativeFlag = false

	local function var_19_3()
		local var_23_0 = {
			68,
			-68
		}

		setAnchoredPosition(arg_19_0.randomBtnSlider, {
			x = var_23_0[arg_19_0.randomFlag and 1 or 2]
		})
		setActive(arg_19_0.nativeBtn, arg_19_0.randomFlag)
		setActive(arg_19_0.flagShipMark, not arg_19_0.randomFlag or arg_19_0.nativeFlag)

		if arg_19_0.randomFlag and var_19_0 then
			triggerButton(arg_19_0.settingBtn)
		end
	end

	local function var_19_4()
		setActive(arg_19_0.nativeBtnOn, arg_19_0.nativeFlag)
		setActive(arg_19_0.nativeBtnOff, not arg_19_0.nativeFlag)
		setActive(arg_19_0.flagShipMark, not arg_19_0.randomFlag or arg_19_0.nativeFlag)

		if var_19_0 then
			triggerButton(arg_19_0.settingBtn)
		end
	end

	onButton(arg_19_0, arg_19_0.randomBtn, function()
		arg_19_0.randomFlag = not arg_19_0.randomFlag

		if arg_19_0.randomFlag then
			local var_25_0 = MainRandomFlagShipSequence.New():Random()

			if not var_25_0 or #var_25_0 <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("random_ship_off_0"))

				arg_19_0.randomFlag = not arg_19_0.randomFlag

				return
			end

			var_19_2:UpdateRandomFlagShipList(var_25_0)
		else
			var_19_2:UpdateRandomFlagShipList({})

			arg_19_0.nativeFlag = false

			var_19_4()
		end

		arg_19_0:SwitchToPage(arg_19_0.randomFlag and var_0_5 or var_0_4)
		var_19_3()

		local var_25_1 = arg_19_0.randomFlag and i18n("random_ship_on") or i18n("random_ship_off")

		pg.TipsMgr.GetInstance():ShowTips(var_25_1)
		arg_19_0:emit(PlayerVitaeMediator.ON_SWITCH_RANDOM_FLAG_SHIP_BTN, arg_19_0.randomFlag)
	end, SFX_PANEL)
	var_19_3()
	onButton(arg_19_0, arg_19_0.nativeBtn, function()
		arg_19_0.nativeFlag = not arg_19_0.nativeFlag

		var_19_4()
		arg_19_0:SwitchToPage(arg_19_0.nativeFlag and var_0_4 or var_0_5)
	end, SFX_PANEL)
	var_19_4()
	onButton(arg_19_0, arg_19_0.educateCharSettingBtn, function()
		local var_27_0 = isActive(arg_19_0.educateCharSettingList.container)

		setActive(arg_19_0.educateCharSettingList.container, not var_27_0)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.settingSeceneBtn, function()
		arg_19_0.contextData.showSelectCharacters = true

		arg_19_0:emit(PlayerVitaeMediator.GO_SCENE, SCENE.SETTINGS, {
			page = NewSettingsScene.PAGE_OPTION,
			scroll = SettingsRandomFlagShipAndSkinPanel
		})
	end, SFX_PANEL)

	arg_19_0.cards = {
		{},
		{},
		{}
	}

	table.insert(arg_19_0.cards[var_0_1], PlayerVitaeShipCard.New(arg_19_0.shipTpl, arg_19_0.event))
	table.insert(arg_19_0.cards[var_0_2], PlayerVitaeAddCard.New(arg_19_0.emptyTpl, arg_19_0.event))
	table.insert(arg_19_0.cards[var_0_3], PlayerVitaeLockCard.New(arg_19_0.lockTpl, arg_19_0.event))
end

function var_0_0.Update(arg_29_0)
	local var_29_0 = getProxy(SettingsProxy)
	local var_29_1

	if arg_29_0.randomFlag and arg_29_0.nativeFlag then
		var_29_1 = var_0_4
	else
		var_29_1 = var_29_0:IsOpenRandomFlagShip() and var_0_5 or var_0_4
	end

	arg_29_0:SwitchToPage(var_29_1)
	arg_29_0:UpdateEducateChar()
	arg_29_0:Show()
end

function var_0_0.UpdateEducateChar(arg_30_0)
	arg_30_0:UpdateEducateCharSettings()
	arg_30_0:UpdateEducateSlot()
	arg_30_0:UpdateEducateCharTrTip()
end

function var_0_0.UpdateEducateCharTrTip(arg_31_0)
	setActive(arg_31_0.educateCharTrTip, getProxy(SettingsProxy):ShouldEducateCharTip())
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

function var_0_0.UpdateEducateSlot(arg_33_0)
	local var_33_0 = var_0_6()
	local var_33_1

	for iter_33_0, iter_33_1 in pairs(arg_33_0.educateCharCards) do
		local var_33_2 = iter_33_0 == var_33_0

		iter_33_1:ShowOrHide(var_33_2)

		if var_33_2 then
			var_33_1 = iter_33_1
		end
	end

	var_33_1:Flush()
end

function var_0_0.UpdateEducateCharSettings(arg_34_0)
	local var_34_0 = getProxy(SettingsProxy)

	local function var_34_1()
		local var_35_0 = var_34_0:GetFlagShipDisplayMode()

		setText(arg_34_0.educateCharSettingBtn:Find("Text"), i18n("flagship_display_mode_" .. var_35_0))
	end

	local var_34_2 = {
		FlAG_SHIP_DISPLAY_ONLY_SHIP,
		FlAG_SHIP_DISPLAY_ONLY_EDUCATECHAR,
		FlAG_SHIP_DISPLAY_ALL
	}

	arg_34_0.educateCharSettingList:make(function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 == UIItemList.EventUpdate then
			local var_36_0 = var_34_2[arg_36_1 + 1]

			setText(arg_36_2:Find("Text"), i18n("flagship_display_mode_" .. var_36_0))
			onButton(arg_34_0, arg_36_2, function()
				var_34_0:SetFlagShipDisplayMode(var_36_0)
				var_34_1()
				setActive(arg_34_0.educateCharSettingList.container, false)
			end, SFX_PANEL)
			setActive(arg_36_2:Find("line"), arg_36_1 + 1 ~= #var_34_2)
		end
	end)
	arg_34_0.educateCharSettingList:align(#var_34_2)
	var_34_1()
end

function var_0_0.SwitchToPage(arg_38_0, arg_38_1)
	local var_38_0

	if arg_38_1 == var_0_5 then
		var_38_0 = _.select(getProxy(SettingsProxy):GetRandomFlagShipList(), function(arg_39_0)
			return getProxy(BayProxy):GetShipPhantom(arg_39_0) ~= nil
		end)
		arg_38_0.tip.text = i18n("random_ship_tips1")

		arg_38_0:emit(PlayerVitaeScene.ON_PAGE_SWTICH, PlayerVitaeScene.PAGE_RANDOM_SHIPS)
	elseif arg_38_1 == var_0_4 then
		var_38_0 = getProxy(PlayerProxy):getRawData():GetShipPhantomMarks()
		arg_38_0.tip.text = i18n("random_ship_tips2")

		arg_38_0:emit(PlayerVitaeScene.ON_PAGE_SWTICH, PlayerVitaeScene.PAGE_NATIVE_SHIPS)
	end

	arg_38_0:Flush(var_38_0, arg_38_1)
	setActive(arg_38_0.tip.gameObject, arg_38_0.randomFlag)
end

function var_0_0.Flush(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0, var_40_1 = var_0_0.GetSlotMaxCnt()

	arg_40_0.max = var_40_0
	arg_40_0.unlockCnt = var_40_1

	local var_40_2 = arg_40_0:GetUnlockShipCnt(arg_40_1)

	arg_40_0:UpdateCards(arg_40_2, arg_40_1, var_40_2)
end

function var_0_0.UpdateCards(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0 = {
		0
	}
	local var_41_1 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_3) do
		table.insert(var_41_1, function(arg_42_0)
			arg_41_0:UpdateTypeCards(arg_41_1, arg_41_2, iter_41_0, iter_41_1, var_41_0, arg_42_0)
		end)
	end

	seriesAsync(var_41_1)
end

function var_0_0.UpdateTypeCards(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5, arg_43_6)
	local var_43_0 = {}
	local var_43_1 = arg_43_0.cards[arg_43_3]

	local function var_43_2(arg_44_0)
		local var_44_0 = var_43_1[arg_44_0]

		if not var_44_0 then
			var_44_0 = var_43_1[1]:Clone()
			var_43_1[arg_44_0] = var_44_0
		end

		arg_43_5[1] = arg_43_5[1] + 1

		var_44_0:Enable()
		var_44_0:Update(arg_43_5[1], arg_44_0, arg_43_2, arg_43_1, arg_43_0.nativeFlag)
	end

	for iter_43_0 = 1, arg_43_4 do
		table.insert(var_43_0, function(arg_45_0)
			if arg_43_0.exited then
				return
			end

			var_43_2(iter_43_0)
			onNextTick(arg_45_0)
		end)
	end

	for iter_43_1 = #var_43_1, arg_43_4 + 1, -1 do
		var_43_1[iter_43_1]:Disable()
	end

	seriesAsync(var_43_0, arg_43_6)
end

function var_0_0.GetUnlockShipCnt(arg_46_0, arg_46_1)
	local var_46_0 = 0
	local var_46_1 = 0
	local var_46_2 = 0
	local var_46_3 = #arg_46_1
	local var_46_4 = arg_46_0.unlockCnt - var_46_3
	local var_46_5 = arg_46_0.max - arg_46_0.unlockCnt

	return {
		var_46_3,
		var_46_4,
		var_46_5
	}
end

function var_0_0.EditCards(arg_47_0, arg_47_1)
	local var_47_0 = {
		var_0_1,
		var_0_2
	}

	for iter_47_0, iter_47_1 in ipairs(var_47_0) do
		local var_47_1 = arg_47_0.cards[iter_47_1]

		for iter_47_2, iter_47_3 in ipairs(var_47_1) do
			if isActive(iter_47_3._tf) then
				iter_47_3:EditCard(arg_47_1)
			end
		end
	end

	arg_47_0.IsOpenEdit = arg_47_1
end

function var_0_0.EditCardsForRandom(arg_48_0, arg_48_1)
	local var_48_0 = {}
	local var_48_1 = arg_48_0.cards[var_0_1]

	for iter_48_0, iter_48_1 in ipairs(var_48_1) do
		if isActive(iter_48_1._tf) then
			if not arg_48_1 then
				var_48_0[iter_48_1.slotIndex] = iter_48_1:GetRandomFlagValue()
			end

			iter_48_1:EditCardForRandom(arg_48_1)
		end
	end

	arg_48_0.IsOpenEditForRandom = arg_48_1

	if #var_48_0 > 0 then
		arg_48_0:SaveRandomSettings(var_48_0)
	end

	local var_48_2 = arg_48_0.cards[var_0_2]

	for iter_48_2, iter_48_3 in ipairs(var_48_2) do
		if isActive(iter_48_3._tf) then
			iter_48_3:EditCard(arg_48_1)
		end
	end
end

function var_0_0.SaveRandomSettings(arg_49_0, arg_49_1)
	local var_49_0 = getProxy(PlayerProxy):getRawData()

	for iter_49_0 = 1, arg_49_0.max do
		if not arg_49_1[iter_49_0] then
			arg_49_1[iter_49_0] = var_49_0:RawGetRandomShipAndSkinValueInpos(iter_49_0)
		end
	end

	arg_49_0:emit(PlayerVitaeMediator.CHANGE_RANDOM_SETTING, arg_49_1)
end

function var_0_0.Show(arg_50_0)
	var_0_0.super.Show(arg_50_0)

	Input.multiTouchEnabled = false
end

function var_0_0.Hide(arg_51_0)
	var_0_0.super.Hide(arg_51_0)

	if arg_51_0.IsOpenEdit then
		triggerButton(arg_51_0.settingBtn)
	end

	if arg_51_0.IsOpenEditForRandom then
		triggerButton(arg_51_0.randomBtn)
	end

	Input.multiTouchEnabled = true

	arg_51_0:emit(PlayerVitaeScene.ON_PAGE_SWTICH, PlayerVitaeScene.PAGE_DEFAULT)
end

function var_0_0.OnDestroy(arg_52_0)
	arg_52_0:Hide()

	for iter_52_0, iter_52_1 in pairs(arg_52_0.cards) do
		for iter_52_2, iter_52_3 in pairs(iter_52_1) do
			iter_52_3:Dispose()
		end
	end

	arg_52_0.exited = true
end

return var_0_0

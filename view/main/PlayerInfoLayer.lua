local var_0_0 = class("PlayerInfoLayer", import("..base.BaseUI"))

var_0_0.MAX_MEDAL_DISPLAY = 5
var_0_0.SECRETARY_MAX = 1

function var_0_0.getUIName(arg_1_0)
	return "AdmiralUI"
end

function var_0_0.GetBGM(arg_2_0)
	local var_2_0 = arg_2_0.flagShip
	local var_2_1 = getProxy(SettingsProxy):IsBGMEnable()

	if var_2_0:IsBgmSkin() and var_2_1 then
		return var_2_0:GetSkinBgm()
	else
		return "main"
	end
end

function var_0_0.setPlayer(arg_3_0, arg_3_1)
	arg_3_0:updatePlayerInfo(arg_3_1)
end

function var_0_0.updatePlayerInfo(arg_4_0, arg_4_1)
	arg_4_0.player = arg_4_1
end

function var_0_0.setShipCount(arg_5_0, arg_5_1)
	arg_5_0.shipCount = arg_5_1 or 0
end

function var_0_0.setFleetGearScore(arg_6_0, arg_6_1)
	arg_6_0.fleetGS = arg_6_1
end

function var_0_0.setCurrentFlagship(arg_7_0, arg_7_1)
	arg_7_0.flagShip = arg_7_1

	arg_7_0:updatePainting(arg_7_1)
	arg_7_0:updateSpinePaintingState()
	arg_7_0:updateLive2DState()
	arg_7_0:updateBGState()
	arg_7_0:updateBGMState()
	arg_7_0:updateSwichSkinBtn(arg_7_1)
end

function var_0_0.setCollectionRate(arg_8_0, arg_8_1)
	arg_8_0.collectionRate = arg_8_1
end

function var_0_0.setMilitaryExercise(arg_9_0, arg_9_1)
	arg_9_0.seasonInfo = arg_9_1
end

function var_0_0.setTrophyList(arg_10_0, arg_10_1)
	arg_10_0.trophyList = arg_10_1
end

function var_0_0.OffsetSource(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = GetComponent(arg_11_0:findTF("Image", arg_11_0.rightPanel), "RectTransform")
	local var_11_1 = GetComponent(GetComponent(var_11_0, "Image").canvas, "RectTransform")
	local var_11_2 = var_11_1.rect.width
	local var_11_3 = var_11_1.rect.height
	local var_11_4 = GetComponent(arg_11_0.rightPanel.parent, "AspectRatioFitter")
	local var_11_5 = 0

	if var_11_4 then
		local var_11_6 = var_11_4.aspectRatio
		local var_11_7 = var_11_6 * var_11_3

		if var_11_7 < var_11_2 then
			var_11_5 = (var_11_2 - var_11_7) / var_11_6
		end
	end

	local var_11_8 = -(var_11_0.rect.width * arg_11_0.rightPanel.localScale.x + arg_11_2 + var_11_5)

	setAnchoredPosition(arg_11_1, {
		x = var_11_8
	})
end

function var_0_0.init(arg_12_0)
	arg_12_0.eventTriggers = {}
	arg_12_0.topPanel = arg_12_0:findTF("blur_panel/adapt/top")
	arg_12_0.rightPanel = arg_12_0:findTF("blur_panel/adapt/right_panel")
	arg_12_0.leftPanel = arg_12_0:findTF("blur_panel/adapt/left_panel")
	arg_12_0.bottomPanel = arg_12_0:findTF("blur_panel/adapt/bottom_panel")
	arg_12_0.characters = arg_12_0:findTF("blur_panel/adapt/characters")
	arg_12_0.backBtn = arg_12_0:findTF("title/back", arg_12_0.topPanel)
	arg_12_0.helpBtn = arg_12_0:findTF("blur_panel/adapt/help_btn")
	arg_12_0.paintContain = arg_12_0:findTF("paint", arg_12_0.leftPanel)
	arg_12_0.replaceBtn = arg_12_0:findTF("replace_btn", arg_12_0.leftPanel)
	arg_12_0.swichSkinBtn = arg_12_0:findTF("swichSkin_btn", arg_12_0.leftPanel)
	arg_12_0.hzszBtn = arg_12_0:findTF("hzsz", arg_12_0.leftPanel)
	arg_12_0.spinePaintingBtn = arg_12_0:findTF("content/SP_btn", arg_12_0.bottomPanel)
	arg_12_0.spinePaintingToggle = arg_12_0.spinePaintingBtn:Find("toggle")
	arg_12_0.live2dBtn = arg_12_0:findTF("content/L2D_btn", arg_12_0.bottomPanel)
	arg_12_0.live2dToggle = arg_12_0.live2dBtn:Find("toggle")
	arg_12_0.live2dState = arg_12_0.live2dBtn:Find("state")
	arg_12_0.showBgBtn = arg_12_0:findTF("content/BG_btn", arg_12_0.bottomPanel)
	arg_12_0.showBgToggle = arg_12_0.showBgBtn:Find("toggle")
	arg_12_0.bgmBtn = arg_12_0:findTF("content/BGM_btn", arg_12_0.bottomPanel)
	arg_12_0.addMedalBtn = arg_12_0:findTF("medalList/appendBtn", arg_12_0.rightPanel)

	setActive(arg_12_0.addMedalBtn, false)

	arg_12_0.writeBtn = arg_12_0:findTF("greet/write_btn", arg_12_0.rightPanel)
	arg_12_0.inputField = arg_12_0:findTF("greet/InputField", arg_12_0.rightPanel)
	arg_12_0.medalList = arg_12_0:findTF("medalList/container", arg_12_0.rightPanel)
	arg_12_0.medalTpl = arg_12_0:findTF("medal_tpl", arg_12_0.rightPanel)
	arg_12_0.shareBtn = arg_12_0:findTF("btn_share", arg_12_0.rightPanel)
	arg_12_0.modifyNameBtn = arg_12_0:findTF("info_panel/title/name_bg/modify_btn", arg_12_0.rightPanel)
	arg_12_0.attireBtn = arg_12_0:findTF("btn_attire", arg_12_0.rightPanel)
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:uiStartAnimating()
	onButton(arg_13_0, arg_13_0.backBtn, function()
		if arg_13_0._currentDragDelegate then
			arg_13_0._forceDropCharacter = true

			LuaHelper.triggerEndDrag(arg_13_0._currentDragDelegate)
		end

		if isActive(arg_13_0.characters) then
			arg_13_0:hideCharacters()
		else
			arg_13_0:uiExitAnimating()
			arg_13_0:emit(var_0_0.ON_BACK, nil, 0.5)
		end
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0.attireBtn, function()
		arg_13_0:emit(PlayerInfoMediator.ON_ATTIRE)
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.replaceBtn, function()
		if isActive(arg_13_0.characters) then
			arg_13_0:hideCharacters()
		else
			arg_13_0:showCharacters()
		end
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.swichSkinBtn, function()
		arg_13_0:emit(PlayerInfoMediator.CHANGE_SKIN, arg_13_0.flagShip)
	end)
	onButton(arg_13_0, arg_13_0.writeBtn, function()
		activateInputField(arg_13_0.inputField)
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeAdmira)
	end, SFX_PANEL)
	onInputEndEdit(arg_13_0, arg_13_0.inputField, function(arg_20_0)
		if wordVer(arg_20_0) > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("playerinfo_mask_word"))
			activateInputField(arg_13_0.inputField)

			return
		end

		if not arg_20_0 or arg_13_0.manifesto == arg_20_0 then
			return
		end

		arg_13_0.manifesto = arg_20_0

		arg_13_0:emit(PlayerInfoMediator.CHANGE_MANIFESTO, arg_20_0)
	end)
	onButton(arg_13_0, arg_13_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("secretary_help")
		})
	end)
	onButton(arg_13_0, arg_13_0.modifyNameBtn, function()
		local var_22_0, var_22_1 = arg_13_0.player:canModifyName()

		if not var_22_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_22_1)

			return
		end

		arg_13_0:openChangePlayerNamePanel()
	end, SFX_PANEL)

	arg_13_0.medalList = arg_13_0:findTF("medalList/container", arg_13_0.rightPanel)

	arg_13_0:initPlayerInfo()
	arg_13_0:updateManifesto()

	arg_13_0.manifesto = arg_13_0.player.manifesto

	arg_13_0:updateSecretaryMax()
end

function var_0_0.updateSecretaryMax(arg_23_0)
	arg_23_0.secretary_max = 1

	local var_23_0 = getProxy(ChapterProxy)

	for iter_23_0, iter_23_1 in pairs(pg.gameset.secretary_group_unlock.description) do
		if pg.chapter_template[iter_23_1[1]] then
			var_0_0.SECRETARY_MAX = iter_23_1[2]

			if var_23_0:isClear(iter_23_1[1]) then
				arg_23_0.secretary_max = iter_23_1[2]
			end
		end
	end

	arg_23_0.secretary_max = math.min(arg_23_0.secretary_max, var_0_0.SECRETARY_MAX)
end

function var_0_0.showCharacters(arg_24_0)
	arg_24_0:updateSecretaryMax()
	arg_24_0:initCharacters()
	setActive(arg_24_0.characters, true)
	setActive(arg_24_0.replaceBtn, false)
	setActive(arg_24_0.helpBtn, true)
	setActive(arg_24_0.rightPanel, false)
	setActive(arg_24_0.bottomPanel, false)
	arg_24_0:updateSwichSkinBtn(arg_24_0.flagShip)
	setActive(arg_24_0.paintContain, false)

	if not HXSet.isHxSkin() then
		setActive(arg_24_0.hzszBtn, true)
		onToggle(arg_24_0, arg_24_0.hzszBtn, function(arg_25_0)
			setActive(arg_24_0:findTF("setting_on", arg_24_0.hzszBtn), arg_25_0)
			setActive(arg_24_0:findTF("setting_off", arg_24_0.hzszBtn), not arg_25_0)

			for iter_25_0, iter_25_1 in ipairs(arg_24_0.cards) do
				if iter_25_1.state == STATE_INFO then
					setActive(iter_25_1.tr:Find("mask"), arg_25_0)
				end
			end

			if arg_25_0 then
				for iter_25_2 = 1, 5 do
					arg_24_0:detachOnCardButton(arg_24_0.cards[iter_25_2])
				end
			else
				for iter_25_3 = 1, arg_24_0.secretary_max do
					arg_24_0:attachOnCardButton(arg_24_0.cards[iter_25_3])
				end
			end
		end)
		triggerToggle(arg_24_0.hzszBtn, false)
	else
		setActive(arg_24_0.hzszBtn, false)
	end
end

function var_0_0.hideCharacters(arg_26_0)
	setActive(arg_26_0.characters, false)
	setActive(arg_26_0.hzszBtn, false)
	setActive(arg_26_0.replaceBtn, true)
	setActive(arg_26_0.helpBtn, false)
	setActive(arg_26_0.rightPanel, true)
	setActive(arg_26_0.bottomPanel, true)
	arg_26_0:updateSwichSkinBtn(arg_26_0.flagShip)
	arg_26_0:updateSpinePaintingState()
	arg_26_0:updateLive2DState()
	arg_26_0:updateBGState()
	setActive(arg_26_0.paintContain, true)
end

function var_0_0.initChangePlayerNamePanel(arg_27_0, arg_27_1)
	PoolMgr.GetInstance():GetUI("AdmiralUIChangeNamePanel", true, function(arg_28_0)
		arg_28_0.name = "changeName_panel"
		arg_27_0.changeNamePanel = rtf(arg_28_0)

		setParent(arg_27_0.changeNamePanel, arg_27_0._tf)
		setActive(arg_27_0.changeNamePanel, false)

		arg_27_0.changeNameTip = arg_27_0:findTF("frame/border/tip", arg_27_0.changeNamePanel):GetComponent(typeof(Text))
		arg_27_0.changeNameConfirmBtn = arg_27_0:findTF("frame/queren", arg_27_0.changeNamePanel)
		arg_27_0.changeNameCancelBtn = arg_27_0:findTF("frame/cancel", arg_27_0.changeNamePanel)
		arg_27_0.changeNameInputField = arg_27_0:findTF("frame/name_field", arg_27_0.changeNamePanel)

		SetActive(arg_27_0.changeNamePanel, false)
		onButton(arg_27_0, arg_27_0.changeNameConfirmBtn, function()
			local var_29_0 = getInputText(arg_27_0.changeNameInputField)

			arg_27_0:emit(PlayerInfoMediator.ON_CHANGE_PLAYER_NAME, var_29_0)
			setInputText(arg_27_0.changeNameInputField, "")
		end, SFX_PANEL)
		onButton(arg_27_0, arg_27_0.changeNameCancelBtn, function()
			arg_27_0:closeChangePlayerNamePanel()
		end, SFX_PANEL)
		onButton(arg_27_0, arg_27_0.changeNamePanel, function()
			arg_27_0:closeChangePlayerNamePanel()
		end, SFX_PANEL)

		arg_27_0.isInitChangeNamePanel = true

		arg_27_1()
	end)
end

function var_0_0.openChangePlayerNamePanel(arg_32_0)
	local function var_32_0()
		arg_32_0.isOpenChangeNamePanel = true

		SetActive(arg_32_0.changeNamePanel, true)

		local var_33_0 = arg_32_0.player:getModifyNameComsume()
		local var_33_1
		local var_33_2 = 0

		if var_33_0[1] == DROP_TYPE_RESOURCE then
			var_33_1 = Item.New({
				id = id2ItemId(var_33_0[2]),
				type = DROP_TYPE_ITEM,
				count = var_33_0[3]
			})
			var_33_2 = arg_32_0.player:getResById(var_33_0[2])
		elseif var_33_0[1] == DROP_TYPE_ITEM then
			var_33_1 = Item.New({
				id = var_33_0[2],
				type = DROP_TYPE_ITEM,
				count = var_33_0[3]
			})
			var_33_2 = getProxy(BagProxy):getItemCountById(var_33_0[2])
		end

		arg_32_0.changeNameTip.text = i18n("player_name_change_windows_tip", var_33_1:getConfig("name"), var_33_2 .. "/" .. var_33_0[3])
	end

	if not arg_32_0.changeNamePanel then
		arg_32_0:initChangePlayerNamePanel(var_32_0)
	else
		var_32_0()
	end
end

function var_0_0.closeChangePlayerNamePanel(arg_34_0)
	arg_34_0.isOpenChangeNamePanel = nil

	SetActive(arg_34_0.changeNamePanel, false)
end

function var_0_0.onBackPressed(arg_35_0)
	local var_35_0 = GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")

	if isActive(var_35_0) then
		triggerButton(var_35_0.transform:Find("dialog/title/back"))

		return
	end

	if arg_35_0.isOpenChangeNamePanel then
		arg_35_0:closeChangePlayerNamePanel()
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
		triggerButton(arg_35_0.backBtn)
	end
end

function var_0_0.updateAttireBtn(arg_36_0, arg_36_1)
	setActive(arg_36_0.attireBtn:Find("tip"), arg_36_1)
end

function var_0_0.uiStartAnimating(arg_37_0)
	setAnchoredPosition(arg_37_0.topPanel, {
		y = 100
	})
	setAnchoredPosition(arg_37_0.leftPanel, {
		x = -1280
	})
	setAnchoredPosition(arg_37_0.bottomPanel, {
		y = -248
	})
	shiftPanel(arg_37_0.topPanel, nil, 0, nil, 0.3, true, true)
	shiftPanel(arg_37_0.leftPanel, 0, nil, nil, 0.3, true, true)
	shiftPanel(arg_37_0.bottomPanel, nil, 0, nil, 0.3, true, true)

	local var_37_0 = arg_37_0:findTF("basic", arg_37_0.rightPanel)
	local var_37_1 = arg_37_0:findTF("info_panel", arg_37_0.rightPanel)
	local var_37_2 = arg_37_0:findTF("statistics", arg_37_0.rightPanel)
	local var_37_3 = arg_37_0:findTF("greet", arg_37_0.rightPanel)

	setAnchoredPosition(var_37_0, {
		x = 1000
	})
	setAnchoredPosition(var_37_1, {
		x = 1000
	})
	setAnchoredPosition(var_37_2, {
		x = 1000
	})
	setAnchoredPosition(var_37_3, {
		x = 1000
	})
	shiftPanel(var_37_1, 0, nil, nil, 0.2, true, true)
	shiftPanel(var_37_0, 0, nil, nil, 0.25, true, true)
	shiftPanel(var_37_2, 0, nil, nil, 0.3, true, true)
	shiftPanel(var_37_3, 0, nil, nil, 0.35, true, true)
end

function var_0_0.uiExitAnimating(arg_38_0)
	shiftPanel(arg_38_0.leftPanel, -1280, nil, 0.4, 0.08, true, true)
	shiftPanel(arg_38_0.rightPanel, 1280, nil, 0.4, 0.08, true, true)
	shiftPanel(arg_38_0.topPanel, nil, 100, 0.2, 0.2, true, true)
	shiftPanel(arg_38_0.bottomPanel, nil, -248, nil, 0.1, true, true)
end

function var_0_0.updateManifesto(arg_39_0)
	local var_39_0 = arg_39_0.player.manifesto

	setInputText(arg_39_0.inputField, var_39_0)
end

function var_0_0.updatePainting(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_1:getPainting()

	setPaintingPrefabAsync(arg_40_0.paintContain, var_40_0, "kanban")
end

function var_0_0.updateFashion(arg_41_0)
	local var_41_0 = arg_41_0.skin.painting

	setPaintingPrefabAsync(arg_41_0.paintContain, var_41_0, "kanban")
	arg_41_0:updateSpinePaintingState()
	arg_41_0:updateLive2DState()
	arg_41_0:updateBGState()
end

function var_0_0.updateBGMState(arg_42_0)
	local function var_42_0(arg_43_0)
		setActive(arg_42_0.bgmBtn:Find("toggle/on"), arg_43_0)
		setActive(arg_42_0.bgmBtn:Find("toggle/off"), not arg_43_0)

		local var_43_0 = arg_42_0:GetBGM()

		playBGM(var_43_0)
	end

	local var_42_1 = getProxy(SettingsProxy)
	local var_42_2 = var_42_1:IsBGMEnable()

	var_42_0(var_42_2)

	if arg_42_0.flagShip:IsBgmSkin() then
		setActive(arg_42_0.bgmBtn, true)
		removeOnButton(arg_42_0.bgmBtn)
		onButton(arg_42_0, arg_42_0.bgmBtn, function()
			var_42_2 = not var_42_2

			var_42_1:SetBgmFlag(var_42_2)
			var_42_0(var_42_2)
		end, SFX_PANEL)
	else
		removeOnButton(arg_42_0.bgmBtn)
		setActive(arg_42_0.bgmBtn, false)
	end
end

function var_0_0.updateLive2DState(arg_45_0)
	local var_45_0 = "live2d/" .. string.lower(arg_45_0.flagShip:getPainting())
	local var_45_1 = HXSet.autoHxShiftPath(var_45_0, nil, true)
	local var_45_2 = getProxy(SettingsProxy)
	local var_45_3 = var_45_2:getCharacterSetting(arg_45_0.flagShip.id, SHIP_FLAG_L2D)
	local var_45_4 = BundleWizard.Inst:GetGroupMgr("L2D")
	local var_45_5 = var_45_4.state

	if var_45_5 == DownloadState.None or var_45_5 == DownloadState.CheckFailure then
		var_45_4:CheckD()
	end

	local var_45_6 = var_45_4:CheckF(var_45_1)

	if var_45_6 == DownloadState.CheckToUpdate or var_45_6 == DownloadState.UpdateFailure then
		setActive(arg_45_0.live2dBtn, true)
		setActive(arg_45_0.live2dState, false)
		setActive(arg_45_0.live2dToggle, true)
		setActive(arg_45_0.live2dToggle:Find("on"), false)
		setActive(arg_45_0.live2dToggle:Find("off"), true)
		onButton(arg_45_0, arg_45_0.live2dBtn, function()
			VersionMgr.Inst:RequestUIForUpdateF("L2D", var_45_1, true)
		end, SFX_PANEL)
	elseif var_45_6 == DownloadState.Updating then
		setActive(arg_45_0.live2dBtn, true)
		setActive(arg_45_0.live2dToggle, false)
		setActive(arg_45_0.live2dState, true)
		removeOnButton(arg_45_0.live2dBtn)
	else
		local var_45_7 = PathMgr.FileExists(PathMgr.getAssetBundle(var_45_1))

		setActive(arg_45_0.live2dBtn, var_45_7)

		if var_45_7 then
			setActive(arg_45_0.live2dState, false)
			setActive(arg_45_0.live2dToggle, true)

			local var_45_8 = var_45_3

			setActive(arg_45_0.live2dToggle:Find("on"), var_45_8)
			setActive(arg_45_0.live2dToggle:Find("off"), not var_45_8)
			onButton(arg_45_0, arg_45_0.live2dBtn, function()
				var_45_2:setCharacterSetting(arg_45_0.flagShip.id, SHIP_FLAG_L2D, not var_45_8)
				arg_45_0:updateLive2DState()
			end, SFX_PANEL)
		end
	end

	if arg_45_0.live2dTimer then
		arg_45_0.live2dTimer:Stop()

		arg_45_0.live2dTimer = nil
	end

	if var_45_6 == DownloadState.CheckToUpdate or var_45_6 == DownloadState.UpdateFailure or var_45_6 == DownloadState.Updating then
		arg_45_0.live2dTimer = Timer.New(function()
			arg_45_0:updateLive2DState()
		end, 0.5, 1)

		arg_45_0.live2dTimer:Start()
	end
end

function var_0_0.updateSwichSkinBtn(arg_49_0, arg_49_1)
	arg_49_0.isExistSkin = arg_49_0:isCurrentShipExistSkin(arg_49_1)

	if HXSet.isHxSkin() then
		setActive(arg_49_0.swichSkinBtn, false)
	else
		local var_49_0 = not isActive(arg_49_0.characters)

		if arg_49_0.contextData.showSelectCharacters then
			var_49_0 = false
		end

		setActive(arg_49_0.swichSkinBtn, arg_49_0.isExistSkin and var_49_0)
	end
end

function var_0_0.isCurrentShipExistSkin(arg_50_0, arg_50_1)
	if arg_50_1 then
		return getProxy(ShipSkinProxy):HasFashion(arg_50_1)
	end

	return false
end

function var_0_0.getGroupSkinList(arg_51_0, arg_51_1)
	return getProxy(ShipSkinProxy):GetAllSkinForShip(arg_51_1)
end

function var_0_0.updateSpinePaintingState(arg_52_0)
	local var_52_0 = getProxy(SettingsProxy)
	local var_52_1 = var_52_0:getCharacterSetting(arg_52_0.flagShip.id, SHIP_FLAG_SP)
	local var_52_2 = HXSet.autoHxShiftPath("spinepainting/" .. arg_52_0.flagShip:getPainting())

	if PathMgr.FileExists(PathMgr.getAssetBundle(var_52_2)) then
		setActive(arg_52_0.spinePaintingBtn, true)
		setActive(arg_52_0.spinePaintingToggle:Find("on"), var_52_1)
		setActive(arg_52_0.spinePaintingToggle:Find("off"), not var_52_1)
		removeOnButton(arg_52_0.spinePaintingBtn)
		onButton(arg_52_0, arg_52_0.spinePaintingBtn, function()
			var_52_1 = not var_52_1

			var_52_0:setCharacterSetting(arg_52_0.flagShip.id, SHIP_FLAG_SP, var_52_1)
			setActive(arg_52_0.spinePaintingToggle:Find("on"), var_52_1)
			setActive(arg_52_0.spinePaintingToggle:Find("off"), not var_52_1)
		end, SFX_PANEL)
	else
		setActive(arg_52_0.spinePaintingBtn, false)
	end
end

function var_0_0.updateBGState(arg_54_0)
	local var_54_0 = getProxy(SettingsProxy)
	local var_54_1 = var_54_0:getCharacterSetting(arg_54_0.flagShip.id, SHIP_FLAG_BG)

	if arg_54_0.flagShip:getShipBgPrint() ~= arg_54_0.flagShip:rarity2bgPrintForGet() then
		setActive(arg_54_0.showBgBtn, true)
		setActive(arg_54_0.showBgToggle:Find("on"), var_54_1)
		setActive(arg_54_0.showBgToggle:Find("off"), not var_54_1)
		removeOnButton(arg_54_0.showBgBtn)
		onButton(arg_54_0, arg_54_0.showBgBtn, function()
			var_54_1 = not var_54_1

			var_54_0:setCharacterSetting(arg_54_0.flagShip.id, SHIP_FLAG_BG, var_54_1)
			setActive(arg_54_0.showBgToggle:Find("on"), var_54_1)
			setActive(arg_54_0.showBgToggle:Find("off"), not var_54_1)
		end, SFX_PANEL)
	else
		setActive(arg_54_0.showBgBtn, false)
	end
end

function var_0_0.updateFleetGSView(arg_56_0)
	setText(arg_56_0:findTF("basic/info_list/score/value", arg_56_0.rightPanel), arg_56_0.fleetGS)
end

function var_0_0.initPlayerInfo(arg_57_0)
	local var_57_0 = arg_57_0.player
	local var_57_1 = math.max(var_57_0.maxRank, 1)

	if var_57_1 > 14 then
		var_57_1 = 14
	end

	local var_57_2 = pg.arena_data_rank[var_57_1]
	local var_57_3 = i18n("friend_resume_title_metal") .. var_57_2.name
	local var_57_4 = {
		var_57_3,
		arg_57_0.fleetGS,
		arg_57_0.collectionRate * 100 .. "%"
	}
	local var_57_5 = {
		var_57_0.shipCount,
		var_57_0.attackCount,
		string.format("%0.1f", var_57_0.winCount / math.max(var_57_0.attackCount, 1) * 100) .. "%",
		var_57_0.collect_attack_count,
		var_57_0.pvp_attack_count,
		string.format("%0.1f", var_57_0.pvp_win_count / math.max(var_57_0.pvp_attack_count, 1) * 100) .. "%"
	}
	local var_57_6 = arg_57_0:findTF("info_panel", arg_57_0.rightPanel)
	local var_57_7 = arg_57_0:findTF("statistics/exp_panel", arg_57_0.rightPanel)

	setText(findTF(var_57_6, "title/name_bg/Text"), var_57_0.name)
	setText(findTF(var_57_6, "title/name_bg/uid"), var_57_0.id)
	setText(findTF(var_57_6, "title/lv_bg/Text"), "LV." .. var_57_0.level)

	local var_57_8 = getConfigFromLevel1(pg.user_level, var_57_0.level).exp

	setText(findTF(var_57_6, "title/exp"), arg_57_0.player.exp .. "/" .. var_57_8)

	local var_57_9 = arg_57_0:findTF("basic/info_list", arg_57_0.rightPanel)

	for iter_57_0, iter_57_1 in ipairs(var_57_4) do
		local var_57_10 = var_57_9:GetChild(iter_57_0 - 1)

		setText(findTF(var_57_10, "value"), iter_57_1 or 0)
	end

	local var_57_11 = arg_57_0:findTF("basic/medal", arg_57_0.rightPanel)
	local var_57_12 = arg_57_0:findTF("basic/medal/Text", arg_57_0.rightPanel)
	local var_57_13 = SeasonInfo.getEmblem(arg_57_0.seasonInfo.score, arg_57_0.seasonInfo.rank)

	LoadImageSpriteAsync("emblem/" .. var_57_13, var_57_11, true)
	LoadImageSpriteAsync("emblem/n_" .. var_57_13, var_57_12, true)

	if SeasonInfo.getMilitaryRank(arg_57_0.seasonInfo.score, arg_57_0.seasonInfo.rank) then
		local var_57_14 = arg_57_0:findTF("basic/medal/Text", arg_57_0.rightPanel)
	end

	for iter_57_2, iter_57_3 in ipairs(var_57_5) do
		local var_57_15 = var_57_7:GetChild(iter_57_2 - 1)

		setText(findTF(var_57_15, "value"), iter_57_3 or 0)
	end

	arg_57_0:updateMedalDisplay()
	arg_57_0:setLanguages()
end

function var_0_0.updateMedalDisplay(arg_58_0, arg_58_1)
	arg_58_0.selectedMedalList = arg_58_0.player.displayTrophyList

	removeAllChildren(arg_58_0.medalList)

	local var_58_0 = math.min(#arg_58_0.selectedMedalList, var_0_0.MAX_MEDAL_DISPLAY)

	for iter_58_0 = 1, var_58_0 do
		local var_58_1 = cloneTplTo(arg_58_0.medalTpl, arg_58_0.medalList)
		local var_58_2 = pg.medal_template[arg_58_0.selectedMedalList[iter_58_0]]

		LoadImageSpriteAsync("medal/s_" .. var_58_2.icon, arg_58_0:findTF("icon", var_58_1), true)
	end

	setActive(arg_58_0.addMedalBtn, false)
end

function var_0_0.updatePlayerName(arg_59_0)
	arg_59_0.selectedMedalList = Clone(arg_59_0.player.displayTrophyList)

	local var_59_0 = arg_59_0:findTF("info_panel", arg_59_0.rightPanel)

	setText(findTF(var_59_0, "title/name_bg/Text"), arg_59_0.player.name)
end

function var_0_0.setLanguages(arg_60_0)
	setText(arg_60_0:findTF("info_panel/bg1/title_name", arg_60_0.rightPanel), i18n("friend_resume_title"))
	setText(arg_60_0:findTF("statistics/bg2/title_name", arg_60_0.rightPanel), i18n("friend_resume_data_title"))
	setText(arg_60_0:findTF("statistics/exp_panel/ship_count/name", arg_60_0.rightPanel), i18n("friend_resume_ship_count"))
	setText(arg_60_0:findTF("statistics/exp_panel/combat_count/name", arg_60_0.rightPanel), i18n("friend_resume_attack_count"))
	setText(arg_60_0:findTF("statistics/exp_panel/succeed_rate/name", arg_60_0.rightPanel), i18n("friend_resume_attack_win_rate"))
	setText(arg_60_0:findTF("statistics/exp_panel/action_count/name", arg_60_0.rightPanel), i18n("friend_event_count"))
	setText(arg_60_0:findTF("statistics/exp_panel/exercise_count/name", arg_60_0.rightPanel), i18n("friend_resume_manoeuvre_count"))
	setText(arg_60_0:findTF("statistics/exp_panel/exercise_rate/name", arg_60_0.rightPanel), i18n("friend_resume_manoeuvre_win_rate"))
	setText(arg_60_0:findTF("basic/info_list/collection_rate/name", arg_60_0.rightPanel), i18n("friend_resume_collection_rate"))
	setText(arg_60_0:findTF("basic/info_list/score/name", arg_60_0.rightPanel), i18n("friend_resume_fleet_gs"))
end

function var_0_0.updateLive2DBtn(arg_61_0, arg_61_1, arg_61_2)
	local var_61_0 = arg_61_2:Find("state")
	local var_61_1 = "live2d/" .. string.lower(arg_61_1:getPainting())
	local var_61_2 = HXSet.autoHxShiftPath(var_61_1, nil, true)
	local var_61_3 = BundleWizard.Inst:GetGroupMgr("L2D")
	local var_61_4 = var_61_3.state

	if var_61_4 == DownloadState.None or var_61_4 == DownloadState.CheckFailure then
		var_61_3:CheckD()
	end

	local var_61_5 = var_61_3:CheckF(var_61_2)

	if var_61_5 == DownloadState.CheckToUpdate or var_61_5 == DownloadState.UpdateFailure then
		setActive(arg_61_2, true)
		setActive(var_61_0, false)
		setActive(arg_61_2:Find("on"), false)
		setActive(arg_61_2:Find("off"), true)
		onToggle(arg_61_0, arg_61_2, function(arg_62_0)
			setActive(arg_61_2:Find("on"), arg_62_0)
			setActive(arg_61_2:Find("off"), not arg_62_0)

			if arg_62_0 then
				VersionMgr.Inst:RequestUIForUpdateF("L2D", var_61_2, true)
			end
		end, SFX_PANEL)
		triggerToggle(arg_61_2, false)
	elseif var_61_5 == DownloadState.Updating then
		setActive(arg_61_2, true)
		setActive(var_61_0, true)
		setActive(arg_61_2:Find("on"), false)
		setActive(arg_61_2:Find("off"), false)

		arg_61_2:GetComponent(typeof(Toggle)).interactable = true
	else
		local var_61_6 = PathMgr.FileExists(PathMgr.getAssetBundle(var_61_2))

		setActive(arg_61_2, var_61_6)

		if var_61_6 then
			setActive(var_61_0, false)
			onToggle(arg_61_0, arg_61_2, function(arg_63_0)
				setActive(arg_61_2:Find("on"), arg_63_0)
				setActive(arg_61_2:Find("off"), not arg_63_0)
				getProxy(SettingsProxy):setCharacterSetting(arg_61_1.id, SHIP_FLAG_L2D, arg_63_0)
			end, SFX_PANEL)
			triggerToggle(arg_61_2, getProxy(SettingsProxy):getCharacterSetting(arg_61_1.id, SHIP_FLAG_L2D))
		end
	end

	if arg_61_0.live2dTimer then
		arg_61_0.live2dTimer:Stop()

		arg_61_0.live2dTimer = nil
	end

	if var_61_5 == DownloadState.CheckToUpdate or var_61_5 == DownloadState.UpdateFailure or var_61_5 == DownloadState.Updating then
		arg_61_0.live2dTimer = Timer.New(function()
			arg_61_0:updateLive2DBtn(arg_61_1, arg_61_2)
		end, 0.5, 1)

		arg_61_0.live2dTimer:Start()
	end
end

function var_0_0.updateCardByShip(arg_65_0, arg_65_1)
	if isActive(arg_65_0.characters) then
		for iter_65_0 = 1, 5 do
			if arg_65_1.id == arg_65_0.player.characters[iter_65_0] then
				arg_65_0:updateCard(iter_65_0)
			end
		end
	end
end

function var_0_0.updateCard(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0.player.characters[arg_66_1]

	if arg_66_1 > arg_66_0.secretary_max and arg_66_1 <= var_0_0.SECRETARY_MAX then
		local var_66_1 = arg_66_0.cards[arg_66_1].tr:Find("lock/Text")

		setText(var_66_1, i18n("secretary_unlock" .. arg_66_1))
	elseif arg_66_1 > var_0_0.SECRETARY_MAX then
		local var_66_2 = arg_66_0.cards[arg_66_1].tr:Find("lock/Text")

		setText(var_66_2, i18n("secretary_closed"))
	end

	if arg_66_1 > arg_66_0.secretary_max then
		arg_66_0.cards[arg_66_1]:update(nil, true)
	elseif var_66_0 then
		local var_66_3 = getProxy(BayProxy):getShipById(var_66_0)

		arg_66_0.cards[arg_66_1]:update(var_66_3, false)
		arg_66_0.cards[arg_66_1]:updateProps(arg_66_0:getCardAttrProps(var_66_3))

		local var_66_4 = arg_66_0.cards[arg_66_1]
		local var_66_5 = var_66_4.tr:Find("mask/settings/l2d")

		arg_66_0:updateLive2DBtn(var_66_3, var_66_5)

		local var_66_6 = HXSet.autoHxShiftPath("spinepainting/" .. var_66_3:getPainting())
		local var_66_7 = PathMgr.FileExists(PathMgr.getAssetBundle(var_66_6))
		local var_66_8 = var_66_4.tr:Find("mask/settings/sp")

		onToggle(arg_66_0, var_66_8, function(arg_67_0)
			setActive(var_66_8:Find("on"), arg_67_0)
			setActive(var_66_8:Find("off"), not arg_67_0)
			getProxy(SettingsProxy):setCharacterSetting(var_66_0, SHIP_FLAG_SP, arg_67_0)
		end)
		triggerToggle(var_66_8, getProxy(SettingsProxy):getCharacterSetting(var_66_0, SHIP_FLAG_SP))
		setActive(var_66_8, var_66_7)

		local var_66_9 = var_66_4.tr:Find("mask/settings/bg")

		onToggle(arg_66_0, var_66_9, function(arg_68_0)
			setActive(var_66_9:Find("on"), arg_68_0)
			setActive(var_66_9:Find("off"), not arg_68_0)
			getProxy(SettingsProxy):setCharacterSetting(var_66_0, SHIP_FLAG_BG, arg_68_0)
		end)
		triggerToggle(var_66_9, getProxy(SettingsProxy):getCharacterSetting(var_66_0, SHIP_FLAG_BG))
		setActive(var_66_9, var_66_3:getShipBgPrint() ~= var_66_3:rarity2bgPrintForGet())

		local var_66_10 = var_66_4.tr:Find("mask/settings/bgm")

		onToggle(arg_66_0, var_66_10, function(arg_69_0)
			setActive(var_66_10:Find("on"), arg_69_0)
			setActive(var_66_10:Find("off"), not arg_69_0)
			getProxy(SettingsProxy):setCharacterSetting(var_66_0, SHIP_FLAG_BGM, arg_69_0)
		end)
		triggerToggle(var_66_10, getProxy(SettingsProxy):getCharacterSetting(var_66_0, SHIP_FLAG_BGM))
		setActive(var_66_10, false)

		local var_66_11 = var_66_4.tr:Find("mask/skin")

		onButton(arg_66_0, var_66_11, function()
			arg_66_0:emit(PlayerInfoMediator.CHANGE_SKIN, var_66_3)
		end)
		setActive(var_66_11, arg_66_0:isCurrentShipExistSkin(var_66_3))
	else
		arg_66_0.cards[arg_66_1]:update(nil, false)
	end

	arg_66_0:detachOnCardButton(arg_66_0.cards[arg_66_1])

	if arg_66_1 <= arg_66_0.secretary_max then
		arg_66_0:attachOnCardButton(arg_66_0.cards[arg_66_1])
	end
end

function var_0_0.initCharacters(arg_71_0)
	if not arg_71_0.cards then
		arg_71_0.cards = {}

		local var_71_0 = arg_71_0.characters:Find("1")

		for iter_71_0 = 1, 5 do
			local var_71_1 = arg_71_0.characters:Find(tostring(iter_71_0)) or cloneTplTo(var_71_0, arg_71_0.characters, iter_71_0)
			local var_71_2 = FormationDetailCard.New(go(var_71_1))

			table.insert(arg_71_0.cards, var_71_2)
		end
	end

	for iter_71_1 = 1, 5 do
		arg_71_0:updateCard(iter_71_1)
	end
end

function var_0_0.getCardAttrProps(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1:getShipCombatPower()
	local var_72_1, var_72_2 = arg_72_1:getIntimacyDetail()

	return {
		{
			i18n("word_lv"),
			arg_72_1.level
		},
		{
			i18n("attribute_intimacy"),
			var_72_2
		},
		{
			i18n("word_synthesize_power"),
			"<color=#ffff00>" .. var_72_0 .. "</color>"
		}
	}
end

function var_0_0.detachOnCardButton(arg_73_0, arg_73_1)
	local var_73_0 = GetOrAddComponent(arg_73_1.go, "EventTriggerListener")

	var_73_0:RemovePointClickFunc()
	var_73_0:RemoveBeginDragFunc()
	var_73_0:RemoveDragFunc()
	var_73_0:RemoveDragEndFunc()
end

function var_0_0.change2ScrPos(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = GameObject.Find("OverlayCamera"):GetComponent("Camera")

	return (LuaHelper.ScreenToLocal(arg_74_1, arg_74_2, var_74_0))
end

function var_0_0.shift(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0.cards

	if #var_75_0 > 0 then
		var_75_0[arg_75_1], var_75_0[arg_75_2] = var_75_0[arg_75_2], var_75_0[arg_75_1]
	end

	arg_75_0._shiftIndex = arg_75_2
end

function var_0_0.attachOnCardButton(arg_76_0, arg_76_1)
	local var_76_0 = GetOrAddComponent(arg_76_1.go, "EventTriggerListener")

	arg_76_0.eventTriggers[var_76_0] = true

	var_76_0:AddPointClickFunc(function(arg_77_0, arg_77_1)
		if not arg_76_0.carddrag and arg_77_0 == arg_76_1.go then
			arg_76_0:emit(PlayerInfoMediator.CHANGE_PAINT, arg_76_1.shipVO)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_PANEL)
		end
	end)

	if arg_76_1.shipVO then
		local var_76_1 = arg_76_0.cards
		local var_76_2 = arg_76_1.tr.parent:GetComponent("ContentSizeFitter")
		local var_76_3 = arg_76_1.tr.parent:GetComponent("HorizontalLayoutGroup")
		local var_76_4 = arg_76_1.tr.rect.width * 0.5
		local var_76_5
		local var_76_6 = 0
		local var_76_7 = {}

		local function var_76_8()
			for iter_78_0 = 1, #var_76_1 do
				if var_76_1[iter_78_0] and var_76_1[iter_78_0] ~= arg_76_1 then
					var_76_1[iter_78_0].tr.anchoredPosition = var_76_1[iter_78_0].tr.anchoredPosition * 0.5 + Vector2(var_76_7[iter_78_0].x, var_76_7[iter_78_0].y) * 0.5
				end
			end

			if var_76_5 and var_76_6 <= Time.realtimeSinceStartup then
				var_76_0:OnDrag(var_76_5)

				var_76_5 = nil
			end
		end

		local function var_76_9()
			for iter_79_0 = 1, #var_76_1 do
				var_76_1[iter_79_0].tr.anchoredPosition = var_76_7[iter_79_0]
			end
		end

		local var_76_10 = Timer.New(var_76_8, 0.03333333333333333, -1)

		var_76_0:AddBeginDragFunc(function()
			if arg_76_0.carddrag then
				return
			end

			arg_76_0._currentDragDelegate = var_76_0
			arg_76_0.carddrag = arg_76_1
			var_76_2.enabled = false
			var_76_3.enabled = false

			arg_76_1.tr:SetSiblingIndex(#var_76_1 - 1)

			for iter_80_0 = 1, #var_76_1 do
				if var_76_1[iter_80_0] == arg_76_1 then
					arg_76_0._shiftIndex = iter_80_0
				end

				var_76_7[iter_80_0] = var_76_1[iter_80_0].tr.anchoredPosition
			end

			var_76_10:Start()
			LeanTween.scale(arg_76_1.paintingTr, Vector3(1.1, 1.1, 0), 0.3)
		end)
		var_76_0:AddDragFunc(function(arg_81_0, arg_81_1)
			if arg_76_0.carddrag ~= arg_76_1 then
				return
			end

			local var_81_0 = arg_76_1.tr.localPosition

			var_81_0.x = arg_76_0:change2ScrPos(arg_76_1.tr.parent, arg_81_1.position).x
			arg_76_1.tr.localPosition = var_81_0

			if var_76_6 > Time.realtimeSinceStartup then
				var_76_5 = arg_81_1

				return
			end

			local var_81_1 = 1

			for iter_81_0 = 1, #var_76_1 do
				if var_76_1[iter_81_0] ~= arg_76_1 and var_76_1[iter_81_0].shipVO and arg_76_1.tr.localPosition.x > var_76_1[iter_81_0].tr.localPosition.x + (var_81_1 < arg_76_0._shiftIndex and 1.1 or -1.1) * var_76_4 then
					var_81_1 = var_81_1 + 1
				end
			end

			if arg_76_0._shiftIndex ~= var_81_1 then
				arg_76_0:shift(arg_76_0._shiftIndex, var_81_1)

				var_76_6 = Time.realtimeSinceStartup + 0.15
			end
		end)
		var_76_0:AddDragEndFunc(function(arg_82_0, arg_82_1)
			if arg_76_0.carddrag ~= arg_76_1 then
				return
			end

			function resetCard()
				var_76_9()

				var_76_2.enabled = true
				var_76_3.enabled = true
				arg_76_0._shiftIndex = nil

				var_76_10:Stop()

				local var_83_0 = {}

				for iter_83_0 = 1, #arg_76_0.cards do
					arg_76_0.cards[iter_83_0].tr:SetSiblingIndex(iter_83_0 - 1)

					var_83_0[iter_83_0] = var_76_1[iter_83_0].shipVO and var_76_1[iter_83_0].shipVO.id
				end

				arg_76_0:emit(PlayerInfoMediator.CHANGE_PAINTS, var_83_0)

				var_76_0.enabled = true
				arg_76_0.carddrag = nil
			end

			local var_82_0 = arg_76_0._forceDropCharacter

			arg_76_0._forceDropCharacter = nil
			arg_76_0._currentDragDelegate = nil
			var_76_0.enabled = false

			if var_82_0 then
				resetCard()

				arg_76_1.paintingTr.localScale = Vector3(1, 1, 0)
			else
				local var_82_1 = math.min(math.abs(arg_76_1.tr.anchoredPosition.x - var_76_7[arg_76_0._shiftIndex].x) / 200, 1) * 0.3

				LeanTween.value(arg_76_1.go, arg_76_1.tr.anchoredPosition.x, var_76_7[arg_76_0._shiftIndex].x, var_82_1):setEase(LeanTweenType.easeOutCubic):setOnUpdate(System.Action_float(function(arg_84_0)
					local var_84_0 = arg_76_1.tr.anchoredPosition

					var_84_0.x = arg_84_0
					arg_76_1.tr.anchoredPosition = var_84_0
				end)):setOnComplete(System.Action(function()
					resetCard()
					LeanTween.scale(arg_76_1.paintingTr, Vector3(1, 1, 0), 0.3)
				end))
			end
		end)
	end
end

function var_0_0.willExit(arg_86_0)
	if arg_86_0.tweens then
		cancelTweens(arg_86_0.tweens)
	end

	if arg_86_0.live2dTimer then
		arg_86_0.live2dTimer:Stop()

		arg_86_0.live2dTimer = nil
	end

	if arg_86_0.eventTriggers then
		for iter_86_0, iter_86_1 in pairs(arg_86_0.eventTriggers) do
			ClearEventTrigger(iter_86_0)
		end

		arg_86_0.eventTriggers = nil
	end
end

return var_0_0

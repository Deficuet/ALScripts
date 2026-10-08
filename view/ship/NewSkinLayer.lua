local var_0_0 = class("NewSkinLayer", import("..base.BaseUI"))

var_0_0.PAINT_DURATION = 0.35
var_0_0.STAR_DURATION = 0.5

local var_0_1 = 19

function var_0_0.getUIName(arg_1_0)
	return "NewSkinUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = arg_2_0.contextData.skinId
	local var_2_1 = {
		ShipSkin.GetBgPrint(var_2_0)
	}

	return table.insertto(var_2_1, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = ShipSkin.GetBgPrint(arg_3_0.contextData.skinId)

	GetSpriteFromAtlasAsync(var_3_0, "", arg_3_1)
end

function var_0_0.init(arg_4_0)
	arg_4_0._shake = arg_4_0._tf:Find("shake_panel")
	arg_4_0._shade = arg_4_0._tf:Find("shade")
	arg_4_0._bg = arg_4_0._shake:Find("bg")
	arg_4_0._staticBg = arg_4_0._bg:Find("static_bg")
	arg_4_0._paintingTF = arg_4_0._shake:Find("paint")
	arg_4_0._dialogue = arg_4_0._shake:Find("dialogue")
	arg_4_0._skinName = arg_4_0._dialogue:Find("name"):GetComponent(typeof(Text))
	arg_4_0._left = arg_4_0._shake:Find("left_panel")
	arg_4_0._viewBtn = arg_4_0._left:Find("view_btn")
	arg_4_0._shareBtn = arg_4_0._left:Find("share_btn")
	arg_4_0.clickTF = arg_4_0._shake:Find("click")
	arg_4_0.newTF = arg_4_0._shake:Find("New")
	arg_4_0.timelimit = arg_4_0._shake:Find("timelimit")

	setActive(arg_4_0.newTF, false)

	arg_4_0.changeSkinBtn = arg_4_0._shake:Find("set_skin_btn")
	arg_4_0.selectPanel = arg_4_0._tf:Find("select_ship_panel")
	arg_4_0.isTimeLimit = arg_4_0.contextData.timeLimit

	setActive(arg_4_0.timelimit, arg_4_0.isTimeLimit)
	pg.UIMgr.GetInstance():OverlayPanel(arg_4_0._tf)

	arg_4_0.isLoadBg = false
	arg_4_0.selectShipPage = ChangeShipSkinPage.New(arg_4_0._parentTf, arg_4_0.event)
	arg_4_0.selectShipPage.isNew = true

	function arg_4_0.selectShipPage.hideCallback()
		arg_4_0:closeView()
	end
end

function var_0_0.voice(arg_6_0, arg_6_1)
	if not arg_6_1 then
		return
	end

	arg_6_0:stopVoice()

	arg_6_0._currentVoice = arg_6_1

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_6_1)
end

function var_0_0.stopVoice(arg_7_0)
	if arg_7_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_7_0._currentVoice)
	end

	arg_7_0._currentVoice = nil
end

function var_0_0.setSkin(arg_8_0, arg_8_1)
	arg_8_0.cg = GetOrAddComponent(arg_8_0._tf, typeof(CanvasGroup))
	arg_8_0.cg.alpha = 0

	setActive(arg_8_0._shade, true)

	arg_8_0._shade:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 1)

	local var_8_0 = "star_level_unlock_anim_" .. arg_8_1

	if checkABExist("ui/skinunlockanim/" .. var_8_0) then
		arg_8_0:playOpening(function()
			arg_8_0:setSkinPri(arg_8_1)
		end, var_8_0)
	else
		arg_8_0:setSkinPri(arg_8_1)
	end
end

function var_0_0.setSkinPri(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:loadUISync("getrole")

	var_10_0.layer = LayerMask.NameToLayer("UI")
	var_10_0.transform.localPosition = Vector3(0, 0, -10)

	setParent(var_10_0, arg_10_0._tf, false)
	setActive(var_10_0, false)
	onNextTick(function()
		setActive(var_10_0, true)
	end)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_CHARGET)

	arg_10_0.cg.alpha = 1
	arg_10_0._shade:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0)

	arg_10_0:recyclePainting()

	arg_10_0._skinConfig = pg.ship_skin_template[arg_10_1]

	local var_10_1 = pg.ship_skin_template[arg_10_1].ship_group
	local var_10_2 = pg.ship_data_statistics[arg_10_0._skinConfig.ship_group * 10 + 1]
	local var_10_3

	if arg_10_0._skinConfig.bg_sp and arg_10_0._skinConfig.bg_sp ~= "" then
		var_10_3 = arg_10_0._skinConfig.bg_sp
	else
		var_10_3 = arg_10_0._skinConfig.bg and #arg_10_0._skinConfig.bg > 0 and arg_10_0._skinConfig.bg or arg_10_0._skinConfig.rarity_bg and #arg_10_0._skinConfig.rarity_bg > 0 and arg_10_0._skinConfig.rarity_bg
	end

	if var_10_3 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_10_0, var_10_3, arg_10_0._bg, arg_10_0._staticBg, function(arg_12_0)
			arg_10_0.isLoadBg = true
		end, function(arg_13_0)
			arg_10_0.isLoadBg = true
		end)
	else
		local var_10_4 = "newshipbg/bg_" .. shipRarity2bgPrint(var_10_2.rarity, ShipGroup.IsBluePrintGroup(var_10_1), ShipGroup.IsMetaGroup(var_10_1))

		GetSpriteFromAtlasAsync(var_10_4, "", function(arg_14_0)
			setImageSprite(arg_10_0._staticBg, arg_14_0, true)

			arg_10_0.isLoadBg = true
		end)
	end

	setPaintingPrefabAsync(arg_10_0._paintingTF, arg_10_0._skinConfig.painting, "huode")

	arg_10_0._skinName.text = i18n("ship_newSkin_name", arg_10_0._skinConfig.name)

	local var_10_5
	local var_10_6 = ""
	local var_10_7
	local var_10_8 = ShipWordHelper.RawGetWord(arg_10_1, ShipWordHelper.WORD_TYPE_UNLOCK)

	if var_10_8 == "" then
		local var_10_9

		var_10_9, var_10_7, var_10_8 = ShipWordHelper.GetWordAndCV(arg_10_1, ShipWordHelper.WORD_TYPE_DROP)
	else
		local var_10_10

		var_10_10, var_10_7, var_10_8 = ShipWordHelper.GetWordAndCV(arg_10_1, ShipWordHelper.WORD_TYPE_UNLOCK)
	end

	setWidgetText(arg_10_0._dialogue, SwitchSpecialChar(var_10_8, true), "desc/Text")

	arg_10_0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(arg_10_0._dialogue, false)
	SetActive(arg_10_0._dialogue, true)
	LeanTween.scale(arg_10_0._dialogue, Vector3(1, 1, 1), 0.1):setOnComplete(System.Action(function()
		setActive(arg_10_0._shade, false)
		setActive(arg_10_0.clickTF, true)
		arg_10_0:voice(var_10_7)
	end))
end

function var_0_0.showExitTip(arg_16_0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("give_up_cloth_change"),
		onYes = function()
			arg_16_0:emit(var_0_0.ON_CLOSE)
		end
	})
end

function var_0_0.didEnter(arg_18_0)
	local var_18_0 = ShipWordHelper.GetDefaultSkin(arg_18_0.contextData.skinId)

	arg_18_0.shipName = pg.ship_skin_template[var_18_0].name

	onButton(arg_18_0, arg_18_0._viewBtn, function()
		arg_18_0.isInView = true

		arg_18_0:paintView()
		setActive(arg_18_0.clickTF, false)
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0._shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewSkin)
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.clickTF, function()
		if arg_18_0.isInView or not arg_18_0.isLoadBg then
			return
		end

		arg_18_0:showExitTip()
	end, SFX_CANCEL)

	arg_18_0.sameShipVOs = arg_18_0:GetShips(arg_18_0.contextData.skinId)

	arg_18_0:onSwitch(arg_18_0.changeSkinBtn, #arg_18_0.sameShipVOs > 0)
end

function var_0_0.GetShips(arg_22_0, arg_22_1)
	local var_22_0 = getProxy(BayProxy):CanUseShareSkinPhantoms(arg_22_1)

	table.sort(var_22_0, CompareFuncs({
		function(arg_23_0)
			return arg_23_0:getSkinId() == arg_22_1 and 1 or 0
		end,
		function(arg_24_0)
			return -arg_24_0.level
		end,
		function(arg_25_0)
			return -arg_25_0:getStar()
		end,
		function(arg_26_0)
			return arg_26_0.inFleet and 0 or 1
		end,
		function(arg_27_0)
			return arg_27_0.createTime
		end
	}))

	return var_22_0
end

function var_0_0.onBackPressed(arg_28_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_28_0.isInView then
		arg_28_0:hidePaintView(true)

		return
	end

	if arg_28_0.selectShipPage:isShowing() then
		arg_28_0.selectShipPage:Hide()

		return
	end

	if isActive(arg_28_0.clickTF) then
		triggerButton(arg_28_0.clickTF)
	end
end

function var_0_0.onSwitch(arg_29_0, arg_29_1, arg_29_2)
	onButton(arg_29_0, arg_29_1, function()
		if arg_29_2 then
			arg_29_0:openSelectPanel()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("err_cloth_change_noship", arg_29_0.shipName))
		end
	end)
end

function var_0_0.paintView(arg_31_0)
	local var_31_0 = {}
	local var_31_1 = arg_31_0._shake.childCount
	local var_31_2 = 0

	while var_31_2 < var_31_1 do
		local var_31_3 = arg_31_0._shake:GetChild(var_31_2)

		if var_31_3.gameObject.activeSelf and var_31_3 ~= arg_31_0._paintingTF and var_31_3 ~= arg_31_0._bg then
			var_31_0[#var_31_0 + 1] = var_31_3

			setActive(var_31_3, false)
		end

		var_31_2 = var_31_2 + 1
	end

	openPortrait()

	local var_31_4 = arg_31_0._paintingTF
	local var_31_5 = var_31_4.anchoredPosition.x
	local var_31_6 = var_31_4.anchoredPosition.y
	local var_31_7 = var_31_4.rect.width
	local var_31_8 = var_31_4.rect.height
	local var_31_9 = arg_31_0._tf.rect.width / UnityEngine.Screen.width
	local var_31_10 = arg_31_0._tf.rect.height / UnityEngine.Screen.height
	local var_31_11 = var_31_7 / 2
	local var_31_12 = var_31_8 / 2
	local var_31_13
	local var_31_14

	if not LeanTween.isTweening(go(var_31_4)) then
		LeanTween.moveX(rtf(var_31_4), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
	end

	local var_31_15 = GetOrAddComponent(arg_31_0._bg, "MultiTouchZoom")

	var_31_15:SetZoomTarget(arg_31_0._paintingTF)

	local var_31_16 = GetOrAddComponent(arg_31_0._bg, "EventTriggerListener")
	local var_31_17 = true

	var_31_15.enabled = true
	var_31_16.enabled = true

	local var_31_18 = false

	var_31_16:AddPointDownFunc(function(arg_32_0)
		if Input.touchCount == 1 or IsUnityEditor then
			var_31_18 = true
			var_31_17 = true
		elseif Input.touchCount >= 2 then
			var_31_17 = false
			var_31_18 = false
		end
	end)
	var_31_16:AddPointUpFunc(function(arg_33_0)
		if Input.touchCount <= 2 then
			var_31_17 = true
		end
	end)
	var_31_16:AddBeginDragFunc(function(arg_34_0, arg_34_1)
		var_31_18 = false
		var_31_13 = arg_34_1.position.x * var_31_9 - var_31_11 - tf(arg_31_0._paintingTF).localPosition.x
		var_31_14 = arg_34_1.position.y * var_31_10 - var_31_12 - tf(arg_31_0._paintingTF).localPosition.y
	end)
	var_31_16:AddDragFunc(function(arg_35_0, arg_35_1)
		if var_31_17 then
			local var_35_0 = tf(arg_31_0._paintingTF).localPosition

			tf(arg_31_0._paintingTF).localPosition = Vector3(arg_35_1.position.x * var_31_9 - var_31_11 - var_31_13, arg_35_1.position.y * var_31_10 - var_31_12 - var_31_14, -22)
		end
	end)
	onButton(arg_31_0, arg_31_0._bg, function()
		arg_31_0:hidePaintView()
	end, SFX_CANCEL)

	function var_0_0.hidePaintView(arg_37_0, arg_37_1)
		if not arg_37_1 and not var_31_18 then
			return
		end

		var_31_16.enabled = false
		var_31_15.enabled = false

		RemoveComponent(arg_37_0._bg, "Button")

		for iter_37_0, iter_37_1 in ipairs(var_31_0) do
			setActive(iter_37_1, true)
		end

		closePortrait()
		LeanTween.cancel(go(arg_37_0._paintingTF))

		arg_37_0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(arg_37_0._paintingTF, {
			x = var_31_5,
			y = var_31_6
		})

		arg_37_0.isInView = false

		setActive(arg_37_0.clickTF, true)
	end
end

function var_0_0.recyclePainting(arg_38_0)
	if arg_38_0._shipVO then
		retPaintingPrefab(arg_38_0._paintingTF, arg_38_0._shipVO:getPainting())
	end
end

function var_0_0.openSelectPanel(arg_39_0)
	arg_39_0.selectShipPage:ExecuteAction("Show", ShipSkin.New({
		id = arg_39_0.contextData.skinId
	}))
end

function var_0_0.updateShipCards(arg_40_0)
	for iter_40_0, iter_40_1 in pairs(arg_40_0.shipCards or {}) do
		local var_40_0 = arg_40_0.sameShipVOs[iter_40_0]

		if var_40_0 then
			iter_40_1:update(var_40_0, arg_40_0.contextData.skinId)
		end
	end
end

function var_0_0.playOpening(arg_41_0, arg_41_1, arg_41_2)
	pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
		return
	end, function()
		if arg_41_1 then
			arg_41_1()
		end
	end, "ui/skinunlockanim", arg_41_2, false, false)
end

function var_0_0.willExit(arg_44_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()

	local var_44_0 = arg_44_0._skinConfig.ship_group * 10 + 1
	local var_44_1 = pg.ship_data_statistics[var_44_0]

	pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newSkinLayer_get", var_44_1.name, arg_44_0._skinConfig.name), COLOR_GREEN)
	arg_44_0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_44_0._tf)
	arg_44_0:stopVoice()

	if arg_44_0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(arg_44_0.loadedCVBankName)

		arg_44_0.loadedCVBankName = nil
	end

	arg_44_0.selectShipPage:Destroy()
	cameraPaintViewAdjust(false)
end

return var_0_0

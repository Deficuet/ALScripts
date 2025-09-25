local var_0_0 = class("NewSkinLayer", import("..base.BaseUI"))

var_0_0.PAINT_DURATION = 0.35
var_0_0.STAR_DURATION = 0.5

local var_0_1 = 19

function var_0_0.getUIName(arg_1_0)
	return "NewSkinUI"
end

function var_0_0.preload(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.contextData.skinId
	local var_2_1 = pg.ship_skin_template[var_2_0]
	local var_2_2 = var_2_1.ship_group
	local var_2_3 = var_2_2 * 10 + 1
	local var_2_4 = pg.ship_data_statistics[var_2_3]
	local var_2_5

	if var_2_1.bg_sp and var_2_1.bg_sp ~= "" then
		var_2_5 = var_2_1.bg_sp
	else
		var_2_5 = var_2_1.bg and #var_2_1.bg > 0 and var_2_1.bg or var_2_1.rarity_bg and #var_2_1.rarity_bg > 0 and var_2_1.rarity_bg
	end

	local var_2_6

	var_2_6 = var_2_5 and "bg/star_level_bg_" .. var_2_5 or "newshipbg/bg_" .. shipRarity2bgPrint(var_2_4.rarity, ShipGroup.IsBluePrintGroup(var_2_2), ShipGroup.IsMetaGroup(var_2_2))

	GetSpriteFromAtlasAsync(var_2_6, "", arg_2_1)
end

function var_0_0.init(arg_3_0)
	arg_3_0._shake = arg_3_0:findTF("shake_panel")
	arg_3_0._shade = arg_3_0:findTF("shade")
	arg_3_0._bg = arg_3_0._shake:Find("bg")
	arg_3_0._staticBg = arg_3_0._bg:Find("static_bg")
	arg_3_0._paintingTF = arg_3_0._shake:Find("paint")
	arg_3_0._dialogue = arg_3_0._shake:Find("dialogue")
	arg_3_0._skinName = arg_3_0._dialogue:Find("name"):GetComponent(typeof(Text))
	arg_3_0._left = arg_3_0._shake:Find("left_panel")
	arg_3_0._viewBtn = arg_3_0._left:Find("view_btn")
	arg_3_0._shareBtn = arg_3_0._left:Find("share_btn")
	arg_3_0.clickTF = arg_3_0._shake:Find("click")
	arg_3_0.newTF = arg_3_0._shake:Find("New")
	arg_3_0.timelimit = arg_3_0._shake:Find("timelimit")

	setActive(arg_3_0.newTF, false)

	arg_3_0.changeSkinBtn = arg_3_0:findTF("set_skin_btn", arg_3_0._shake)
	arg_3_0.selectPanel = arg_3_0:findTF("select_ship_panel")
	arg_3_0.isTimeLimit = arg_3_0.contextData.timeLimit

	setActive(arg_3_0.timelimit, arg_3_0.isTimeLimit)
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0._tf)

	arg_3_0.isLoadBg = false
	arg_3_0.selectShipPage = ChangeShipSkinPage.New(arg_3_0._parentTf, arg_3_0.event)
	arg_3_0.selectShipPage.isNew = true

	function arg_3_0.selectShipPage.hideCallback()
		arg_3_0:closeView()
	end
end

function var_0_0.voice(arg_5_0, arg_5_1)
	if not arg_5_1 then
		return
	end

	arg_5_0:stopVoice()

	arg_5_0._currentVoice = arg_5_1

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_5_1)
end

function var_0_0.stopVoice(arg_6_0)
	if arg_6_0._currentVoice then
		pg.CriMgr.GetInstance():UnloadSoundEffect_V3(arg_6_0._currentVoice)
	end

	arg_6_0._currentVoice = nil
end

function var_0_0.setSkin(arg_7_0, arg_7_1)
	arg_7_0.cg = GetOrAddComponent(arg_7_0._tf, typeof(CanvasGroup))
	arg_7_0.cg.alpha = 0

	setActive(arg_7_0._shade, true)

	arg_7_0._shade:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 1)

	local var_7_0 = "star_level_unlock_anim_" .. arg_7_1

	if checkABExist("ui/skinunlockanim/" .. var_7_0) then
		arg_7_0:playOpening(function()
			arg_7_0:setSkinPri(arg_7_1)
		end, var_7_0)
	else
		arg_7_0:setSkinPri(arg_7_1)
	end
end

function var_0_0.setSkinPri(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:loadUISync("getrole")

	var_9_0.layer = LayerMask.NameToLayer("UI")
	var_9_0.transform.localPosition = Vector3(0, 0, -10)

	setParent(var_9_0, arg_9_0._tf, false)
	setActive(var_9_0, false)
	onNextTick(function()
		setActive(var_9_0, true)
	end)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_CHARGET)

	arg_9_0.cg.alpha = 1
	arg_9_0._shade:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0)

	arg_9_0:recyclePainting()

	arg_9_0._skinConfig = pg.ship_skin_template[arg_9_1]

	local var_9_1 = pg.ship_skin_template[arg_9_1].ship_group
	local var_9_2 = pg.ship_data_statistics[arg_9_0._skinConfig.ship_group * 10 + 1]
	local var_9_3

	if arg_9_0._skinConfig.bg_sp and arg_9_0._skinConfig.bg_sp ~= "" then
		var_9_3 = arg_9_0._skinConfig.bg_sp
	else
		var_9_3 = arg_9_0._skinConfig.bg and #arg_9_0._skinConfig.bg > 0 and arg_9_0._skinConfig.bg or arg_9_0._skinConfig.rarity_bg and #arg_9_0._skinConfig.rarity_bg > 0 and arg_9_0._skinConfig.rarity_bg
	end

	if var_9_3 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_9_0, var_9_3, arg_9_0._bg, arg_9_0._staticBg, function(arg_11_0)
			arg_9_0.isLoadBg = true
		end, function(arg_12_0)
			arg_9_0.isLoadBg = true
		end)
	else
		local var_9_4 = "newshipbg/bg_" .. shipRarity2bgPrint(var_9_2.rarity, ShipGroup.IsBluePrintGroup(var_9_1), ShipGroup.IsMetaGroup(var_9_1))

		GetSpriteFromAtlasAsync(var_9_4, "", function(arg_13_0)
			setImageSprite(arg_9_0._staticBg, arg_13_0, true)

			arg_9_0.isLoadBg = true
		end)
	end

	setPaintingPrefabAsync(arg_9_0._paintingTF, arg_9_0._skinConfig.painting, "huode")

	arg_9_0._skinName.text = i18n("ship_newSkin_name", arg_9_0._skinConfig.name)

	local var_9_5
	local var_9_6 = ""
	local var_9_7
	local var_9_8 = ShipWordHelper.RawGetWord(arg_9_1, ShipWordHelper.WORD_TYPE_UNLOCK)

	if var_9_8 == "" then
		local var_9_9

		var_9_9, var_9_7, var_9_8 = ShipWordHelper.GetWordAndCV(arg_9_1, ShipWordHelper.WORD_TYPE_DROP)
	else
		local var_9_10

		var_9_10, var_9_7, var_9_8 = ShipWordHelper.GetWordAndCV(arg_9_1, ShipWordHelper.WORD_TYPE_UNLOCK)
	end

	setWidgetText(arg_9_0._dialogue, SwitchSpecialChar(var_9_8, true), "desc/Text")

	arg_9_0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(arg_9_0._dialogue, false)
	SetActive(arg_9_0._dialogue, true)
	LeanTween.scale(arg_9_0._dialogue, Vector3(1, 1, 1), 0.1):setOnComplete(System.Action(function()
		setActive(arg_9_0._shade, false)
		setActive(arg_9_0.clickTF, true)
		arg_9_0:voice(var_9_7)
	end))
end

function var_0_0.showExitTip(arg_15_0)
	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("give_up_cloth_change"),
		onYes = function()
			arg_15_0:emit(var_0_0.ON_CLOSE)
		end
	})
end

function var_0_0.didEnter(arg_17_0)
	local var_17_0 = ShipWordHelper.GetDefaultSkin(arg_17_0.contextData.skinId)

	arg_17_0.shipName = pg.ship_skin_template[var_17_0].name

	onButton(arg_17_0, arg_17_0._viewBtn, function()
		arg_17_0.isInView = true

		arg_17_0:paintView()
		setActive(arg_17_0.clickTF, false)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0._shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewSkin)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.clickTF, function()
		if arg_17_0.isInView or not arg_17_0.isLoadBg then
			return
		end

		arg_17_0:showExitTip()
	end, SFX_CANCEL)

	arg_17_0.sameShipVOs = arg_17_0:GetShips(arg_17_0.contextData.skinId)

	arg_17_0:onSwitch(arg_17_0.changeSkinBtn, #arg_17_0.sameShipVOs > 0)
end

function var_0_0.GetShips(arg_21_0, arg_21_1)
	local var_21_0 = getProxy(BayProxy):CanUseShareSkinPhantoms(arg_21_1)

	table.sort(var_21_0, CompareFuncs({
		function(arg_22_0)
			return arg_22_0:getSkinId() == arg_21_1 and 1 or 0
		end,
		function(arg_23_0)
			return -arg_23_0.level
		end,
		function(arg_24_0)
			return -arg_24_0:getStar()
		end,
		function(arg_25_0)
			return arg_25_0.inFleet and 0 or 1
		end,
		function(arg_26_0)
			return arg_26_0.createTime
		end
	}))

	return var_21_0
end

function var_0_0.onBackPressed(arg_27_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_27_0.isInView then
		arg_27_0:hidePaintView(true)

		return
	end

	if arg_27_0.selectShipPage:isShowing() then
		arg_27_0.selectShipPage:Hide()

		return
	end

	if isActive(arg_27_0.clickTF) then
		triggerButton(arg_27_0.clickTF)
	end
end

function var_0_0.onSwitch(arg_28_0, arg_28_1, arg_28_2)
	onButton(arg_28_0, arg_28_1, function()
		if arg_28_2 then
			arg_28_0:openSelectPanel()
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("err_cloth_change_noship", arg_28_0.shipName))
		end
	end)
end

function var_0_0.paintView(arg_30_0)
	local var_30_0 = {}
	local var_30_1 = arg_30_0._shake.childCount
	local var_30_2 = 0

	while var_30_2 < var_30_1 do
		local var_30_3 = arg_30_0._shake:GetChild(var_30_2)

		if var_30_3.gameObject.activeSelf and var_30_3 ~= arg_30_0._paintingTF and var_30_3 ~= arg_30_0._bg then
			var_30_0[#var_30_0 + 1] = var_30_3

			setActive(var_30_3, false)
		end

		var_30_2 = var_30_2 + 1
	end

	openPortrait()

	local var_30_4 = arg_30_0._paintingTF
	local var_30_5 = var_30_4.anchoredPosition.x
	local var_30_6 = var_30_4.anchoredPosition.y
	local var_30_7 = var_30_4.rect.width
	local var_30_8 = var_30_4.rect.height
	local var_30_9 = arg_30_0._tf.rect.width / UnityEngine.Screen.width
	local var_30_10 = arg_30_0._tf.rect.height / UnityEngine.Screen.height
	local var_30_11 = var_30_7 / 2
	local var_30_12 = var_30_8 / 2
	local var_30_13
	local var_30_14

	if not LeanTween.isTweening(go(var_30_4)) then
		LeanTween.moveX(rtf(var_30_4), 150, 0.5):setEase(LeanTweenType.easeInOutSine)
	end

	local var_30_15 = GetOrAddComponent(arg_30_0._bg, "MultiTouchZoom")

	var_30_15:SetZoomTarget(arg_30_0._paintingTF)

	local var_30_16 = GetOrAddComponent(arg_30_0._bg, "EventTriggerListener")
	local var_30_17 = true

	var_30_15.enabled = true
	var_30_16.enabled = true

	local var_30_18 = false

	var_30_16:AddPointDownFunc(function(arg_31_0)
		if Input.touchCount == 1 or IsUnityEditor then
			var_30_18 = true
			var_30_17 = true
		elseif Input.touchCount >= 2 then
			var_30_17 = false
			var_30_18 = false
		end
	end)
	var_30_16:AddPointUpFunc(function(arg_32_0)
		if Input.touchCount <= 2 then
			var_30_17 = true
		end
	end)
	var_30_16:AddBeginDragFunc(function(arg_33_0, arg_33_1)
		var_30_18 = false
		var_30_13 = arg_33_1.position.x * var_30_9 - var_30_11 - tf(arg_30_0._paintingTF).localPosition.x
		var_30_14 = arg_33_1.position.y * var_30_10 - var_30_12 - tf(arg_30_0._paintingTF).localPosition.y
	end)
	var_30_16:AddDragFunc(function(arg_34_0, arg_34_1)
		if var_30_17 then
			local var_34_0 = tf(arg_30_0._paintingTF).localPosition

			tf(arg_30_0._paintingTF).localPosition = Vector3(arg_34_1.position.x * var_30_9 - var_30_11 - var_30_13, arg_34_1.position.y * var_30_10 - var_30_12 - var_30_14, -22)
		end
	end)
	onButton(arg_30_0, arg_30_0._bg, function()
		arg_30_0:hidePaintView()
	end, SFX_CANCEL)

	function var_0_0.hidePaintView(arg_36_0, arg_36_1)
		if not arg_36_1 and not var_30_18 then
			return
		end

		var_30_16.enabled = false
		var_30_15.enabled = false

		RemoveComponent(arg_36_0._bg, "Button")

		for iter_36_0, iter_36_1 in ipairs(var_30_0) do
			setActive(iter_36_1, true)
		end

		closePortrait()
		LeanTween.cancel(go(arg_36_0._paintingTF))

		arg_36_0._paintingTF.localScale = Vector3(1, 1, 1)

		setAnchoredPosition(arg_36_0._paintingTF, {
			x = var_30_5,
			y = var_30_6
		})

		arg_36_0.isInView = false

		setActive(arg_36_0.clickTF, true)
	end
end

function var_0_0.recyclePainting(arg_37_0)
	if arg_37_0._shipVO then
		retPaintingPrefab(arg_37_0._paintingTF, arg_37_0._shipVO:getPainting())
	end
end

function var_0_0.openSelectPanel(arg_38_0)
	arg_38_0.selectShipPage:ExecuteAction("Show", ShipSkin.New({
		id = arg_38_0.contextData.skinId
	}))
end

function var_0_0.updateShipCards(arg_39_0)
	for iter_39_0, iter_39_1 in pairs(arg_39_0.shipCards or {}) do
		local var_39_0 = arg_39_0.sameShipVOs[iter_39_0]

		if var_39_0 then
			iter_39_1:update(var_39_0, arg_39_0.contextData.skinId)
		end
	end
end

function var_0_0.playOpening(arg_40_0, arg_40_1, arg_40_2)
	pg.CpkPlayMgr.GetInstance():PlayCpkMovie(function()
		return
	end, function()
		if arg_40_1 then
			arg_40_1()
		end
	end, "ui/skinunlockanim", arg_40_2, false, false)
end

function var_0_0.willExit(arg_43_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()

	local var_43_0 = arg_43_0._skinConfig.ship_group * 10 + 1
	local var_43_1 = pg.ship_data_statistics[var_43_0]

	pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newSkinLayer_get", var_43_1.name, arg_43_0._skinConfig.name), COLOR_GREEN)
	arg_43_0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_43_0._tf)
	arg_43_0:stopVoice()

	if arg_43_0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(arg_43_0.loadedCVBankName)

		arg_43_0.loadedCVBankName = nil
	end

	arg_43_0.selectShipPage:Destroy()
	cameraPaintViewAdjust(false)
end

return var_0_0

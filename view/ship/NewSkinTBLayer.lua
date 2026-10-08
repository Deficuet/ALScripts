local var_0_0 = class("NewSkinTBLayer", import("view.ship.NewSkinLayer"))

function var_0_0.getUIName(arg_1_0)
	return "NewSkinUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = arg_2_0.contextData.skinId
	local var_2_1 = {
		var_2_0 and ShipSkin.GetBgPrint(var_2_0, true) or nil
	}

	return table.insertto(var_2_1, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = ShipSkin.GetBgPrint(arg_3_0.contextData.skinId, true)

	if var_3_0 then
		GetSpriteFromAtlasAsync(var_3_0, "", arg_3_1)
	else
		existCall(arg_3_1)
	end
end

function var_0_0.setSkinPri(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0:loadUISync("getrole")

	var_4_0.layer = LayerMask.NameToLayer("UI")
	var_4_0.transform.localPosition = Vector3(0, 0, -10)

	setParent(var_4_0, arg_4_0._tf, false)
	setActive(var_4_0, false)
	onNextTick(function()
		setActive(var_4_0, true)
	end)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_DOCKYARD_CHARGET)

	arg_4_0.cg.alpha = 1
	arg_4_0._shade:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0)

	arg_4_0:recyclePainting()

	arg_4_0._skinConfig = pg.ship_skin_template[arg_4_1]

	local var_4_1

	if arg_4_0._skinConfig.bg_sp and arg_4_0._skinConfig.bg_sp ~= "" then
		var_4_1 = arg_4_0._skinConfig.bg_sp
	else
		var_4_1 = arg_4_0._skinConfig.bg and #arg_4_0._skinConfig.bg > 0 and arg_4_0._skinConfig.bg or arg_4_0._skinConfig.rarity_bg and #arg_4_0._skinConfig.rarity_bg > 0 and arg_4_0._skinConfig.rarity_bg
	end

	if var_4_1 then
		pg.DynamicBgMgr.GetInstance():LoadBg(arg_4_0, var_4_1, arg_4_0._bg, arg_4_0._staticBg, function(arg_6_0)
			arg_4_0.isLoadBg = true
		end, function(arg_7_0)
			arg_4_0.isLoadBg = true
		end)
	end

	setPaintingPrefabAsync(arg_4_0._paintingTF, arg_4_0._skinConfig.painting, "huode")

	arg_4_0._skinName.text = i18n("ship_newSkin_name", arg_4_0._skinConfig.name)

	local var_4_2
	local var_4_3 = ""
	local var_4_4
	local var_4_5, var_4_6, var_4_7 = EducateCharWordHelper.GetWordAndCV(NewEducateHelper.GetSecIdBySkinId(arg_4_1), "login")

	setWidgetText(arg_4_0._dialogue, SwitchSpecialChar(var_4_7, true), "desc/Text")

	arg_4_0._dialogue.transform.localScale = Vector3(0, 1, 1)

	SetActive(arg_4_0._dialogue, false)
	SetActive(arg_4_0._dialogue, true)
	LeanTween.scale(arg_4_0._dialogue, Vector3(1, 1, 1), 0.1):setOnComplete(System.Action(function()
		setActive(arg_4_0._shade, false)
		setActive(arg_4_0.clickTF, true)
		arg_4_0:voice(var_4_6)
	end))
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0.shipName = NewEducateHelper.GetShipNameBySecId(arg_9_0.contextData.secId)

	onButton(arg_9_0, arg_9_0._viewBtn, function()
		arg_9_0.isInView = true

		arg_9_0:paintView()
		setActive(arg_9_0.clickTF, false)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0._shareBtn, function()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeNewSkin)
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.clickTF, function()
		if arg_9_0.isInView or not arg_9_0.isLoadBg then
			return
		end

		arg_9_0:showExitTip()
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.changeSkinBtn, function()
		if NewEducateHelper.IsUnlockDefaultShip(NewEducateHelper.GetSecIdBySkinId(arg_9_0.contextData.skinId)) then
			arg_9_0.hideExitTip = true

			arg_9_0:emit(NewSkinTBMediator.GO_SET_TB_SKIN)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("secretary_special_character_buy_unlock"))
		end
	end)

	if arg_9_0.contextData.isClose then
		onNextTick(function()
			arg_9_0:closeView()
		end)
	end
end

function var_0_0.willExit(arg_15_0)
	pg.CpkPlayMgr.GetInstance():DisposeCpkMovie()

	if not arg_15_0.hideExitTip then
		local var_15_0 = pg.ship_skin_template[arg_15_0.contextData.skinId].name
		local var_15_1 = NewEducateHelper.GetShipNameBySecId(arg_15_0.contextData.secId)

		pg.TipsMgr.GetInstance():ShowTips(i18n("ship_newSkinLayer_get", var_15_1, var_15_0), COLOR_GREEN)
	end

	arg_15_0:recyclePainting()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_15_0._tf)
	arg_15_0:stopVoice()

	if arg_15_0.loadedCVBankName then
		pg.CriMgr.UnloadCVBank(arg_15_0.loadedCVBankName)

		arg_15_0.loadedCVBankName = nil
	end

	arg_15_0.selectShipPage:Destroy()
	cameraPaintViewAdjust(false)
end

return var_0_0

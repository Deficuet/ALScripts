local var_0_0 = class("AtelierCompositeBaseScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "AtelierCompositeUI"
end

function var_0_0.InitStr(arg_2_0)
	arg_2_0.bundleName = "ui/AtelierCompositeUI_atlas"
	arg_2_0.commonBundleName = "ui/AtelierCommonUI_atlas"
	arg_2_0.chatText = {
		idle = {
			"ryza_atellier1"
		},
		clickFormula = {
			"ryza_atellier2",
			"ryza_atellier3",
			"ryza_atellier4"
		},
		showMaterialSelectWindow = {
			"ryza_atellier2",
			"ryza_atellier3",
			"ryza_atellier4"
		},
		selectMaterial = {
			"ryza_atellier5",
			"ryza_atellier6",
			"ryza_atellier7"
		},
		compositeResult = {
			"ryza_atellier8",
			"ryza_atellier9"
		},
		compositeResult2 = {
			"ryza_atellier10",
			"ryza_atellier11"
		}
	}
	arg_2_0.soundStr = {
		formulaDetailUnlock = "event:/ui/ryza_atellier_ui_3",
		showMaterialSelectWindow = "event:/ui/ryza_atellier_ui_1",
		compositeConfirm = "event:/ui/ryza_atellier_ui_6",
		selectMaterial = "event:/ui/ryza_atellier_ui_2",
		formulaDetail = "event:/ui/ryza_atellier_ui_5",
		clickFormula = "event:/ui/ryza_atellier_ui_1",
		formulaDetailFill = "event:/ui/ryza_atellier_ui_4"
	}
	arg_2_0.helpStr = "ryza_composite_help_tip"
	arg_2_0.tipStr = "ryza_composite_words"
	arg_2_0.unlockText = "ryza_tip_composite_unlock"
end

function var_0_0.InitView(arg_3_0)
	arg_3_0.atelierFormulaListView = AtelierFormulaListView.New(arg_3_0.layerFormulaPanel, arg_3_0)
	arg_3_0.atelierFormulaDetailView = AtelierFormulaDetailView.New(arg_3_0.layerFormulaDetailPanel, arg_3_0)
	arg_3_0.atelierMaterialSelectView = AtelierMaterialSelectView.New(arg_3_0.materialSelectPanel, arg_3_0)
	arg_3_0.atelierMaterialsPreview = AtelierFormulaMaterialsPreview.New(arg_3_0.materialsPreviewPanel, arg_3_0)
	arg_3_0.atelierCompositeConfirmView = AtelierCompositeConfirmView.New(arg_3_0.compositeConfirmPanel, arg_3_0)
	arg_3_0.atelierCompositeResultView = AtelierCompositeResultView.New(arg_3_0.compositeResultPanel, arg_3_0)
end

function var_0_0.OnClickStore(arg_4_0)
	local var_4_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(AtelierCompositeMediator)

	addSubLayer(Context.New({
		mediator = AtelierStoreBaseMediator,
		viewComponent = AtelierStoreBaseScene,
		data = {
			activity = arg_4_0.activity
		}
	}), var_4_0)
end

function var_0_0.preload(arg_5_0, arg_5_1)
	arg_5_0:InitStr()

	arg_5_0.loader = AutoLoader.New()

	table.ParallelIpairsAsync({
		arg_5_0.bundleName,
		arg_5_0.commonBundleName
	}, function(arg_6_0, arg_6_1, arg_6_2)
		arg_5_0.loader:LoadBundle(arg_6_1, arg_6_2)
	end, arg_5_1)
end

function var_0_0.getResource(arg_7_0)
	arg_7_0:InitStr()

	local var_7_0 = var_0_0.super.getResource(arg_7_0)
	local var_7_1 = {
		arg_7_0.bundleName,
		arg_7_0.commonBundleName,
		"ui/laisha_ui_huo_o",
		"ui/laisha_ui_huo_6",
		"ui/laisha_ui_bing_o",
		"ui/laisha_ui_bing_6",
		"ui/laisha_ui_lei_o",
		"ui/laisha_ui_lei_6",
		"ui/laisha_ui_feng_o",
		"ui/laisha_ui_feng_6",
		"ui/laisha_ui_sairen_o",
		"ui/laisha_ui_sairen_6",
		"ui/laisha_ui_wupinshanguang",
		"ui/laisha_ui_jiesuo",
		"ui/laisha_ui_lianjie01",
		"ui/laisha_ui_lianjie02",
		"ui/laisha_ui_lianjie_qiehuan",
		"ui/laisha_ui_wupinzhiru",
		"ui/laisha_ui_baoshi",
		"ui/" .. arg_7_0:GetAtelierCompositEffect()
	}

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		if noEmptyStr(iter_7_1) and not table.contains(var_7_0, iter_7_1) then
			table.insert(var_7_0, iter_7_1)
		end
	end

	return var_7_0
end

function var_0_0.init(arg_8_0)
	arg_8_0.top = arg_8_0._tf:Find("Top")
	arg_8_0.layerFormulaPanel = arg_8_0._tf:Find("FormulaList")
	arg_8_0.layerFormulaOverlayPanel = arg_8_0._tf:Find("FormulaDetail/Overlay")
	arg_8_0.layerFormulaDetailPanel = arg_8_0._tf:Find("FormulaDetail")
	arg_8_0.scrollView = arg_8_0._tf:Find("FormulaDetail/ScrollView")
	arg_8_0.materialSelectPanel = arg_8_0._tf:Find("FormulaDetail/Overlay/AvaliableMaterials")
	arg_8_0.materialsPreviewPanel = arg_8_0._tf:Find("FormulaMaterialsPreview")
	arg_8_0.compositeConfirmPanel = arg_8_0._tf:Find("CompositeConfirmWindow")
	arg_8_0.compositeResultPanel = arg_8_0._tf:Find("CompositeResultWindow")

	arg_8_0:InitCustom()
	setActive(arg_8_0.layerEmpty, false)
end

function var_0_0.InitCustom(arg_9_0)
	arg_9_0.layerEmpty = arg_9_0._tf:Find("Empty")

	setText(arg_9_0._tf:Find("Empty/Bar/Text"), i18n(arg_9_0.unlockText))

	arg_9_0.painting = arg_9_0._tf:Find("Painting")
	arg_9_0.chat = arg_9_0.painting:Find("Chat")

	setActive(arg_9_0.chat, false)
	pg.ViewUtils.SetSortingOrder(arg_9_0._tf:Find("Mask/BG"):GetChild(0), -1)
end

function var_0_0.SetContextData(arg_10_0, arg_10_1)
	arg_10_0.contextData = arg_10_1

	arg_10_0.atelierFormulaListView:SetContextData(arg_10_1)
	arg_10_0.atelierFormulaDetailView:SetContextData(arg_10_1)
	arg_10_0.atelierMaterialSelectView:SetContextData(arg_10_1)
	arg_10_0.atelierMaterialsPreview:SetContentData(arg_10_1)
	arg_10_0.atelierCompositeConfirmView:SetContentData(arg_10_1)
	arg_10_0.atelierCompositeResultView:SetContentData(arg_10_1)
end

function var_0_0.SetActivity(arg_11_0, arg_11_1)
	arg_11_0.activity = arg_11_1

	arg_11_0.atelierFormulaListView:SetActivity(arg_11_1)
	arg_11_0.atelierFormulaDetailView:SetActivity(arg_11_1)
	arg_11_0.atelierMaterialSelectView:SetActivity(arg_11_1)
	arg_11_0.atelierMaterialsPreview:SetActivity(arg_11_1)
	arg_11_0.atelierCompositeConfirmView:SetActivity(arg_11_1)
	arg_11_0.atelierCompositeResultView:SetActivity(arg_11_1)
end

function var_0_0.SetEnabled(arg_12_0, arg_12_1)
	arg_12_0.unlockSystem = arg_12_1
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:RefreshEmptyPanel()
	arg_13_0.atelierFormulaListView:didEnter()
	arg_13_0.atelierFormulaDetailView:didEnter()
	arg_13_0.atelierMaterialSelectView:didEnter()
	arg_13_0.atelierMaterialsPreview:didEnter()
	arg_13_0.atelierCompositeConfirmView:didEnter()
	arg_13_0.atelierCompositeResultView:didEnter()
	onButton(arg_13_0, arg_13_0._tf:Find("Top/TopBar/Back"), function()
		arg_13_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0._tf:Find("Top/TopBar/Home"), function()
		arg_13_0:quickExitFunc()
	end, SFX_CANCEL)
	onButton(arg_13_0, arg_13_0._tf:Find("Top/TopBar/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n(arg_13_0.helpStr)
		})
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0._tf:Find("Top/TopBar/StoreHouse"), function()
		arg_13_0:OnClickStore()
	end, SFX_PANEL)
	pg.UIMgr.GetInstance():OverlayPanel(arg_13_0.top)

	if arg_13_0.unlockSystem then
		if arg_13_0.contextData.formulaId then
			local var_13_0 = arg_13_0.activity:GetFormulas()[arg_13_0.contextData.formulaId]

			arg_13_0:ShowFormulaDetail(var_13_0)
		else
			arg_13_0:DispalyChat(arg_13_0.chatText.idle)
			arg_13_0:ShowFormulaList()
		end
	end

	arg_13_0:PlayGuide()
end

function var_0_0.PlayGuide(arg_18_0)
	if arg_18_0.unlockSystem and PlayerPrefs.GetInt(string.format("first_enter_ryza_atelier_%s_%s", getProxy(PlayerProxy):getRawData().id, arg_18_0.activity.id), 0) == 0 then
		triggerButton(arg_18_0._tf:Find("Top/TopBar/Help"))
		PlayerPrefs.SetInt(string.format("first_enter_ryza_atelier_%s_%s", getProxy(PlayerProxy):getRawData().id, arg_18_0.activity.id), 1)
	end
end

function var_0_0.willExit(arg_19_0)
	arg_19_0.loader:Clear()
	arg_19_0:LoadingOff()
	arg_19_0:HideChat()
	arg_19_0:ClearSound()
	arg_19_0.atelierMaterialsPreview:HideMaterialsPreview()
	arg_19_0.atelierCompositeResultView:HideCompositeResult()
	arg_19_0.atelierCompositeConfirmView:HideCompositeConfirmWindow()
	arg_19_0.atelierMaterialSelectView:HideCandicatePanel()
	arg_19_0:HideFormulaDetail()
	arg_19_0:HideFormulaList()
	arg_19_0.atelierFormulaListView:willExit()

	arg_19_0.atelierFormulaListView = nil

	arg_19_0.atelierFormulaDetailView:willExit()

	arg_19_0.atelierFormulaDetailView = nil

	arg_19_0.atelierMaterialSelectView:willExit()

	arg_19_0.atelierMaterialSelectView = nil

	arg_19_0.atelierMaterialsPreview:willExit()

	arg_19_0.atelierMaterialsPreview = nil

	arg_19_0.atelierCompositeConfirmView:willExit()

	arg_19_0.atelierCompositeConfirmView = nil

	arg_19_0.atelierCompositeResultView:willExit()

	arg_19_0.atelierCompositeResultView = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_19_0.top, arg_19_0._tf)

	if arg_19_0.nodePools then
		for iter_19_0, iter_19_1 in pairs(arg_19_0.nodePools) do
			iter_19_1:ClearItems()
		end
	end
end

function var_0_0.UpdateRyzaDrop(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	updateDrop(arg_20_1, arg_20_2)
	SetCompomentEnabled(arg_20_1:Find("icon_bg"), typeof(Image), false)
	setActive(arg_20_1:Find("bg"), false)
	setActive(arg_20_1:Find("icon_bg/frame"), false)
	setActive(arg_20_1:Find("icon_bg/stars"), false)

	local var_20_0 = arg_20_2:getConfig("rarity")

	if arg_20_2.type == DROP_TYPE_EQUIP or arg_20_2.type == DROP_TYPE_EQUIPMENT_SKIN then
		var_20_0 = var_20_0 - 1
	end

	local var_20_1 = "icon_frame_" .. var_20_0

	if arg_20_3 then
		var_20_1 = var_20_1 .. "_small"
	end

	arg_20_0.loader:GetSpriteQuiet(arg_20_0.commonBundleName, var_20_1, arg_20_1)

	if arg_20_2.type ~= DROP_TYPE_RYZA_DROP then
		onButton(arg_20_0, arg_20_1, function()
			arg_20_0:emit(var_0_0.ON_DROP, arg_20_2)
		end, SFX_PANEL)
	else
		removeOnButton(arg_20_1)
	end
end

function var_0_0.UpdateRyzaItem(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = "icon_frame_" .. arg_22_2:GetRarity()

	if arg_22_3 then
		var_22_0 = var_22_0 .. "_small"
	end

	arg_22_0.loader:GetSpriteQuiet(arg_22_0.commonBundleName, var_22_0, arg_22_1)
	arg_22_0.loader:GetSpriteQuiet(arg_22_2:GetIconPath(), "", arg_22_1:Find("Icon"))

	if not IsNil(arg_22_1:Find("Lv")) then
		setText(arg_22_1:Find("Lv/Text"), arg_22_2:GetLevel())
	end

	local var_22_1 = arg_22_2:GetProps()
	local var_22_2 = CustomIndexLayer.Clone2Full(arg_22_1:Find("List"), #var_22_1)

	for iter_22_0, iter_22_1 in ipairs(var_22_2) do
		arg_22_0.loader:GetSpriteQuiet(arg_22_0.commonBundleName, "element_" .. AtelierFormulaCircle.ELEMENT_NAME[var_22_1[iter_22_0]], iter_22_1)
	end

	if not IsNil(arg_22_1:Find("Text")) then
		setText(arg_22_1:Find("Text"), arg_22_2.count)
	end
end

function var_0_0.OnClickFormula(arg_23_0, arg_23_1)
	arg_23_0:HideFormulaList()
	arg_23_0:ShowFormulaDetail(arg_23_1)
	arg_23_0:DispalyChat(arg_23_0.chatText.clickFormula)
	arg_23_0:PlaySoundEffect(arg_23_0.soundStr.clickFormula)
end

function var_0_0.OnClickFormulaBack(arg_24_0)
	arg_24_0:HideFormulaDetail()

	arg_24_0.contextData.formulaId = nil

	arg_24_0:ShowFormulaList()
end

function var_0_0.ShowMaterialSelectWindow(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_0:DispalyChat(arg_25_0.chatText.showMaterialSelectWindow)
	arg_25_0:PlaySoundEffect(arg_25_0.soundStr.showMaterialSelectWindow)
	arg_25_0.atelierMaterialSelectView:ShowCandicatePanel(arg_25_1, arg_25_2, arg_25_3)
end

function var_0_0.ShowCompositeConfirmWindow(arg_26_0, arg_26_1)
	arg_26_0.atelierCompositeConfirmView:ShowCompositeConfirmWindow(arg_26_1)
end

function var_0_0.OnSelectMaterial(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0:DispalyChat(arg_27_0.chatText.selectMaterial)
	arg_27_0:PlaySoundEffect(arg_27_0.soundStr.selectMaterial)
	arg_27_0.atelierFormulaDetailView:FillNode(arg_27_1, arg_27_2)
end

function var_0_0.RefreshEmptyPanel(arg_28_0)
	setActive(arg_28_0.layerEmpty, not arg_28_0.unlockSystem)
	setActive(arg_28_0.painting, arg_28_0.unlockSystem)
end

function var_0_0.ShowFormulaList(arg_29_0)
	arg_29_0:AddIdleTimer()
	arg_29_0.atelierFormulaListView:ShowFormulaList()
end

function var_0_0.HideFormulaList(arg_30_0)
	if not arg_30_0.layerFormulaPanel then
		return
	end

	arg_30_0:RemoveIdleTimer()
	setParent(arg_30_0.layerFormulaPanel, arg_30_0._tf)
	setActive(arg_30_0.layerFormulaPanel, false)

	return true
end

function var_0_0.ShowFormulaDetail(arg_31_0, arg_31_1)
	arg_31_0.contextData.formulaId = arg_31_1:GetConfigID()

	arg_31_0.atelierFormulaDetailView:Show(arg_31_1)
	setParent(arg_31_0.layerFormulaOverlayPanel, arg_31_0.top)
	arg_31_0.layerFormulaOverlayPanel:SetSiblingIndex(0)
	setParent(arg_31_0.painting, arg_31_0.layerFormulaOverlayPanel)
	setActive(arg_31_0.materialSelectPanel, false)
end

function var_0_0.HideFormulaDetail(arg_32_0)
	if not isActive(arg_32_0.layerFormulaDetailPanel) then
		return
	end

	arg_32_0.atelierMaterialSelectView:HideCandicatePanel()
	setParent(arg_32_0.painting, arg_32_0._tf)
	arg_32_0.painting:SetSiblingIndex(1)
	setParent(arg_32_0.layerFormulaOverlayPanel, arg_32_0.layerFormulaDetailPanel)
	setActive(arg_32_0.layerFormulaDetailPanel, false)

	return true
end

function var_0_0.ShowMaterialsPreview(arg_33_0)
	arg_33_0.atelierMaterialsPreview:ShowMaterialsPreview(arg_33_0.atelierFormulaDetailView.nodeList)
end

function var_0_0.DispalyChat(arg_34_0, arg_34_1)
	arg_34_0:HideChat()
	setActive(arg_34_0.chat, true)

	arg_34_0.chatTween = LeanTween.delayedCall(go(arg_34_0.chat), 4, System.Action(function()
		arg_34_0:HideChat()
	end)).uniqueId

	local var_34_0 = arg_34_1[math.random(#arg_34_1)]
	local var_34_1 = pg.gametip[arg_34_0.tipStr].tip
	local var_34_2 = _.detect(var_34_1, function(arg_36_0)
		return arg_36_0[1] == var_34_0
	end)
	local var_34_3 = var_34_2 and var_34_2[2]

	setText(arg_34_0.chat:Find("Text"), var_34_3)

	local var_34_4 = arg_34_0:GetSoundPath() .. var_34_0

	arg_34_0:PlaySound(var_34_4)
end

function var_0_0.GetSoundPath(arg_37_0)
	local var_37_0 = 1090001

	return "event:/cv/" .. var_37_0 .. "/"
end

function var_0_0.PlaySoundEffect(arg_38_0, arg_38_1)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_38_1)
end

function var_0_0.ShowItemDetail(arg_39_0, arg_39_1)
	arg_39_0:emit(AtelierMaterialDetailMediator.SHOW_DETAIL, arg_39_1)
end

function var_0_0.LoadingOn(arg_40_0)
	if arg_40_0.animating then
		return
	end

	arg_40_0.animating = true

	pg.UIMgr.GetInstance():LoadingOn(false)
end

function var_0_0.LoadingOff(arg_41_0)
	if not arg_41_0.animating then
		return
	end

	pg.UIMgr.GetInstance():LoadingOff()

	arg_41_0.animating = false
end

function var_0_0.PlaySound(arg_42_0, arg_42_1, arg_42_2)
	if not arg_42_0.playbackInfo or arg_42_1 ~= arg_42_0.prevCvPath or arg_42_0.playbackInfo.channelPlayer == nil then
		arg_42_0:StopSound()
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_42_1, function(arg_43_0)
			if arg_43_0 then
				arg_42_0.playbackInfo = arg_43_0

				arg_42_0.playbackInfo:SetIgnoreAutoUnload(true)

				if arg_42_2 then
					arg_42_2(arg_42_0.playbackInfo.cueInfo)
				end
			elseif arg_42_2 then
				arg_42_2()
			end
		end)

		arg_42_0.prevCvPath = arg_42_1

		if arg_42_0.playbackInfo == nil then
			return nil
		end

		return arg_42_0.playbackInfo.cueInfo
	elseif arg_42_0.playbackInfo then
		arg_42_0.playbackInfo:PlaybackStop()
		arg_42_0.playbackInfo:SetStartTimeAndPlay()

		if arg_42_2 then
			arg_42_2(arg_42_0.playbackInfo.cueInfo)
		end

		return arg_42_0.playbackInfo.cueInfo
	elseif arg_42_2 then
		arg_42_2()
	end

	return nil
end

function var_0_0.StopSound(arg_44_0)
	if arg_44_0.playbackInfo then
		pg.CriMgr.GetInstance():StopPlaybackInfoForce(arg_44_0.playbackInfo)
		arg_44_0.playbackInfo:SetIgnoreAutoUnload(false)
	end
end

function var_0_0.ClearSound(arg_45_0)
	arg_45_0:StopSound()

	if arg_45_0.playbackInfo then
		arg_45_0.playbackInfo:Dispose()

		arg_45_0.playbackInfo = nil
	end
end

function var_0_0.HideChat(arg_46_0)
	if arg_46_0.chatTween then
		LeanTween.cancel(arg_46_0.chatTween)

		arg_46_0.chatTween = nil
	end

	setActive(arg_46_0.chat, false)
end

function var_0_0.AddIdleTimer(arg_47_0)
	arg_47_0:RemoveIdleTimer()

	arg_47_0.idleTimer = Timer.New(function()
		arg_47_0:DispalyChat(arg_47_0.chatText.idle)
		arg_47_0:AddIdleTimer()
	end, 8 + math.random() * 4)

	arg_47_0.idleTimer:Start()
end

function var_0_0.RemoveIdleTimer(arg_49_0)
	if not arg_49_0.idleTimer then
		return
	end

	arg_49_0.idleTimer:Stop()

	arg_49_0.idleTimer = nil
end

function var_0_0.GetAtelierCompositEffect(arg_50_0)
	return "laisha_lianjin"
end

function var_0_0.GetAtelierCompositEffectPos(arg_51_0)
	return Vector2.zero
end

function var_0_0.OnCompositeResult(arg_52_0, arg_52_1)
	arg_52_0:LoadingOn()
	arg_52_0:DispalyChat(arg_52_0.chatText.compositeResult)

	local var_52_0 = 1.5
	local var_52_1 = 0.5

	arg_52_0.loader:GetPrefab("ui/" .. arg_52_0:GetAtelierCompositEffect(), "", function(arg_53_0)
		pg.UIMgr.GetInstance():OverlayPanel(tf(arg_53_0))
		setAnchoredPosition(arg_53_0, arg_52_0:GetAtelierCompositEffectPos())
		arg_52_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_52_0._tf, typeof(CanvasGroup)), 0, var_52_0):setFrom(1)
		arg_52_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_52_0.top, typeof(CanvasGroup)), 0, var_52_0):setFrom(1)
		arg_52_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_52_0.compositeConfirmPanel, typeof(CanvasGroup)), 0, var_52_0):setFrom(1)
		arg_52_0:managedTween(LeanTween.delayedCall, function()
			arg_52_0.atelierCompositeConfirmView:HideCompositeConfirmWindow()
			setCanvasGroupAlpha(arg_52_0.compositeConfirmPanel, 1)
			arg_52_0:CleanNodeInstance()
			arg_52_0.atelierCompositeResultView:ShowCompositeResult(arg_52_1)
			arg_52_0:DispalyChat(arg_52_0.chatText.compositeResult2)
			arg_52_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_52_0._tf, typeof(CanvasGroup)), 1, var_52_1):setFrom(0)
			arg_52_0:managedTween(LeanTween.alphaCanvas, nil, GetComponent(arg_52_0.top, typeof(CanvasGroup)), 1, var_52_1):setFrom(0)
			arg_52_0:managedTween(LeanTween.alphaCanvas, nil, GetOrAddComponent(arg_52_0.compositeResultPanel, typeof(CanvasGroup)), 1, var_52_1):setFrom(0)
			arg_52_0:managedTween(LeanTween.delayedCall, function()
				arg_52_0:LoadingOff()
				pg.UIMgr.GetInstance():UnOverlayPanel(tf(arg_53_0), arg_52_0._tf)
				arg_52_0.loader:ClearRequest("CompositeResult")
			end, go(arg_52_0.compositeResultPanel), var_52_1, nil)
		end, go(arg_52_0.compositeResultPanel), var_52_0, nil)
	end, "CompositeResult")
end

function var_0_0.OnReceiveFormualRequest(arg_56_0, arg_56_1)
	arg_56_0.atelierMaterialSelectView:HideCandicatePanel()
	arg_56_0.atelierCompositeConfirmView:HideCompositeConfirmWindow()
	arg_56_0.atelierCompositeResultView:HideCompositeResult()
	arg_56_0.atelierMaterialsPreview:HideMaterialsPreview()
	arg_56_0:HideFormulaList()

	local var_56_0 = arg_56_0.activity:GetFormulas()[arg_56_1]

	arg_56_0:ShowFormulaDetail(var_56_0)
end

function var_0_0.CleanNodeInstance(arg_57_0)
	local var_57_0 = arg_57_0.activity:GetFormulas()[arg_57_0.contextData.formulaId]

	if not var_57_0:IsAvaliable() then
		arg_57_0:HideFormulaDetail()

		arg_57_0.contextData.formulaId = nil

		arg_57_0:ShowFormulaList()

		return
	end

	_.each(arg_57_0.atelierFormulaDetailView.nodeList, function(arg_58_0)
		arg_58_0.Instance = nil
		arg_58_0.Change = true
	end)
	arg_57_0:ShowFormulaDetail(var_57_0)
end

function var_0_0.onBackPressed(arg_59_0)
	if arg_59_0.animating then
		return true
	end

	if arg_59_0.atelierMaterialsPreview:HideMaterialsPreview() then
		return true
	end

	if arg_59_0.atelierCompositeResultView:HideCompositeResult() then
		return true
	end

	if arg_59_0.atelierCompositeConfirmView:HideCompositeConfirmWindow() then
		return true
	end

	if arg_59_0.atelierMaterialSelectView:HideCandicatePanel() then
		return true
	end

	if arg_59_0:HideFormulaDetail() then
		arg_59_0.contextData.formulaId = nil

		arg_59_0:ShowFormulaList()

		return true
	end

	arg_59_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0

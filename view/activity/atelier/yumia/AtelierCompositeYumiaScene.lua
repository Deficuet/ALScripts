local var_0_0 = class("AtelierCompositeYumiaScene", import("view.activity.Atelier.base.AtelierCompositeBaseScene"))

function var_0_0.getUIName(arg_1_0)
	return "AtelierCompositeYumiaUI"
end

function var_0_0.InitCustom(arg_2_0)
	arg_2_0.layerEmpty = arg_2_0:findTF("bg/Empty")

	setText(arg_2_0:findTF("bg/Empty/bg/Text"), i18n(arg_2_0.unlockText))

	arg_2_0.painting = arg_2_0:findTF("bg/painting")
	arg_2_0.topBar = arg_2_0:findTF("Top/TopBar")
	arg_2_0.chat = arg_2_0:findTF("bg/Chat")

	setActive(arg_2_0.chat, false)
end

function var_0_0.InitStr(arg_3_0)
	arg_3_0.bundleName = "ui/AtelierCompositeYumiaUI_atlas"
	arg_3_0.commonBundleName = "ui/AtelierCommonYumiaUI_atlas"
	arg_3_0.chatText = {
		idle = {
			"atelier_yumia_1"
		},
		clickFormula = {
			"atelier_yumia_2",
			"atelier_yumia_3",
			"atelier_yumia_4"
		},
		showMaterialSelectWindow = {
			"atelier_yumia_2",
			"atelier_yumia_3",
			"atelier_yumia_4"
		},
		selectMaterial = {
			"atelier_yumia_5",
			"atelier_atellier6",
			"atelier_atellier7"
		},
		compositeResult = {
			"atelier_atellier8",
			"atelier_atellier9"
		},
		compositeResult2 = {
			"atelier_atellier10",
			"atelier_atellier11"
		}
	}
	arg_3_0.soundStr = {
		formulaDetailUnlock = "event:/ui/ryza_atellier_ui_3",
		showMaterialSelectWindow = "event:/ui/ryza_atellier_ui_1",
		compositeConfirm = "event:/ui/ryza_atellier_ui_6",
		selectMaterial = "event:/ui/ryza_atellier_ui_2",
		formulaDetail = "event:/ui/ryza_atellier_ui_5",
		clickFormula = "event:/ui/ryza_atellier_ui_1",
		formulaDetailFill = "event:/ui/ryza_atellier_ui_4"
	}
	arg_3_0.helpStr = "ryza_composite_help_tip"
	arg_3_0.tipStr = "yumia_atelier_tip22"
	arg_3_0.unlockText = "yumia_atelier_tip1"
end

function var_0_0.InitView(arg_4_0)
	arg_4_0.atelierFormulaListView = AtelierFormulaListYumiaView.New(arg_4_0.layerFormulaPanel, arg_4_0)
	arg_4_0.atelierFormulaDetailView = AtelierFormulaDetailYumiaView.New(arg_4_0.layerFormulaDetailPanel, arg_4_0)
	arg_4_0.atelierMaterialSelectView = AtelierMaterialSelectYumiaView.New(arg_4_0.materialSelectPanel, arg_4_0)
	arg_4_0.atelierMaterialsPreview = AtelierFormulaMaterialsPreviewYumia.New(arg_4_0.materialsPreviewPanel, arg_4_0)
	arg_4_0.atelierCompositeConfirmView = AtelierCompositeConfirmYumiaView.New(arg_4_0.compositeConfirmPanel, arg_4_0)
	arg_4_0.atelierCompositeResultView = AtelierCompositeResultYumiaView.New(arg_4_0.compositeResultPanel, arg_4_0)
end

function var_0_0.RefreshEmptyPanel(arg_5_0)
	setActive(arg_5_0.layerEmpty, not arg_5_0.unlockSystem)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0:UpdateAdapt()
	var_0_0.super.didEnter(arg_6_0)
end

function var_0_0.UpdateAdapt(arg_7_0)
	local var_7_0 = 1.3333333333333333
	local var_7_1 = 2.1666666666666665
	local var_7_2 = pg.CameraFixMgr.GetInstance()
	local var_7_3 = var_7_2.currentWidth / var_7_2.currentHeight
	local var_7_4 = math.clamp(var_7_3, var_7_0, var_7_1)

	arg_7_0._tf:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_7_4
	arg_7_0.top:GetComponent(typeof(AspectRatioFitter)).aspectRatio = var_7_4
end

function var_0_0.OnClickStore(arg_8_0)
	local var_8_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(AtelierCompositeMediator)

	addSubLayer(Context.New({
		mediator = AtelierStoreBaseMediator,
		viewComponent = AtelierStoreYumiaScene,
		data = {
			activity = arg_8_0.activity
		}
	}), var_8_0)
end

function var_0_0.ShowFormulaList(arg_9_0)
	arg_9_0:AddIdleTimer()
	arg_9_0.atelierFormulaListView:ShowFormulaList()
end

function var_0_0.ShowFormulaDetail(arg_10_0, arg_10_1)
	arg_10_0.contextData.formulaId = arg_10_1:GetConfigID()

	arg_10_0.atelierFormulaDetailView:Show(arg_10_1)
	setActive(arg_10_0.materialSelectPanel, false)
end

function var_0_0.HideFormulaDetail(arg_11_0)
	arg_11_0:ShowTopBar(true)

	if not isActive(arg_11_0.layerFormulaDetailPanel) then
		return
	end

	arg_11_0.atelierMaterialSelectView:HideCandicatePanel()
	arg_11_0.atelierFormulaDetailView:HideDescriptionView()
	setActive(arg_11_0.layerFormulaDetailPanel, false)

	return true
end

function var_0_0.ShowMaterialSelectWindow(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0.atelierFormulaDetailView:HideDescriptionView()
	arg_12_0.atelierFormulaDetailView:HideCompositePanel()
	var_0_0.super.ShowMaterialSelectWindow(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
end

function var_0_0.RefreshScrollViewPosition(arg_13_0)
	arg_13_0.atelierFormulaDetailView:RefreshScrollViewPosition()
end

function var_0_0.ShowTopBar(arg_14_0, arg_14_1)
	setActive(arg_14_0.topBar, arg_14_1)
end

function var_0_0.UpdateRyzaDrop(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	updateDrop(arg_15_1, arg_15_2)
	SetCompomentEnabled(arg_15_0:findTF("icon_bg", arg_15_1), typeof(Image), false)
	setActive(arg_15_0:findTF("bg", arg_15_1), false)
	setActive(arg_15_0:findTF("icon_bg/frame", arg_15_1), false)
	setActive(arg_15_0:findTF("icon_bg/stars", arg_15_1), false)

	local var_15_0 = arg_15_2:getConfig("rarity")

	if arg_15_2.type == DROP_TYPE_EQUIP or arg_15_2.type == DROP_TYPE_EQUIPMENT_SKIN then
		var_15_0 = var_15_0 - 1
	end

	local var_15_1 = ItemRarity.Rarity2Print(var_15_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_15_1, arg_15_0:findTF("icon_bg", arg_15_1))

	if arg_15_2.type ~= DROP_TYPE_RYZA_DROP then
		onButton(arg_15_0, arg_15_1, function()
			arg_15_0:emit(var_0_0.ON_DROP, arg_15_2)
		end, SFX_PANEL)
	else
		removeOnButton(arg_15_1)
	end
end

function var_0_0.UpdateRyzaItem(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	AtelierTools.UpdateYumiaItem(arg_17_1, arg_17_2)
end

function var_0_0.GetAtelierCompositEffect(arg_18_0)
	return "youmiya_lianjinhecheng"
end

function var_0_0.GetAtelierCompositEffectPos(arg_19_0)
	return Vector2(0, 100)
end

function var_0_0.AddIdleTimer(arg_20_0)
	local var_20_0 = GetComponent(arg_20_0._tf, typeof(Animation))

	if var_20_0:IsPlaying("anim_composite_in") then
		arg_20_0:RemoveIdleTimer()

		arg_20_0.idleTimer = FrameTimer.New(function()
			if not var_20_0:IsPlaying("anim_composite_in") then
				arg_20_0:DispalyChat(arg_20_0.chatText.idle)
				arg_20_0:AddChatTimer()

				return
			end
		end, 1, -1)

		arg_20_0.idleTimer:Start()
	else
		arg_20_0:AddChatTimer()
	end
end

function var_0_0.AddChatTimer(arg_22_0)
	arg_22_0:RemoveIdleTimer()

	arg_22_0.idleTimer = Timer.New(function()
		arg_22_0:DispalyChat(arg_22_0.chatText.idle)
		arg_22_0:AddIdleTimer()
	end, 8 + math.random() * 4)

	arg_22_0.idleTimer:Start()
end

function var_0_0.DispalyChat(arg_24_0, arg_24_1)
	if GetComponent(arg_24_0._tf, typeof(Animation)):IsPlaying("anim_composite_in") then
		return
	end

	var_0_0.super.DispalyChat(arg_24_0, arg_24_1)
	arg_24_0.painting:Find("root"):GetComponent("Animation"):Play("anim_composite_formulalist_talk")
end

function var_0_0.GetSoundPath(arg_25_0)
	local var_25_0 = 1130001

	return "event:/cv/" .. var_25_0 .. "/"
end

function var_0_0.PlaySoundEffect(arg_26_0, arg_26_1)
	return
end

function var_0_0.ClearSound(arg_27_0)
	return
end

function var_0_0.PlayGuide(arg_28_0)
	return
end

return var_0_0

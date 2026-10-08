local var_0_0 = class("ShipBluePrintScene", import("..base.BaseUI"))
local var_0_1 = pg.ship_data_blueprint
local var_0_2 = pg.ship_data_template
local var_0_3 = pg.ship_data_breakout
local var_0_4 = 3
local var_0_5 = -10
local var_0_6 = 2.3
local var_0_7 = 0.3

function var_0_0.getUIName(arg_1_0)
	return "ShipBluePrintUI"
end

function var_0_0.setVersion(arg_2_0, arg_2_1)
	arg_2_0.version = arg_2_1
end

function var_0_0.setShipVOs(arg_3_0, arg_3_1)
	arg_3_0.shipVOs = arg_3_1
end

function var_0_0.getShipById(arg_4_0, arg_4_1)
	return arg_4_0.shipVOs[arg_4_1]
end

function var_0_0.setTaskVOs(arg_5_0, arg_5_1)
	arg_5_0.taskVOs = arg_5_1
end

function var_0_0.getTaskById(arg_6_0, arg_6_1)
	return arg_6_0.taskVOs[arg_6_1] or Task.New({
		id = arg_6_1
	})
end

function var_0_0.getItemById(arg_7_0, arg_7_1)
	return getProxy(BagProxy):getItemById(arg_7_1) or Item.New({
		count = 0,
		id = arg_7_1
	})
end

function var_0_0.setShipBluePrints(arg_8_0, arg_8_1)
	arg_8_0.bluePrintByIds = arg_8_1
end

function var_0_0.updateShipBluePrintVO(arg_9_0, arg_9_1)
	if arg_9_1 then
		arg_9_0.bluePrintByIds[arg_9_1.id] = arg_9_1
	end

	arg_9_0:initShips()
end

function var_0_0.init(arg_10_0)
	arg_10_0.main = arg_10_0._tf:Find("main")
	arg_10_0.centerPanel = arg_10_0.main:Find("center_panel")
	arg_10_0.blurPanel = arg_10_0._tf:Find("blur_panel")
	arg_10_0.top = arg_10_0.blurPanel:Find("adapt")
	arg_10_0.topPanel = arg_10_0.top:Find("top")
	arg_10_0.topBg = arg_10_0.blurPanel:Find("top_bg")
	arg_10_0.backBtn = arg_10_0.top:Find("top/back")
	arg_10_0.leftPanle = arg_10_0.top:Find("left_panel")
	arg_10_0.bottomPanel = arg_10_0.top:Find("bottom_panel")
	arg_10_0.rightPanel = arg_10_0.top:Find("right_panel")
	arg_10_0.shipContainer = arg_10_0.bottomPanel:Find("ships/bg/content")
	arg_10_0.shipTpl = arg_10_0.bottomPanel:Find("ship_tpl")
	arg_10_0.versionBtn = arg_10_0.bottomPanel:Find("ships/bg/version/version_btn")
	arg_10_0.eyeTF = arg_10_0.leftPanle:Find("eye")
	arg_10_0.painting = arg_10_0._tf:Find("main/center_panel/painting")
	arg_10_0.nameTF = arg_10_0.centerPanel:Find("name")
	arg_10_0.shipName = arg_10_0.nameTF:Find("name_mask/Text")
	arg_10_0.shipType = arg_10_0.nameTF:Find("type")
	arg_10_0.englishName = arg_10_0.nameTF:Find("english_name")
	arg_10_0.shipInfoStarTpl = arg_10_0.nameTF:Find("star_tpl")

	setActive(arg_10_0.shipInfoStarTpl, false)

	arg_10_0.stars = arg_10_0.nameTF:Find("stars")
	arg_10_0.initBtn = arg_10_0.leftPanle:Find("property_panel/btns/init_toggle")
	arg_10_0.attrBtn = arg_10_0.leftPanle:Find("property_panel/btns/attr_toggle")
	arg_10_0.attrDisableBtn = arg_10_0.leftPanle:Find("property_panel/btns/attr_toggle/disable")
	arg_10_0.initPanel = arg_10_0.leftPanle:Find("property_panel/init_panel")
	arg_10_0.propertyPanel = PropertyPanel.New(arg_10_0.initPanel, 32)

	setText(arg_10_0.initPanel:Find("property_title1/Text"), i18n("blueprint_combatperformance"))
	setText(arg_10_0.initPanel:Find("property_title2/Text"), i18n("blueprint_shipperformance"))

	arg_10_0.skillRect = arg_10_0.leftPanle:Find("property_panel/init_panel/skills_rect")
	arg_10_0.skillPanel = arg_10_0.leftPanle:Find("property_panel/init_panel/skills_rect/skills")
	arg_10_0.skillTpl = arg_10_0.skillPanel:Find("skilltpl")
	arg_10_0.skillArrLeft = arg_10_0.leftPanle:Find("property_panel/init_panel/arrow1")
	arg_10_0.skillArrRight = arg_10_0.leftPanle:Find("property_panel/init_panel/arrow2")
	arg_10_0.simulationBtn = arg_10_0.leftPanle:Find("property_panel/init_panel/property_title2/simulation")
	arg_10_0.attrPanel = arg_10_0.leftPanle:Find("property_panel/attr_panel")
	arg_10_0.modAdditionPanel = arg_10_0.leftPanle:Find("property_panel/attr_panel")
	arg_10_0.modAdditionContainer = arg_10_0.modAdditionPanel:Find("scroll_rect/content")
	arg_10_0.modAdditionTpl = arg_10_0.modAdditionContainer:Find("addition_tpl")
	arg_10_0.preViewBtn = arg_10_0.attrPanel:Find("pre_view")
	arg_10_0.stateInfo = arg_10_0.centerPanel:Find("state_info")
	arg_10_0.startBtn = arg_10_0.centerPanel:Find("state_info/start_btn")
	arg_10_0.lockPanel = arg_10_0.centerPanel:Find("state_info/lock_panel")
	arg_10_0.lockBtn = arg_10_0.lockPanel:Find("lock")
	arg_10_0.finishedBtn = arg_10_0.centerPanel:Find("state_info/finished_btn")
	arg_10_0.progressPanel = arg_10_0.centerPanel:Find("state_info/progress")

	setText(arg_10_0.progressPanel:Find("label"), i18n("blueprint_researching"))

	arg_10_0.progressContainer = arg_10_0.progressPanel:Find("content")
	arg_10_0.progressTpl = arg_10_0.progressContainer:Find("item")
	arg_10_0.openCondition = arg_10_0.centerPanel:Find("state_info/open_condition")
	arg_10_0.speedupBtn = arg_10_0._tf:Find("main/speedup_btn")
	arg_10_0.taskListPanel = arg_10_0.rightPanel:Find("task_list")
	arg_10_0.taskContainer = arg_10_0.rightPanel:Find("task_list/scroll/content")
	arg_10_0.taskTpl = arg_10_0.taskContainer:Find("task_tpl")
	arg_10_0.modPanel = arg_10_0.rightPanel:Find("mod_panel")
	arg_10_0.attrContainer = arg_10_0.modPanel:Find("desc/atrrs")
	arg_10_0.levelSlider = arg_10_0.modPanel:Find("title/slider"):GetComponent(typeof(Slider))
	arg_10_0.levelSliderTxt = arg_10_0.modPanel:Find("title/slider/Text")
	arg_10_0.preLevelSlider = arg_10_0.modPanel:Find("title/pre_slider"):GetComponent(typeof(Slider))
	arg_10_0.modLevel = arg_10_0.modPanel:Find("title/level_bg/Text"):GetComponent(typeof(Text))
	arg_10_0.needLevelTxt = arg_10_0.modPanel:Find("title/Text"):GetComponent(typeof(Text))
	arg_10_0.phantomPanel = arg_10_0.rightPanel:Find("phantom_panel")
	arg_10_0.rtPhantomQuestContainer = arg_10_0.phantomPanel:Find("desc/content")
	arg_10_0.questTpl = arg_10_0.rtPhantomQuestContainer:GetChild(0)
	arg_10_0.btnPhantom = arg_10_0.top:Find("phantomBtn")
	arg_10_0.calcPanel = arg_10_0.modPanel:Find("desc/calc_panel")
	arg_10_0.calcMinusBtn = arg_10_0.calcPanel:Find("calc/base/minus")
	arg_10_0.calcPlusBtn = arg_10_0.calcPanel:Find("calc/base/plus")
	arg_10_0.calcTxt = arg_10_0.calcPanel:Find("calc/base/count/Text")
	arg_10_0.calcMaxBtn = arg_10_0.calcPanel:Find("calc/max")
	arg_10_0.itemInfo = arg_10_0.calcPanel:Find("item_bg")
	arg_10_0.itemInfoIcon = arg_10_0.itemInfo:Find("icon")
	arg_10_0.itemInfoCount = arg_10_0.itemInfo:Find("kc")
	arg_10_0.modBtn = arg_10_0.calcPanel:Find("confirm_btn")
	arg_10_0.fittingBtn = arg_10_0.modPanel:Find("desc/fitting_btn")
	arg_10_0.fittingBtnEffect = arg_10_0.fittingBtn:Find("anim/ShipBlue02")
	arg_10_0.fittingPanel = arg_10_0.rightPanel:Find("fitting_panel")

	setActive(arg_10_0.fittingPanel, false)

	arg_10_0.fittingAttrPanel = arg_10_0.fittingPanel:Find("desc/middle")
	arg_10_0.phasePic = arg_10_0.fittingPanel:Find("title/phase")
	arg_10_0.phaseSlider = arg_10_0.fittingPanel:Find("desc/top/slider"):GetComponent(typeof(Slider))
	arg_10_0.phaseSliderTxt = arg_10_0.fittingPanel:Find("desc/top/precent")
	arg_10_0.prePhaseSlider = arg_10_0.fittingPanel:Find("desc/top/pre_slider"):GetComponent(typeof(Slider))
	arg_10_0.fittingNeedMask = arg_10_0.fittingPanel:Find("desc/top/mask")
	arg_10_0.fittingCalcPanel = arg_10_0.fittingPanel:Find("desc/bottom")
	arg_10_0.fittingCalcMinusBtn = arg_10_0.fittingCalcPanel:Find("calc/base/minus")
	arg_10_0.fittingCalcPlusBtn = arg_10_0.fittingCalcPanel:Find("calc/base/plus")
	arg_10_0.fittingCalcTxt = arg_10_0.fittingCalcPanel:Find("calc/base/count/Text")
	arg_10_0.fittingCalcMaxBtn = arg_10_0.fittingCalcPanel:Find("calc/max")
	arg_10_0.fittingItemInfo = arg_10_0.fittingCalcPanel:Find("item_bg")
	arg_10_0.fittingItemInfoIcon = arg_10_0.fittingItemInfo:Find("icon")
	arg_10_0.fittingItemInfoCount = arg_10_0.fittingItemInfo:Find("kc")
	arg_10_0.fittingConfirmBtn = arg_10_0.fittingCalcPanel:Find("confirm_btn")
	arg_10_0.fittingCancelBtn = arg_10_0.fittingCalcPanel:Find("cancel_btn")
	arg_10_0.msgPanel = arg_10_0.blurPanel:Find("msg_panel")

	setActive(arg_10_0.msgPanel, false)

	arg_10_0.versionPanel = arg_10_0._tf:Find("version_panel")

	setActive(arg_10_0.versionPanel, false)

	arg_10_0.preViewer = arg_10_0._tf:Find("preview")
	arg_10_0.preViewerFrame = arg_10_0._tf:Find("preview/frame")

	setText(arg_10_0.preViewerFrame:Find("bg/title/Image"), i18n("word_preview"))
	setActive(arg_10_0.preViewer, false)

	arg_10_0.sea = arg_10_0.preViewerFrame:Find("sea")
	arg_10_0.rawImage = arg_10_0.sea:GetComponent("RawImage")

	setActive(arg_10_0.rawImage, false)

	arg_10_0.seaLoading = arg_10_0.preViewerFrame:Find("bg/loading")
	arg_10_0.healTF = arg_10_0._tf:Find("resources/heal")
	arg_10_0.healTF.transform.localPosition = Vector3(-360, 50, 40)

	setActive(arg_10_0.healTF, false)

	arg_10_0.stages = arg_10_0.preViewerFrame:Find("stageScrollRect/stages")
	arg_10_0.breakView = arg_10_0.preViewerFrame:Find("content/Text")
	arg_10_0.previewAttrPanel = arg_10_0._tf:Find("preview/attrs_panel/attr_panel")
	arg_10_0.previewAttrContainer = arg_10_0.previewAttrPanel:Find("content")

	setText(arg_10_0._tf:Find("preview/attrs_panel/Text"), i18n("meta_energy_preview_tip"))
	setText(arg_10_0._tf:Find("preview/attrs_panel/desc"), i18n("meta_energy_preview_title"))

	arg_10_0.helpBtn = arg_10_0.top:Find("helpBtn")
	arg_10_0.exchangeBtn = arg_10_0.top:Find("exchangeBtn")
	arg_10_0.itemUnlockBtn = arg_10_0.top:Find("itemUnlockBtn")
	arg_10_0.bottomWidth = arg_10_0.bottomPanel.rect.height
	arg_10_0.topWidth = arg_10_0.topPanel.rect.height * 2
	arg_10_0.taskTFs = {}
	arg_10_0.leanTweens = {}
	arg_10_0.unlockPanel = arg_10_0.blurPanel:Find("unlock_panel")

	setActive(arg_10_0.unlockPanel, false)

	arg_10_0.svQuickExchange = BlueprintQuickExchangeView.New(arg_10_0._tf, arg_10_0.event)
end

function var_0_0.didEnter(arg_11_0)
	local var_11_0 = getProxy(TechnologyProxy):getConfigMaxVersion()

	if not arg_11_0.contextData.shipBluePrintVO then
		local var_11_1 = {}

		for iter_11_0 = 1, var_11_0 do
			var_11_1[iter_11_0] = 0
		end

		for iter_11_1, iter_11_2 in pairs(arg_11_0.bluePrintByIds) do
			local var_11_2 = iter_11_2:getConfig("blueprint_version")

			var_11_1[var_11_2] = var_11_1[var_11_2] + (iter_11_2.state == ShipBluePrint.STATE_UNLOCK and 1 or 0)

			if iter_11_2.state == ShipBluePrint.STATE_DEV then
				arg_11_0.contextData.shipBluePrintVO = arg_11_0.contextData.shipBluePrintVO or iter_11_2

				break
			end
		end

		if not arg_11_0.contextData.shipBluePrintVO then
			for iter_11_3 = 1, var_11_0 do
				arg_11_0.version = iter_11_3

				if var_11_1[iter_11_3] <= 4 then
					break
				end
			end

			arg_11_0:emit(ShipBluePrintMediator.SET_TECHNOLOGY_VERSION, arg_11_0.version)
		end
	end

	arg_11_0:switchHide()
	arg_11_0:initShips()
	onButton(arg_11_0, arg_11_0.speedupBtn, function()
		arg_11_0:emit(ShipBluePrintMediator.ON_CLICK_SPEEDUP_BTN)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.backBtn, function()
		arg_11_0:closeView()
	end, SOUND_BACK)
	onButton(arg_11_0, arg_11_0.startBtn, function()
		if not arg_11_0.contextData.shipBluePrintVO then
			return
		end

		local var_14_0 = arg_11_0.contextData.shipBluePrintVO.id

		arg_11_0:emit(ShipBluePrintMediator.ON_START, var_14_0)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.finishedBtn, function()
		if not arg_11_0.contextData.shipBluePrintVO then
			return
		end

		local var_15_0 = arg_11_0.contextData.shipBluePrintVO.id

		arg_11_0:emit(ShipBluePrintMediator.ON_FINISHED, var_15_0)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.itemUnlockBtn, function()
		if not arg_11_0.contextData.shipBluePrintVO then
			return
		end

		arg_11_0:showUnlockPanel()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.preViewBtn, function()
		arg_11_0:openPreView()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.seaLoading, function()
		if not arg_11_0.previewer then
			arg_11_0:showBarrage()
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.preViewer, function()
		arg_11_0:closePreview()
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.eyeTF, function()
		if arg_11_0.isSwitchAnim then
			return
		end

		arg_11_0:switchHide()
		arg_11_0:switchState(var_0_7, not arg_11_0.flag)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.main, function()
		if arg_11_0.isSwitchAnim then
			return
		end

		if not arg_11_0.flag then
			arg_11_0:switchHide()
			arg_11_0:switchState(var_0_7, not arg_11_0.flag)
		end
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[isActive(arg_11_0.fittingPanel) and "help_shipblueprintui_luck" or "help_shipblueprintui"].tip
		})
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.exchangeBtn, function()
		arg_11_0.svQuickExchange:Load()
		arg_11_0.svQuickExchange:ActionInvoke("Show")
		arg_11_0.svQuickExchange:ActionInvoke("UpdateBlueprint", arg_11_0.contextData.shipBluePrintVO)
	end)
	setText(arg_11_0.modPanel:Find("switch/Text"), i18n("tech_shadow_change_button_1"))
	onButton(arg_11_0, arg_11_0.modPanel:Find("switch"), function()
		arg_11_0:switchState(var_0_7, true, function()
			arg_11_0.isPhantom = true

			setActive(arg_11_0.phantomPanel, arg_11_0.isPhantom)
			setActive(arg_11_0.modPanel, not arg_11_0.isPhantom)
		end)
	end, SFX_PANEL)
	setText(arg_11_0.phantomPanel:Find("switch/Text"), i18n("tech_shadow_change_button_2"))
	onButton(arg_11_0, arg_11_0.phantomPanel:Find("switch"), function()
		arg_11_0:switchState(var_0_7, true, function()
			arg_11_0.isPhantom = false

			setActive(arg_11_0.phantomPanel, arg_11_0.isPhantom)
			setActive(arg_11_0.modPanel, not arg_11_0.isPhantom)
		end)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.btnPhantom, function()
		arg_11_0:emit(ShipBluePrintMediator.OPEN_PHANTOM_LAYER, arg_11_0.version)
	end, SFX_PANEL)
	arg_11_0:OverlayPanel(arg_11_0.blurPanel, {
		pbList = {
			arg_11_0.rightPanel:Find("task_list"),
			arg_11_0.rightPanel:Find("mod_panel"),
			arg_11_0.leftPanle:Find("property_panel"),
			arg_11_0.bottomPanel:Find("ships/bg")
		}
	})
	setText(arg_11_0.msgPanel:Find("window/top/bg/infomation/title"), i18n("title_info"))
	onButton(arg_11_0, arg_11_0.msgPanel:Find("window/top/btnBack"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.msgPanel, arg_11_0.top)
		setActive(arg_11_0.msgPanel, false)
	end, SFX_CANCEL)
	setText(arg_11_0.msgPanel:Find("window/confirm_btn/Text"), i18n("text_confirm"))
	onButton(arg_11_0, arg_11_0.msgPanel:Find("window/confirm_btn"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.msgPanel, arg_11_0.top)
		setActive(arg_11_0.msgPanel, false)
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.msgPanel:Find("bg"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.msgPanel, arg_11_0.top)
		setActive(arg_11_0.msgPanel, false)
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.unlockPanel:Find("window/top/btnBack"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.unlockPanel, arg_11_0.top)
		setActive(arg_11_0.unlockPanel, false)
	end, SFX_CANCEL)
	setText(arg_11_0.unlockPanel:Find("window/confirm_btn/Text"), i18n("text_confirm"))
	setText(arg_11_0.unlockPanel:Find("window/cancel_btn/Text"), i18n("text_cancel"))
	setText(arg_11_0.unlockPanel:Find("window/top/bg/infomation/title"), i18n("title_info"))
	onButton(arg_11_0, arg_11_0.unlockPanel:Find("window/cancel_btn"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.unlockPanel, arg_11_0.top)
		setActive(arg_11_0.unlockPanel, false)
	end, SFX_CANCEL)
	onButton(arg_11_0, arg_11_0.unlockPanel:Find("bg"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.unlockPanel, arg_11_0.top)
		setActive(arg_11_0.unlockPanel, false)
	end, SFX_CANCEL)
	GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", "version_" .. arg_11_0.version, arg_11_0.versionBtn)
	arg_11_0:updateVersionBtnTip()

	if var_11_0 > 1 then
		onButton(arg_11_0, arg_11_0.versionBtn, function()
			if arg_11_0.cbTimer then
				return
			end

			setActive(arg_11_0.versionPanel, true)
			pg.UIMgr.GetInstance():BlurPanel(arg_11_0.versionPanel)
		end, SFX_PANEL)
		onButton(arg_11_0, arg_11_0.versionPanel:Find("bg"), function()
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.versionPanel, arg_11_0._tf)
			setActive(arg_11_0.versionPanel, false)
		end, SFX_CANCEL)

		local var_11_3 = UIItemList.New(arg_11_0.versionPanel:Find("window/content"), arg_11_0.versionPanel:Find("window/content/version_1"))

		var_11_3:make(function(arg_37_0, arg_37_1, arg_37_2)
			arg_37_1 = arg_37_1 + 1

			if arg_37_0 == UIItemList.EventUpdate then
				arg_37_2.name = "version_" .. arg_37_1

				GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", "newVersion_" .. arg_37_1, arg_37_2:Find("image"))

				if arg_11_0.version == arg_37_1 then
					setActive(arg_37_2:Find("choose"), true)
				else
					setActive(arg_37_2:Find("choose"), false)
				end

				onButton(arg_11_0, arg_37_2, function()
					arg_11_0.version = arg_37_1

					arg_11_0:emit(ShipBluePrintMediator.SET_TECHNOLOGY_VERSION, arg_11_0.version)

					arg_11_0.contextData.shipBluePrintVO = nil

					GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", "version_" .. arg_11_0.version, arg_11_0.versionBtn)
					arg_11_0:initShips()
					arg_11_0:updateVersionBtnTip()
					var_11_3:align(var_11_0)
					pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0.versionPanel, arg_11_0._tf)
					setActive(arg_11_0.versionPanel, false)
				end, SFX_CANCEL)
			end
		end)
		var_11_3:align(var_11_0)
		arg_11_0:updateVersionPanelBtnTip()
	end

	LeanTween.alpha(rtf(arg_11_0.skillArrLeft), 0.25, 1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
	LeanTween.alpha(rtf(arg_11_0.skillArrRight), 0.25, 1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
end

function var_0_0.updateVersionBtnTip(arg_39_0)
	local var_39_0 = getProxy(TechnologyProxy)
	local var_39_1 = var_39_0:getConfigMaxVersion()
	local var_39_2 = {}

	for iter_39_0 = 1, var_39_1 do
		if iter_39_0 ~= arg_39_0.version then
			table.insert(var_39_2, iter_39_0)
		end
	end

	setActive(arg_39_0.versionBtn:Find("tip"), var_39_0:CheckPursuingCostTip(var_39_2))
end

function var_0_0.updateVersionPanelBtnTip(arg_40_0)
	local var_40_0 = getProxy(TechnologyProxy)
	local var_40_1 = var_40_0:getConfigMaxVersion()

	for iter_40_0 = 1, var_40_1 do
		setActive(arg_40_0.versionPanel:Find("window/content/version_" .. iter_40_0 .. "/tip"), var_40_0:CheckPursuingCostTip({
			iter_40_0
		}))
	end
end

function var_0_0.updateAllPursuingCostTip(arg_41_0)
	arg_41_0:updateVersionBtnTip()
	arg_41_0:updateVersionPanelBtnTip()

	for iter_41_0, iter_41_1 in pairs(arg_41_0.bluePrintItems) do
		iter_41_1:updatePursuingTip()
	end
end

function var_0_0.switchHide(arg_42_0)
	local var_42_0 = not arg_42_0.flag

	LeanTween.cancel(arg_42_0.bottomPanel)
	LeanTween.cancel(arg_42_0.topPanel)
	LeanTween.cancel(arg_42_0.topBg)

	if var_42_0 then
		LeanTween.moveY(arg_42_0.bottomPanel, 0, var_0_7)
		LeanTween.moveY(arg_42_0.topPanel, 0, var_0_7)
		LeanTween.moveY(arg_42_0.topBg, 0, var_0_7)
	else
		LeanTween.moveY(arg_42_0.bottomPanel, -arg_42_0.bottomWidth, var_0_7)
		LeanTween.moveY(arg_42_0.topPanel, arg_42_0.topWidth, var_0_7)
		LeanTween.moveY(arg_42_0.topBg, arg_42_0.topWidth, var_0_7)
	end

	setActive(arg_42_0.nameTF, var_42_0)
	setActive(arg_42_0.stateInfo, var_42_0)
	setActive(arg_42_0.helpBtn, var_42_0)
	setActive(arg_42_0.exchangeBtn, var_42_0)
	setActive(arg_42_0.btnPhantom, var_42_0)
	setImageAlpha(arg_42_0.itemUnlockBtn, var_42_0 and 1 or 0)
	setImageRaycastTarget(arg_42_0.itemUnlockBtn, var_42_0)
	setImageAlpha(arg_42_0.speedupBtn, var_42_0 and 1 or 0)
	setImageRaycastTarget(arg_42_0.speedupBtn, var_42_0)
end

function var_0_0.switchState(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4)
	local var_43_0 = {}

	if arg_43_0.flag then
		table.insert(var_43_0, function(arg_44_0)
			arg_43_0.flag = false

			arg_43_0:switchUI(arg_43_1, {
				-arg_43_0.leftPanle.rect.width - 400,
				arg_43_0.rightPanel.rect.width + 400
			}, arg_44_0)
		end)
	end

	table.insert(var_43_0, function(arg_45_0)
		existCall(arg_43_3)

		return arg_45_0()
	end)

	if arg_43_2 then
		table.insert(var_43_0, function(arg_46_0)
			arg_43_0.flag = true

			if arg_43_0.isFate or arg_43_0.isPhantom then
				arg_43_0:switchUI(arg_43_1, {
					-arg_43_0.leftPanle.rect.width - 400,
					0,
					-arg_43_0.leftPanle.rect.width / 2
				}, arg_46_0)
			else
				arg_43_0:switchUI(arg_43_1, {
					0,
					0,
					0
				}, arg_46_0)
			end
		end)
	end

	seriesAsync(var_43_0, arg_43_4)
end

function var_0_0.switchUI(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	LeanTween.cancel(arg_47_0.leftPanle)
	LeanTween.cancel(arg_47_0.rightPanel)
	LeanTween.cancel(arg_47_0.centerPanel)

	arg_47_0.isSwitchAnim = true

	parallelAsync({
		function(arg_48_0)
			LeanTween.moveX(arg_47_0.leftPanle, arg_47_2[1], arg_47_1):setOnComplete(System.Action(arg_48_0))
		end,
		function(arg_49_0)
			LeanTween.moveX(arg_47_0.rightPanel, arg_47_2[2], arg_47_1):setOnComplete(System.Action(arg_49_0))
		end,
		function(arg_50_0)
			if arg_47_2[3] then
				LeanTween.moveX(arg_47_0.centerPanel, arg_47_2[3], arg_47_1):setOnComplete(System.Action(arg_50_0))
			else
				arg_50_0()
			end
		end
	}, function()
		arg_47_0.isSwitchAnim = false

		return arg_47_3()
	end)
end

function var_0_0.createShipItem(arg_52_0, arg_52_1)
	local var_52_0 = {
		init = function(arg_53_0)
			arg_53_0._go = arg_52_1
			arg_53_0._tf = tf(arg_52_1)
			arg_53_0.icon = arg_53_0._tf:Find("icon")
			arg_53_0.state = arg_53_0._tf:Find("state")
			arg_53_0.count = arg_53_0._tf:Find("count")
			arg_53_0.tip = arg_53_0._tf:Find("tip")
		end,
		update = function(arg_54_0, arg_54_1, arg_54_2)
			SetCompomentEnabled(arg_54_0._tf, typeof(Toggle), arg_54_1.id > 0)

			arg_54_0.shipBluePrintVO = arg_54_1

			setActive(arg_54_0.state, arg_54_0.shipBluePrintVO.id > 0)
			setActive(arg_54_0.count, arg_54_0.shipBluePrintVO.id > 0)

			if arg_54_0.shipBluePrintVO.id > 0 then
				local var_54_0 = "shipdesignicon/" .. arg_54_0.shipBluePrintVO:getShipVO():getPainting()

				LoadSpriteAsync(var_54_0, function(arg_55_0)
					if arg_54_0.shipBluePrintVO.id > 0 and string.find(arg_55_0.name, arg_54_0.shipBluePrintVO:getShipVO():getPainting()) then
						setImageSprite(arg_54_0.icon, arg_55_0)
					end
				end)

				local var_54_1 = {
					tip = false,
					pursuing = arg_54_1:isPursuing(),
					fate = arg_54_1:canFateSimulation()
				}

				switch(arg_54_1.state, {
					[ShipBluePrint.STATE_LOCK] = function()
						var_54_1.state = "lock" .. (arg_54_1:getUnlockItem() and "_item" or "")
					end,
					[ShipBluePrint.STATE_DEV] = function()
						var_54_1.state = "research"
					end,
					[ShipBluePrint.STATE_DEV_FINISHED] = function()
						var_54_1.state = var_54_1.fate and "fate" or "dev"
						var_54_1.tip = true
					end,
					[ShipBluePrint.STATE_UNLOCK] = function()
						var_54_1.state = var_54_1.fate and "fate" or "dev"
					end
				})
				setText(arg_54_0.count, arg_54_2.count > 999 and "999+" or arg_54_2.count)
				setActive(arg_54_0.count:Find("icon"), not var_54_1.pursuing)
				setActive(arg_54_0.count:Find("icon_2"), var_54_1.pursuing)
				setText(arg_54_0.state:Find("dev/Text"), arg_54_0.shipBluePrintVO.level)

				if var_54_1.fate then
					GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", "icon_phase_" .. arg_54_0.shipBluePrintVO.fateLevel, arg_54_0.state:Find("fate/Image"), true)
				end

				eachChild(arg_54_0.state, function(arg_60_0)
					setActive(arg_60_0, arg_60_0.name == var_54_1.state)
				end)
				setActive(arg_54_0.tip, var_54_1.tip)
			else
				local var_54_2 = "shipdesignicon/empty"

				LoadSpriteAsync(var_54_2, function(arg_61_0)
					if arg_54_0.shipBluePrintVO.id < 0 then
						setImageSprite(arg_54_0.icon, arg_61_0)
					end
				end)
				setActive(arg_54_0.tip, false)
			end
		end,
		updateSelectedStyle = function(arg_62_0, arg_62_1)
			local var_62_0 = arg_62_1 and 0 or -25

			LeanTween.cancel(arg_62_0.icon)
			LeanTween.moveY(arg_62_0.icon, var_62_0, 0.1)
		end,
		updatePursuingTip = function(arg_63_0)
			setActive(arg_63_0.count:Find("icon_2/tip"), arg_63_0.shipBluePrintVO.id > 0 and arg_63_0.shipBluePrintVO:isPursuingCostTip())
		end
	}

	var_52_0:init()
	onButton(arg_52_0, var_52_0.count:Find("icon_2"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("blueprint_catchup_by_gold_help")
		})
	end, SFX_PANEL)

	return var_52_0
end

function var_0_0.initShips(arg_65_0)
	arg_65_0:checkStory()
	arg_65_0:filterBlueprints()

	if not arg_65_0.itemList then
		arg_65_0.bluePrintItems = {}
		arg_65_0.itemList = UIItemList.New(arg_65_0.shipContainer, arg_65_0.shipContainer:Find("ship_tpl"))

		arg_65_0.itemList:make(function(arg_66_0, arg_66_1, arg_66_2)
			if arg_66_0 == UIItemList.EventUpdate then
				onToggle(arg_65_0, arg_66_2, function(arg_67_0)
					if arg_67_0 then
						if arg_65_0.cbTimer then
							arg_65_0.cbTimer:Stop()

							arg_65_0.cbTimer = nil
						end

						arg_65_0:clearLeanTween()

						arg_65_0.contextData.shipBluePrintVO = arg_65_0.bluePrintItems[arg_66_2].shipBluePrintVO

						if arg_65_0.nowShipId ~= arg_65_0.contextData.shipBluePrintVO.id then
							arg_65_0.nowShipId = arg_65_0.contextData.shipBluePrintVO.id

							arg_65_0:switchState(var_0_7, true, function()
								arg_65_0:setSelectedBluePrint()
							end)
						else
							arg_65_0:setSelectedBluePrint()
						end
					end

					arg_65_0.bluePrintItems[arg_66_2]:updateSelectedStyle(arg_67_0)
				end, SFX_PANEL)

				arg_65_0.bluePrintItems[arg_66_2] = arg_65_0.bluePrintItems[arg_66_2] or arg_65_0:createShipItem(arg_66_2)

				local var_66_0 = arg_65_0.filterBlueprintVOs[arg_66_1 + 1]

				if var_66_0.id > 0 then
					local var_66_1 = var_66_0:getItemId()
					local var_66_2 = arg_65_0:getItemById(var_66_1)

					arg_65_0.bluePrintItems[arg_66_2]:update(var_66_0, var_66_2)
					arg_65_0.bluePrintItems[arg_66_2]:updatePursuingTip()
				else
					arg_65_0.bluePrintItems[arg_66_2]:update(var_66_0, nil)
				end

				triggerToggle(arg_66_2, false)
			end
		end)
	end

	setActive(arg_65_0.shipContainer, false)
	arg_65_0.itemList:align(#arg_65_0.filterBlueprintVOs)
	setActive(arg_65_0.shipContainer, true)

	if not arg_65_0.contextData.shipBluePrintVO or underscore.all(arg_65_0.filterBlueprintVOs, function(arg_69_0)
		return arg_65_0.contextData.shipBluePrintVO.id ~= arg_69_0.id
	end) then
		arg_65_0.contextData.shipBluePrintVO = arg_65_0.filterBlueprintVOs[1]
	end

	eachChild(arg_65_0.shipContainer, function(arg_70_0)
		if arg_65_0.contextData.shipBluePrintVO.id == arg_65_0.bluePrintItems[arg_70_0].shipBluePrintVO.id then
			triggerToggle(arg_70_0, true)
		end
	end)
end

function var_0_0.filterBlueprints(arg_71_0)
	if arg_71_0.contextData.shipBluePrintVO then
		arg_71_0.version = arg_71_0.contextData.shipBluePrintVO:getConfig("blueprint_version")

		arg_71_0:emit(ShipBluePrintMediator.SET_TECHNOLOGY_VERSION, arg_71_0.version)
	end

	arg_71_0.filterBlueprintVOs = {}

	local var_71_0 = 0

	for iter_71_0, iter_71_1 in pairs(arg_71_0.bluePrintByIds) do
		if iter_71_1:getConfig("blueprint_version") == arg_71_0.version then
			table.insert(arg_71_0.filterBlueprintVOs, iter_71_1)

			var_71_0 = var_71_0 + 1
		end
	end

	for iter_71_2 = var_71_0, 5 do
		table.insert(arg_71_0.filterBlueprintVOs, {
			id = -1,
			state = -1
		})
	end

	table.sort(arg_71_0.filterBlueprintVOs, CompareFuncs({
		function(arg_72_0)
			return -arg_72_0.state
		end,
		function(arg_73_0)
			return arg_73_0.id
		end
	}))
end

function var_0_0.getSelectedBluePrintResList(arg_74_0, arg_74_1)
	local var_74_0 = {}
	local var_74_1 = arg_74_1:getShipVO():getPainting()
	local var_74_2 = arg_74_1:getTaskIds()

	table.insert(var_74_0, "painting/" .. var_74_1)

	if checkABExist("painting/" .. var_74_1 .. "_blueprint") then
		table.insert(var_74_0, "painting/" .. var_74_1 .. "_blueprint")
	end

	if PLATFORM_CODE == PLATFORM_CH then
		if checkABExist("painting/" .. var_74_1 .. "_hx") then
			table.insert(var_74_0, "painting/" .. var_74_1 .. "_hx")
		end

		if checkABExist("painting/" .. var_74_1 .. "n_hx") then
			table.insert(var_74_0, "painting/" .. var_74_1 .. "n_hx")
		end

		if checkABExist("painting/" .. var_74_1 .. "n") then
			table.insert(var_74_0, "painting/" .. var_74_1 .. "n")
		end
	end

	if arg_74_1:canFateSimulation() then
		for iter_74_0 = 1, arg_74_1:getMaxFateLevel() do
			local var_74_3 = arg_74_1:getFateStrengthenConfig(iter_74_0)

			if var_74_3 and var_74_3.special == 1 and type(var_74_3.special_effect) == "table" then
				for iter_74_1, iter_74_2 in ipairs(var_74_3.special_effect) do
					if iter_74_2[1] == ShipBluePrint.STRENGTHEN_TYPE_CHANGE_SKILL then
						local var_74_4 = iter_74_2[2][2]

						if var_74_4 then
							table.insert(var_74_0, "tecfateskillicon/skill_" .. var_74_4)
							table.insert(var_74_0, "tecfateskillicon/skill_on_" .. var_74_4)
						end

						break
					end
				end
			end
		end
	end

	return var_74_0
end

function var_0_0.downloadSelectedBluePrintResList(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0:getSelectedBluePrintResList(arg_75_1)

	SplitPackConst.DownloadByLuaArr(var_75_0, function()
		if arg_75_0.exited then
			return
		end

		arg_75_2()
	end)
end

function var_0_0.setSelectedBluePrint(arg_77_0)
	assert(arg_77_0.contextData.shipBluePrintVO, "should exist blue print")

	local var_77_0 = arg_77_0.contextData.shipBluePrintVO

	arg_77_0:downloadSelectedBluePrintResList(var_77_0, function()
		arg_77_0:updateInfo()
		arg_77_0:updatePainting()
		arg_77_0:updateProperty()

		local var_78_0 = var_77_0:isUnlock()

		setActive(arg_77_0.taskListPanel, not var_78_0)
		setActive(arg_77_0.attrDisableBtn, not var_78_0)

		if var_78_0 then
			if not var_77_0:canFateSimulation() or not pg.NewStoryMgr.GetInstance():IsPlayed(var_77_0:getConfig("luck_story")) then
				arg_77_0.isFate = false
			end

			arg_77_0:updateMod()
			arg_77_0:updatePhantomQuest()
		else
			arg_77_0.isFate = false

			arg_77_0:updateTaskList()
			triggerToggle(arg_77_0.initBtn, true)
		end

		setActive(arg_77_0.phantomPanel, var_78_0 and arg_77_0.isPhantom)
		setActive(arg_77_0.fittingPanel, var_78_0 and arg_77_0.isFate)
		setActive(arg_77_0.modPanel, var_78_0 and not arg_77_0.isFate and not arg_77_0.isPhantom)
		setActive(arg_77_0.itemUnlockBtn, not var_78_0 and var_77_0:getUnlockItem())

		if var_77_0:isDeving() then
			arg_77_0:emit(ShipBluePrintMediator.ON_CHECK_TAKES, var_77_0.id)
		end
	end)
end

function var_0_0.updateMod(arg_79_0)
	if arg_79_0.noUpdateMod then
		return
	end

	local var_79_0 = arg_79_0.contextData.shipBluePrintVO

	if not var_79_0 or not var_79_0:isUnlock() or not var_79_0:isFetched() then
		return
	end

	arg_79_0:updateModPanel()
	arg_79_0:updateModAdditionPanel()
end

function var_0_0.updateModInfo(arg_80_0, arg_80_1)
	local var_80_0 = arg_80_0:getShipById(arg_80_1.shipId)
	local var_80_1 = arg_80_0.contextData.shipBluePrintVO
	local var_80_2 = intProperties(var_80_1:getShipProperties(var_80_0))
	local var_80_3 = intProperties(arg_80_1:getShipProperties(var_80_0))
	local var_80_4 = Clone(arg_80_1)

	var_80_4.level = var_80_4:getMaxLevel()

	local var_80_5 = intProperties(var_80_4:getShipProperties(var_80_0))

	local function var_80_6(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
		local var_81_0 = arg_81_0:Find("attr_bg/name")
		local var_81_1 = arg_81_0:Find("attr_bg/value")
		local var_81_2 = arg_81_0:Find("attr_bg/max")
		local var_81_3 = arg_81_0:Find("slider"):GetComponent(typeof(Slider))
		local var_81_4 = arg_81_0:Find("pre_slider"):GetComponent(typeof(Slider))
		local var_81_5 = arg_81_0:Find("exp")

		if arg_80_1:isMaxLevel() then
			arg_81_3 = arg_81_2
		end

		setText(var_81_2, arg_81_3)
		setText(var_81_0, AttributeType.Type2Name(arg_81_1))
		setText(var_81_1, arg_81_2)

		local var_81_6, var_81_7 = var_80_1:getBluePrintAddition(arg_81_1)
		local var_81_8 = table.indexof(ShipModAttr.BLUEPRINT_ATTRS, arg_81_1)
		local var_81_9 = var_80_1:getExpRetio(var_81_8)

		var_81_3.value = var_81_7 / var_81_9

		local var_81_10, var_81_11 = arg_80_1:getBluePrintAddition(arg_81_1)
		local var_81_12 = arg_80_1:getExpRetio(var_81_8)

		setText(var_81_5, math.floor(var_81_11) .. "/" .. var_81_9)

		var_81_4.value = math.floor(var_81_10) > math.floor(var_81_6) and 1 or var_81_11 / var_81_12
	end

	local var_80_7 = 0

	for iter_80_0, iter_80_1 in pairs(var_80_3) do
		if table.contains(ShipModAttr.BLUEPRINT_ATTRS, iter_80_0) then
			local var_80_8 = arg_80_0.attrContainer:Find(iter_80_0)

			var_80_7 = var_80_7 + 1

			var_80_6(var_80_8, iter_80_0, iter_80_1, var_80_5[iter_80_0] or 0)
		end
	end

	arg_80_0.modLevel.text = arg_80_0:formatModLvTxt(arg_80_1.level, arg_80_1:getMaxLevel())

	local var_80_9 = var_80_1:getNextLevelExp()

	if var_80_9 == -1 then
		arg_80_0.levelSlider.value = 1
	else
		arg_80_0.levelSlider.value = var_80_1.exp / var_80_9
	end

	local var_80_10 = arg_80_1:getNextLevelExp()

	if var_80_10 == -1 then
		setText(arg_80_0.levelSliderTxt, "MAX")

		arg_80_0.preLevelSlider.value = 1
	else
		setText(arg_80_0.levelSliderTxt, arg_80_1.exp .. "/" .. arg_80_1:getNextLevelExp())

		arg_80_0.preLevelSlider.value = arg_80_1.level > var_80_1.level and 1 or arg_80_1.exp / var_80_10
	end

	local var_80_11, var_80_12 = arg_80_1:isShipModMaxLevel(var_80_0)

	setActive(arg_80_0.needLevelTxt, var_80_11)
	setActive(arg_80_0.levelSliderTxt, not var_80_11)

	if var_80_11 then
		setText(arg_80_0.needLevelTxt, i18n("buleprint_need_level_tip", var_80_12))

		arg_80_0.levelSlider.value = 1
	end
end

function var_0_0.inModAnim(arg_82_0)
	return arg_82_0.inAnim
end

function var_0_0.formatModLvTxt(arg_83_0, arg_83_1, arg_83_2)
	return "<size=45>" .. arg_83_1 .. "</size>/<size=27>" .. arg_83_2 .. "</size>"
end

local var_0_8 = 0.2

function var_0_0.doModAnim(arg_84_0, arg_84_1, arg_84_2)
	arg_84_0:clearLeanTween()

	arg_84_0.inAnim = true

	local var_84_0 = {}
	local var_84_1 = arg_84_2:getMaxLevel()

	if arg_84_1.level ~= var_84_1 then
		local function var_84_2(arg_85_0, arg_85_1, arg_85_2)
			arg_85_0 = Clone(arg_85_0)
			arg_85_0.level = arg_85_1
			arg_85_0.exp = arg_85_2

			return arg_85_0
		end

		arg_84_0.preLevelSlider.value = 0

		for iter_84_0 = arg_84_1.level, arg_84_2.level do
			local var_84_3 = iter_84_0 == arg_84_1.level and arg_84_1.exp / arg_84_1:getNextLevelExp() or 0
			local var_84_4 = iter_84_0 == arg_84_2.level and arg_84_2.level ~= var_84_1 and arg_84_2.exp / arg_84_2:getNextLevelExp() or 1

			table.insert(var_84_0, function(arg_86_0)
				TweenValue(go(arg_84_0.levelSlider), var_84_3, var_84_4, var_0_8, nil, function(arg_87_0)
					arg_84_0.levelSlider.value = arg_87_0
				end, function()
					local var_88_0 = iter_84_0 == arg_84_1.level and arg_84_1 or var_84_2(arg_84_1, iter_84_0, 0)
					local var_88_1 = iter_84_0 == arg_84_2.level and arg_84_2 or var_84_2(arg_84_1, iter_84_0 + 1, 0)

					arg_84_0:doAttrsAinm(var_88_0, var_88_1, arg_86_0)

					arg_84_0.modLevel.text = arg_84_0:formatModLvTxt(var_88_1.level, var_84_1)
				end)
			end)
		end

		table.insert(arg_84_0.leanTweens, arg_84_0.levelSlider)
	else
		var_84_1 = arg_84_2:getMaxFateLevel()

		local function var_84_5(arg_89_0, arg_89_1, arg_89_2)
			arg_89_0 = Clone(arg_89_0)
			arg_89_0.fateLevel = arg_89_1
			arg_89_0.exp = arg_89_2

			return arg_89_0
		end

		arg_84_0.prePhaseSlider.value = 0

		for iter_84_1 = arg_84_1.fateLevel, arg_84_2.fateLevel do
			local var_84_6 = iter_84_1 == arg_84_1.fateLevel and arg_84_1.exp / arg_84_1:getNextFateLevelExp() or 0
			local var_84_7 = iter_84_1 == arg_84_2.fateLevel and arg_84_2.fateLevel ~= var_84_1 and arg_84_2.exp / arg_84_2:getNextFateLevelExp() or 1

			table.insert(var_84_0, function(arg_90_0)
				TweenValue(go(arg_84_0.phaseSlider), var_84_6, var_84_7, var_0_8, nil, function(arg_91_0)
					arg_84_0.phaseSlider.value = arg_91_0
				end, function()
					if iter_84_1 ~= arg_84_1.fateLevel or not arg_84_1 then
						local var_92_0 = var_84_5(arg_84_1, iter_84_1, 0)
					end

					local var_92_1 = iter_84_1 == arg_84_2.fateLevel and arg_84_2 or var_84_5(arg_84_1, iter_84_1 + 1, 0)

					arg_84_0:updateFittingAttrPanel(var_92_1)
					GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", "phase_" .. math.min(var_92_1.fateLevel + 1, var_92_1:getMaxFateLevel()), arg_84_0.phasePic, true)
					arg_90_0()
				end)
			end)
		end

		table.insert(arg_84_0.leanTweens, arg_84_0.phaseSlider)
	end

	seriesAsync(var_84_0, function()
		arg_84_0.noUpdateMod = false

		arg_84_0:updateMod()

		arg_84_0.inAnim = false
	end)
end

function var_0_0.doAttrsAinm(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	local var_94_0 = {}
	local var_94_1 = arg_94_0:getShipById(arg_94_1.shipId)
	local var_94_2 = intProperties(arg_94_1:getShipProperties(var_94_1))
	local var_94_3 = intProperties(arg_94_2:getShipProperties(var_94_1))

	for iter_94_0, iter_94_1 in ipairs(ShipModAttr.BLUEPRINT_ATTRS) do
		if iter_94_1 ~= AttributeType.AntiAircraft then
			local var_94_4 = arg_94_0.attrContainer:Find(iter_94_1)
			local var_94_5 = var_94_4:Find("attr_bg/value"):GetComponent(typeof(Text))
			local var_94_6 = var_94_4:Find("slider"):GetComponent(typeof(Slider))
			local var_94_7 = var_94_4:Find("pre_slider"):GetComponent(typeof(Slider))
			local var_94_8 = table.indexof(ShipModAttr.BLUEPRINT_ATTRS, iter_94_1)
			local var_94_9 = arg_94_1:getExpRetio(var_94_8)
			local var_94_10 = var_94_2[iter_94_1]
			local var_94_11 = var_94_3[iter_94_1]
			local var_94_12, var_94_13 = arg_94_1:getBluePrintAddition(iter_94_1)
			local var_94_14, var_94_15 = arg_94_2:getBluePrintAddition(iter_94_1)
			local var_94_16 = var_94_13 / var_94_9
			local var_94_17 = var_94_15 / var_94_9

			var_94_7.value = 0

			table.insert(var_94_0, function(arg_95_0)
				arg_94_0:doAttrAnim(var_94_6, var_94_5, var_94_16, var_94_17, math.floor(var_94_12), math.floor(var_94_14), var_94_10, var_94_11, arg_95_0)
			end)
		end
	end

	parallelAsync(var_94_0, arg_94_3)
end

local var_0_9 = 0.1

function var_0_0.doAttrAnim(arg_96_0, arg_96_1, arg_96_2, arg_96_3, arg_96_4, arg_96_5, arg_96_6, arg_96_7, arg_96_8, arg_96_9)
	table.insert(arg_96_0.leanTweens, arg_96_1)

	local var_96_0 = {}

	for iter_96_0 = arg_96_5, arg_96_6 do
		local var_96_1 = iter_96_0 == arg_96_5 and arg_96_3 or 0
		local var_96_2 = iter_96_0 == arg_96_6 and arg_96_4 or 1

		table.insert(var_96_0, function(arg_97_0)
			TweenValue(go(arg_96_1), var_96_1, var_96_2, var_0_9, nil, function(arg_98_0)
				arg_96_1.value = arg_98_0
			end, function()
				arg_96_2.text = arg_96_8 - math.min(arg_96_6 - iter_96_0, arg_96_8 - arg_96_7)

				arg_97_0()
			end)
		end)
	end

	seriesAsync(var_96_0, function()
		arg_96_9()
	end)
end

function var_0_0.clearLeanTween(arg_101_0, arg_101_1)
	for iter_101_0, iter_101_1 in pairs(arg_101_0.leanTweens) do
		if LeanTween.isTweening(go(iter_101_1)) then
			LeanTween.cancel(go(iter_101_1))
		end
	end

	if arg_101_0.inAnim then
		arg_101_0.inAnim = nil

		if not arg_101_1 then
			arg_101_0.noUpdateMod = false
		end
	end

	arg_101_0.leanTweens = {}
end

function var_0_0.updateModPanel(arg_102_0)
	local var_102_0 = arg_102_0.contextData.shipBluePrintVO
	local var_102_1 = arg_102_0:getShipById(var_102_0.shipId)
	local var_102_2 = var_102_0:getConfig("strengthen_item")
	local var_102_3 = arg_102_0:getItemById(var_102_2)
	local var_102_4 = var_102_3.count == 0 and var_102_0:isPursuing()
	local var_102_5 = 0
	local var_102_6
	local var_102_7

	if var_102_4 then
		local var_102_8 = getProxy(TechnologyProxy)

		var_102_6 = math.min(var_102_8:calcMaxPursuingCount(var_102_0), var_102_0:getUseageMaxItem())

		function var_102_7(arg_103_0)
			local var_103_0 = arg_103_0 * var_102_0:getItemExp()
			local var_103_1 = Clone(var_102_0)

			var_103_1:addExp(var_103_0)
			arg_102_0:updateModInfo(var_103_1)
			setText(arg_102_0.calcTxt, arg_103_0)

			local var_103_2 = var_102_0:isRarityUR()
			local var_103_3 = TechnologyProxy.getPursuingDiscount(var_102_8:getPursuingTimes(var_103_2) + var_102_5 + 1, var_103_2)

			setText(arg_102_0.itemInfoIcon:Find("icon_bg/count"), var_102_0:getPursuingPrice(var_103_3))
			setActive(arg_102_0.itemInfo:Find("no_cost"), var_103_3 == 0)
			setActive(arg_102_0.itemInfo:Find("discount"), var_103_3 > 0 and var_103_3 < 100)

			if var_103_3 > 0 and var_103_3 < 100 then
				setText(arg_102_0.itemInfo:Find("discount/Text"), 100 - var_103_3 .. "%OFF")
			end

			setActive(arg_102_0.modBtn:Find("pursuing_cost"), var_102_5 > 0)
			setText(arg_102_0.modBtn:Find("pursuing_cost/Text"), var_102_8:calcPursuingCost(var_102_0, arg_103_0))
		end

		local var_102_9 = {
			type = DROP_TYPE_RESOURCE,
			id = PlayerConst.ResGold
		}

		updateDrop(arg_102_0.itemInfoIcon, var_102_9)
		onButton(arg_102_0, arg_102_0.itemInfoIcon, function()
			if LOCK_TECHNOLOGY_PURSUING_TIP then
				arg_102_0:emit(BaseUI.ON_DROP, var_102_9)
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("blueprint_catchup_by_gold_help")
				})
			end
		end, SFX_PANEL)
		setScrollText(findTF(arg_102_0.itemInfo, "name/Text"), var_102_9:getConfig("name"))
		setText(arg_102_0.itemInfoCount, i18n("tec_tip_material_stock") .. ":" .. getProxy(PlayerProxy):getRawData():getResource(PlayerConst.ResGold))
		setText(arg_102_0.itemInfo:Find("no_cost/Text"), i18n("tec_tip_no_consumption"))
		setText(arg_102_0.modBtn:Find("pursuing_cost/word"), i18n("tec_tip_to_consumption"))
		onButton(arg_102_0, arg_102_0.modBtn, function()
			if arg_102_0:inModAnim() then
				return
			end

			if var_102_5 == 0 then
				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("blueprint_catchup_by_gold_confirm", var_102_8:calcPursuingCost(var_102_0, var_102_5)),
				onYes = function()
					arg_102_0:emit(ShipBluePrintMediator.ON_PURSUING, var_102_0.id, var_102_5)
				end
			})
		end, SFX_PANEL)
	else
		var_102_6 = math.min(var_102_3.count, var_102_0:getUseageMaxItem())

		function var_102_7(arg_107_0)
			local var_107_0 = arg_107_0 * var_102_0:getItemExp()
			local var_107_1 = Clone(var_102_0)

			var_107_1:addExp(var_107_0)
			arg_102_0:updateModInfo(var_107_1)
			setText(arg_102_0.calcTxt, arg_107_0)
		end

		updateDrop(arg_102_0.itemInfoIcon, {
			type = DROP_TYPE_ITEM,
			id = var_102_3.id
		})
		onButton(arg_102_0, arg_102_0.itemInfoIcon, function()
			ItemTipPanel.ShowItemTipbyID(var_102_3.id, i18n("title_item_ways", var_102_3:getConfig("name")))
		end, SFX_PANEL)
		setScrollText(findTF(arg_102_0.itemInfo, "name/Text"), var_102_3:getConfig("name"))
		setText(arg_102_0.itemInfoCount, i18n("tec_tip_material_stock") .. ":" .. var_102_3.count)
		setActive(arg_102_0.itemInfo:Find("no_cost"), false)
		setActive(arg_102_0.itemInfo:Find("discount"), false)
		setActive(arg_102_0.modBtn:Find("pursuing_cost"), false)
		onButton(arg_102_0, arg_102_0.modBtn, function()
			if arg_102_0:inModAnim() then
				return
			end

			if var_102_5 == 0 then
				return
			end

			arg_102_0:emit(ShipBluePrintMediator.ON_MOD, var_102_0.id, var_102_5)
		end, SFX_PANEL)
	end

	var_102_7(var_102_5)

	local var_102_10 = 0
	local var_102_11 = Clone(var_102_0)
	local var_102_12 = var_102_0:getItemExp()

	while var_102_11.level < var_102_11:getMaxLevel() and var_102_1.level >= var_102_11:getStrengthenConfig(math.min(var_102_11.level + 1, var_102_11:getMaxLevel())).need_lv do
		var_102_10 = var_102_10 + 1

		var_102_11:addExp(var_102_12)
	end

	local var_102_13 = math.min(var_102_6, var_102_10)

	pressPersistTrigger(arg_102_0.calcMinusBtn, 0.5, function(arg_110_0)
		if arg_102_0:inModAnim() or var_102_0:isMaxLevel() or var_102_5 == 0 then
			arg_110_0()

			return
		end

		var_102_5 = var_102_5 - 1

		var_102_7(var_102_5)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(arg_102_0.calcPlusBtn, 0.5, function(arg_111_0)
		if arg_102_0:inModAnim() or var_102_0:isMaxLevel() or var_102_5 == var_102_13 then
			arg_111_0()

			return
		end

		var_102_5 = var_102_5 + 1

		var_102_7(var_102_5)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_102_0, arg_102_0.calcMaxBtn, function()
		if arg_102_0:inModAnim() or var_102_0:isMaxLevel() or var_102_5 == var_102_13 then
			return
		end

		var_102_5 = var_102_13

		var_102_7(var_102_5)
	end, SFX_PANEL)
	setActive(arg_102_0.calcMaxBtn, not var_102_4)

	local var_102_14 = var_102_0:canFateSimulation()

	if var_102_14 then
		onButton(arg_102_0, arg_102_0.fittingBtn, function()
			if arg_102_0.isSwitchAnim then
				return
			end

			setActive(arg_102_0.fittingBtnEffect, true)

			arg_102_0.cbTimer = Timer.New(function()
				arg_102_0.cbTimer = nil

				setActive(arg_102_0.fittingBtnEffect, false)
				arg_102_0:switchState(var_0_7, true, function()
					arg_102_0.isFate = true

					setActive(arg_102_0.fittingPanel, arg_102_0.isFate)
					setActive(arg_102_0.modPanel, not arg_102_0.isFate)

					if not PlayerPrefs.HasKey("first_fate") then
						triggerButton(arg_102_0.helpBtn)
						PlayerPrefs.SetInt("first_fate", 1)
						PlayerPrefs.Save()
					end
				end)
			end, 0.6)

			arg_102_0.cbTimer:Start()
		end, SFX_PANEL)
		arg_102_0:updateFittingPanel()

		if not inGuide then
			pg.NewStoryMgr.GetInstance():Play(var_102_0:getConfig("luck_story"), function(arg_116_0)
				if arg_116_0 then
					arg_102_0:buildStartAni("fateStartWindow", function()
						triggerButton(arg_102_0.fittingBtn)
					end)
				end
			end)
		end
	end

	setActive(arg_102_0.calcPanel, not var_102_14)
	setActive(arg_102_0.fittingBtn, var_102_14)
	setActive(arg_102_0.fittingBtnEffect, false)
end

function var_0_0.updateFittingPanel(arg_118_0)
	local var_118_0 = arg_118_0.contextData.shipBluePrintVO
	local var_118_1 = arg_118_0:getShipById(var_118_0.shipId)
	local var_118_2 = var_118_0:getConfig("strengthen_item")
	local var_118_3 = arg_118_0:getItemById(var_118_2)
	local var_118_4 = var_118_3.count == 0 and var_118_0:isPursuing()
	local var_118_5 = 0
	local var_118_6
	local var_118_7

	if var_118_4 then
		local var_118_8 = getProxy(TechnologyProxy)

		var_118_6 = math.min(var_118_8:calcMaxPursuingCount(var_118_0), var_118_0:getFateUseageMaxItem())

		function var_118_7(arg_119_0)
			local var_119_0 = arg_119_0 * var_118_0:getItemExp()
			local var_119_1 = Clone(var_118_0)

			var_119_1:addExp(var_119_0)
			arg_118_0:updateFittingInfo(var_119_1)
			setText(arg_118_0.fittingCalcTxt, arg_119_0)

			local var_119_2 = var_118_0:isRarityUR()
			local var_119_3 = TechnologyProxy.getPursuingDiscount(var_118_8:getPursuingTimes(var_119_2) + var_118_5 + 1, var_119_2)

			setText(arg_118_0.fittingItemInfoIcon:Find("icon_bg/count"), var_118_0:getPursuingPrice(var_119_3))
			setActive(arg_118_0.fittingItemInfo:Find("no_cost"), var_119_3 == 0)
			setActive(arg_118_0.fittingItemInfo:Find("discount"), var_119_3 > 0 and var_119_3 < 100)

			if var_119_3 > 0 and var_119_3 < 100 then
				setText(arg_118_0.fittingItemInfo:Find("discount/Text"), 100 - var_119_3 .. "%OFF")
			end

			setActive(arg_118_0.fittingConfirmBtn:Find("pursuing_cost"), arg_119_0 > 0)
			setText(arg_118_0.fittingConfirmBtn:Find("pursuing_cost/Text"), var_118_8:calcPursuingCost(var_118_0, arg_119_0))
		end

		local var_118_9 = {
			type = DROP_TYPE_RESOURCE,
			id = PlayerConst.ResGold
		}

		updateDrop(arg_118_0.fittingItemInfoIcon, var_118_9)
		onButton(arg_118_0, arg_118_0.fittingItemInfoIcon, function()
			if LOCK_TECHNOLOGY_PURSUING_TIP then
				arg_118_0:emit(BaseUI.ON_DROP, var_118_9)
			else
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("blueprint_catchup_by_gold_help")
				})
			end
		end, SFX_PANEL)
		setScrollText(findTF(arg_118_0.fittingItemInfo, "name/Text"), var_118_9:getConfig("name"))
		setText(arg_118_0.fittingItemInfoCount, i18n("tec_tip_material_stock") .. ":" .. getProxy(PlayerProxy):getRawData():getResource(PlayerConst.ResGold))
		setText(arg_118_0.fittingItemInfo:Find("no_cost/Text"), i18n("tec_tip_no_consumption"))
		setText(arg_118_0.fittingConfirmBtn:Find("pursuing_cost/word"), i18n("tec_tip_to_consumption"))
		onButton(arg_118_0, arg_118_0.fittingConfirmBtn, function()
			if arg_118_0:inModAnim() then
				return
			end

			if var_118_5 == 0 then
				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("blueprint_catchup_by_gold_confirm", var_118_8:calcPursuingCost(var_118_0, var_118_5)),
				onYes = function()
					arg_118_0:emit(ShipBluePrintMediator.ON_PURSUING, var_118_0.id, var_118_5)
				end
			})
		end, SFX_PANEL)
	else
		var_118_6 = math.min(var_118_3.count, var_118_0:getFateUseageMaxItem())

		function var_118_7(arg_123_0)
			local var_123_0 = arg_123_0 * var_118_0:getItemExp()
			local var_123_1 = Clone(var_118_0)

			var_123_1:addExp(var_123_0)
			arg_118_0:updateFittingInfo(var_123_1)
			setText(arg_118_0.fittingCalcTxt, arg_123_0)
		end

		updateDrop(arg_118_0.fittingItemInfoIcon, {
			type = DROP_TYPE_ITEM,
			id = var_118_3.id
		})
		onButton(arg_118_0, arg_118_0.fittingItemInfoIcon, function()
			ItemTipPanel.ShowItemTipbyID(var_118_3.id, i18n("title_item_ways", var_118_3:getConfig("name")))
		end, SFX_PANEL)
		setScrollText(arg_118_0.fittingItemInfo:Find("name/Text"), var_118_3:getConfig("name"))
		setText(arg_118_0.fittingItemInfoCount, i18n("tec_tip_material_stock") .. ":" .. var_118_3.count)
		setActive(arg_118_0.fittingItemInfo:Find("no_cost"), false)
		setActive(arg_118_0.fittingItemInfo:Find("discount"), false)
		setActive(arg_118_0.fittingConfirmBtn:Find("pursuing_cost"), false)
		onButton(arg_118_0, arg_118_0.fittingConfirmBtn, function()
			if arg_118_0:inModAnim() then
				return
			end

			if var_118_5 == 0 then
				return
			end

			arg_118_0:emit(ShipBluePrintMediator.ON_MOD, var_118_0.id, var_118_5)
		end, SFX_PANEL)
	end

	setText(arg_118_0.fittingAttrPanel:Find("attr/name"), AttributeType.Type2Name(AttributeType.Luck))
	setText(arg_118_0.fittingPanel:Find("desc/top/text/Text"), i18n("fate_phase_word"))
	onButton(arg_118_0, arg_118_0.fittingCancelBtn, function()
		arg_118_0:switchState(var_0_7, true, function()
			arg_118_0.isFate = false

			setActive(arg_118_0.fittingPanel, arg_118_0.isFate)
			setActive(arg_118_0.modPanel, not arg_118_0.isFate)
		end)
	end, SFX_PANEL)

	local var_118_10 = 0
	local var_118_11 = Clone(var_118_0)
	local var_118_12 = var_118_0:getItemExp()

	while var_118_11.fateLevel < var_118_11:getMaxFateLevel() and var_118_1.level >= var_118_11:getFateStrengthenConfig(math.min(var_118_11.fateLevel + 1, var_118_11:getMaxFateLevel())).need_lv do
		var_118_10 = var_118_10 + 1

		var_118_11:addExp(var_118_12)
	end

	local var_118_13 = math.min(var_118_6, var_118_10)

	pressPersistTrigger(arg_118_0.fittingCalcMinusBtn, 0.5, function(arg_128_0)
		if arg_118_0:inModAnim() or var_118_0:isMaxFateLevel() or var_118_5 == 0 then
			arg_128_0()

			return
		end

		var_118_5 = math.max(var_118_5 - 1, 0)

		var_118_7(var_118_5)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(arg_118_0.fittingCalcPlusBtn, 0.5, function(arg_129_0)
		if arg_118_0:inModAnim() or var_118_0:isMaxFateLevel() or var_118_5 == var_118_13 then
			arg_129_0()

			return
		end

		var_118_5 = math.max(math.min(var_118_5 + 1, var_118_13), 0)

		var_118_7(var_118_5)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_118_0, arg_118_0.fittingCalcMaxBtn, function()
		if arg_118_0:inModAnim() or var_118_0:isMaxFateLevel() or var_118_5 == var_118_13 then
			return
		end

		var_118_5 = var_118_13

		var_118_7(var_118_5)
	end, SFX_PANEL)
	setActive(arg_118_0.fittingCalcMaxBtn, not var_118_4)

	local var_118_14 = arg_118_0.fittingAttrPanel:Find("phase_panel")
	local var_118_15 = var_118_14:Find("phase_tpl")

	setActive(var_118_15, false)

	local var_118_16 = {
		0,
		-60,
		0,
		60
	}
	local var_118_17 = {}

	for iter_118_0 = 1, var_118_0:getMaxFateLevel() do
		local var_118_18 = var_118_14:Find("phase_" .. iter_118_0) or cloneTplTo(var_118_15, var_118_14, "phase_" .. iter_118_0)
		local var_118_19 = var_118_0:getFateStrengthenConfig(iter_118_0)

		assert(var_118_19.special == 1 and type(var_118_19.special_effect) == "table", "without fate config")

		local var_118_20 = var_118_19.special_effect
		local var_118_21

		for iter_118_1, iter_118_2 in ipairs(var_118_20) do
			if iter_118_2[1] == ShipBluePrint.STRENGTHEN_TYPE_CHANGE_SKILL then
				var_118_21 = iter_118_2[2][2]

				break
			end
		end

		for iter_118_3, iter_118_4 in ipairs({
			"off",
			"on"
		}) do
			setActive(var_118_18:Find(iter_118_4 .. "/icon"), not var_118_21)
			setActive(var_118_18:Find(iter_118_4 .. "/skill"), var_118_21)
			setActive(var_118_18:Find(iter_118_4 .. "/icon/line"), var_118_16[iter_118_0])
			setActive(var_118_18:Find(iter_118_4 .. "/skill/line"), var_118_16[iter_118_0])

			if var_118_16[iter_118_0] then
				var_118_18:Find(iter_118_4 .. "/icon/line").localEulerAngles = Vector3(0, 0, var_118_16[iter_118_0])
				var_118_18:Find(iter_118_4 .. "/skill/line").localEulerAngles = Vector3(0, 0, var_118_16[iter_118_0])

				GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", iter_118_0 .. "_" .. iter_118_4, var_118_18:Find(iter_118_4 .. "/icon/icon"), true)
			end
		end

		if var_118_21 then
			GetImageSpriteFromAtlasAsync("tecfateskillicon/skill_" .. var_118_21, "", var_118_18:Find("off/skill/icon"), true)
			GetImageSpriteFromAtlasAsync("tecfateskillicon/skill_on_" .. var_118_21, "", var_118_18:Find("on/skill/icon"), true)

			var_118_17[iter_118_0] = 55
		else
			var_118_17[iter_118_0] = 40
		end

		onButton(arg_118_0, var_118_18, function()
			arg_118_0:showFittingMsgPanel(iter_118_0)
		end, SFX_PANEL)
	end

	local var_118_22 = Vector2.zero
	local var_118_23 = Vector2.zero
	local var_118_24 = Vector2.zero

	for iter_118_5 = 1, var_118_0:getMaxFateLevel() do
		local var_118_25 = var_118_14:Find("phase_" .. iter_118_5)

		setAnchoredPosition(var_118_25, var_118_22)

		var_118_23.x = math.min(var_118_23.x, var_118_22.x)
		var_118_23.y = math.min(var_118_23.y, var_118_22.y)
		var_118_24.x = math.max(var_118_24.x, var_118_22.x)
		var_118_24.y = math.max(var_118_24.y, var_118_22.y)

		if var_118_16[iter_118_5] then
			var_118_22 = var_118_22 + (var_118_17[iter_118_5] + var_118_17[iter_118_5 + 1]) * Vector2(math.cos(math.pi * var_118_16[iter_118_5] / 180), math.sin(math.pi * var_118_16[iter_118_5] / 180))
		end
	end

	setSizeDelta(var_118_14, var_118_24 - var_118_23)
	setAnchoredPosition(var_118_14, {
		y = -var_118_24.y
	})
	var_118_7(var_118_5)
end

function var_0_0.updateFittingInfo(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0:getShipById(arg_132_1.shipId)
	local var_132_1 = arg_132_0.contextData.shipBluePrintVO

	arg_132_0:updateFittingAttrPanel(var_132_1, arg_132_1)
	GetImageSpriteFromAtlasAsync("ui/shipblueprintui_atlas", "phase_" .. math.max(arg_132_1.fateLevel, 1), arg_132_0.phasePic, true)

	local var_132_2 = var_132_1:getNextFateLevelExp()

	if var_132_2 == -1 then
		arg_132_0.phaseSlider.value = 1
	else
		arg_132_0.phaseSlider.value = var_132_1.exp / var_132_2
	end

	local var_132_3 = arg_132_1:getNextFateLevelExp()

	if var_132_3 == -1 then
		setText(arg_132_0.phaseSliderTxt, "MAX")

		arg_132_0.prePhaseSlider.value = 1
	else
		local var_132_4 = math.floor(arg_132_1.exp / arg_132_1:getNextFateLevelExp() * 100)

		setText(arg_132_0.phaseSliderTxt, tostring(var_132_4) .. "%")

		arg_132_0.prePhaseSlider.value = arg_132_1.fateLevel > var_132_1.fateLevel and 1 or arg_132_1.exp / var_132_3
	end

	local var_132_5, var_132_6 = arg_132_1:isShipModMaxFateLevel(var_132_0)

	setActive(arg_132_0.fittingNeedMask, var_132_5)

	if var_132_5 then
		setText(arg_132_0.fittingNeedMask:Find("limit"), i18n("buleprint_need_level_tip", var_132_6))

		arg_132_0.phaseSlider.value = 1
	end
end

function var_0_0.updateFittingAttrPanel(arg_133_0, arg_133_1, arg_133_2)
	setText(arg_133_0.fittingAttrPanel:Find("attr/name/Text"), " + " .. defaultValue((arg_133_2 or arg_133_1):attrSpecialAddition()[AttributeType.Luck], 0))

	arg_133_0.blinkTarget = arg_133_0.blinkTarget or {
		{},
		{}
	}

	for iter_133_0 = 1, arg_133_1:getMaxFateLevel() do
		local var_133_0 = arg_133_0.fittingAttrPanel:Find("phase_panel/phase_" .. iter_133_0)
		local var_133_1 = var_133_0:Find("off")
		local var_133_2 = var_133_0:Find("on")

		if arg_133_2 and iter_133_0 > arg_133_1.fateLevel and iter_133_0 <= arg_133_2.fateLevel then
			setActive(var_133_1, true)
			setActive(var_133_2, true)

			if not table.contains(arg_133_0.blinkTarget[1], var_133_1) then
				table.insert(arg_133_0.blinkTarget[1], var_133_1)
				table.insert(arg_133_0.blinkTarget[2], var_133_2)
			end
		else
			local var_133_3 = table.indexof(arg_133_0.blinkTarget[1], var_133_1)

			if var_133_3 then
				table.remove(arg_133_0.blinkTarget[1], var_133_3)
				table.remove(arg_133_0.blinkTarget[2], var_133_3)
			end

			setActive(var_133_1, iter_133_0 > arg_133_1.fateLevel)
			setActive(var_133_2, iter_133_0 <= arg_133_1.fateLevel)

			var_133_1:GetComponent(typeof(CanvasGroup)).alpha = 1
			var_133_2:GetComponent(typeof(CanvasGroup)).alpha = 1
		end
	end

	if #arg_133_0.blinkTarget[1] == 0 then
		LeanTween.cancel(go(arg_133_0.fittingAttrPanel))
	elseif not LeanTween.isTweening(go(arg_133_0.fittingAttrPanel)) then
		LeanTween.value(go(arg_133_0.fittingAttrPanel), 1, 0, 0.8):setOnUpdate(System.Action_float(function(arg_134_0)
			for iter_134_0, iter_134_1 in ipairs(arg_133_0.blinkTarget[1]) do
				iter_134_1:GetComponent(typeof(CanvasGroup)).alpha = arg_134_0
			end

			for iter_134_2, iter_134_3 in ipairs(arg_133_0.blinkTarget[2]) do
				iter_134_3:GetComponent(typeof(CanvasGroup)).alpha = 1 - arg_134_0
			end
		end)):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(0)
	end
end

function var_0_0.updateModAdditionPanel(arg_135_0)
	local var_135_0 = arg_135_0.contextData.shipBluePrintVO
	local var_135_1 = var_135_0:specialStrengthens()

	for iter_135_0 = arg_135_0.modAdditionContainer.childCount - 1, #var_135_1 do
		arg_135_0:cloneTplTo(arg_135_0.modAdditionTpl, arg_135_0.modAdditionContainer)
	end

	local var_135_2 = arg_135_0.modAdditionContainer.childCount

	for iter_135_1 = 1, var_135_2 do
		local var_135_3 = iter_135_1 <= #var_135_1
		local var_135_4 = arg_135_0.modAdditionContainer:GetChild(iter_135_1 - 1)

		setActive(var_135_4, var_135_3)

		if var_135_3 then
			arg_135_0:updateAdvanceTF(var_135_0, var_135_4, var_135_1[iter_135_1])
		end
	end
end

function var_0_0.updateAdvanceTF(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
	local var_136_0 = arg_136_1.level < arg_136_3.level

	setActive(arg_136_2:Find("mask"), var_136_0)

	if var_136_0 then
		setText(arg_136_2:Find("mask/content/Text"), i18n("blueprint_mod_addition_lock", arg_136_3.level))
	end

	local var_136_1 = arg_136_3.des
	local var_136_2 = arg_136_3.extraDes or {}
	local var_136_3 = arg_136_2:Find("additions")

	removeAllChildren(var_136_3)

	local var_136_4 = arg_136_0.modAdditionPanel:Find("scroll_rect/info")

	local function var_136_5(arg_137_0, arg_137_1)
		local var_137_0 = arg_137_1[2]
		local var_137_1 = pg.ship_data_breakout[var_137_0].pre_id
		local var_137_2 = Ship.New({
			configId = var_137_0
		})
		local var_137_3 = Ship.New({
			configId = var_137_1
		}):getStar()
		local var_137_4 = var_137_2:getStar()
		local var_137_5 = arg_137_0:Find("star_tpl")
		local var_137_6 = arg_137_0:Find("stars")
		local var_137_7 = arg_137_0:Find("pre_stars")

		removeAllChildren(var_137_6)
		removeAllChildren(var_137_7)

		for iter_137_0 = 1, var_137_3 do
			cloneTplTo(var_137_5, var_137_6)
		end

		for iter_137_1 = 1, var_137_4 do
			cloneTplTo(var_137_5, var_137_7)
		end
	end

	for iter_136_0 = 1, #var_136_1 do
		local var_136_6 = cloneTplTo(var_136_4, var_136_3)
		local var_136_7 = var_136_6:Find("text_tpl")
		local var_136_8 = var_136_6:Find("breakout_tpl")

		setActive(var_136_7, false)
		setActive(var_136_6:Find("attr_tpl"), false)
		setActive(var_136_8, false)
		setActive(var_136_6:Find("empty_tpl"), false)

		if var_136_1[iter_136_0] then
			if var_136_1[iter_136_0][1] == ShipBluePrint.STRENGTHEN_TYPE_BREAKOUT then
				setActive(var_136_8, true)
				var_136_5(var_136_8, var_136_1[iter_136_0])
			else
				setActive(var_136_7, true)
				setText(var_136_7:Find("Text"), var_136_1[iter_136_0][3])
			end
		end
	end

	for iter_136_1 = 1, #var_136_2 do
		local var_136_9 = cloneTplTo(var_136_4, var_136_3)
		local var_136_10 = var_136_9:Find("text_tpl")

		setActive(var_136_10, true)
		setActive(var_136_9:Find("attr_tpl"), false)
		setActive(var_136_9:Find("breakout_tpl"), false)
		setActive(var_136_9:Find("empty_tpl"), false)
		setText(var_136_10:Find("Text"), var_136_2[iter_136_1])
	end
end

function var_0_0.updateInfo(arg_138_0)
	local var_138_0 = arg_138_0.contextData.shipBluePrintVO
	local var_138_1

	if var_138_0:isFetched() then
		var_138_1 = arg_138_0.shipVOs[var_138_0.shipId]
	end

	var_138_1 = var_138_1 or var_138_0:getShipVO()

	local var_138_2 = var_138_1:getConfigTable()
	local var_138_3 = var_138_1:getName()

	setText(arg_138_0.shipName, var_138_3)
	setText(arg_138_0.englishName, var_138_2.english_name)
	removeAllChildren(arg_138_0.stars)

	local var_138_4 = var_138_1:getStar()
	local var_138_5 = var_138_1:getMaxStar()

	for iter_138_0 = 1, var_138_5 do
		cloneTplTo(arg_138_0.shipInfoStarTpl, arg_138_0.stars, "star_" .. iter_138_0)
	end

	local var_138_6 = var_138_5 - var_138_4

	for iter_138_1 = 1, var_138_6 do
		local var_138_7 = arg_138_0.stars:GetChild(var_138_5 - iter_138_1)

		setActive(var_138_7:Find("star_tpl"), false)
		setActive(var_138_7:Find("empty_star_tpl"), true)
	end

	local var_138_8 = GetSpriteFromAtlas("shiptype", var_138_1:getShipType())

	if not var_138_8 then
		warning("找不到船形, shipConfigId: " .. var_138_1.configId)
	end

	setImageSprite(arg_138_0.shipType, var_138_8, true)

	local var_138_9 = var_138_0:isLock()

	setActive(arg_138_0.finishedBtn, var_138_0:isFinished())

	local var_138_10 = var_138_0:isDeving()

	setActive(arg_138_0.progressPanel, var_138_10)

	if not var_138_10 then
		setActive(arg_138_0.speedupBtn, false)
	end

	if var_138_10 then
		arg_138_0:updateTasksProgress()
	end

	local var_138_11, var_138_12 = var_138_0:isFinishPrevTask()

	if var_138_9 and not var_138_12 then
		if var_138_11 then
			for iter_138_2, iter_138_3 in ipairs(var_138_0:getOpenTaskList()) do
				arg_138_0:emit(ShipBluePrintMediator.ON_FINISH_TASK, iter_138_3)
			end

			var_138_12 = true
		else
			local var_138_13 = getProxy(TaskProxy)
			local var_138_14 = var_138_0:getOpenTaskList()

			for iter_138_4, iter_138_5 in ipairs(var_138_14) do
				local var_138_15 = var_138_13:getTaskVO(iter_138_5)
				local var_138_16 = iter_138_4 > arg_138_0.lockPanel.childCount and cloneTplTo(arg_138_0.lockBtn, arg_138_0.lockPanel) or arg_138_0.lockPanel:GetChild(iter_138_4 - 1)

				setActive(var_138_16, true)

				local var_138_17 = var_138_15:getProgress()
				local var_138_18 = var_138_15:getConfig("target_num")

				setText(var_138_16:Find("Text"), (var_138_18 <= var_138_17 and setColorStr(var_138_17, COLOR_GREEN) or var_138_17) .. "/" .. var_138_18)
			end

			for iter_138_6 = #var_138_14 + 1, arg_138_0.lockPanel.childCount do
				setActive(arg_138_0.lockPanel:GetChild(iter_138_6 - 1), false)
			end
		end
	end

	setText(arg_138_0.openCondition:Find("Text"), var_138_0:getConfig("unlock_word"))
	setActive(arg_138_0.openCondition, var_138_9)
	setActive(arg_138_0.startBtn, var_138_9 and var_138_12)
	setActive(arg_138_0.lockPanel, var_138_9 and not var_138_12)
end

function var_0_0.updateTasksProgress(arg_139_0)
	local var_139_0 = arg_139_0.contextData.shipBluePrintVO

	if not var_139_0:isDeving() then
		return
	end

	local var_139_1 = var_139_0:getTaskIds()

	for iter_139_0 = arg_139_0.progressContainer.childCount, #var_139_1 do
		cloneTplTo(arg_139_0.progressTpl, arg_139_0.progressContainer)
	end

	local var_139_2 = arg_139_0.progressContainer.childCount

	for iter_139_1 = 1, var_139_2 do
		local var_139_3 = arg_139_0.progressContainer:GetChild(iter_139_1 - 1)
		local var_139_4 = iter_139_1 <= #var_139_1

		setActive(var_139_3, var_139_4)

		if var_139_4 then
			local var_139_5 = var_139_0:getTaskStateById(var_139_1[iter_139_1])

			setActive(findTF(var_139_3, "complete"), var_139_5 == ShipBluePrint.TASK_STATE_FINISHED)
			setActive(findTF(var_139_3, "lock"), var_139_5 == ShipBluePrint.TASK_STATE_LOCK or var_139_5 == ShipBluePrint.TASK_STATE_WAIT)
			setActive(findTF(var_139_3, "working"), var_139_5 == ShipBluePrint.TASK_STATE_ACHIEVED or var_139_5 == ShipBluePrint.TASK_STATE_OPENING or var_139_5 == ShipBluePrint.TASK_STATE_START)
		end
	end

	local var_139_6 = var_139_0:getConfig("blueprint_version")
	local var_139_7 = pg.gameset.technology_catchup_itemid.description[var_139_6]

	if var_139_7 then
		local var_139_8 = var_139_0:getTaskStateById(var_139_1[1])
		local var_139_9 = var_139_0:getTaskStateById(var_139_1[4])
		local var_139_10 = var_139_7[1]
		local var_139_11 = getProxy(BagProxy):getItemCountById(var_139_10)

		setActive(arg_139_0.speedupBtn, (var_139_8 == ShipBluePrint.TASK_STATE_START or var_139_9 == ShipBluePrint.TASK_STATE_START) and var_139_11 > 0)
	else
		setActive(arg_139_0.speedupBtn, false)
	end
end

function var_0_0.updatePainting(arg_140_0)
	local var_140_0 = arg_140_0.contextData.shipBluePrintVO:getShipVO():getPainting()

	if PLATFORM_CODE == PLATFORM_CH and checkABExist("painting/" .. var_140_0 .. "_blueprint") then
		var_140_0 = var_140_0 .. "_blueprint"
	end

	if arg_140_0.lastPaintingName and arg_140_0.lastPaintingName ~= var_140_0 then
		retPaintingPrefab(arg_140_0.painting, arg_140_0.lastPaintingName)
	end

	arg_140_0.lastPaintingName = var_140_0

	setPaintingPrefab(arg_140_0.painting, var_140_0, "tuzhi")
	arg_140_0:paintBreath()
end

function var_0_0.updateProperty(arg_141_0)
	local var_141_0 = arg_141_0.contextData.shipBluePrintVO
	local var_141_1 = var_141_0:getShipVO()

	arg_141_0.propertyPanel:initProperty(var_141_1.configId, PropertyPanel.TypeFlat)

	local var_141_2 = var_0_2[var_141_1.configId].buff_list_display

	for iter_141_0 = arg_141_0.skillPanel.childCount, #var_141_2 - 1 do
		cloneTplTo(arg_141_0.skillTpl, arg_141_0.skillPanel)
	end

	local var_141_3 = arg_141_0.skillPanel.childCount

	for iter_141_1 = 1, var_141_3 do
		local var_141_4 = arg_141_0.skillPanel:GetChild(iter_141_1 - 1)
		local var_141_5 = iter_141_1 <= #var_141_2
		local var_141_6 = findTF(var_141_4, "icon")

		if var_141_5 then
			local var_141_7 = var_141_2[iter_141_1]
			local var_141_8 = getSkillConfig(var_141_7)

			LoadImageSpriteAsync("skillicon/" .. var_141_8.icon, var_141_6)
			onButton(arg_141_0, var_141_4, function()
				arg_141_0:emit(ShipBluePrintMediator.SHOW_SKILL_INFO, var_141_8.id, {
					id = var_141_8.id,
					level = pg.skill_data_template[var_141_8.id].max_level
				}, function()
					return
				end)
			end, SFX_PANEL)
		end

		setActive(var_141_4, var_141_5)
	end

	setActive(arg_141_0.skillArrLeft, #var_141_2 > 3)
	setActive(arg_141_0.skillArrRight, #var_141_2 > 3)

	if #var_141_2 > 3 then
		onScroll(arg_141_0, arg_141_0.skillRect, function(arg_144_0)
			setActive(arg_141_0.skillArrLeft, arg_144_0.x > 0.01)
			setActive(arg_141_0.skillArrRight, arg_144_0.x < 0.99)
		end)
	else
		GetComponent(arg_141_0.skillRect, typeof(ScrollRect)).onValueChanged:RemoveAllListeners()
	end

	setAnchoredPosition(arg_141_0.skillPanel, {
		x = 0
	})

	local var_141_9 = var_141_0:getConfig("simulate_dungeon")

	setActive(arg_141_0.simulationBtn, var_141_9 ~= 0)
	onButton(arg_141_0, arg_141_0.simulationBtn, function()
		if var_141_9 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tech_simulate_closed"))
		else
			local var_145_0 = i18n("blueprint_simulation_confirm_" .. var_141_0.id)

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = var_145_0,
				onYes = function()
					arg_141_0:emit(ShipBluePrintMediator.SIMULATION_BATTLE, var_141_9)
				end
			})
		end
	end, SFX_CONFIRM)
end

function var_0_0.updateTaskList(arg_147_0)
	local var_147_0 = arg_147_0.contextData.shipBluePrintVO
	local var_147_1 = var_147_0:getTaskIds()

	UIItemList.StaticAlign(arg_147_0.taskContainer, arg_147_0.taskTpl, #var_147_1, function(arg_148_0, arg_148_1, arg_148_2)
		arg_148_1 = arg_148_1 + 1

		if arg_148_0 == UIItemList.EventUpdate then
			if arg_147_0.taskTFs[arg_148_1] then
				arg_147_0.taskTFs[arg_148_1]:clear()
			end

			if arg_148_1 <= #var_147_1 then
				if not arg_147_0.taskTFs[arg_148_1] then
					arg_147_0.taskTFs[arg_148_1] = arg_147_0:createTask(arg_148_2)
				end

				local var_148_0 = var_147_1[arg_148_1]
				local var_148_1 = arg_147_0:getTaskById(var_148_0)

				if var_147_0.duration > 0 then
					var_148_1.leftTime = var_147_0:getTaskOpenTimeStamp(var_148_0) - var_147_0.duration
				end

				var_148_1.taskState = var_147_0:getTaskStateById(var_148_0)
				var_148_1.dueTime = var_147_0:getTaskOpenTimeStamp(var_148_0)
				var_148_1.index = arg_148_1

				arg_147_0.taskTFs[arg_148_1]:update(var_148_1)
			end
		end
	end)
end

function var_0_0.updatePhantomQuest(arg_149_0)
	local var_149_0 = arg_149_0.contextData.shipBluePrintVO
	local var_149_1 = var_149_0:isUnlockShipPhantom()

	setActive(arg_149_0.phantomPanel:Find("title/bg"), var_149_1)
	setActive(arg_149_0.phantomPanel:Find("title/bg_lock"), not var_149_1)
	setActive(arg_149_0.phantomPanel:Find("desc/content"), var_149_1)
	setActive(arg_149_0.phantomPanel:Find("desc/lock_mask"), not var_149_1)
	setText(arg_149_0.phantomPanel:Find("desc/lock_mask/Text"), i18n("tech_shadow_limit_text", getGameset("technology_shadow_unlock_lv")[1]))

	if not var_149_1 then
		return
	end

	local var_149_2 = var_149_0:getAllPhantomQuestInfo()

	setText(arg_149_0.phantomPanel:Find("title/bg/Text"), string.format("%d/%d", #underscore.filter(var_149_2, function(arg_150_0)
		return arg_150_0.unlocked
	end), #var_149_2))
	UIItemList.StaticAlign(arg_149_0.rtPhantomQuestContainer, arg_149_0.questTpl, #var_149_2, function(arg_151_0, arg_151_1, arg_151_2)
		arg_151_1 = arg_151_1 + 1

		if arg_151_0 == UIItemList.EventUpdate then
			local var_151_0 = var_149_2[arg_151_1]

			setActive(arg_151_2:Find("title/bg"), var_151_0.config.type ~= 5)
			setActive(arg_151_2:Find("title/bg_1"), var_151_0.config.type == 5)
			setActive(arg_151_2:Find("title/complete"), var_151_0.unlocked)
			setActive(arg_151_2:Find("title/working"), not var_151_0.unlocked)
			setText(arg_151_2:Find("title/name"), var_151_0.config.name)
			setText(arg_151_2:Find("title/number"), arg_151_1)
			setSlider(arg_151_2:Find("title/slider"), 0, var_151_0.config.target_num, var_151_0.unlocked and var_151_0.config.target_num or var_151_0.progress)
			setActive(arg_151_2:Find("title/slider/complete"), var_151_0.unlocked)
			setActive(arg_151_2:Find("title/tip"), not var_151_0.unlocked and var_151_0.progress >= var_151_0.config.target_num)

			if var_151_0.config.type == 5 then
				setText(arg_151_2:Find("desc/info/Text"), stringInset(var_151_0.config.desc, var_151_0.config.target_num))
			else
				setText(arg_151_2:Find("desc/info/Text"), var_151_0.config.desc)
			end

			local var_151_1 = string.format("%d", math.clamp(var_151_0.unlocked and var_151_0.config.target_num or var_151_0.progress, 0, var_151_0.config.target_num) * 100 / var_151_0.config.target_num)

			setText(arg_151_2:Find("desc/info/progress"), var_151_1 .. "%")
			setText(arg_151_2:Find("desc/info/progress/shadow"), var_151_1 .. "%")

			local var_151_2 = ShipBluePrint.getPhantomQuestCostDrop(var_151_0)

			setActive(arg_151_2:Find("desc/item_info/items"), var_151_2)

			if var_151_2 then
				updateDrop(arg_151_2:Find("desc/item_info/items/item_tpl/award"), var_151_2)
			end

			local var_151_3 = var_151_0.unlocked or var_151_0.progress < var_151_0.config.target_num

			setActive(arg_151_2:Find("desc/commit_panel/commit_btn"), not canCommit)
			setActive(arg_151_2:Find("desc/commit_panel/lock_btn"), var_151_3)
			onButton(arg_149_0, arg_151_2:Find("desc/commit_panel/commit_btn"), function()
				local var_152_0 = {}

				if var_151_2 then
					table.insert(var_152_0, function(arg_153_0)
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("tech_shadow_commit_tip", var_151_2:getName() .. "x" .. var_151_2.count),
							onYes = arg_153_0
						})
					end)
				end

				seriesAsync(var_152_0, function()
					arg_149_0:emit(ShipBluePrintMediator.FINISH_PHANTOM_QUEST, var_149_0.id, arg_151_1)
				end)
			end, SFX_CONFIRM)
			onToggle(arg_149_0, arg_151_2, function(arg_155_0)
				if arg_155_0 then
					Canvas.ForceUpdateCanvases()

					local var_155_0 = arg_149_0.rtPhantomQuestContainer.parent.transform:InverseTransformPoint(arg_151_2.position).y
					local var_155_1 = var_155_0 - arg_151_2.rect.height
					local var_155_2 = arg_149_0.rtPhantomQuestContainer.parent.transform.rect
					local var_155_3 = 0

					if var_155_1 < var_155_2.yMin then
						var_155_3 = var_155_2.yMin - var_155_1
					end

					if var_155_0 > var_155_2.yMax then
						var_155_3 = var_155_2.yMax - var_155_0
					end

					local var_155_4 = arg_149_0.rtPhantomQuestContainer.localPosition

					var_155_4.y = var_155_4.y + var_155_3
					arg_149_0.rtPhantomQuestContainer.localPosition = var_155_4
				end
			end, SFX_PANEL)
		end
	end)
end

function var_0_0.createTask(arg_156_0, arg_156_1)
	local var_156_0 = {
		title = arg_156_1:Find("title/name"),
		desc = arg_156_1:Find("desc/info/Text"),
		timerTF = arg_156_1:Find("title/timer"),
		timerTFTxt = arg_156_1:Find("title/timer/Text"),
		timerOpen = arg_156_1:Find("title/timer/open"),
		timerClose = arg_156_1:Find("title/timer/close"),
		maskAchieved = arg_156_1:Find("title/slider/complete"),
		tip = arg_156_1:Find("title/tip"),
		commitBtn = arg_156_1:Find("desc/commit_panel/commit_btn"),
		itemInfo = arg_156_1:Find("desc/item_info")
	}

	var_156_0.itemContainer = var_156_0.itemInfo:Find("items")
	var_156_0.itemTpl = var_156_0.itemContainer:Find("item_tpl")
	var_156_0.numberTF = arg_156_1:Find("title/number")
	var_156_0.progressTF = arg_156_1:Find("title/slider")
	var_156_0.progessSlider = var_156_0.progressTF:GetComponent(typeof(Slider))
	var_156_0.lockBtn = arg_156_1:Find("desc/commit_panel/lock_btn")
	var_156_0.itemCount = var_156_0.itemTpl:Find("award/icon_bg/count")
	var_156_0.progres = arg_156_1:Find("desc/info/progress")
	var_156_0.progreshadow = arg_156_1:Find("desc/info/progress/shadow")
	var_156_0.check = findTF(arg_156_1, "title/complete")
	var_156_0.lock = findTF(arg_156_1, "title/lock")
	var_156_0.working = findTF(arg_156_1, "title/working")
	var_156_0.pause = findTF(arg_156_1, "title/pause")
	var_156_0.pauseLock = findTF(arg_156_1, "title/pause_lock")
	var_156_0.view = arg_156_0

	onToggle(arg_156_0, arg_156_1, function(arg_157_0)
		setActive(var_156_0.desc, arg_157_0)
		setActive(var_156_0.progreshadow, arg_157_0)

		if arg_157_0 then
			Canvas.ForceUpdateCanvases()

			local var_157_0 = arg_156_0.taskContainer.parent.transform:InverseTransformPoint(arg_156_1.position).y
			local var_157_1 = var_157_0 - arg_156_1.rect.height
			local var_157_2 = arg_156_0.taskContainer.parent.transform.rect
			local var_157_3 = 0

			if var_157_1 < var_157_2.yMin then
				var_157_3 = var_157_2.yMin - var_157_1
			end

			if var_157_0 > var_157_2.yMax then
				var_157_3 = var_157_2.yMax - var_157_0
			end

			local var_157_4 = arg_156_0.taskContainer.localPosition

			var_157_4.y = var_157_4.y + var_157_3
			arg_156_0.taskContainer.localPosition = var_157_4
		end
	end, SFX_PANEL)

	function var_156_0.update(arg_158_0, arg_158_1)
		arg_158_0:clearTimer()

		arg_158_0.autoCommit = true
		arg_158_0.isExpTask = false

		removeOnButton(arg_158_0.commitBtn)
		arg_158_0:updateItemInfo(arg_158_1)
		arg_158_0:updateView(arg_158_1)
		arg_158_0:updateProgress(arg_158_1)
	end

	function var_156_0.updateItemInfo(arg_159_0, arg_159_1)
		arg_159_0.taskVO = arg_159_1

		changeToScrollText(arg_159_0.title, arg_159_1:getConfig("name"))
		setText(arg_159_0.desc, arg_159_1:getConfig("desc") .. "\n\n")

		local var_159_0
		local var_159_1 = arg_159_1:getConfig("target_num")
		local var_159_2 = arg_159_1:getConfig("sub_type")

		if var_159_2 == TASK_SUB_TYPE_GIVE_ITEM then
			arg_159_0.autoCommit = false
			var_159_0 = tonumber(arg_159_1:getConfig("target_id"))
		elseif var_159_2 == TASK_SUB_TYPE_PLAYER_RES then
			arg_159_0.autoCommit = false
			var_159_0 = id2ItemId(tonumber(arg_159_1:getConfig("target_id")))
		elseif var_159_2 == TASK_SUB_TYPE_BATTLE_EXP then
			arg_159_0.isExpTask = true
			var_159_0 = 59000
		end

		setActive(arg_159_0.itemContainer, not arg_159_0.autoCommit or arg_159_0.isExpTask)

		if var_159_0 then
			updateDrop(arg_159_0.itemTpl:Find("award"), {
				type = 2,
				id = var_159_0,
				count = var_159_1
			})
			setText(arg_159_0.itemCount, var_159_1 > 1000 and math.floor(var_159_1 / 1000) .. "K" or var_159_1)
		end

		setText(arg_159_0.numberTF, arg_159_1.index)
	end

	function var_156_0.updateView(arg_160_0, arg_160_1)
		local var_160_0 = arg_160_1.taskState
		local var_160_1 = false
		local var_160_2 = false
		local var_160_3 = false

		if var_160_0 == ShipBluePrint.TASK_STATE_PAUSE and arg_160_1.leftTime then
			local var_160_4 = getProxy(TaskProxy):getTaskVO(arg_160_1.id)

			var_160_1 = var_160_4 and var_160_4:isFinish()
			var_160_3 = arg_160_1.leftTime > 0
			var_160_2 = var_160_4 and var_160_4:isReceive()

			if arg_160_1.leftTime > 0 then
				setText(var_156_0.timerTFTxt, pg.TimeMgr.GetInstance():DescCDTime(arg_160_1.leftTime))
			end
		end

		setActive(arg_160_0.pause, ShipBluePrint.TASK_STATE_PAUSE == var_160_0 and not var_160_1 and not var_160_3 or ShipBluePrint.TASK_STATE_PAUSE == var_160_0 and not var_160_3 and var_160_1 and not arg_160_0.autoCommit)
		setActive(arg_160_0.pauseLock, ShipBluePrint.TASK_STATE_PAUSE == var_160_0 and not var_160_1 and var_160_3)
		setActive(arg_160_0.lockBtn, var_160_0 ~= ShipBluePrint.TASK_STATE_ACHIEVED and (var_160_0 ~= ShipBluePrint.TASK_STATE_START or not not arg_160_0.autoCommit))
		setActive(arg_160_0.commitBtn, var_160_0 == ShipBluePrint.TASK_STATE_ACHIEVED or var_160_0 == ShipBluePrint.TASK_STATE_START and not arg_160_0.autoCommit)
		setActive(arg_160_0.progressTF, var_160_0 == ShipBluePrint.TASK_STATE_ACHIEVED or var_160_0 == ShipBluePrint.TASK_STATE_START or var_160_0 == ShipBluePrint.TASK_STATE_FINISHED or var_160_0 == ShipBluePrint.TASK_STATE_PAUSE and not var_160_3)
		setActive(arg_160_0.lock, var_160_0 == ShipBluePrint.TASK_STATE_LOCK or var_160_0 == ShipBluePrint.TASK_STATE_WAIT)
		setActive(arg_160_0.working, var_160_0 == ShipBluePrint.TASK_STATE_OPENING or var_160_0 == ShipBluePrint.TASK_STATE_START or var_160_0 == ShipBluePrint.TASK_STATE_ACHIEVED)
		setActive(arg_160_0.maskAchieved, var_160_0 == ShipBluePrint.TASK_STATE_FINISHED or var_160_0 == ShipBluePrint.TASK_STATE_PAUSE and var_160_2)
		setActive(arg_160_0.timerTF, var_160_0 == ShipBluePrint.TASK_STATE_WAIT or var_160_0 == ShipBluePrint.TASK_STATE_PAUSE and arg_160_1.leftTime and arg_160_1.leftTime > 0)
		setActive(arg_160_0.check, arg_160_0.autoCommit and var_160_0 == ShipBluePrint.TASK_STATE_ACHIEVED or var_160_0 == ShipBluePrint.TASK_STATE_FINISHED or var_160_0 == ShipBluePrint.TASK_STATE_PAUSE and var_160_2)
		setActive(arg_160_0.tip, var_160_0 == ShipBluePrint.TASK_STATE_ACHIEVED)
		setActive(arg_160_0.timerOpen, var_160_0 == ShipBluePrint.TASK_STATE_WAIT)
		setActive(arg_160_0.timerClose, var_160_0 == ShipBluePrint.TASK_STATE_PAUSE and arg_160_1.leftTime and arg_160_1.leftTime > 0)
	end

	function var_156_0.updateProgress(arg_161_0, arg_161_1)
		local var_161_0 = arg_161_1.taskState
		local var_161_1 = arg_161_1:getProgress() / arg_161_1:getConfig("target_num")

		if var_161_0 == ShipBluePrint.TASK_STATE_WAIT then
			arg_161_0:addTimer(arg_161_1, arg_161_1.dueTime)

			var_161_1 = 0
		elseif var_161_0 == ShipBluePrint.TASK_STATE_OPENING then
			var_161_1 = 0

			arg_161_0.view:emit(ShipBluePrintMediator.ON_TASK_OPEN, arg_161_1.id)
		elseif var_161_0 == ShipBluePrint.TASK_STATE_PAUSE then
			if arg_161_1:isReceive() then
				var_161_1 = 1
			end
		elseif var_161_0 == ShipBluePrint.TASK_STATE_LOCK then
			var_161_1 = 0
		elseif var_161_0 == ShipBluePrint.TASK_STATE_ACHIEVED then
			onButton(arg_161_0.view, arg_161_0.commitBtn, function()
				arg_161_0.view:emit(ShipBluePrintMediator.ON_FINISH_TASK, arg_161_1.id)
			end, SFX_PANEL)

			var_161_1 = 1
		elseif var_161_0 == ShipBluePrint.TASK_STATE_FINISHED then
			var_161_1 = 1
		elseif var_161_0 == ShipBluePrint.TASK_STATE_START and not arg_161_0.autoCommit then
			onButton(arg_161_0.view, arg_161_0.commitBtn, function()
				arg_161_0.view:emit(ShipBluePrintMediator.ON_FINISH_TASK, arg_161_1.id)
			end, SFX_PANEL)

			var_161_1 = 0
		end

		if var_161_1 > 0 then
			arg_161_0.itemSliderLT = LeanTween.value(go(arg_161_0.progressTF), 0, math.min(var_161_1, 1), 0.5 * math.min(var_161_1, 1)):setOnUpdate(System.Action_float(function(arg_164_0)
				arg_161_0.progessSlider.value = arg_164_0
			end)).uniqueId
		else
			arg_161_0.progessSlider.value = var_161_1
		end

		local var_161_2 = math.floor(var_161_1 * 100)

		setText(arg_161_0.progres, math.ceil(math.min(var_161_2, 100)) .. "%")
		setText(arg_161_0.progreshadow, math.min(var_161_2, 100) .. "%")
	end

	function var_156_0.addTimer(arg_165_0, arg_165_1, arg_165_2)
		arg_165_0:clearTimer()

		arg_165_0.taskTimer = Timer.New(function()
			local var_166_0 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_166_1 = arg_165_2 - var_166_0

			if var_166_1 > 0 then
				setText(arg_165_0.timerTFTxt, pg.TimeMgr.GetInstance():DescCDTime(var_166_1))
			else
				arg_165_0:clearTimer()
				setText(arg_165_0.timerTFTxt, "00:00:00")
				arg_165_0.view:emit(ShipBluePrintMediator.ON_TASK_OPEN, arg_165_1.id)
			end
		end, 1, -1)

		arg_165_0.taskTimer:Start()
		arg_165_0.taskTimer.func()
	end

	function var_156_0.clearTimer(arg_167_0)
		if arg_167_0.taskTimer then
			arg_167_0.taskTimer:Stop()

			arg_167_0.taskTimer = nil
		end
	end

	function var_156_0.clear(arg_168_0)
		arg_168_0:clearTimer()

		if arg_168_0.itemSliderLT then
			LeanTween.cancel(arg_168_0.itemSliderLT)

			arg_168_0.itemSliderLT = nil
		end
	end

	return var_156_0
end

function var_0_0.openPreView(arg_169_0)
	local var_169_0 = arg_169_0.contextData.shipBluePrintVO

	if var_169_0 then
		setActive(arg_169_0.preViewer, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_169_0.preViewer)
		arg_169_0:playLoadingAni()

		arg_169_0.viewShipVO = var_169_0:getShipVO()
		arg_169_0.breakIds = arg_169_0:getStages(arg_169_0.viewShipVO)

		for iter_169_0 = 1, var_0_4 do
			local var_169_1 = arg_169_0.breakIds[iter_169_0]
			local var_169_2 = var_0_3[var_169_1]
			local var_169_3 = arg_169_0.stages:Find("stage" .. iter_169_0)

			onToggle(arg_169_0, var_169_3, function(arg_170_0)
				if arg_170_0 then
					if PLATFORM_CODE == PLATFORM_US then
						changeToScrollText(arg_169_0.breakView, var_0_3[var_169_1].breakout_view)
					else
						setText(arg_169_0.breakView, var_0_3[var_169_1].breakout_view)
					end

					arg_169_0:switchStage(var_169_1)
				end
			end, SFX_PANEL)

			if iter_169_0 == 1 then
				triggerToggle(var_169_3, true)
			end
		end

		arg_169_0.isShowPreview = true

		arg_169_0:updateMaxLevelAttrs(var_169_0)
	end
end

var_0_0.MAX_LEVEL_ATTRS = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.ArmorType,
	AttributeType.Dodge
}

function var_0_0.updateMaxLevelAttrs(arg_171_0, arg_171_1)
	if not arg_171_1:isFetched() then
		return
	end

	local var_171_0 = arg_171_0.shipVOs[arg_171_1.shipId]
	local var_171_1 = Clone(var_171_0)

	var_171_1.level = 125

	local var_171_2 = Clone(arg_171_1)

	var_171_2.level = arg_171_1:getMaxLevel()

	local var_171_3 = intProperties(var_171_2:getShipProperties(var_171_1, false))

	for iter_171_0, iter_171_1 in ipairs(var_0_0.MAX_LEVEL_ATTRS) do
		local var_171_4 = arg_171_0.previewAttrContainer:Find(iter_171_1)

		if iter_171_1 == AttributeType.ArmorType then
			setText(var_171_4:Find("bg/value"), var_171_0:getShipArmorName())
		else
			setText(var_171_4:Find("bg/value"), var_171_3[iter_171_1] or 0)
		end

		setText(var_171_4:Find("bg/name"), AttributeType.Type2Name(iter_171_1))
	end
end

function var_0_0.closePreview(arg_172_0, arg_172_1)
	if arg_172_0.previewer then
		arg_172_0.previewer:clear()

		arg_172_0.previewer = nil
	end

	setActive(arg_172_0.preViewer, false)
	setActive(arg_172_0.rawImage, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_172_0.preViewer, arg_172_0._tf)

	arg_172_0.isShowPreview = nil
end

function var_0_0.playLoadingAni(arg_173_0)
	setActive(arg_173_0.seaLoading, true)
end

function var_0_0.stopLoadingAni(arg_174_0)
	setActive(arg_174_0.seaLoading, false)
end

function var_0_0.showBarrage(arg_175_0)
	arg_175_0.previewer = WeaponPreviewer.New(arg_175_0.rawImage)

	arg_175_0.previewer:configUI(arg_175_0.healTF)
	arg_175_0.previewer:setDisplayWeapon(arg_175_0:getWaponIdsById(arg_175_0.breakOutId))
	arg_175_0.previewer:load(40000, arg_175_0.viewShipVO, arg_175_0:getAllWeaponIds(), function()
		arg_175_0:stopLoadingAni()
	end)
end

function var_0_0.getWaponIdsById(arg_177_0, arg_177_1)
	return var_0_3[arg_177_1].weapon_ids
end

function var_0_0.getAllWeaponIds(arg_178_0)
	local var_178_0 = {}

	for iter_178_0, iter_178_1 in ipairs(arg_178_0.breakIds) do
		local var_178_1 = Clone(var_0_3[iter_178_1].weapon_ids)
		local var_178_2 = {
			__add = function(arg_179_0, arg_179_1)
				for iter_179_0, iter_179_1 in ipairs(arg_179_0) do
					if not table.contains(arg_179_1, iter_179_1) then
						table.insert(arg_179_1, iter_179_1)
					end
				end

				return arg_179_1
			end
		}

		setmetatable(var_178_0, var_178_2)

		var_178_0 = var_178_0 + var_178_1
	end

	return var_178_0
end

function var_0_0.getStages(arg_180_0, arg_180_1)
	local var_180_0 = {}
	local var_180_1 = math.floor(arg_180_1.configId / 10)

	for iter_180_0 = 1, 4 do
		local var_180_2 = tonumber(var_180_1 .. iter_180_0)

		assert(var_0_3[var_180_2], "必须存在配置" .. var_180_2)
		table.insert(var_180_0, var_180_2)
	end

	return var_180_0
end

function var_0_0.switchStage(arg_181_0, arg_181_1)
	if arg_181_0.breakOutId == arg_181_1 then
		return
	end

	arg_181_0.breakOutId = arg_181_1

	if arg_181_0.previewer then
		arg_181_0.previewer:setDisplayWeapon(arg_181_0:getWaponIdsById(arg_181_0.breakOutId))
	end
end

function var_0_0.clearTimers(arg_182_0)
	for iter_182_0, iter_182_1 in pairs(arg_182_0.taskTFs or {}) do
		iter_182_1:clear()
	end
end

function var_0_0.cloneTplTo(arg_183_0, arg_183_1, arg_183_2)
	local var_183_0 = tf(Instantiate(arg_183_1))

	SetActive(var_183_0, true)
	var_183_0:SetParent(tf(arg_183_2), false)

	return var_183_0
end

function var_0_0.onBackPressed(arg_184_0)
	if isActive(arg_184_0.msgPanel) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_184_0.msgPanel, arg_184_0.top)
		setActive(arg_184_0.msgPanel, false)
	elseif isActive(arg_184_0.unlockPanel) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_184_0.unlockPanel, arg_184_0.top)
		setActive(arg_184_0.unlockPanel, false)
	elseif isActive(arg_184_0.versionPanel) then
		triggerButton(arg_184_0.versionPanel:Find("bg"))
	elseif arg_184_0.isShowPreview then
		arg_184_0:closePreview(true)
	elseif arg_184_0.svQuickExchange:isShowing() then
		arg_184_0.svQuickExchange:Hide()
	elseif arg_184_0.awakenPlay or arg_184_0:inModAnim() then
		-- block empty
	else
		arg_184_0:emit(var_0_0.ON_BACK_PRESSED)
	end
end

function var_0_0.getResource(arg_185_0, arg_185_1)
	local var_185_0 = {
		"ui/shipblueprintui_atlas",
		"shipdesignicon/empty",
		"shiptype",
		"ui/fateStartWindow"
	}

	for iter_185_0, iter_185_1 in pairs(var_0_1.all) do
		local var_185_1 = var_0_1[iter_185_1]
		local var_185_2 = tonumber(var_185_1.id .. "0")
		local var_185_3 = tonumber(var_185_1.id .. "1")
		local var_185_4

		if pg.ship_skin_template[var_185_2] then
			var_185_4 = pg.ship_skin_template[var_185_2].painting
		end

		if var_185_4 then
			if not table.contains(var_185_0, "shipdesignicon/" .. var_185_4) then
				table.insert(var_185_0, "shipdesignicon/" .. var_185_4)
			end

			if checkABExist("shipdesignicon/" .. var_185_4 .. "_hx") and not table.contains(var_185_0, "shipdesignicon/" .. var_185_4 .. "_hx") then
				table.insert(var_185_0, "shipdesignicon/" .. var_185_4 .. "_hx")
			end

			if not table.contains(var_185_0, "shipYardIcon/" .. var_185_4) then
				table.insert(var_185_0, "shipYardIcon/" .. var_185_4)
			end
		end

		if pg.ship_data_template[var_185_3] then
			local var_185_5 = pg.ship_data_template[var_185_3].buff_list_display

			if var_185_5 then
				for iter_185_2, iter_185_3 in ipairs(var_185_5) do
					local var_185_6 = getSkillConfig(iter_185_3)

					if var_185_6 then
						local var_185_7 = "skillicon/" .. var_185_6.icon

						if not table.contains(var_185_0, var_185_7) then
							table.insert(var_185_0, var_185_7)
						end
					end
				end
			end
		end
	end

	return table.insertto(var_185_0, var_0_0.super.getResource(arg_185_0, arg_185_1))
end

function var_0_0.willExit(arg_186_0)
	if isActive(arg_186_0.msgPanel) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_186_0.msgPanel, arg_186_0.top)
		setActive(arg_186_0.msgPanel, false)
	end

	if isActive(arg_186_0.unlockPanel) then
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_186_0.unlockPanel, arg_186_0.top)
		setActive(arg_186_0.unlockPanel, false)
	end

	arg_186_0:UnOverlayPanel(arg_186_0.blurPanel, arg_186_0._tf)
	LeanTween.cancel(go(arg_186_0.fittingAttrPanel))

	if arg_186_0.lastPaintingName then
		retPaintingPrefab(arg_186_0.painting, arg_186_0.lastPaintingName)
	end

	for iter_186_0, iter_186_1 in pairs(arg_186_0.taskTFs or {}) do
		iter_186_1:clear()
	end

	arg_186_0:closePreview(true)
	arg_186_0:clearLeanTween(true)

	if arg_186_0.previewer then
		arg_186_0.previewer:clear()

		arg_186_0.previewer = nil
	end

	if arg_186_0.cbTimer then
		arg_186_0.cbTimer:Stop()

		arg_186_0.cbTimer = nil
	end

	if arg_186_0.svQuickExchange:isShowing() then
		arg_186_0.svQuickExchange:Hide()
	end

	arg_186_0.svQuickExchange:Destroy()
end

function var_0_0.paintBreath(arg_187_0)
	LeanTween.cancel(go(arg_187_0.painting))
	LeanTween.moveY(rtf(arg_187_0.painting), var_0_5, var_0_6):setLoopPingPong():setEase(LeanTweenType.easeInOutCubic):setFrom(0)
end

function var_0_0.buildStartAni(arg_188_0, arg_188_1, arg_188_2)
	if arg_188_1 == "researchStartWindow" then
		arg_188_0.progressPanel.localScale = Vector3(0, 1, 1)

		LeanTween.scale(arg_188_0.progressPanel, Vector3(1, 1, 1), 0.2):setDelay(2)
	end

	local function var_188_0()
		arg_188_0.awakenAni:SetActive(true)

		arg_188_0.awakenPlay = true

		local var_189_0 = tf(arg_188_0.awakenAni)

		pg.UIMgr.GetInstance():BlurPanel(var_189_0)
		var_189_0:SetAsLastSibling()
		var_189_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_190_0)
			if not IsNil(arg_188_0.awakenAni) then
				pg.UIMgr.GetInstance():UnOverlayPanel(var_189_0, arg_188_0.blurPanel)
				arg_188_0.awakenAni:SetActive(false)

				arg_188_0.awakenPlay = false

				if arg_188_2 then
					arg_188_2()
				end
			end
		end)
	end

	local var_188_1 = arg_188_0._tf:Find(arg_188_1 .. "(Clone)")

	arg_188_0.awakenAni = var_188_1 and go(var_188_1)

	if not arg_188_0.awakenAni then
		PoolMgr.GetInstance():GetUI(arg_188_1, true, function(arg_191_0)
			arg_191_0:SetActive(true)

			arg_188_0.awakenAni = arg_191_0

			var_188_0()
		end)
	else
		var_188_0()
	end
end

function var_0_0.showFittingMsgPanel(arg_192_0, arg_192_1)
	pg.UIMgr.GetInstance():BlurPanel(arg_192_0.msgPanel)
	setActive(arg_192_0.msgPanel, true)

	local var_192_0 = arg_192_0.contextData.shipBluePrintVO
	local var_192_1 = var_192_0:getMaxFateLevel()
	local var_192_2 = arg_192_0.msgPanel:Find("window/content")
	local var_192_3 = var_192_2:Find("pre_btn")
	local var_192_4 = var_192_2:Find("next_btn")
	local var_192_5 = var_192_2:Find("attrl_panel")
	local var_192_6 = var_192_2:Find("skill_panel")
	local var_192_7 = var_192_2:Find("phase")
	local var_192_8 = {
		"I",
		"II",
		"III",
		"IV",
		"V"
	}

	local function var_192_9()
		setActive(var_192_3, arg_192_1 > 1)
		setActive(var_192_4, arg_192_1 < var_192_1)
		setText(var_192_7, "PHASE." .. var_192_8[arg_192_1])

		local var_193_0 = var_192_0:getFateStrengthenConfig(arg_192_1)

		assert(var_193_0.special == 1 and type(var_193_0.special_effect) == "table", "without fate config")

		local var_193_1 = var_193_0.special_effect
		local var_193_2
		local var_193_3 = {}

		for iter_193_0, iter_193_1 in ipairs(var_193_1) do
			local var_193_4 = iter_193_1[1]

			if var_193_4 == ShipBluePrint.STRENGTHEN_TYPE_CHANGE_SKILL then
				var_193_2 = iter_193_1[2][2]
			elseif var_193_4 == ShipBluePrint.STRENGTHEN_TYPE_ATTR then
				table.insert(var_193_3, iter_193_1[2])
			end
		end

		setActive(var_192_5, #var_193_3 > 0)
		setActive(var_192_6, var_193_2)

		if var_193_2 then
			local var_193_5 = getSkillConfig(var_193_2)

			GetImageSpriteFromAtlasAsync("skillicon/" .. var_193_5.icon, "", var_192_6:Find("skill_icon"))
			setText(var_192_6:Find("skill_name"), getSkillName(var_193_2))

			local var_193_6 = 1

			setText(var_192_6:Find("skill_lv"), "Lv." .. var_193_6)
			setText(var_192_6:Find("help_panel/skill_intro"), getSkillDescGet(var_193_2))
		end

		if #var_193_3 > 0 then
			for iter_193_2, iter_193_3 in ipairs(var_193_3) do
				local var_193_7 = iter_193_2 < var_192_5.childCount and var_192_5:GetChild(iter_193_2) or cloneTplTo(var_192_5:GetChild(iter_193_2 - 1), var_192_5)

				setText(var_193_7:Find("name"), AttributeType.Type2Name(iter_193_3[1]))
				setText(var_193_7:Find("number"), " + " .. iter_193_3[2])
			end

			for iter_193_4 = #var_193_3 + 1, var_192_5.childCount - 1 do
				setActive(var_192_5:GetChild(iter_193_4), false)
			end
		end
	end

	onButton(arg_192_0, var_192_3, function()
		arg_192_1 = arg_192_1 - 1

		var_192_9()
	end)
	onButton(arg_192_0, var_192_4, function()
		arg_192_1 = arg_192_1 + 1

		var_192_9()
	end)
	setText(var_192_5:Find("desc"), i18n("fate_attr_word"))
	var_192_9()
end

function var_0_0.showUnlockPanel(arg_196_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_196_0.unlockPanel)
	setActive(arg_196_0.unlockPanel, true)

	local var_196_0 = arg_196_0.contextData.shipBluePrintVO.id
	local var_196_1 = arg_196_0.contextData.shipBluePrintVO:getUnlockItem()
	local var_196_2 = Drop.New({
		type = DROP_TYPE_ITEM,
		id = var_196_1
	})
	local var_196_3 = arg_196_0.contextData.shipBluePrintVO:getShipVO()
	local var_196_4 = var_196_3:getPainting()
	local var_196_5 = arg_196_0.unlockPanel:Find("window/content")

	GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_196_4, var_196_4, var_196_5:Find("Image/mask/icon"), true)
	setText(var_196_5:Find("words/Text"), i18n("techpackage_item_use_1", var_196_3:getName()))
	setText(var_196_5:Find("words/Text_2"), i18n("techpackage_item_use_2", var_196_2:getName()))
	GetImageSpriteFromAtlasAsync(var_196_2:getIcon(), "", arg_196_0.unlockPanel:Find("window/confirm_btn/Image/Image"))
	setText(arg_196_0.unlockPanel:Find("window/confirm_btn/Image/Text"), i18n("event_ui_consume"))
	onButton(arg_196_0, arg_196_0.unlockPanel:Find("window/confirm_btn"), function()
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_196_0.unlockPanel, arg_196_0.top)
		setActive(arg_196_0.unlockPanel, false)
		arg_196_0:emit(ShipBluePrintMediator.ON_ITEM_UNLOCK, var_196_0, var_196_1)
	end, SFX_CANCEL)
end

function var_0_0.checkStory(arg_198_0)
	local var_198_0 = {
		nil,
		"FANGAN3"
	}

	arg_198_0.storyMgr = arg_198_0.storyMgr or pg.NewStoryMgr.GetInstance()

	if var_198_0[arg_198_0.version] and not arg_198_0.storyMgr:IsPlayed(var_198_0[arg_198_0.version]) then
		arg_198_0.storyMgr:Play(var_198_0[arg_198_0.version])
	end
end

function var_0_0.changeEffectVisible(arg_199_0, arg_199_1)
	setActive(arg_199_0.fittingBtn, arg_199_1)
	setActive(arg_199_0.initPanel, arg_199_1)
end

return var_0_0

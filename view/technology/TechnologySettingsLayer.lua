local var_0_0 = class("TechnologySettingsLayer", import("..base.BaseUI"))

var_0_0.TEC_PAGE_TENDENCY = 1
var_0_0.TEC_PAGE_CATCHUP_TARGET1 = 2
var_0_0.TEC_PAGE_CATCHUP_TARGET2 = 3
var_0_0.TEC_PAGE_CATCHUP_TARGET3 = 4
var_0_0.TEC_PAGE_CATCHUP_TARGET4 = 5
var_0_0.TEC_PAGE_CATCHUP_TARGET5 = 6
var_0_0.TEC_PAGE_CATCHUP_TARGET6 = 7
var_0_0.TEC_PAGE_CATCHUP_TARGET7 = 8
var_0_0.TEC_PAGE_CATCHUP_ACT = 99
var_0_0.PANEL_INTO_TIME = 0.15
var_0_0.SELECT_TENDENCY_FADE_TIME = 0.3
var_0_0.SELECT_CHAR_LIGHT_FADE_TIME = 0.3
var_0_0.CATCHUP_CLASSES = {
	import("view.technology.TargetCatchup.TargetCatchupPanel1"),
	import("view.technology.TargetCatchup.TargetCatchupPanel2"),
	import("view.technology.TargetCatchup.TargetCatchupPanel3"),
	import("view.technology.TargetCatchup.TargetCatchupPanel4"),
	import("view.technology.TargetCatchup.TargetCatchupPanel5"),
	import("view.technology.TargetCatchup.TargetCatchupPanel6"),
	import("view.technology.TargetCatchup.TargetCatchupPanel7")
}
var_0_0.CATCHUP_VERSION = 7

function var_0_0.getUIName(arg_1_0)
	return "TechnologySettingsUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = {}

	local function var_2_2(arg_3_0)
		if noEmptyStr(arg_3_0) and not var_2_1[arg_3_0] then
			var_2_1[arg_3_0] = true

			table.insert(var_2_0, arg_3_0)
		end
	end

	var_2_2("ui/TechnologySettingsUI")
	var_2_2("ui/technologysettingsui_atlas")

	for iter_2_0 = 1, var_0_0.CATCHUP_VERSION do
		var_2_2("ui/TargetCatchupPanel" .. iter_2_0)
	end

	local var_2_3 = getProxy(TechnologyProxy)

	local function var_2_4(arg_4_0)
		if arg_4_0 then
			var_2_2("TecCatchup/QChar" .. arg_4_0)
			var_2_2("TecCatchup/selbg" .. arg_4_0)
		end
	end

	for iter_2_1 = 1, var_0_0.CATCHUP_VERSION do
		local var_2_5 = pg.technology_catchup_template[iter_2_1]

		if var_2_5 then
			for iter_2_2, iter_2_3 in ipairs(var_2_5.char_choice or {}) do
				var_2_4(iter_2_3)
			end
		end
	end

	local var_2_6 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLUEPRINT_CATCHUP)

	if var_2_6 and not var_2_6:isEnd() then
		local var_2_7 = var_2_6:getConfig("page_info")

		if var_2_7 and noEmptyStr(var_2_7.ui_name) then
			var_2_2("ui/" .. var_2_7.ui_name)
		end

		local var_2_8 = var_2_6:getConfig("config_id")
		local var_2_9 = pg.activity_event_blueprint_catchup[var_2_8]

		if var_2_9 then
			var_2_4(var_2_9.char_choice)
		end
	end

	return var_2_0
end

function var_0_0.init(arg_5_0)
	arg_5_0:initData()
	arg_5_0:findUI()
	arg_5_0:addListener()
	arg_5_0:initTendencyPage()
	arg_5_0:initActCatchupPage()
end

function var_0_0.didEnter(arg_6_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_6_0._tf)
	arg_6_0:resetLeftBtnUnsel()
	arg_6_0:updateTendencyBtn(arg_6_0.curTendency)
	arg_6_0:updateTargetCatchupBtns()
	arg_6_0:updateActCatchupBtn()
	triggerButton(arg_6_0.leftBtnList[1])
	triggerToggle(arg_6_0.showFinish, arg_6_0.showFinishFlag == 1 and true or false)
	getProxy(CommanderManualProxy):TaskProgressAdd(2024, 1)
end

function var_0_0.willExit(arg_7_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0._tf)

	if arg_7_0.actCatchupTimer then
		arg_7_0.actCatchupTimer:Stop()

		arg_7_0.actCatchupTimer = nil
	end

	for iter_7_0, iter_7_1 in pairs(arg_7_0.catchupPanels) do
		iter_7_1:willExit()
	end

	arg_7_0.loader:Clear()
end

function var_0_0.initData(arg_8_0)
	arg_8_0.technologyProxy = getProxy(TechnologyProxy)
	arg_8_0.bayProxy = getProxy(BayProxy)
	arg_8_0.bagProxy = getProxy(BagProxy)
	arg_8_0.curPageID = 0
	arg_8_0.curTendency = arg_8_0.technologyProxy:getTendency(2)
	arg_8_0.curSelectedIndex = 0
	arg_8_0.reSelectTag = false
	arg_8_0.actCatchup = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLUEPRINT_CATCHUP)
	arg_8_0.isShowActCatchup = arg_8_0.actCatchup and not arg_8_0.actCatchup:isEnd()
	arg_8_0.loader = AutoLoader.New()
end

function var_0_0.findUI(arg_9_0)
	arg_9_0.bg = arg_9_0._tf:Find("BG")

	local var_9_0 = arg_9_0.bg:Find("BackTips/ClickText")

	setText(var_9_0, i18n("click_back_tip"))

	local var_9_1 = arg_9_0._tf:Find("Panel")
	local var_9_2 = var_9_1:Find("LeftScrollViewMask/LeftScrollView/LeftBtnList")

	arg_9_0.leftBtnList = {}
	arg_9_0.tendencyBtn = var_9_2:Find("TendencyBtn")
	arg_9_0.leftBtnList[var_0_0.TEC_PAGE_TENDENCY] = arg_9_0.tendencyBtn
	arg_9_0.catchupBtns = {}

	for iter_9_0 = 1, var_0_0.CATCHUP_VERSION do
		arg_9_0.catchupBtns[iter_9_0] = cloneTplTo(var_9_2:Find("TargetCatchupBtn_tpl"), var_9_2)
		arg_9_0.leftBtnList[iter_9_0 + 1] = arg_9_0.catchupBtns[iter_9_0]
	end

	arg_9_0.actCatchupBtn = var_9_2:Find("ActCatchupBtn")

	arg_9_0.actCatchupBtn:SetAsLastSibling()

	arg_9_0.leftBtnList[var_0_0.TEC_PAGE_CATCHUP_ACT] = arg_9_0.actCatchupBtn

	local var_9_3 = var_9_1:Find("RightPanelContainer")

	arg_9_0.rightPageTFList = {}
	arg_9_0.tendencyPanel = var_9_3:Find("TecTendencyPanel")
	arg_9_0.rightPageTFList[var_0_0.TEC_PAGE_TENDENCY] = arg_9_0.tendencyPanel
	arg_9_0.catchupPanels = {}
	arg_9_0.actCatchupPanel = var_9_3:Find("ActCatchupPanel")
	arg_9_0.rightPageTFList[var_0_0.TEC_PAGE_CATCHUP_ACT] = arg_9_0.actCatchupPanel
	arg_9_0.showFinish = arg_9_0._tf:Find("ShowFinishToggle")

	setText(arg_9_0.showFinish:Find("Label"), i18n("tec_target_catchup_show_the_finished_version"))

	arg_9_0.showFinishFlag = PlayerPrefs.GetInt("isShowFinishCatchupVersion") or 0

	if var_0_0.CATCHUP_VERSION < 1 then
		setActive(arg_9_0.showFinish, false)
	end
end

function var_0_0.addListener(arg_10_0)
	onButton(arg_10_0, arg_10_0.bg, function()
		arg_10_0:closeView()
	end, SFX_PANEL)

	for iter_10_0, iter_10_1 in pairs(arg_10_0.leftBtnList) do
		onButton(arg_10_0, iter_10_1, function()
			if arg_10_0.onPageSwitchAnim then
				return
			end

			if arg_10_0.curPageID ~= iter_10_0 then
				arg_10_0:resetLeftBtnUnsel()
				setActive(iter_10_1:Find("Selected"), true)
				arg_10_0:switchRightPage(iter_10_0)
			end
		end, SFX_PANEL)
	end

	onToggle(arg_10_0, arg_10_0.showFinish, function(arg_13_0)
		if var_0_0.CATCHUP_VERSION < 1 then
			return
		end

		for iter_13_0, iter_13_1 in pairs(arg_10_0.catchupBtns) do
			if iter_13_0 <= var_0_0.CATCHUP_VERSION then
				if arg_10_0.technologyProxy:getCatchupState(iter_13_0) == TechnologyCatchup.STATE_FINISHED_ALL and not arg_13_0 then
					setActive(iter_13_1, false)
				else
					setActive(iter_13_1, true)
				end
			end
		end

		arg_10_0.showFinishFlag = arg_13_0 and 1 or 0

		PlayerPrefs.SetInt("isShowFinishCatchupVersion", arg_10_0.showFinishFlag)
		triggerButton(arg_10_0.leftBtnList[1])
	end, SFX_PANEL)
end

function var_0_0.resetLeftBtnUnsel(arg_14_0)
	for iter_14_0, iter_14_1 in pairs(arg_14_0.leftBtnList) do
		local var_14_0 = iter_14_1:Find("Selected")

		setActive(var_14_0, false)
	end
end

function var_0_0.switchRightPage(arg_15_0, arg_15_1)
	seriesAsync({
		function(arg_16_0)
			if not arg_15_0.rightPageTFList[arg_15_1] then
				local var_16_0 = arg_15_1 - 1
				local var_16_1 = arg_15_0._tf:Find("Panel/RightPanelContainer")

				arg_15_0.catchupPanels[var_16_0] = var_0_0.CATCHUP_CLASSES[var_16_0].New(nil, function()
					arg_15_0.rightPageTFList[arg_15_1] = arg_15_0.catchupPanels[var_16_0]._go

					setActive(arg_15_0.rightPageTFList[arg_15_1], false)
					SetParent(arg_15_0.rightPageTFList[arg_15_1], var_16_1, false)
					arg_16_0()
				end)
			else
				arg_16_0()
			end
		end,
		function(arg_18_0)
			local var_18_0 = arg_15_0.rightPageTFList[arg_15_0.curPageID]
			local var_18_1 = arg_15_0.rightPageTFList[arg_15_1]

			setActive(var_18_1, true)

			arg_15_0.onPageSwitchAnim = true

			arg_15_0:managedTween(LeanTween.alphaCanvas, function()
				arg_15_0.onPageSwitchAnim = false
			end, GetOrAddComponent(var_18_1, typeof(CanvasGroup)), 1, var_0_0.PANEL_INTO_TIME):setFrom(0)

			if var_18_0 then
				arg_15_0:managedTween(LeanTween.alphaCanvas, function()
					setActive(var_18_0, false)
				end, GetOrAddComponent(var_18_0, typeof(CanvasGroup)), 0, var_0_0.PANEL_INTO_TIME):setFrom(1)
			end

			arg_15_0.curPageID = arg_15_1

			if arg_15_1 == var_0_0.TEC_PAGE_TENDENCY then
				arg_15_0:updateTendencyPage(arg_15_0.curTendency)
			elseif arg_15_1 == var_0_0.TEC_PAGE_CATCHUP_ACT then
				arg_15_0:updateActCatchupPage()
			else
				arg_15_0:updateTargetCatchupPage(arg_15_1 - 1)
			end
		end
	})
end

function var_0_0.initTendencyPage(arg_21_0)
	local var_21_0 = getProxy(TechnologyProxy):getConfigMaxVersion()
	local var_21_1 = arg_21_0.tendencyPanel:Find("TecItemList")
	local var_21_2 = UIItemList.New(var_21_1, var_21_1:Find("tpl"))

	var_21_2:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = arg_22_1 > 0 and i18n("tec_tendency_x", i18n("number_" .. arg_22_1)) or i18n("tec_tendency_0")

			setText(arg_22_2:Find("UnSelect/Text"), var_22_0)
			setText(arg_22_2:Find("Selected/Text"), var_22_0)
			onButton(arg_21_0, arg_22_2, function()
				if arg_21_0.curTendency ~= arg_22_1 then
					arg_21_0:emit(TechnologySettingsMediator.CHANGE_TENDENCY, arg_22_1)
				end
			end, SFX_PANEL)
		end
	end)
	var_21_2:align(var_21_0 + 1)
end

function var_0_0.updateTendencyPage(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.tendencyPanel:Find("TecItemList")

	setActive(var_24_0:GetChild(arg_24_0.curTendency):Find("Selected"), false)

	local var_24_1 = var_24_0:GetChild(arg_24_1):Find("Selected")

	setActive(var_24_1, true)
	setImageAlpha(var_24_1:Find("Image"), 0)
	arg_24_0:managedTween(LeanTween.alpha, nil, var_24_1:Find("Image"), 1, var_0_0.SELECT_TENDENCY_FADE_TIME):setFrom(0)

	local var_24_2 = arg_24_0.tendencyPanel:Find("TendencyNum")

	setImageAlpha(var_24_2:Find("Image"), 0)

	if arg_24_1 > 0 then
		GetImageSpriteFromAtlasAsync("ui/technologysettingsui_atlas", "right_tendency_num_" .. arg_24_1, var_24_2:Find("Image"), true)
		arg_24_0:managedTween(LeanTween.alpha, nil, var_24_2:Find("Image"), 1, var_0_0.SELECT_TENDENCY_FADE_TIME):setFrom(0)
	end

	arg_24_0.curTendency = arg_24_1
end

function var_0_0.updateTendencyBtn(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1 > 0 and i18n("tec_tendency_cur_x", i18n("number_" .. arg_25_1)) or i18n("tec_tendency_cur_0")

	setText(arg_25_0.tendencyBtn:Find("UnSelect/Text"), var_25_0)
	setText(arg_25_0.tendencyBtn:Find("Selected/Text"), var_25_0)
end

function var_0_0.updateTargetCatchupPage(arg_26_0, arg_26_1)
	arg_26_0.catchupPanels[arg_26_1]:updateTargetCatchupPage()
end

function var_0_0.updateTargetCatchupBtns(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.catchupBtns) do
		if iter_27_0 <= var_0_0.CATCHUP_VERSION then
			local var_27_0 = arg_27_0.technologyProxy:getCatchupState(iter_27_0)
			local var_27_1 = var_27_0 == TechnologyCatchup.STATE_CATCHUPING
			local var_27_2 = iter_27_1:Find("UnSelect/Text")
			local var_27_3 = iter_27_1:Find("Selected/Text")
			local var_27_4 = iter_27_1:Find("UnSelect/CharImg")
			local var_27_5 = iter_27_1:Find("Selected/CharImg")
			local var_27_6 = var_27_4:Find("ProgressText")
			local var_27_7 = var_27_5:Find("ProgressText")

			setActive(var_27_4, var_27_1)
			setActive(var_27_5, var_27_1)

			if var_27_1 then
				local var_27_8 = iter_27_0 > 0 and i18n("tec_target_catchup_selected_x", i18n("number_" .. iter_27_0)) or i18n("tec_target_catchup_selected_0")

				setText(var_27_2, var_27_8)
				setText(var_27_3, var_27_8)

				local var_27_9 = arg_27_0.technologyProxy:getCurCatchupTecInfo()
				local var_27_10 = var_27_9.tecID
				local var_27_11 = var_27_9.groupID
				local var_27_12 = var_27_9.printNum
				local var_27_13 = arg_27_0.technologyProxy:getCatchupData(var_27_10):isUr(var_27_11) and pg.technology_catchup_template[var_27_10].obtain_max_per_ur or pg.technology_catchup_template[var_27_10].obtain_max

				setImageSprite(var_27_4, LoadSprite("TecCatchup/QChar" .. var_27_11, tostring(var_27_11)))
				setImageSprite(var_27_5, LoadSprite("TecCatchup/QChar" .. var_27_11, tostring(var_27_11)))
				setText(var_27_6, var_27_12 .. "/" .. var_27_13)
				setText(var_27_7, var_27_12 .. "/" .. var_27_13)
			elseif var_27_0 == TechnologyCatchup.STATE_UNSELECT then
				local var_27_14 = iter_27_0 > 0 and i18n("tec_target_catchup_none_x", i18n("number_" .. iter_27_0)) or i18n("tec_target_catchup_none_0")

				setText(var_27_2, var_27_14)
				setText(var_27_3, var_27_14)
			elseif var_27_0 == TechnologyCatchup.STATE_FINISHED_ALL then
				local var_27_15 = iter_27_0 > 0 and i18n("tec_target_catchup_finish_x", i18n("number_" .. iter_27_0)) or i18n("tec_target_catchup_finish_0")

				setText(var_27_2, var_27_15)
				setText(var_27_3, var_27_15)
			end
		end
	end
end

function var_0_0.initActCatchupPage(arg_28_0)
	if arg_28_0.isShowActCatchup then
		local var_28_0 = arg_28_0.actCatchup:getConfig("page_info").ui_name

		arg_28_0.loader:GetPrefab("ui/" .. var_28_0, "", function(arg_29_0)
			setParent(arg_29_0, arg_28_0.actCatchupPanel)
			setLocalScale(arg_29_0, {
				x = 0.925,
				y = 0.923
			})
			setAnchoredPosition(arg_29_0, Vector2.zero)

			arg_28_0.actCatchupTF = tf(arg_29_0):Find("AD")
			arg_28_0.actCatchupItemTF = arg_28_0.actCatchupTF:Find("Award")
			arg_28_0.actCatchupSliderTF = arg_28_0.actCatchupTF:Find("Slider")
			arg_28_0.actCatchupProgressText = arg_28_0.actCatchupTF:Find("Progress")

			local var_29_0 = arg_28_0.actCatchupTF:Find("GoBtn")

			if var_29_0 then
				setActive(var_29_0, false)
			end

			local var_29_1 = arg_28_0.actCatchupTF:Find("FinishBtn")

			if var_29_1 then
				setActive(var_29_1, false)
			end

			local var_29_2 = arg_28_0.actCatchup.data1
			local var_29_3 = arg_28_0.actCatchup:getConfig("config_id")
			local var_29_4 = pg.activity_event_blueprint_catchup[var_29_3].obtain_max
			local var_29_5 = arg_28_0.actCatchup:getConfig("config_client").itemid
			local var_29_6 = {
				type = DROP_TYPE_ITEM,
				id = var_29_5
			}

			updateDrop(arg_28_0.actCatchupItemTF, var_29_6)
			onButton(arg_28_0, arg_28_0.actCatchupItemTF, function()
				arg_28_0:emit(BaseUI.ON_DROP, var_29_6)
			end, SFX_PANEL)
			setSlider(arg_28_0.actCatchupSliderTF, 0, var_29_4, var_29_2)
			setText(arg_28_0.actCatchupProgressText, var_29_2 .. "/" .. var_29_4)
			setActive(arg_29_0, true)
		end)
	end
end

function var_0_0.updateActCatchupPage(arg_31_0)
	return
end

function var_0_0.updateActCatchupBtn(arg_32_0)
	local var_32_0 = arg_32_0.actCatchupBtn:Find("UnSelect/Text")
	local var_32_1 = arg_32_0.actCatchupBtn:Find("Selected/Text")

	setText(var_32_0, i18n("tec_act_catchup_btn_word"))
	setText(var_32_1, i18n("tec_act_catchup_btn_word"))

	local var_32_2 = arg_32_0.actCatchupBtn:Find("UnSelect/CharImg")
	local var_32_3 = arg_32_0.actCatchupBtn:Find("Selected/CharImg")
	local var_32_4 = var_32_2:Find("ProgressText")
	local var_32_5 = var_32_3:Find("ProgressText")
	local var_32_6 = false
	local var_32_7 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLUEPRINT_CATCHUP)

	if var_32_7 and not var_32_7:isEnd() then
		local var_32_8 = var_32_7.data1
		local var_32_9 = var_32_7:getConfig("config_id")
		local var_32_10 = pg.activity_event_blueprint_catchup[var_32_9].char_choice
		local var_32_11 = pg.activity_event_blueprint_catchup[var_32_9].obtain_max

		setImageSprite(var_32_2, LoadSprite("TecCatchup/QChar" .. var_32_10, tostring(var_32_10)))
		setImageSprite(var_32_3, LoadSprite("TecCatchup/QChar" .. var_32_10, tostring(var_32_10)))
		setText(var_32_4, var_32_8 .. "/" .. var_32_11)
		setText(var_32_5, var_32_8 .. "/" .. var_32_11)

		local var_32_12 = var_32_7.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

		if arg_32_0.actCatchupTimer then
			arg_32_0.actCatchupTimer:Stop()

			arg_32_0.actCatchupTimer = nil
		end

		local var_32_13 = arg_32_0.actCatchupBtn:Find("TimeLeft/Day")
		local var_32_14 = arg_32_0.actCatchupBtn:Find("TimeLeft/Hour")
		local var_32_15 = arg_32_0.actCatchupBtn:Find("TimeLeft/Min")
		local var_32_16 = arg_32_0.actCatchupBtn:Find("TimeLeft/NumText")

		local function var_32_17()
			local var_33_0, var_33_1, var_33_2, var_33_3 = pg.TimeMgr.GetInstance():parseTimeFrom(var_32_12)

			var_32_12 = var_32_12 - 1

			if var_33_0 >= 1 then
				setActive(var_32_13, true)
				setActive(var_32_14, false)
				setActive(var_32_15, false)
				setText(var_32_16, var_33_0)
			elseif var_33_0 <= 0 and var_33_1 > 0 then
				setActive(var_32_13, false)
				setActive(var_32_14, true)
				setActive(var_32_15, false)
				setText(var_32_16, var_33_1)
			elseif var_33_0 <= 0 and var_33_1 <= 0 and (var_33_2 > 0 or var_33_3 > 0) then
				setActive(var_32_13, false)
				setActive(var_32_14, false)
				setActive(var_32_15, true)
				setText(var_32_16, math.max(var_33_2, 1))
			elseif var_33_0 <= 0 and var_33_1 <= 0 and var_33_2 <= 0 and var_33_3 <= 0 and arg_32_0.actCatchupTimer then
				arg_32_0.actCatchupTimer:Stop()

				arg_32_0.actCatchupTimer = nil

				arg_32_0:switchRightPage(var_0_0.TEC_PAGE_TENDENCY)
				setActive(arg_32_0.actCatchupBtn, false)
			end
		end

		arg_32_0.actCatchupTimer = Timer.New(var_32_17, 1, -1, 1)

		arg_32_0.actCatchupTimer:Start()
		arg_32_0.actCatchupTimer.func()

		var_32_6 = true
	end

	setActive(arg_32_0.actCatchupBtn, var_32_6)
end

return var_0_0

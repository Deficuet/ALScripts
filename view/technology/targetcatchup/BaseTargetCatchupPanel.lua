local var_0_0 = class("BaseTargetCatchupPanel", import("...base.BaseUI"))

var_0_0.SELECT_CHAR_LIGHT_FADE_TIME = 0.3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0)
	PoolMgr.GetInstance():GetUI(arg_1_0:getUIName(), true, function(arg_2_0)
		arg_2_0.transform:SetParent(arg_1_1, false)
		arg_1_0:onUILoaded(arg_2_0)

		if arg_1_2 then
			arg_1_2()
		end
	end)
end

function var_0_0.getUIName(arg_3_0)
	assert(false)

	return ""
end

function var_0_0.init(arg_4_0)
	return
end

function var_0_0.initData(arg_5_0)
	arg_5_0.curSelectedIndex = 0
	arg_5_0.technologyProxy = getProxy(TechnologyProxy)
	arg_5_0.bayProxy = getProxy(BayProxy)
	arg_5_0.bagProxy = getProxy(BagProxy)
	arg_5_0.configCatchup = pg.technology_catchup_template
	arg_5_0.charIDList = arg_5_0.configCatchup[arg_5_0.tecID].char_choice
	arg_5_0.urList = arg_5_0.configCatchup[arg_5_0.tecID].ur_char
	arg_5_0.state = arg_5_0.technologyProxy:getCatchupState(arg_5_0.tecID)
end

function var_0_0.initUI(arg_6_0)
	arg_6_0.choosePanel = arg_6_0._tf:Find("ChoosePanel")

	local var_6_0 = arg_6_0.choosePanel:Find("SelectedImgTpl")
	local var_6_1 = arg_6_0.choosePanel:Find("SelectedImgList")

	arg_6_0.selectedImgUIItemList = UIItemList.New(var_6_1, var_6_0)

	arg_6_0.selectedImgUIItemList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			arg_7_1 = arg_7_1 + 1

			local var_7_0 = arg_7_2:Find("Selected")

			setActive(var_7_0, arg_7_1 == arg_6_0.curSelectedIndex)

			if arg_7_1 == arg_6_0.curSelectedIndex then
				setImageAlpha(var_7_0, 0)
				arg_6_0:updateProgress(arg_6_0.charIDList[arg_6_0.curSelectedIndex])
				arg_6_0:managedTween(LeanTween.alpha, nil, rtf(var_7_0), 1, var_0_0.SELECT_CHAR_LIGHT_FADE_TIME):setFrom(0)
			end
		end
	end)
	arg_6_0.selectedImgUIItemList:align(#arg_6_0.charIDList)

	local var_6_2 = arg_6_0.choosePanel:Find("CharTpl")
	local var_6_3 = arg_6_0.choosePanel:Find("CharList")

	arg_6_0.charUIItemList = UIItemList.New(var_6_3, var_6_2)

	arg_6_0.charUIItemList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_8_1 = arg_8_1 + 1

			arg_6_0:updateCharTpl(arg_8_1, arg_8_2)
			onButton(arg_6_0, arg_8_2, function()
				if arg_8_1 ~= arg_6_0.curSelectedIndex then
					arg_6_0.curSelectedIndex = arg_8_1

					arg_6_0.selectedImgUIItemList:align(#arg_6_0.charIDList)
				end
			end, SFX_PANEL)
		end
	end)
	arg_6_0.charUIItemList:align(#arg_6_0.charIDList)

	arg_6_0.confirmBtn = arg_6_0.choosePanel:Find("ConfirmBtn")

	onButton(arg_6_0, arg_6_0.confirmBtn, function()
		if arg_6_0.curSelectedIndex and arg_6_0.curSelectedIndex ~= 0 then
			local var_10_0 = arg_6_0.charIDList[arg_6_0.curSelectedIndex]

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tec_target_catchup_select_tip", ShipGroup.getDefaultShipNameByGroupID(var_10_0)),
				onYes = function()
					pg.m02:sendNotification(GAME.SELECT_TEC_TARGET_CATCHUP, {
						tecID = arg_6_0.tecID,
						charID = var_10_0
					})
				end
			})
		end
	end, SFX_PANEL)

	arg_6_0.proTitle = arg_6_0.choosePanel:Find("ProgressTitle/Text")

	setText(arg_6_0.proTitle, i18n("tec_target_catchup_progress"))

	arg_6_0.ssrProgress = arg_6_0.choosePanel:Find("ProgressTitle/Progress_SSR")
	arg_6_0.urProgress = arg_6_0.choosePanel:Find("ProgressTitle/Progress_UR")
	arg_6_0.showPanel = arg_6_0._tf:Find("ShowPanel")
	arg_6_0.showBG = arg_6_0.showPanel:Find("BG")
	arg_6_0.nameText = arg_6_0.showPanel:Find("NameText")
	arg_6_0.progressText = arg_6_0.showPanel:Find("Progress/ProgressText")
	arg_6_0.tipText = arg_6_0.showPanel:Find("Progress/Text")

	setText(arg_6_0.tipText, i18n("tec_target_catchup_progress"))

	arg_6_0.selectedImg = arg_6_0.showPanel:Find("Selected")
	arg_6_0.giveupBtn = arg_6_0.showPanel:Find("GiveupBtn")
	arg_6_0.finishedImg = arg_6_0.showPanel:Find("Finished")
	arg_6_0.helpBtn = arg_6_0._tf:Find("HelpBtn")

	onButton(arg_6_0, arg_6_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.tec_target_catchup_help_tip.tip
		})
	end, SFX_PANEL)
	setText(arg_6_0.choosePanel:Find("FinishAll/BG/Text"), i18n("tec_target_catchup_all_finish_tip"))
	setText(arg_6_0.choosePanel:Find("CharListBG/SSRTag/Text"), i18n("tec_target_catchup_pry_char"))

	if #arg_6_0.urList > 0 then
		setText(arg_6_0.choosePanel:Find("FinishPart/BG/Text"), i18n("tec_target_catchup_dr_finish_tip"))
		setText(arg_6_0.choosePanel:Find("CharListBG/URTag/Text"), i18n("tec_target_catchup_dr_char"))
	end

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.urList) do
		setText(arg_6_0.choosePanel:Find("Finish_" .. iter_6_1 .. "/BG/Text"), i18n("tec_target_catchup_dr_finish_tip"))
	end
end

function var_0_0.updateTargetCatchupPage(arg_13_0)
	arg_13_0.state = arg_13_0.technologyProxy:getCatchupState(arg_13_0.tecID)

	if arg_13_0.state == TechnologyCatchup.STATE_CATCHUPING then
		arg_13_0:updateShowPanel()
	else
		arg_13_0:updateChoosePanel()
	end
end

function var_0_0.updateCharTpl(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_2:Find("PrintNum/Text")

	setText(var_14_0, i18n("tec_target_need_print"))

	local var_14_1 = arg_14_2:Find("PrintNum/NumText")
	local var_14_2 = arg_14_2:Find("NameText")
	local var_14_3 = arg_14_2:Find("LevelText")
	local var_14_4 = arg_14_2:Find("NotGetTag")
	local var_14_5 = arg_14_0.charIDList[arg_14_1]
	local var_14_6 = arg_14_0.bayProxy:findShipByGroup(var_14_5)
	local var_14_7 = arg_14_0.technologyProxy:getBluePrintVOByGroupID(var_14_5)
	local var_14_8 = pg.ship_data_blueprint[var_14_5].strengthen_item
	local var_14_9 = var_14_6 and math.floor(arg_14_0:getShipBluePrintCurExp(var_14_7) / Item.getConfigData(var_14_8).usage_arg[1]) or 0
	local var_14_10 = arg_14_0.configCatchup[arg_14_0.tecID].blueprint_max[arg_14_1]
	local var_14_11 = arg_14_0.bagProxy:getItemCountById(var_14_8)
	local var_14_12 = math.max(var_14_10 - var_14_9 - var_14_11, 0)

	setText(var_14_1, var_14_12)

	local var_14_13 = ShipGroup.getDefaultShipNameByGroupID(var_14_5)

	setText(var_14_2, var_14_13)
	setActive(var_14_3, var_14_6)
	setActive(var_14_4, not var_14_6)

	if var_14_6 then
		local var_14_14 = arg_14_0.technologyProxy:getBluePrintVOByGroupID(var_14_5)

		setText(var_14_3, "Lv. " .. var_14_14.level .. "/" .. var_14_14:getMaxLevel())
	end
end

function var_0_0.updateShowPanel(arg_15_0)
	setActive(arg_15_0.showPanel, true)
	setActive(arg_15_0.choosePanel, false)

	local var_15_0 = arg_15_0.technologyProxy:getCurCatchupTecInfo()
	local var_15_1 = var_15_0.tecID
	local var_15_2 = var_15_0.groupID
	local var_15_3 = var_15_0.printNum

	setImageSprite(arg_15_0.showBG, LoadSprite("TecCatchup/selbg" .. var_15_2, var_15_2))

	local var_15_4 = ShipGroup.getDefaultShipNameByGroupID(var_15_2)

	setText(arg_15_0.nameText, var_15_4)
	setText(arg_15_0.progressText, var_15_3 .. "/" .. arg_15_0:getMaxNum(var_15_2))

	local var_15_5 = arg_15_0.state == TechnologyCatchup.STATE_FINISHED_ALL

	setActive(arg_15_0.finishedImg, var_15_5)
	setActive(arg_15_0.selectedImg, not var_15_5)
	onButton(arg_15_0, arg_15_0.selectedImg, function()
		arg_15_0:updateChoosePanel()
		setActive(arg_15_0.choosePanel:Find("ProgressTitle"), false)
	end, SFX_PANEL)
end

function var_0_0.updateChoosePanel(arg_17_0)
	setActive(arg_17_0.showPanel, false)
	setActive(arg_17_0.choosePanel, true)

	local var_17_0 = arg_17_0.technologyProxy:getCatchupData(arg_17_0.tecID)

	if arg_17_0.state == TechnologyCatchup.STATE_FINISHED_ALL then
		setActive(arg_17_0.choosePanel:Find("FinishAll"), true)
		setActive(arg_17_0.choosePanel:Find("ProgressTitle"), false)
	elseif #arg_17_0.urList > 0 then
		setActive(arg_17_0.choosePanel:Find("FinishAll"), false)

		local var_17_1 = var_17_0:isFinishSSR()

		setActive(arg_17_0.choosePanel:Find("FinishPart"), var_17_1)

		for iter_17_0, iter_17_1 in ipairs(arg_17_0.urList) do
			local var_17_2 = var_17_0:isFinish(iter_17_1)

			setActive(arg_17_0.choosePanel:Find("Finish_" .. iter_17_1), var_17_2)
		end
	end
end

function var_0_0.updateProgress(arg_18_0, arg_18_1)
	setActive(arg_18_0.choosePanel:Find("ProgressTitle"), true)

	local var_18_0 = arg_18_0.technologyProxy:getCatchupData(arg_18_0.tecID):getTargetNum(arg_18_1)
	local var_18_1 = arg_18_0:getMaxNum(arg_18_1)

	if arg_18_0:isUR(arg_18_1) then
		setActive(arg_18_0.urProgress, true)
		setActive(arg_18_0.ssrProgress, false)
		setText(arg_18_0.urProgress:Find("Text"), var_18_0 .. "/" .. var_18_1)
	else
		setActive(arg_18_0.urProgress, false)
		setActive(arg_18_0.ssrProgress, true)
		setText(arg_18_0.ssrProgress:Find("Text"), var_18_0 .. "/" .. var_18_1)
	end
end

function var_0_0.isUR(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in ipairs(arg_19_0.urList) do
		if arg_19_1 == iter_19_1 then
			return true
		end
	end

	return false
end

function var_0_0.getMaxNum(arg_20_0, arg_20_1)
	return arg_20_0:isUR(arg_20_1) and pg.technology_catchup_template[arg_20_0.tecID].obtain_max_per_ur or pg.technology_catchup_template[arg_20_0.tecID].obtain_max
end

function var_0_0.willExit(arg_21_0)
	PoolMgr.GetInstance():ReturnUI(arg_21_0:getUIName(), arg_21_0._go)
end

function var_0_0.getShipBluePrintCurExp(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.level
	local var_22_1 = arg_22_1.fateLevel
	local var_22_2 = arg_22_1.exp
	local var_22_3 = arg_22_1:getConfig("strengthen_effect")
	local var_22_4 = arg_22_1:getConfig("fate_strengthen")
	local var_22_5 = 0 + var_22_2

	for iter_22_0 = 1, var_22_0 do
		var_22_5 = var_22_5 + pg.ship_strengthen_blueprint[var_22_3[iter_22_0]].need_exp
	end

	for iter_22_1 = 1, var_22_1 do
		var_22_5 = var_22_5 + pg.ship_strengthen_blueprint[var_22_4[iter_22_1]].need_exp
	end

	return var_22_5
end

return var_0_0

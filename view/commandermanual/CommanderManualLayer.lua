local var_0_0 = class("CommanderManualLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderManualUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("blur_panel/top/CommonTitleAndBack/back_btn")
	arg_2_0.helpBtn = arg_2_0:findTF("blur_panel/top/helpBtn")
	arg_2_0.taskBtn = arg_2_0:findTF("blur_panel/panel/pageBtns/taskBtn")
	arg_2_0.techBtn = arg_2_0:findTF("blur_panel/panel/pageBtns/techBtn")
	arg_2_0.guideBtn = arg_2_0:findTF("blur_panel/panel/pageBtns/guideBtn")
	arg_2_0.topBtns = {
		arg_2_0.taskBtn,
		arg_2_0.techBtn,
		arg_2_0.guideBtn
	}
	arg_2_0.pages = arg_2_0:findTF("blur_panel/panel/pages")
	arg_2_0.taskPage = arg_2_0:findTF("blur_panel/panel/pages/taskPage")
	arg_2_0.techPage = arg_2_0:findTF("blur_panel/panel/pages/techPage")
	arg_2_0.guidePage = arg_2_0:findTF("blur_panel/panel/pages/guidePage")
	arg_2_0.blurPanel = arg_2_0._tf:Find("blur_panel")
	arg_2_0.pageBg = arg_2_0._tf:Find("blur_panel/panel/mask/pageBg")

	pg.UIMgr.GetInstance():OverlayPanel(arg_2_0.blurPanel, {
		pbList = {
			arg_2_0.pageBg
		}
	})
	setText(arg_2_0:findTF("blur_panel/top/CommonTitleAndBack/title"), i18n("handbook_name"))
	setText(arg_2_0:findTF("blur_panel/top/CommonTitleAndBack/title/en"), "HANDBOOK")
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/go_btn/Text", arg_2_0.taskPage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/get_btn/Text", arg_2_0.taskPage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/got_btn/Text", arg_2_0.taskPage), i18n("handbook_finished"))
	setText(arg_2_0:findTF("page/ptPanel/go_btn/Text", arg_2_0.taskPage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/ptPanel/get_btn/Text", arg_2_0.taskPage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/ptPanel/got_btn/Text", arg_2_0.taskPage), i18n("handbook_finished"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/go_btn/Text", arg_2_0.techPage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/lock_btn/Text", arg_2_0.techPage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/get_btn/Text", arg_2_0.techPage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/got_btn/Text", arg_2_0.techPage), i18n("handbook_finished"))
	setText(arg_2_0:findTF("page/ptPanel/go_btn/Text", arg_2_0.techPage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/ptPanel/get_btn/Text", arg_2_0.techPage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/ptPanel/got_btn/Text", arg_2_0.techPage), i18n("handbook_finished"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/content/descBg/go_btn/Text", arg_2_0.guidePage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/content/descBg/get_btn/Text", arg_2_0.guidePage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/normal/content/descBg/got_btn/Text", arg_2_0.guidePage), i18n("handbook_finished"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/fold/descBg/go_btn/Text", arg_2_0.guidePage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/fold/descBg/get_btn/Text", arg_2_0.guidePage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/scroll/Viewport/Content/tpl/fold/descBg/got_btn/Text", arg_2_0.guidePage), i18n("handbook_finished"))
	setText(arg_2_0:findTF("page/ptPanel/go_btn/Text", arg_2_0.guidePage), i18n("handbook_process"))
	setText(arg_2_0:findTF("page/ptPanel/get_btn/Text", arg_2_0.guidePage), i18n("handbook_claim"))
	setText(arg_2_0:findTF("page/ptPanel/got_btn/Text", arg_2_0.guidePage), i18n("handbook_finished"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.handbook_gametip.tip
		})
	end, SFX_PANEL)
	arg_3_0:InitData()
	arg_3_0:RefreshAll()
end

function var_0_0.InitData(arg_6_0)
	arg_6_0.commanderManualProxy = getProxy(CommanderManualProxy)
	arg_6_0.taskProxy = getProxy(TaskProxy)
	arg_6_0.taskPages = arg_6_0.commanderManualProxy:GetPagesByType(1)
	arg_6_0.guidePages = arg_6_0.commanderManualProxy:GetPagesByType(2)
	arg_6_0.topTaskCfg = pg.tutorial_handbook[CommanderManualProxy.TOP_PAGE_TASK]
	arg_6_0.topTechCfg = pg.tutorial_handbook[CommanderManualProxy.TOP_PAGE_TECH]
	arg_6_0.topGuideCfg = pg.tutorial_handbook[CommanderManualProxy.TOP_PAGE_GUIDE]

	arg_6_0:UpdateTechActivity()
end

function var_0_0.UpdateTechActivity(arg_7_0)
	arg_7_0.techActivity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP)

	if not arg_7_0.techActivity or arg_7_0.techActivity:isEnd() then
		return
	end

	local var_7_0 = arg_7_0.techActivity

	arg_7_0.allTechPhase = #var_7_0:getConfig("config_data")[3] + 1

	if var_7_0.data1 == 0 then
		arg_7_0.phaseId = "ready"
	else
		arg_7_0.phaseId = var_7_0.data1

		if arg_7_0.phaseId == 1 and var_7_0.data2 < 1 then
			arg_7_0.phaseId = 0
		end
	end

	arg_7_0.techFinishTaskId = arg_7_0.phaseId ~= "ready" and var_7_0:getConfig("config_data")[3][math.max(1, arg_7_0.phaseId)][2] or nil
	arg_7_0.finishPhaseDic = {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0.data1_list) do
		arg_7_0.finishPhaseDic[iter_7_1] = true
	end

	arg_7_0.finishPhaseDic[0] = arg_7_0.finishPhaseDic[1]
	arg_7_0.finishPhaseDic[1] = var_7_0.data2 == 1 and var_7_0.data1 ~= 1
end

function var_0_0.RefreshAll(arg_8_0)
	local var_8_0 = arg_8_0.commanderManualProxy:IsTopUnlock(CommanderManualProxy.TOP_PAGE_TASK)
	local var_8_1 = arg_8_0.commanderManualProxy:IsTopUnlock(CommanderManualProxy.TOP_PAGE_TECH)
	local var_8_2 = arg_8_0.commanderManualProxy:IsTopUnlock(CommanderManualProxy.TOP_PAGE_GUIDE)

	setActive(arg_8_0.taskBtn, not arg_8_0.commanderManualProxy:IsTopPageComplete(1))

	local var_8_3, var_8_4 = TechnologyConst.isTecActOn()

	setActive(arg_8_0.techBtn, var_8_3)
	setActive(arg_8_0:findTF("Text/lock", arg_8_0.taskBtn), not var_8_0)
	setActive(arg_8_0:findTF("Text/lock", arg_8_0.techBtn), not var_8_1)
	setActive(arg_8_0:findTF("Text/lock", arg_8_0.guideBtn), not var_8_2)
	setText(arg_8_0:findTF("Text", arg_8_0.taskBtn), var_8_0 and arg_8_0.topTaskCfg.name or arg_8_0.topTaskCfg.lock_name)
	setText(arg_8_0:findTF("Text", arg_8_0.techBtn), var_8_1 and arg_8_0.topTechCfg.name or arg_8_0.topTechCfg.lock_name)
	setText(arg_8_0:findTF("Text", arg_8_0.guideBtn), var_8_2 and arg_8_0.topGuideCfg.name or arg_8_0.topGuideCfg.lock_name)
	setText(arg_8_0:findTF("select/Text", arg_8_0.taskBtn), arg_8_0.topTaskCfg.name)
	setText(arg_8_0:findTF("select/Text", arg_8_0.techBtn), arg_8_0.topTechCfg.name)
	setText(arg_8_0:findTF("select/Text", arg_8_0.guideBtn), arg_8_0.topGuideCfg.name)
	setText(arg_8_0:findTF("select/en", arg_8_0.taskBtn), arg_8_0.topTaskCfg.eng_name)
	setText(arg_8_0:findTF("select/en", arg_8_0.techBtn), arg_8_0.topTechCfg.eng_name)
	setText(arg_8_0:findTF("select/en", arg_8_0.guideBtn), arg_8_0.topGuideCfg.eng_name)
	setActive(arg_8_0:findTF("tip", arg_8_0.taskBtn), arg_8_0.commanderManualProxy:ShouldShowTipByType(1))
	setActive(arg_8_0:findTF("tip", arg_8_0.techBtn), var_8_4)
	setActive(arg_8_0:findTF("tip", arg_8_0.guideBtn), arg_8_0.commanderManualProxy:ShouldShowTipByType(2))

	arg_8_0.hasRefreshed = false

	onButton(arg_8_0, arg_8_0.taskBtn, function()
		if arg_8_0.contextData.topIndex ~= 1 or not arg_8_0.hasRefreshed then
			if var_8_0 then
				arg_8_0.contextData.topIndex = 1

				if arg_8_0.hasRefreshed then
					arg_8_0.contextData.currentPageId = nil
				end

				arg_8_0:SetPagesActive(1)
				arg_8_0:ShowTaskPage()

				for iter_9_0, iter_9_1 in ipairs(arg_8_0.topBtns) do
					setActive(arg_8_0:findTF("select", iter_9_1), iter_9_1 == arg_8_0.taskBtn)
				end
			else
				local var_9_0 = arg_8_0.commanderManualProxy:GetLockTip(CommanderManualProxy.TOP_PAGE_TASK)

				if var_9_0 and var_9_0 ~= "" then
					pg.TipsMgr.GetInstance():ShowTips(var_9_0)
				end
			end
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.techBtn, function()
		if arg_8_0.contextData.topIndex ~= 2 or not arg_8_0.hasRefreshed then
			if var_8_1 then
				arg_8_0.contextData.topIndex = 2

				if arg_8_0.hasRefreshed then
					arg_8_0.contextData.currentPageId = nil
				end

				arg_8_0:SetPagesActive(2)
				arg_8_0:ShowTechPage()

				for iter_10_0, iter_10_1 in ipairs(arg_8_0.topBtns) do
					setActive(arg_8_0:findTF("select", iter_10_1), iter_10_1 == arg_8_0.techBtn)
				end
			else
				local var_10_0 = arg_8_0.commanderManualProxy:GetLockTip(CommanderManualProxy.TOP_PAGE_TECH)

				if var_10_0 and var_10_0 ~= "" then
					pg.TipsMgr.GetInstance():ShowTips(var_10_0)
				end
			end
		end
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.guideBtn, function()
		if arg_8_0.contextData.topIndex ~= 3 or not arg_8_0.hasRefreshed then
			if var_8_2 then
				arg_8_0.contextData.topIndex = 3

				if arg_8_0.hasRefreshed then
					arg_8_0.contextData.currentPageId = nil
				end

				arg_8_0:SetPagesActive(3)
				arg_8_0:ShowGuidePage()

				for iter_11_0, iter_11_1 in ipairs(arg_8_0.topBtns) do
					setActive(arg_8_0:findTF("select", iter_11_1), iter_11_1 == arg_8_0.guideBtn)
				end
			else
				local var_11_0 = arg_8_0.commanderManualProxy:GetLockTip(CommanderManualProxy.TOP_PAGE_GUIDE)

				if var_11_0 and var_11_0 ~= "" then
					pg.TipsMgr.GetInstance():ShowTips(var_11_0)
				end
			end
		end
	end, SFX_PANEL)

	if arg_8_0.contextData.topIndex then
		triggerButton(arg_8_0.topBtns[arg_8_0.contextData.topIndex])

		arg_8_0.hasRefreshed = true
	else
		local var_8_5 = false

		for iter_8_0, iter_8_1 in ipairs(arg_8_0.topBtns) do
			if isActive(iter_8_1) and not isActive(arg_8_0:findTF("Text/lock", iter_8_1)) and isActive(arg_8_0:findTF("tip", iter_8_1)) then
				triggerButton(iter_8_1)

				var_8_5 = true
				arg_8_0.hasRefreshed = true

				break
			end
		end

		if not var_8_5 then
			for iter_8_2, iter_8_3 in ipairs(arg_8_0.topBtns) do
				if isActive(iter_8_3) and not isActive(arg_8_0:findTF("Text/lock", iter_8_3)) then
					triggerButton(iter_8_3)

					arg_8_0.hasRefreshed = true

					break
				end
			end
		end
	end
end

function var_0_0.SetPagesActive(arg_12_0, arg_12_1)
	for iter_12_0 = 1, arg_12_0.pages.childCount do
		setActive(arg_12_0.pages:GetChild(iter_12_0 - 1), iter_12_0 == arg_12_1)
	end
end

function var_0_0.ShowTaskPage(arg_13_0)
	if not arg_13_0.taskItemAnimTime then
		arg_13_0.taskItemAnimTime = {}
	end

	local var_13_0 = UIItemList.New(arg_13_0:findTF("subPageScroll/Viewport/Content", arg_13_0.taskPage), arg_13_0:findTF("subPageScroll/Viewport/Content/subPageBtn", arg_13_0.taskPage))
	local var_13_1 = UIItemList.New(arg_13_0:findTF("page/scroll/Viewport/Content", arg_13_0.taskPage), arg_13_0:findTF("page/scroll/Viewport/Content/tpl", arg_13_0.taskPage))
	local var_13_2 = false

	var_13_0:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_13_0.taskPages[arg_14_1 + 1]

			setActive(arg_14_2:Find("name/lock"), not var_14_0.isUnlock)
			setActive(arg_14_2:Find("tip"), var_14_0:ShouldShowTip())
			setText(arg_14_2:Find("name"), var_14_0.isUnlock and var_14_0:getConfig("name") or var_14_0:getConfig("lock_name"))
			setText(arg_14_2:Find("name/en"), var_14_0:getConfig("eng_name"))
			setText(arg_14_2:Find("select/name"), var_14_0:getConfig("name"))
			setText(arg_14_2:Find("select/name/en"), var_14_0:getConfig("eng_name"))

			arg_14_2:GetComponent(typeof(CanvasGroup)).alpha = var_14_0.isUnlock and 1 or 0.5

			onButton(arg_13_0, arg_14_2, function()
				if var_14_0.isUnlock then
					arg_13_0.contextData.currentPageId = var_14_0.id

					for iter_15_0 = 1, arg_13_0:findTF("subPageScroll/Viewport/Content", arg_13_0.taskPage).childCount do
						setActive(arg_13_0:findTF("select", arg_13_0:findTF("subPageScroll/Viewport/Content", arg_13_0.taskPage):GetChild(iter_15_0 - 1)), iter_15_0 == arg_14_1 + 1)
						setActive(arg_13_0:findTF("name", arg_13_0:findTF("subPageScroll/Viewport/Content", arg_13_0.taskPage):GetChild(iter_15_0 - 1)), iter_15_0 ~= arg_14_1 + 1)

						arg_13_0:findTF("tip", arg_13_0:findTF("subPageScroll/Viewport/Content", arg_13_0.taskPage):GetChild(iter_15_0 - 1)).anchoredPosition = Vector2(iter_15_0 == arg_14_1 + 1 and -34.295 or 18, -2)
					end

					var_14_0:SortTaskIdList()
					var_13_1:make(function(arg_16_0, arg_16_1, arg_16_2)
						if arg_16_0 == UIItemList.EventUpdate then
							local var_16_0 = var_14_0.taskIdList[arg_16_1 + 1]
							local var_16_1 = pg.task_data_template[var_16_0]
							local var_16_2 = arg_13_0.taskProxy:getTaskById(var_16_0)

							setText(arg_16_2:Find("normal/number"), string.format("NO.%02d", arg_16_1 + 1))
							setText(arg_16_2:Find("normal/desc"), var_16_1.desc)

							local var_16_3 = arg_16_2:Find("normal/awards")
							local var_16_4 = var_16_3:GetChild(0)

							arg_13_0:updateTaskAwards(var_16_1.award_display, var_16_3, var_16_4)

							local var_16_5 = var_16_1.target_num
							local var_16_6 = arg_16_2:Find("normal/go_btn")
							local var_16_7 = arg_16_2:Find("normal/get_btn")
							local var_16_8 = arg_16_2:Find("normal/got_btn")
							local var_16_9 = arg_16_2:Find("normal")
							local var_16_10 = arg_16_2:Find("lock")

							if var_16_2 then
								local var_16_11 = var_16_2:getProgress()
								local var_16_12 = math.min(var_16_11, var_16_5)

								setText(arg_16_2:Find("normal/progress"), var_16_12 .. "/" .. var_16_5)
								setSlider(arg_16_2:Find("normal/slider"), 0, var_16_5, var_16_12)

								if var_16_2:getTaskStatus() == 0 then
									setActive(var_16_6, true)
									setActive(var_16_7, false)
									setActive(var_16_8, false)
								elseif var_16_2:getTaskStatus() == 1 then
									setActive(var_16_6, false)
									setActive(var_16_7, true)
									setActive(var_16_8, false)
								elseif var_16_2:getTaskStatus() == 2 then
									setActive(var_16_6, false)
									setActive(var_16_7, false)
									setActive(var_16_8, true)
								end

								onButton(arg_13_0, var_16_6, function()
									arg_13_0:emit(CommanderManualMediator.ON_TASK_GO, var_16_2)
								end, SFX_PANEL)
								onButton(arg_13_0, var_16_7, function()
									arg_13_0:TaskAwardsCheckAndSubmit(var_16_2)
								end, SFX_PANEL)
								setActive(var_16_9, true)
								setActive(var_16_10, false)
							elseif var_14_0:IsTaskComplete(var_16_0) then
								setText(arg_16_2:Find("normal/progress"), var_16_5 .. "/" .. var_16_5)
								setSlider(arg_16_2:Find("normal/slider"), 0, var_16_5, var_16_5)
								setActive(var_16_6, false)
								setActive(var_16_7, false)
								setActive(var_16_8, true)
								setActive(var_16_9, true)
								setActive(var_16_10, false)
							else
								setText(arg_16_2:Find("lock/lockBg/Text"), var_14_0:GetTaskLockTip(var_16_0))
								setActive(var_16_9, false)
								setActive(var_16_10, true)
							end

							if not arg_13_0.taskItemAnimTime[var_16_0] or Time.realtimeSinceStartup - arg_13_0.taskItemAnimTime[var_16_0] > 1 then
								arg_16_2:GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_tpl_update")

								arg_13_0.taskItemAnimTime[var_16_0] = Time.realtimeSinceStartup
							end
						end
					end)
					var_13_1:align(#var_14_0.taskIdList)
					scrollTo(arg_13_0:findTF("page/scroll", arg_13_0.taskPage), 0, 1)
					arg_13_0:SetPtPanel(arg_13_0:findTF("page/ptPanel", arg_13_0.taskPage), var_14_0)
				else
					local var_15_0 = var_14_0:GetLockTip()

					if var_15_0 and var_15_0 ~= "" then
						pg.TipsMgr.GetInstance():ShowTips(var_15_0)
					end
				end
			end, SFX_PANEL)

			if arg_13_0.contextData.currentPageId == var_14_0.id then
				var_13_2 = true

				triggerButton(arg_14_2)
			end

			if not arg_13_0.contextData.currentPageId and var_14_0.isUnlock and isActive(arg_14_2:Find("tip")) then
				var_13_2 = true
				arg_13_0.contextData.currentPageId = var_14_0.id

				triggerButton(arg_14_2)
			end
		end
	end)
	var_13_0:align(#arg_13_0.taskPages)

	if not var_13_2 then
		for iter_13_0 = #arg_13_0.taskPages, 1, -1 do
			if arg_13_0.taskPages[iter_13_0].isUnlock then
				triggerButton(arg_13_0:findTF("subPageScroll/Viewport/Content", arg_13_0.taskPage):GetChild(iter_13_0 - 1))

				break
			end
		end
	end

	arg_13_0:ShowBottomTip(arg_13_0.taskPage, 1)
	onScroll(arg_13_0, arg_13_0.taskPage:Find("subPageScroll"), function(arg_19_0)
		arg_13_0:ShowBottomTip(arg_13_0.taskPage, arg_19_0.y)
	end)
end

function var_0_0.ShowGuidePage(arg_20_0)
	local var_20_0 = UIItemList.New(arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage), arg_20_0:findTF("subPageScroll/Viewport/Content/subPageBtn", arg_20_0.guidePage))
	local var_20_1 = UIItemList.New(arg_20_0:findTF("page/scroll/Viewport/Content", arg_20_0.guidePage), arg_20_0:findTF("page/scroll/Viewport/Content/tpl", arg_20_0.guidePage))
	local var_20_2 = false

	var_20_0:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = arg_20_0.guidePages[arg_21_1 + 1]

			setActive(arg_21_2:Find("lock0/lock"), not var_21_0.isUnlock)
			setActive(arg_21_2:Find("tip"), var_21_0:ShouldShowTip())
			arg_21_2:Find("mask/name"):GetComponent("ScrollText"):SetText(var_21_0.isUnlock and var_21_0:getConfig("name") or var_21_0:getConfig("lock_name"))
			setText(arg_21_2:Find("en"), var_21_0:getConfig("eng_name"))
			arg_21_2:Find("select/mask/name"):GetComponent("ScrollText"):SetText(var_21_0:getConfig("name"))
			setText(arg_21_2:Find("select/en"), var_21_0:getConfig("eng_name"))

			arg_21_2:GetComponent(typeof(CanvasGroup)).alpha = var_21_0.isUnlock and 1 or 0.5

			onButton(arg_20_0, arg_21_2, function()
				if var_21_0.isUnlock then
					arg_20_0.contextData.currentPageId = var_21_0.id

					for iter_22_0 = 1, arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage).childCount do
						setActive(arg_20_0:findTF("select", arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage):GetChild(iter_22_0 - 1)), iter_22_0 == arg_21_1 + 1)
						setActive(arg_20_0:findTF("lock0", arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage):GetChild(iter_22_0 - 1)), iter_22_0 ~= arg_21_1 + 1)
						setActive(arg_20_0:findTF("mask", arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage):GetChild(iter_22_0 - 1)), iter_22_0 ~= arg_21_1 + 1)
						setActive(arg_20_0:findTF("en", arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage):GetChild(iter_22_0 - 1)), iter_22_0 ~= arg_21_1 + 1)

						arg_20_0:findTF("tip", arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage):GetChild(iter_22_0 - 1)).anchoredPosition = Vector2(iter_22_0 == arg_21_1 + 1 and -34.295 or 18, -2)
					end

					var_21_0:SortTaskIdList()
					var_20_1:make(function(arg_23_0, arg_23_1, arg_23_2)
						if arg_23_0 == UIItemList.EventUpdate then
							local var_23_0 = var_21_0.taskIdList[arg_23_1 + 1]
							local var_23_1 = pg.task_data_template[var_23_0]
							local var_23_2 = arg_20_0.taskProxy:getTaskById(var_23_0)

							setText(arg_23_2:Find("normal/number"), string.format("NO.%02d", arg_23_1 + 1))
							setText(arg_23_2:Find("normal/name"), var_23_1.name)
							setText(arg_23_2:Find("normal/content/descBg/desc"), var_23_1.desc)
							LoadImageSpriteAsync(var_23_1.tutorial_handbook_pic, arg_23_2:Find("normal/content/picture"))
							setText(arg_23_2:Find("fold/number"), string.format("NO.%02d", arg_23_1 + 1))
							setText(arg_23_2:Find("fold/name"), var_23_1.name)
							setText(arg_23_2:Find("fold/descBg/desc"), var_23_1.desc)

							local var_23_3 = arg_23_2:Find("normal/content/descBg/go_btn")
							local var_23_4 = arg_23_2:Find("normal/content/descBg/get_btn")
							local var_23_5 = arg_23_2:Find("normal/content/descBg/got_btn")
							local var_23_6 = arg_23_2:Find("fold/descBg/go_btn")
							local var_23_7 = arg_23_2:Find("fold/descBg/get_btn")
							local var_23_8 = arg_23_2:Find("fold/descBg/got_btn")
							local var_23_9 = arg_23_2:Find("normal")
							local var_23_10 = arg_23_2:Find("fold")
							local var_23_11 = arg_23_2:Find("lock")
							local var_23_12 = arg_23_2:GetComponent(typeof(Animation))
							local var_23_13 = arg_23_2:GetComponent(typeof(DftAniEvent))

							if var_23_2 then
								if var_23_2:getTaskStatus() == 0 then
									setActive(var_23_3, true)
									setActive(var_23_4, false)
									setActive(var_23_5, false)
									setActive(var_23_6, true)
									setActive(var_23_7, false)
									setActive(var_23_8, false)
								elseif var_23_2:getTaskStatus() == 1 then
									setActive(var_23_3, false)
									setActive(var_23_4, true)
									setActive(var_23_5, false)
									setActive(var_23_6, false)
									setActive(var_23_7, true)
									setActive(var_23_8, false)
								elseif var_23_2:getTaskStatus() == 2 then
									setActive(var_23_3, false)
									setActive(var_23_4, false)
									setActive(var_23_5, true)
									setActive(var_23_6, false)
									setActive(var_23_7, false)
									setActive(var_23_8, true)
								end

								onButton(arg_20_0, var_23_3, function()
									arg_20_0:emit(CommanderManualMediator.ON_TASK_GO, var_23_2)
								end, SFX_PANEL)
								onButton(arg_20_0, var_23_4, function()
									arg_20_0:TaskAwardsCheckAndSubmit(var_23_2)
								end, SFX_PANEL)
								onButton(arg_20_0, var_23_6, function()
									arg_20_0:emit(CommanderManualMediator.ON_TASK_GO, var_23_2)
								end, SFX_PANEL)
								onButton(arg_20_0, var_23_7, function()
									arg_20_0:TaskAwardsCheckAndSubmit(var_23_2)
								end, SFX_PANEL)
								setActive(arg_23_2:Find("normal/content/descBg/triangle"), false)
								setActive(var_23_9, true)
								setActive(var_23_10, false)
								setActive(var_23_11, false)
							elseif var_21_0:IsTaskComplete(var_23_0) then
								setActive(var_23_3, false)
								setActive(var_23_4, false)
								setActive(var_23_5, true)
								setActive(var_23_6, false)
								setActive(var_23_7, false)
								setActive(var_23_8, true)
								setActive(arg_23_2:Find("normal/content/descBg/triangle"), true)
								onButton(arg_20_0, arg_23_2:Find("normal/content/descBg/triangle"), function()
									setActive(var_23_9, true)
									var_23_13:SetEndEvent(function()
										setActive(var_23_9, false)
										setActive(var_23_10, true)
									end)
									var_23_12:Play("anim_CommanderManualUI_tpl_guidePage_expand")
								end, SFX_PANEL)
								onButton(arg_20_0, arg_23_2:Find("fold/descBg/triangle"), function()
									setActive(var_23_9, true)
									var_23_13:SetEndEvent(function()
										setActive(var_23_10, false)
									end)
									var_23_12:Play("anim_CommanderManualUI_tpl_guidePage_retract")
								end, SFX_PANEL)
								setActive(var_23_9, false)
								setActive(var_23_10, true)
								setActive(var_23_11, false)
							else
								setText(arg_23_2:Find("lock/lockBg/Text"), var_21_0:GetTaskLockTip(var_23_0))
								setActive(var_23_9, false)
								setActive(var_23_10, false)
								setActive(var_23_11, true)
							end

							var_23_12:Play("anim_CommanderManualUI_tpl_guidePage")
						end
					end)
					var_20_1:align(#var_21_0.taskIdList)
					scrollTo(arg_20_0:findTF("page/scroll", arg_20_0.guidePage), 0, 1)
					arg_20_0:SetPtPanel(arg_20_0:findTF("page/ptPanel", arg_20_0.guidePage), var_21_0)
				else
					local var_22_0 = var_21_0:GetLockTip()

					if var_22_0 and var_22_0 ~= "" then
						pg.TipsMgr.GetInstance():ShowTips(var_22_0)
					end
				end
			end, SFX_PANEL)

			if arg_20_0.contextData.currentPageId == var_21_0.id then
				var_20_2 = true

				triggerButton(arg_21_2)
			end

			if not arg_20_0.contextData.currentPageId and var_21_0.isUnlock and isActive(arg_21_2:Find("tip")) then
				var_20_2 = true
				arg_20_0.contextData.currentPageId = var_21_0.id

				triggerButton(arg_21_2)
			end
		end
	end)
	var_20_0:align(#arg_20_0.guidePages)

	if not var_20_2 then
		triggerButton(arg_20_0:findTF("subPageScroll/Viewport/Content", arg_20_0.guidePage):GetChild(0))
	end

	arg_20_0:ShowBottomTip(arg_20_0.guidePage, 1)
	onScroll(arg_20_0, arg_20_0.guidePage:Find("subPageScroll"), function(arg_32_0)
		arg_20_0:ShowBottomTip(arg_20_0.guidePage, arg_32_0.y)
	end)
end

function var_0_0.SetPtPanel(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_2:getConfig("target")
	local var_33_1 = arg_33_2:getConfig("drop_client")

	setText(arg_33_0:findTF("upgrade/progress/progress1", arg_33_1), arg_33_2.pt)
	setText(arg_33_0:findTF("upgrade/progress/progress2", arg_33_1), "/" .. #arg_33_2.taskIdList)
	setSlider(arg_33_0:findTF("slider", arg_33_1), 0, #arg_33_2.taskIdList, arg_33_2.pt)

	if arg_33_2.pt == #arg_33_2.taskIdList then
		arg_33_1:Find("upgrade"):GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_ptPanel_upgrade")
	end

	local var_33_2 = arg_33_2:GetCurrentPtTarget()

	setText(arg_33_0:findTF("desc", arg_33_1), i18n("handbook_unfinished", var_33_2))

	local var_33_3 = arg_33_0:findTF("awards", arg_33_1)
	local var_33_4 = var_33_3:GetChild(0)

	arg_33_0:updateTaskAwards(arg_33_2:GetCurrentPtAward(), var_33_3, var_33_4)
	setActive(arg_33_0:findTF("go_btn", arg_33_1), var_33_2 > arg_33_2.pt)
	setActive(arg_33_0:findTF("get_btn", arg_33_1), var_33_2 <= arg_33_2.pt and arg_33_2.award < #arg_33_2:getConfig("target"))
	setActive(arg_33_0:findTF("got_btn", arg_33_1), arg_33_2.award == #arg_33_2:getConfig("target"))
	onButton(arg_33_0, arg_33_0:findTF("get_btn", arg_33_1), function()
		arg_33_0:PtAwardsCheckAndSubmit(arg_33_2)
	end, SFX_PANEL)
end

function var_0_0.updateTaskAwards(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = _.slice(arg_35_1, 1, 3)

	for iter_35_0 = arg_35_2.childCount, #var_35_0 - 1 do
		cloneTplTo(arg_35_3, arg_35_2)
	end

	local var_35_1 = arg_35_2.childCount

	for iter_35_1 = 1, var_35_1 do
		local var_35_2 = arg_35_2:GetChild(iter_35_1 - 1)
		local var_35_3 = iter_35_1 <= #var_35_0

		setActive(var_35_2, var_35_3)

		if var_35_3 then
			local var_35_4 = var_35_0[iter_35_1]
			local var_35_5 = {
				type = var_35_4[1],
				id = var_35_4[2],
				count = var_35_4[3]
			}

			updateDrop(var_35_2, var_35_5)
			onButton(arg_35_0, var_35_2, function()
				arg_35_0:emit(BaseUI.ON_DROP, var_35_5)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.ShowTechPage(arg_37_0)
	local var_37_0 = arg_37_0.techPage:Find("subPageScroll/Viewport/Content")

	UIItemList.StaticAlign(var_37_0, var_37_0:GetChild(0), arg_37_0.allTechPhase, function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 == UIItemList.EventUpdate then
			arg_38_2.name = "Phase" .. arg_38_1

			setText(arg_38_2:Find("name"), i18n("tec_catchup_" .. arg_38_1))
			setText(arg_38_2:Find("name/en"), "")
			setText(arg_38_2:Find("select/name"), i18n("tec_catchup_" .. arg_38_1))
			setText(arg_38_2:Find("select/name/en"), "")
			onToggle(arg_37_0, arg_38_2, function(arg_39_0)
				setActive(arg_38_2:Find("select"), arg_39_0)
				setCanvasGroupAlpha(arg_38_2, not arg_39_0 and arg_37_0.finishPhaseDic[arg_38_1] and 0.5 or 1)

				arg_38_2:Find("tip").anchoredPosition = Vector2(arg_39_0 and -34.295 or 18, -2)

				setActive(arg_38_2:Find("name"), not arg_39_0)

				if arg_39_0 then
					arg_37_0:SetTechDisplayPage(arg_38_1)
				end
			end, SFX_PANEL)
		end
	end)
	arg_37_0:UpdateTechPageState()

	local var_37_1

	var_37_1 = arg_37_0.phaseId == "ready"

	setActive(arg_37_0.techPage:Find("page"), true)

	local var_37_2 = arg_37_0.phaseId == "ready" and 0 or arg_37_0.phaseId

	eachChild(var_37_0, function(arg_40_0, arg_40_1)
		triggerToggle(arg_40_0, arg_40_1 == var_37_2)
	end)
	arg_37_0:ShowBottomTip(arg_37_0.techPage, 1)
	onScroll(arg_37_0, arg_37_0.techPage:Find("subPageScroll"), function(arg_41_0)
		arg_37_0:ShowBottomTip(arg_37_0.techPage, arg_41_0.y)
	end)
end

function var_0_0.GetTechTask(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = Task.New({
		id = arg_42_1
	})

	if arg_42_2 then
		var_42_0.progress = var_42_0:getConfig("target_num")
		var_42_0.submitTime = 1
	end

	return var_42_0
end

function var_0_0.SetTechDisplayPage(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1 == arg_43_0.phaseId
	local var_43_1 = arg_43_0.finishPhaseDic[arg_43_1]

	setActive(arg_43_0.techPage:Find("page/lock_mask"), not var_43_0)

	local var_43_2 = arg_43_0.techActivity:getConfig("config_data")[3]
	local var_43_3, var_43_4 = unpack(var_43_2[math.max(1, arg_43_1)])
	local var_43_5 = underscore.map(var_43_3, function(arg_44_0)
		return arg_43_0.taskProxy:getTaskVO(arg_44_0) or arg_43_0:GetTechTask(arg_44_0, var_43_0 or var_43_1)
	end)

	table.sort(var_43_5, CompareFuncs({
		function(arg_45_0)
			return arg_45_0:isReceive() and 1 or 0
		end,
		function(arg_46_0)
			return arg_46_0:isFinish() and 0 or 1
		end,
		function(arg_47_0)
			return arg_47_0.id
		end
	}))

	local var_43_6 = arg_43_0.techPage:Find("page/scroll/Viewport/Content")

	UIItemList.StaticAlign(var_43_6, var_43_6:Find("tpl"), #var_43_5, function(arg_48_0, arg_48_1, arg_48_2)
		arg_48_1 = arg_48_1 + 1

		if arg_48_0 == UIItemList.EventUpdate then
			local var_48_0 = var_43_5[arg_48_1]

			setText(arg_48_2:Find("normal/number"), string.format("NO.%02d", arg_48_1))
			setText(arg_48_2:Find("normal/desc"), var_48_0:getConfig("desc"))

			local var_48_1 = arg_48_2:Find("normal/awards")
			local var_48_2 = var_48_1:GetChild(0)

			arg_43_0:updateTaskAwards(var_48_0:getConfig("award_display"), var_48_1, var_48_2)

			local var_48_3 = arg_48_2:Find("normal/go_btn")
			local var_48_4 = arg_48_2:Find("normal/get_btn")
			local var_48_5 = arg_48_2:Find("normal/got_btn")
			local var_48_6 = arg_48_2:Find("normal/lock_btn")
			local var_48_7 = arg_48_2:Find("normal")
			local var_48_8 = arg_48_2:Find("lock")
			local var_48_9 = var_48_0:getConfig("target_num")
			local var_48_10 = var_48_0:getProgress()
			local var_48_11 = math.min(var_48_10, var_48_9)

			setText(arg_48_2:Find("normal/progress"), var_48_11 .. "/" .. var_48_9)
			setSlider(arg_48_2:Find("normal/slider"), 0, var_48_9, var_48_11)

			if not var_43_0 and not var_43_1 then
				setActive(var_48_3, false)
				setActive(var_48_4, false)
				setActive(var_48_5, false)
				setActive(var_48_6, true)
			else
				local var_48_12 = var_48_0:getTaskStatus()

				setActive(var_48_3, var_48_12 == 0)
				setActive(var_48_4, var_48_12 == 1)
				setActive(var_48_5, var_48_12 == 2)
				setActive(var_48_6, false)
			end

			onButton(arg_43_0, var_48_3, function()
				arg_43_0:emit(CommanderManualMediator.ON_TASK_GO, var_48_0)
			end, SFX_PANEL)
			onButton(arg_43_0, var_48_4, function()
				arg_43_0:TaskAwardsCheckAndSubmit(var_48_0)
			end, SFX_PANEL)
			setActive(var_48_7, true)
			setActive(var_48_8, false)
			arg_48_2:GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_tpl_update")
		end
	end)
	scrollTo(arg_43_0.techPage:Find("page/scroll"), 0, 1)

	local var_43_7 = arg_43_0.techPage:Find("page/ptPanel")
	local var_43_8

	if var_43_0 then
		var_43_8 = arg_43_0.taskProxy:getTaskVO(var_43_4)
	elseif var_43_1 then
		var_43_8 = arg_43_0:GetTechTask(var_43_4, var_43_1)
	end

	if var_43_8 then
		if var_43_8 and var_43_8:isClientTrigger() and not var_43_8:isFinish() then
			arg_43_0:emit(CommanderManualMediator.ON_UPDATE, var_43_8)
		end

		local var_43_9 = var_43_8:getConfig("target_num")
		local var_43_10 = var_43_8:getProgress()
		local var_43_11 = math.min(var_43_10, var_43_9)

		setText(var_43_7:Find("upgrade/progress/progress1"), var_43_11)
		setText(var_43_7:Find("upgrade/progress/progress2"), "/" .. var_43_9)
		setSlider(var_43_7:Find("slider"), 0, var_43_9, var_43_11)

		if var_43_11 == var_43_9 then
			var_43_7:Find("upgrade"):GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_ptPanel_upgrade")
		end

		setText(var_43_7:Find("desc"), var_43_8:getConfig("desc"))

		local var_43_12 = var_43_7:Find("awards")
		local var_43_13 = var_43_12:GetChild(0)

		arg_43_0:updateTaskAwards(var_43_8:getConfig("award_display"), var_43_12, var_43_13)

		local var_43_14 = var_43_7:Find("go_btn")
		local var_43_15 = var_43_7:Find("get_btn")
		local var_43_16 = var_43_7:Find("got_btn")
		local var_43_17 = var_43_8:getTaskStatus()

		setActive(var_43_14, var_43_17 == 0)
		setActive(var_43_15, var_43_17 == 1)
		setActive(var_43_16, var_43_17 == 2)

		local var_43_18 = var_43_7:Find("unlock_btn")
		local var_43_19 = var_43_7:Find("wait_btn")

		setActive(var_43_18, false)
		setActive(var_43_19, false)
		onButton(arg_43_0, var_43_14, function()
			arg_43_0:emit(CommanderManualMediator.ON_TASK_GO, var_43_8)
		end, SFX_PANEL)
		onButton(arg_43_0, var_43_15, function()
			arg_43_0:TaskAwardsCheckAndSubmit(var_43_8)
		end, SFX_PANEL)
	else
		local var_43_20 = #var_43_5
		local var_43_21 = var_43_0 and underscore.reduce(var_43_5, 0, function(arg_53_0, arg_53_1)
			return arg_53_0 + (arg_53_1:isReceive() and 1 or 0)
		end) or 0

		setText(var_43_7:Find("upgrade/progress/progress1"), var_43_21)
		setText(var_43_7:Find("upgrade/progress/progress2"), "/" .. var_43_20)
		setSlider(var_43_7:Find("slider"), 0, var_43_20, var_43_21)

		if var_43_21 == var_43_20 then
			var_43_7:Find("upgrade"):GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_ptPanel_upgrade")
		end

		setText(var_43_7:Find("desc"), i18n("handbook_research_final_task_desc_locked", i18n("tec_catchup_" .. arg_43_1)))

		local var_43_22 = var_43_7:Find("awards")
		local var_43_23 = var_43_22:GetChild(0)

		arg_43_0:updateTaskAwards(pg.task_data_template[var_43_4].award_display, var_43_22, var_43_23)

		local var_43_24 = var_43_7:Find("go_btn")
		local var_43_25 = var_43_7:Find("get_btn")
		local var_43_26 = var_43_7:Find("got_btn")

		setActive(var_43_24, false)
		setActive(var_43_25, false)
		setActive(var_43_26, false)

		if var_43_20 <= var_43_21 then
			arg_43_0:emit(CommanderManualMediator.ON_TRIGGER, {
				cmd = 2,
				activity_id = arg_43_0.techActivity.id
			})
		end

		local var_43_27, var_43_28 = TechnologyConst.isTecActOn()
		local var_43_29 = arg_43_0.techFinishTaskId and arg_43_0.taskProxy:getTaskVO(arg_43_0.techFinishTaskId)
		local var_43_30 = arg_43_0.phaseId == "ready" or var_43_27 and var_43_29 and var_43_29:isReceive()
		local var_43_31 = not var_43_1 and not var_43_0
		local var_43_32 = var_43_30 and (arg_43_1 ~= 1 or arg_43_0.finishPhaseDic[0] or arg_43_0.phaseId == 0)
		local var_43_33 = var_43_7:Find("unlock_btn")
		local var_43_34 = var_43_7:Find("wait_btn")

		setText(var_43_33:Find("Text"), i18n("handbook_research_confirm", i18n("tec_catchup_" .. arg_43_1)))
		setText(var_43_34:Find("Text"), i18n("handbook_research_final_task_btn_locked"))
		setActive(var_43_33, var_43_31 and var_43_32)
		setActive(var_43_34, var_43_0 and var_43_21 < var_43_20)
		onButton(arg_43_0, var_43_33, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tec_catchup_confirm"),
				onYes = function()
					if arg_43_1 == 1 then
						arg_43_0:emit(CommanderManualMediator.ON_TRIGGER, {
							cmd = 3,
							activity_id = arg_43_0.techActivity.id
						})
					else
						arg_43_0:emit(CommanderManualMediator.ON_TRIGGER, {
							cmd = 1,
							activity_id = arg_43_0.techActivity.id,
							arg1 = math.max(arg_43_1, 1)
						})
					end
				end
			})
		end, SFX_CONFIRM)
		onButton(arg_43_0, var_43_34, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("handbook_research_final_task_desc_locked", i18n("tec_catchup_" .. arg_43_1)))
		end, SFX_CONFIRM)
	end
end

function var_0_0.UpdateTechPageState(arg_57_0)
	local var_57_0, var_57_1 = TechnologyConst.isTecActOn()
	local var_57_2 = arg_57_0.techFinishTaskId and arg_57_0.taskProxy:getTaskVO(arg_57_0.techFinishTaskId)
	local var_57_3 = arg_57_0.phaseId == "ready" or var_57_0 and var_57_2 and var_57_2:isReceive()

	eachChild(arg_57_0.techPage:Find("subPageScroll/Viewport/Content"), function(arg_58_0, arg_58_1)
		local var_58_0 = not arg_57_0.finishPhaseDic[arg_58_1] and arg_57_0.phaseId ~= arg_58_1
		local var_58_1 = var_57_3 and (arg_58_1 ~= 1 or arg_57_0.finishPhaseDic[0] or arg_57_0.phaseId == 0)

		setActive(arg_58_0:Find("name/lock"), false)
		setActive(arg_58_0:Find("select/bg"), not arg_57_0.finishPhaseDic[arg_58_1])
		setActive(arg_58_0:Find("select/bg_end"), arg_57_0.finishPhaseDic[arg_58_1])

		if var_58_1 then
			setActive(arg_58_0:Find("tip"), var_58_0)
		else
			setActive(arg_58_0:Find("tip"), arg_58_1 == arg_57_0.phaseId and var_57_1)
		end
	end)
end

function var_0_0.ShowBottomTip(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = arg_59_1:Find("subPageScroll"):GetComponent(typeof(ScrollRect))
	local var_59_1 = arg_59_1:Find("subPageScroll/Viewport/Content")
	local var_59_2 = var_59_1:GetComponent(typeof(VerticalLayoutGroup))
	local var_59_3 = var_59_2.padding.top
	local var_59_4 = var_59_2.padding.bottom
	local var_59_5 = var_59_2.spacing
	local var_59_6 = var_59_1:GetChild(0).rect.height
	local var_59_7 = var_59_3 + var_59_4 + var_59_6 * var_59_1.childCount + var_59_5 * (var_59_1.childCount - 1)
	local var_59_8 = arg_59_1:Find("subPageScroll/Viewport").rect.height

	if var_59_7 < var_59_8 + var_59_5 + var_59_6 then
		setActive(arg_59_1:Find("bottomTip"), false)

		return
	end

	local var_59_9 = math.floor(var_59_8 / (var_59_6 + var_59_5))
	local var_59_10 = math.ceil((var_59_1.childCount - var_59_9) * (1 - arg_59_2) + var_59_9)

	if var_59_10 < var_59_9 then
		var_59_10 = var_59_9
	end

	if var_59_10 > var_59_1.childCount - 1 then
		setActive(arg_59_1:Find("bottomTip"), false)

		return
	end

	setActive(arg_59_1:Find("bottomTip"), false)

	for iter_59_0 = var_59_10, var_59_1.childCount - 1 do
		if isActive(var_59_1:GetChild(iter_59_0):Find("tip")) then
			setActive(arg_59_1:Find("bottomTip"), true)

			break
		end
	end
end

function var_0_0.TaskAwardsCheckAndSubmit(arg_60_0, arg_60_1)
	local var_60_0 = {}
	local var_60_1 = arg_60_1:getConfig("award_display")
	local var_60_2 = getProxy(PlayerProxy):getRawData()
	local var_60_3 = pg.gameset.urpt_chapter_max.description[1]
	local var_60_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_60_3)
	local var_60_5, var_60_6 = Task.StaticJudgeOverflow(var_60_2.gold, var_60_2.oil, var_60_4, true, true, var_60_1)

	if var_60_5 then
		table.insert(var_60_0, function(arg_61_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_60_6,
				onYes = arg_61_0
			})
		end)
	end

	seriesAsync(var_60_0, function()
		arg_60_0:emit(CommanderManualMediator.ON_TASK_SUBMIT, arg_60_1)
	end)
end

function var_0_0.PtAwardsCheckAndSubmit(arg_63_0, arg_63_1)
	local var_63_0 = {}
	local var_63_1 = arg_63_1:GetCurrentPtAward()
	local var_63_2 = getProxy(PlayerProxy):getRawData()
	local var_63_3 = pg.gameset.urpt_chapter_max.description[1]
	local var_63_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_63_3)
	local var_63_5, var_63_6 = Task.StaticJudgeOverflow(var_63_2.gold, var_63_2.oil, var_63_4, true, true, var_63_1)

	if var_63_5 then
		table.insert(var_63_0, function(arg_64_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_63_6,
				onYes = arg_64_0
			})
		end)
	end

	seriesAsync(var_63_0, function()
		arg_63_0:emit(CommanderManualMediator.GET_PT_AWARD, arg_63_1.id)
	end)
end

function var_0_0.willExit(arg_66_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_66_0.blurPanel, arg_66_0._tf)
end

function var_0_0.onBackPressed(arg_67_0)
	arg_67_0:closeView()
end

return var_0_0

local var_0_0 = class("CommanderManualLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderManualUI"
end

function var_0_0.getResource(arg_2_0, arg_2_1)
	local var_2_0 = {
		"weaponframes",
		"shiptype",
		"ui/iconcolorful",
		"ui/MsgBox"
	}

	table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0, arg_2_1))

	return var_2_0
end

function var_0_0.init(arg_3_0)
	arg_3_0.backBtn = arg_3_0._tf:Find("blur_panel/top/CommonTitleAndBack/back_btn")
	arg_3_0.helpBtn = arg_3_0._tf:Find("blur_panel/top/helpBtn")
	arg_3_0.taskBtn = arg_3_0._tf:Find("blur_panel/panel/pageBtns/taskBtn")
	arg_3_0.techBtn = arg_3_0._tf:Find("blur_panel/panel/pageBtns/techBtn")
	arg_3_0.guideBtn = arg_3_0._tf:Find("blur_panel/panel/pageBtns/guideBtn")
	arg_3_0.topBtns = {
		arg_3_0.taskBtn,
		arg_3_0.techBtn,
		arg_3_0.guideBtn
	}
	arg_3_0.pages = arg_3_0._tf:Find("blur_panel/panel/pages")
	arg_3_0.taskPage = arg_3_0._tf:Find("blur_panel/panel/pages/taskPage")
	arg_3_0.techPage = arg_3_0._tf:Find("blur_panel/panel/pages/techPage")
	arg_3_0.guidePage = arg_3_0._tf:Find("blur_panel/panel/pages/guidePage")
	arg_3_0.blurPanel = arg_3_0._tf:Find("blur_panel")
	arg_3_0.pageBg = arg_3_0._tf:Find("blur_panel/panel/mask/pageBg")

	arg_3_0:OverlayPanel(arg_3_0.blurPanel, {
		pbList = {
			arg_3_0.pageBg
		}
	})
	setText(arg_3_0._tf:Find("blur_panel/top/CommonTitleAndBack/title"), i18n("handbook_name"))
	setText(arg_3_0._tf:Find("blur_panel/top/CommonTitleAndBack/title/en"), "HANDBOOK")
	setText(arg_3_0.taskPage:Find("page/scroll/Viewport/Content/tpl/normal/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.taskPage:Find("page/scroll/Viewport/Content/tpl/normal/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.taskPage:Find("page/scroll/Viewport/Content/tpl/normal/got_btn/Text"), i18n("handbook_finished"))
	setText(arg_3_0.taskPage:Find("page/ptPanel/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.taskPage:Find("page/ptPanel/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.taskPage:Find("page/ptPanel/got_btn/Text"), i18n("handbook_finished"))
	setText(arg_3_0.techPage:Find("page/scroll/Viewport/Content/tpl/normal/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.techPage:Find("page/scroll/Viewport/Content/tpl/normal/lock_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.techPage:Find("page/scroll/Viewport/Content/tpl/normal/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.techPage:Find("page/scroll/Viewport/Content/tpl/normal/got_btn/Text"), i18n("handbook_finished"))
	setText(arg_3_0.techPage:Find("page/ptPanel/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.techPage:Find("page/ptPanel/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.techPage:Find("page/ptPanel/got_btn/Text"), i18n("handbook_finished"))
	setText(arg_3_0.guidePage:Find("page/scroll/Viewport/Content/tpl/normal/content/descBg/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.guidePage:Find("page/scroll/Viewport/Content/tpl/normal/content/descBg/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.guidePage:Find("page/scroll/Viewport/Content/tpl/normal/content/descBg/got_btn/Text"), i18n("handbook_finished"))
	setText(arg_3_0.guidePage:Find("page/scroll/Viewport/Content/tpl/fold/descBg/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.guidePage:Find("page/scroll/Viewport/Content/tpl/fold/descBg/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.guidePage:Find("page/scroll/Viewport/Content/tpl/fold/descBg/got_btn/Text"), i18n("handbook_finished"))
	setText(arg_3_0.guidePage:Find("page/ptPanel/go_btn/Text"), i18n("handbook_process"))
	setText(arg_3_0.guidePage:Find("page/ptPanel/get_btn/Text"), i18n("handbook_claim"))
	setText(arg_3_0.guidePage:Find("page/ptPanel/got_btn/Text"), i18n("handbook_finished"))
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.handbook_gametip.tip
		})
	end, SFX_PANEL)
	arg_4_0:InitData()
	arg_4_0:RefreshAll()
end

function var_0_0.InitData(arg_7_0)
	arg_7_0.commanderManualProxy = getProxy(CommanderManualProxy)
	arg_7_0.taskProxy = getProxy(TaskProxy)
	arg_7_0.taskPages = arg_7_0.commanderManualProxy:GetPagesByType(1)
	arg_7_0.guidePages = arg_7_0.commanderManualProxy:GetPagesByType(2)
	arg_7_0.topTaskCfg = pg.tutorial_handbook[CommanderManualProxy.TOP_PAGE_TASK]
	arg_7_0.topTechCfg = pg.tutorial_handbook[CommanderManualProxy.TOP_PAGE_TECH]
	arg_7_0.topGuideCfg = pg.tutorial_handbook[CommanderManualProxy.TOP_PAGE_GUIDE]

	arg_7_0:UpdateTechActivity()
end

function var_0_0.UpdateTechActivity(arg_8_0)
	arg_8_0.techActivity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP)

	if not arg_8_0.techActivity or arg_8_0.techActivity:isEnd() then
		return
	end

	local var_8_0 = arg_8_0.techActivity

	arg_8_0.allTechPhase = #var_8_0:getConfig("config_data")[3] + 1

	if var_8_0.data1 == 0 then
		arg_8_0.phaseId = "ready"
	else
		arg_8_0.phaseId = var_8_0.data1

		if arg_8_0.phaseId == 1 and var_8_0.data2 < 1 then
			arg_8_0.phaseId = 0
		end
	end

	arg_8_0.techFinishTaskId = arg_8_0.phaseId ~= "ready" and var_8_0:getConfig("config_data")[3][math.max(1, arg_8_0.phaseId)][2] or nil
	arg_8_0.finishPhaseDic = {}

	for iter_8_0, iter_8_1 in ipairs(var_8_0.data1_list) do
		arg_8_0.finishPhaseDic[iter_8_1] = true
	end

	arg_8_0.finishPhaseDic[0] = arg_8_0.finishPhaseDic[1]
	arg_8_0.finishPhaseDic[1] = var_8_0.data2 == 1 and var_8_0.data1 ~= 1
end

function var_0_0.RefreshAll(arg_9_0)
	local var_9_0 = arg_9_0.commanderManualProxy:IsTopUnlock(CommanderManualProxy.TOP_PAGE_TASK)
	local var_9_1 = arg_9_0.commanderManualProxy:IsTopUnlock(CommanderManualProxy.TOP_PAGE_TECH)
	local var_9_2 = arg_9_0.commanderManualProxy:IsTopUnlock(CommanderManualProxy.TOP_PAGE_GUIDE)

	setActive(arg_9_0.taskBtn, not arg_9_0.commanderManualProxy:IsTopPageComplete(1))

	local var_9_3, var_9_4 = TechnologyConst.isTecActOn()

	setActive(arg_9_0.techBtn, var_9_3)
	setActive(arg_9_0.taskBtn:Find("Text/lock"), not var_9_0)
	setActive(arg_9_0.techBtn:Find("Text/lock"), not var_9_1)
	setActive(arg_9_0.guideBtn:Find("Text/lock"), not var_9_2)
	setText(arg_9_0.taskBtn:Find("Text"), var_9_0 and arg_9_0.topTaskCfg.name or arg_9_0.topTaskCfg.lock_name)
	setText(arg_9_0.techBtn:Find("Text"), var_9_1 and arg_9_0.topTechCfg.name or arg_9_0.topTechCfg.lock_name)
	setText(arg_9_0.guideBtn:Find("Text"), var_9_2 and arg_9_0.topGuideCfg.name or arg_9_0.topGuideCfg.lock_name)
	setText(arg_9_0.taskBtn:Find("select/Text"), arg_9_0.topTaskCfg.name)
	setText(arg_9_0.techBtn:Find("select/Text"), arg_9_0.topTechCfg.name)
	setText(arg_9_0.guideBtn:Find("select/Text"), arg_9_0.topGuideCfg.name)
	setText(arg_9_0.taskBtn:Find("select/en"), arg_9_0.topTaskCfg.eng_name)
	setText(arg_9_0.techBtn:Find("select/en"), arg_9_0.topTechCfg.eng_name)
	setText(arg_9_0.guideBtn:Find("select/en"), arg_9_0.topGuideCfg.eng_name)
	setActive(arg_9_0.taskBtn:Find("tip"), arg_9_0.commanderManualProxy:ShouldShowTipByType(1))
	setActive(arg_9_0.techBtn:Find("tip"), var_9_4)
	setActive(arg_9_0.guideBtn:Find("tip"), arg_9_0.commanderManualProxy:ShouldShowTipByType(2))

	arg_9_0.hasRefreshed = false

	onButton(arg_9_0, arg_9_0.taskBtn, function()
		if arg_9_0.contextData.topIndex ~= 1 or not arg_9_0.hasRefreshed then
			if var_9_0 then
				arg_9_0.contextData.topIndex = 1

				if arg_9_0.hasRefreshed then
					arg_9_0.contextData.currentPageId = nil
				end

				arg_9_0:SetPagesActive(1)
				arg_9_0:ShowTaskPage()

				for iter_10_0, iter_10_1 in ipairs(arg_9_0.topBtns) do
					setActive(iter_10_1:Find("select"), iter_10_1 == arg_9_0.taskBtn)
				end
			else
				local var_10_0 = arg_9_0.commanderManualProxy:GetLockTip(CommanderManualProxy.TOP_PAGE_TASK)

				if var_10_0 and var_10_0 ~= "" then
					pg.TipsMgr.GetInstance():ShowTips(var_10_0)
				end
			end
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.techBtn, function()
		if arg_9_0.contextData.topIndex ~= 2 or not arg_9_0.hasRefreshed then
			if var_9_1 then
				arg_9_0.contextData.topIndex = 2

				if arg_9_0.hasRefreshed then
					arg_9_0.contextData.currentPageId = nil
				end

				arg_9_0:SetPagesActive(2)
				arg_9_0:ShowTechPage()

				for iter_11_0, iter_11_1 in ipairs(arg_9_0.topBtns) do
					setActive(iter_11_1:Find("select"), iter_11_1 == arg_9_0.techBtn)
				end
			else
				local var_11_0 = arg_9_0.commanderManualProxy:GetLockTip(CommanderManualProxy.TOP_PAGE_TECH)

				if var_11_0 and var_11_0 ~= "" then
					pg.TipsMgr.GetInstance():ShowTips(var_11_0)
				end
			end
		end
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.guideBtn, function()
		if arg_9_0.contextData.topIndex ~= 3 or not arg_9_0.hasRefreshed then
			if var_9_2 then
				arg_9_0.contextData.topIndex = 3

				if arg_9_0.hasRefreshed then
					arg_9_0.contextData.currentPageId = nil
				end

				arg_9_0:SetPagesActive(3)
				arg_9_0:ShowGuidePage()

				for iter_12_0, iter_12_1 in ipairs(arg_9_0.topBtns) do
					setActive(iter_12_1:Find("select"), iter_12_1 == arg_9_0.guideBtn)
				end
			else
				local var_12_0 = arg_9_0.commanderManualProxy:GetLockTip(CommanderManualProxy.TOP_PAGE_GUIDE)

				if var_12_0 and var_12_0 ~= "" then
					pg.TipsMgr.GetInstance():ShowTips(var_12_0)
				end
			end
		end
	end, SFX_PANEL)

	if arg_9_0.contextData.topIndex then
		triggerButton(arg_9_0.topBtns[arg_9_0.contextData.topIndex])

		arg_9_0.hasRefreshed = true
	else
		local var_9_5 = false

		for iter_9_0, iter_9_1 in ipairs(arg_9_0.topBtns) do
			if isActive(iter_9_1) and not isActive(iter_9_1:Find("Text/lock")) and isActive(iter_9_1:Find("tip")) then
				triggerButton(iter_9_1)

				var_9_5 = true
				arg_9_0.hasRefreshed = true

				break
			end
		end

		if not var_9_5 then
			for iter_9_2, iter_9_3 in ipairs(arg_9_0.topBtns) do
				if isActive(iter_9_3) and not isActive(iter_9_3:Find("Text/lock")) then
					triggerButton(iter_9_3)

					arg_9_0.hasRefreshed = true

					break
				end
			end
		end
	end
end

function var_0_0.SetPagesActive(arg_13_0, arg_13_1)
	for iter_13_0 = 1, arg_13_0.pages.childCount do
		setActive(arg_13_0.pages:GetChild(iter_13_0 - 1), iter_13_0 == arg_13_1)
	end
end

function var_0_0.ShowTaskPage(arg_14_0)
	if not arg_14_0.taskItemAnimTime then
		arg_14_0.taskItemAnimTime = {}
	end

	local var_14_0 = UIItemList.New(arg_14_0.taskPage:Find("subPageScroll/Viewport/Content"), arg_14_0.taskPage:Find("subPageScroll/Viewport/Content/subPageBtn"))
	local var_14_1 = UIItemList.New(arg_14_0.taskPage:Find("page/scroll/Viewport/Content"), arg_14_0.taskPage:Find("page/scroll/Viewport/Content/tpl"))
	local var_14_2 = false

	var_14_0:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = arg_14_0.taskPages[arg_15_1 + 1]

			setActive(arg_15_2:Find("name/lock"), not var_15_0.isUnlock)
			setActive(arg_15_2:Find("tip"), var_15_0:ShouldShowTip())
			setText(arg_15_2:Find("name"), var_15_0.isUnlock and var_15_0:getConfig("name") or var_15_0:getConfig("lock_name"))
			setText(arg_15_2:Find("name/en"), var_15_0:getConfig("eng_name"))
			setText(arg_15_2:Find("select/name"), var_15_0:getConfig("name"))
			setText(arg_15_2:Find("select/name/en"), var_15_0:getConfig("eng_name"))

			arg_15_2:GetComponent(typeof(CanvasGroup)).alpha = var_15_0.isUnlock and 1 or 0.5

			onButton(arg_14_0, arg_15_2, function()
				if var_15_0.isUnlock then
					arg_14_0.contextData.currentPageId = var_15_0.id

					for iter_16_0 = 1, arg_14_0.taskPage:Find("subPageScroll/Viewport/Content").childCount do
						setActive(arg_14_0.taskPage:Find("subPageScroll/Viewport/Content"):GetChild(iter_16_0 - 1):Find("select"), iter_16_0 == arg_15_1 + 1)
						setActive(arg_14_0.taskPage:Find("subPageScroll/Viewport/Content"):GetChild(iter_16_0 - 1):Find("name"), iter_16_0 ~= arg_15_1 + 1)

						arg_14_0.taskPage:Find("subPageScroll/Viewport/Content"):GetChild(iter_16_0 - 1):Find("tip").anchoredPosition = Vector2(iter_16_0 == arg_15_1 + 1 and -34.295 or 18, -2)
					end

					var_15_0:SortTaskIdList()
					var_14_1:make(function(arg_17_0, arg_17_1, arg_17_2)
						if arg_17_0 == UIItemList.EventUpdate then
							local var_17_0 = var_15_0.taskIdList[arg_17_1 + 1]
							local var_17_1 = pg.task_data_template[var_17_0]
							local var_17_2 = arg_14_0.taskProxy:getTaskById(var_17_0)

							setText(arg_17_2:Find("normal/number"), string.format("NO.%02d", arg_17_1 + 1))
							setText(arg_17_2:Find("normal/desc"), var_17_1.desc)

							local var_17_3 = arg_17_2:Find("normal/awards")
							local var_17_4 = var_17_3:GetChild(0)

							arg_14_0:updateTaskAwards(var_17_1.award_display, var_17_3, var_17_4)

							local var_17_5 = var_17_1.target_num
							local var_17_6 = arg_17_2:Find("normal/go_btn")
							local var_17_7 = arg_17_2:Find("normal/get_btn")
							local var_17_8 = arg_17_2:Find("normal/got_btn")
							local var_17_9 = arg_17_2:Find("normal")
							local var_17_10 = arg_17_2:Find("lock")

							if var_17_2 then
								local var_17_11 = var_17_2:getProgress()
								local var_17_12 = math.min(var_17_11, var_17_5)

								setText(arg_17_2:Find("normal/progress"), var_17_12 .. "/" .. var_17_5)
								setSlider(arg_17_2:Find("normal/slider"), 0, var_17_5, var_17_12)

								if var_17_2:getTaskStatus() == 0 then
									setActive(var_17_6, true)
									setActive(var_17_7, false)
									setActive(var_17_8, false)
								elseif var_17_2:getTaskStatus() == 1 then
									setActive(var_17_6, false)
									setActive(var_17_7, true)
									setActive(var_17_8, false)
								elseif var_17_2:getTaskStatus() == 2 then
									setActive(var_17_6, false)
									setActive(var_17_7, false)
									setActive(var_17_8, true)
								end

								onButton(arg_14_0, var_17_6, function()
									arg_14_0:emit(CommanderManualMediator.ON_TASK_GO, var_17_2)
								end, SFX_PANEL)
								onButton(arg_14_0, var_17_7, function()
									arg_14_0:TaskAwardsCheckAndSubmit(var_17_2)
								end, SFX_PANEL)
								setActive(var_17_9, true)
								setActive(var_17_10, false)
							elseif var_15_0:IsTaskComplete(var_17_0) then
								setText(arg_17_2:Find("normal/progress"), var_17_5 .. "/" .. var_17_5)
								setSlider(arg_17_2:Find("normal/slider"), 0, var_17_5, var_17_5)
								setActive(var_17_6, false)
								setActive(var_17_7, false)
								setActive(var_17_8, true)
								setActive(var_17_9, true)
								setActive(var_17_10, false)
							else
								setText(arg_17_2:Find("lock/lockBg/Text"), var_15_0:GetTaskLockTip(var_17_0))
								setActive(var_17_9, false)
								setActive(var_17_10, true)
							end

							if not arg_14_0.taskItemAnimTime[var_17_0] or Time.realtimeSinceStartup - arg_14_0.taskItemAnimTime[var_17_0] > 1 then
								arg_17_2:GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_tpl_update")

								arg_14_0.taskItemAnimTime[var_17_0] = Time.realtimeSinceStartup
							end
						end
					end)
					var_14_1:align(#var_15_0.taskIdList)
					scrollTo(arg_14_0.taskPage:Find("page/scroll"), 0, 1)
					arg_14_0:SetPtPanel(arg_14_0.taskPage:Find("page/ptPanel"), var_15_0)
				else
					local var_16_0 = var_15_0:GetLockTip()

					if var_16_0 and var_16_0 ~= "" then
						pg.TipsMgr.GetInstance():ShowTips(var_16_0)
					end
				end
			end, SFX_PANEL)

			if arg_14_0.contextData.currentPageId == var_15_0.id then
				var_14_2 = true

				triggerButton(arg_15_2)
			end

			if not arg_14_0.contextData.currentPageId and var_15_0.isUnlock and isActive(arg_15_2:Find("tip")) then
				var_14_2 = true
				arg_14_0.contextData.currentPageId = var_15_0.id

				triggerButton(arg_15_2)
			end
		end
	end)
	var_14_0:align(#arg_14_0.taskPages)

	if not var_14_2 then
		for iter_14_0 = #arg_14_0.taskPages, 1, -1 do
			if arg_14_0.taskPages[iter_14_0].isUnlock then
				triggerButton(arg_14_0.taskPage:Find("subPageScroll/Viewport/Content"):GetChild(iter_14_0 - 1))

				break
			end
		end
	end

	arg_14_0:ShowBottomTip(arg_14_0.taskPage, 1)
	onScroll(arg_14_0, arg_14_0.taskPage:Find("subPageScroll"), function(arg_20_0)
		arg_14_0:ShowBottomTip(arg_14_0.taskPage, arg_20_0.y)
	end)
end

function var_0_0.ShowGuidePage(arg_21_0)
	local var_21_0 = UIItemList.New(arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"), arg_21_0.guidePage:Find("subPageScroll/Viewport/Content/subPageBtn"))
	local var_21_1 = UIItemList.New(arg_21_0.guidePage:Find("page/scroll/Viewport/Content"), arg_21_0.guidePage:Find("page/scroll/Viewport/Content/tpl"))
	local var_21_2 = false

	var_21_0:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = arg_21_0.guidePages[arg_22_1 + 1]
			local var_22_1 = var_22_0:getConfig("name")
			local var_22_2 = var_22_0:getConfig("lock_name")

			setActive(arg_22_2:Find("lock0/lock"), not var_22_0.isUnlock)
			setActive(arg_22_2:Find("tip"), var_22_0:ShouldShowTip())
			arg_22_2:Find("mask/name"):GetComponent("ScrollText"):SetText(var_22_0.isUnlock and var_22_1 or var_22_2 or "")
			setText(arg_22_2:Find("en"), var_22_0:getConfig("eng_name"))
			arg_22_2:Find("select/mask/name"):GetComponent("ScrollText"):SetText(tostring(var_22_1 or ""))
			setText(arg_22_2:Find("select/en"), var_22_0:getConfig("eng_name"))

			arg_22_2:GetComponent(typeof(CanvasGroup)).alpha = var_22_0.isUnlock and 1 or 0.5

			onButton(arg_21_0, arg_22_2, function()
				if var_22_0.isUnlock then
					arg_21_0.contextData.currentPageId = var_22_0.id

					for iter_23_0 = 1, arg_21_0.guidePage:Find("subPageScroll/Viewport/Content").childCount do
						setActive(arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"):GetChild(iter_23_0 - 1):Find("select"), iter_23_0 == arg_22_1 + 1)
						setActive(arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"):GetChild(iter_23_0 - 1):Find("lock0"), iter_23_0 ~= arg_22_1 + 1)
						setActive(arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"):GetChild(iter_23_0 - 1):Find("mask"), iter_23_0 ~= arg_22_1 + 1)
						setActive(arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"):GetChild(iter_23_0 - 1):Find("en"), iter_23_0 ~= arg_22_1 + 1)

						arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"):GetChild(iter_23_0 - 1):Find("tip").anchoredPosition = Vector2(iter_23_0 == arg_22_1 + 1 and -34.295 or 18, -2)
					end

					var_22_0:SortTaskIdList()
					var_21_1:make(function(arg_24_0, arg_24_1, arg_24_2)
						if arg_24_0 == UIItemList.EventUpdate then
							local var_24_0 = var_22_0.taskIdList[arg_24_1 + 1]
							local var_24_1 = pg.task_data_template[var_24_0]
							local var_24_2 = arg_21_0.taskProxy:getTaskById(var_24_0)

							setText(arg_24_2:Find("normal/number"), string.format("NO.%02d", arg_24_1 + 1))
							setText(arg_24_2:Find("normal/name"), var_24_1.name)
							setText(arg_24_2:Find("normal/content/descBg/desc"), var_24_1.desc)
							LoadImageSpriteAsync(var_24_1.tutorial_handbook_pic, arg_24_2:Find("normal/content/picture"))
							setText(arg_24_2:Find("fold/number"), string.format("NO.%02d", arg_24_1 + 1))
							setText(arg_24_2:Find("fold/name"), var_24_1.name)
							setText(arg_24_2:Find("fold/descBg/desc"), var_24_1.desc)

							local var_24_3 = arg_24_2:Find("normal/content/descBg/go_btn")
							local var_24_4 = arg_24_2:Find("normal/content/descBg/get_btn")
							local var_24_5 = arg_24_2:Find("normal/content/descBg/got_btn")
							local var_24_6 = arg_24_2:Find("fold/descBg/go_btn")
							local var_24_7 = arg_24_2:Find("fold/descBg/get_btn")
							local var_24_8 = arg_24_2:Find("fold/descBg/got_btn")
							local var_24_9 = arg_24_2:Find("normal")
							local var_24_10 = arg_24_2:Find("fold")
							local var_24_11 = arg_24_2:Find("lock")
							local var_24_12 = arg_24_2:GetComponent(typeof(Animation))
							local var_24_13 = arg_24_2:GetComponent(typeof(DftAniEvent))

							if var_24_2 then
								if var_24_2:getTaskStatus() == 0 then
									setActive(var_24_3, true)
									setActive(var_24_4, false)
									setActive(var_24_5, false)
									setActive(var_24_6, true)
									setActive(var_24_7, false)
									setActive(var_24_8, false)
								elseif var_24_2:getTaskStatus() == 1 then
									setActive(var_24_3, false)
									setActive(var_24_4, true)
									setActive(var_24_5, false)
									setActive(var_24_6, false)
									setActive(var_24_7, true)
									setActive(var_24_8, false)
								elseif var_24_2:getTaskStatus() == 2 then
									setActive(var_24_3, false)
									setActive(var_24_4, false)
									setActive(var_24_5, true)
									setActive(var_24_6, false)
									setActive(var_24_7, false)
									setActive(var_24_8, true)
								end

								onButton(arg_21_0, var_24_3, function()
									arg_21_0:emit(CommanderManualMediator.ON_TASK_GO, var_24_2)
								end, SFX_PANEL)
								onButton(arg_21_0, var_24_4, function()
									arg_21_0:TaskAwardsCheckAndSubmit(var_24_2)
								end, SFX_PANEL)
								onButton(arg_21_0, var_24_6, function()
									arg_21_0:emit(CommanderManualMediator.ON_TASK_GO, var_24_2)
								end, SFX_PANEL)
								onButton(arg_21_0, var_24_7, function()
									arg_21_0:TaskAwardsCheckAndSubmit(var_24_2)
								end, SFX_PANEL)
								setActive(arg_24_2:Find("normal/content/descBg/triangle"), false)
								setActive(var_24_9, true)
								setActive(var_24_10, false)
								setActive(var_24_11, false)
							elseif var_22_0:IsTaskComplete(var_24_0) then
								setActive(var_24_3, false)
								setActive(var_24_4, false)
								setActive(var_24_5, true)
								setActive(var_24_6, false)
								setActive(var_24_7, false)
								setActive(var_24_8, true)
								setActive(arg_24_2:Find("normal/content/descBg/triangle"), true)
								onButton(arg_21_0, arg_24_2:Find("normal/content/descBg/triangle"), function()
									setActive(var_24_9, true)
									var_24_13:SetEndEvent(function()
										setActive(var_24_9, false)
										setActive(var_24_10, true)
									end)
									var_24_12:Play("anim_CommanderManualUI_tpl_guidePage_expand")
								end, SFX_PANEL)
								onButton(arg_21_0, arg_24_2:Find("fold/descBg/triangle"), function()
									setActive(var_24_9, true)
									var_24_13:SetEndEvent(function()
										setActive(var_24_10, false)
									end)
									var_24_12:Play("anim_CommanderManualUI_tpl_guidePage_retract")
								end, SFX_PANEL)
								setActive(var_24_9, false)
								setActive(var_24_10, true)
								setActive(var_24_11, false)
							else
								setText(arg_24_2:Find("lock/lockBg/Text"), var_22_0:GetTaskLockTip(var_24_0))
								setActive(var_24_9, false)
								setActive(var_24_10, false)
								setActive(var_24_11, true)
							end

							var_24_12:Play("anim_CommanderManualUI_tpl_guidePage")
						end
					end)
					var_21_1:align(#var_22_0.taskIdList)
					scrollTo(arg_21_0.guidePage:Find("page/scroll"), 0, 1)
					arg_21_0:SetPtPanel(arg_21_0.guidePage:Find("page/ptPanel"), var_22_0)
				else
					local var_23_0 = var_22_0:GetLockTip()

					if var_23_0 and var_23_0 ~= "" then
						pg.TipsMgr.GetInstance():ShowTips(var_23_0)
					end
				end
			end, SFX_PANEL)

			if arg_21_0.contextData.currentPageId == var_22_0.id then
				var_21_2 = true

				triggerButton(arg_22_2)
			end

			if not arg_21_0.contextData.currentPageId and var_22_0.isUnlock and isActive(arg_22_2:Find("tip")) then
				var_21_2 = true
				arg_21_0.contextData.currentPageId = var_22_0.id

				triggerButton(arg_22_2)
			end
		end
	end)
	var_21_0:align(#arg_21_0.guidePages)

	if not var_21_2 then
		triggerButton(arg_21_0.guidePage:Find("subPageScroll/Viewport/Content"):GetChild(0))
	end

	arg_21_0:ShowBottomTip(arg_21_0.guidePage, 1)
	onScroll(arg_21_0, arg_21_0.guidePage:Find("subPageScroll"), function(arg_33_0)
		arg_21_0:ShowBottomTip(arg_21_0.guidePage, arg_33_0.y)
	end)
end

function var_0_0.SetPtPanel(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_2:getConfig("target")
	local var_34_1 = arg_34_2:getConfig("drop_client")

	setText(arg_34_1:Find("upgrade/progress/progress1"), arg_34_2.pt)
	setText(arg_34_1:Find("upgrade/progress/progress2"), "/" .. #arg_34_2.taskIdList)
	setSlider(arg_34_1:Find("slider"), 0, #arg_34_2.taskIdList, arg_34_2.pt)

	if arg_34_2.pt == #arg_34_2.taskIdList then
		arg_34_1:Find("upgrade"):GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_ptPanel_upgrade")
	end

	local var_34_2 = arg_34_2:GetCurrentPtTarget()

	setText(arg_34_1:Find("desc"), i18n("handbook_unfinished", var_34_2))

	local var_34_3 = arg_34_1:Find("awards")
	local var_34_4 = var_34_3:GetChild(0)

	arg_34_0:updateTaskAwards(arg_34_2:GetCurrentPtAward(), var_34_3, var_34_4)
	setActive(arg_34_1:Find("go_btn"), var_34_2 > arg_34_2.pt)
	setActive(arg_34_1:Find("get_btn"), var_34_2 <= arg_34_2.pt and arg_34_2.award < #arg_34_2:getConfig("target"))
	setActive(arg_34_1:Find("got_btn"), arg_34_2.award == #arg_34_2:getConfig("target"))
	onButton(arg_34_0, arg_34_1:Find("get_btn"), function()
		arg_34_0:PtAwardsCheckAndSubmit(arg_34_2)
	end, SFX_PANEL)
end

function var_0_0.updateTaskAwards(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local var_36_0 = _.slice(arg_36_1, 1, 3)

	for iter_36_0 = arg_36_2.childCount, #var_36_0 - 1 do
		cloneTplTo(arg_36_3, arg_36_2)
	end

	local var_36_1 = arg_36_2.childCount

	for iter_36_1 = 1, var_36_1 do
		local var_36_2 = arg_36_2:GetChild(iter_36_1 - 1)
		local var_36_3 = iter_36_1 <= #var_36_0

		setActive(var_36_2, var_36_3)

		if var_36_3 then
			local var_36_4 = var_36_0[iter_36_1]
			local var_36_5 = {
				type = var_36_4[1],
				id = var_36_4[2],
				count = var_36_4[3]
			}

			updateDrop(var_36_2, var_36_5)
			onButton(arg_36_0, var_36_2, function()
				arg_36_0:emit(BaseUI.ON_DROP, var_36_5)
			end, SFX_PANEL)
		end
	end
end

function var_0_0.ShowTechPage(arg_38_0)
	local var_38_0 = arg_38_0.techPage:Find("subPageScroll/Viewport/Content")

	UIItemList.StaticAlign(var_38_0, var_38_0:GetChild(0), arg_38_0.allTechPhase, function(arg_39_0, arg_39_1, arg_39_2)
		if arg_39_0 == UIItemList.EventUpdate then
			arg_39_2.name = "Phase" .. arg_39_1

			setText(arg_39_2:Find("name"), i18n("tec_catchup_" .. arg_39_1))
			setText(arg_39_2:Find("name/en"), "")
			setText(arg_39_2:Find("select/name"), i18n("tec_catchup_" .. arg_39_1))
			setText(arg_39_2:Find("select/name/en"), "")
			onToggle(arg_38_0, arg_39_2, function(arg_40_0)
				setActive(arg_39_2:Find("select"), arg_40_0)
				setCanvasGroupAlpha(arg_39_2, not arg_40_0 and arg_38_0.finishPhaseDic[arg_39_1] and 0.5 or 1)

				arg_39_2:Find("tip").anchoredPosition = Vector2(arg_40_0 and -34.295 or 18, -2)

				setActive(arg_39_2:Find("name"), not arg_40_0)

				if arg_40_0 then
					arg_38_0:SetTechDisplayPage(arg_39_1)
				end
			end, SFX_PANEL)
		end
	end)
	arg_38_0:UpdateTechPageState()

	local var_38_1

	var_38_1 = arg_38_0.phaseId == "ready"

	setActive(arg_38_0.techPage:Find("page"), true)

	local var_38_2 = arg_38_0.phaseId == "ready" and 0 or arg_38_0.phaseId

	eachChild(var_38_0, function(arg_41_0, arg_41_1)
		triggerToggle(arg_41_0, arg_41_1 == var_38_2)
	end)
	arg_38_0:ShowBottomTip(arg_38_0.techPage, 1)
	onScroll(arg_38_0, arg_38_0.techPage:Find("subPageScroll"), function(arg_42_0)
		arg_38_0:ShowBottomTip(arg_38_0.techPage, arg_42_0.y)
	end)
end

function var_0_0.GetTechTask(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = Task.New({
		id = arg_43_1
	})

	if arg_43_2 then
		var_43_0.progress = var_43_0:getConfig("target_num")
		var_43_0.submitTime = 1
	end

	return var_43_0
end

function var_0_0.SetTechDisplayPage(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1 == arg_44_0.phaseId
	local var_44_1 = arg_44_0.finishPhaseDic[arg_44_1]

	setActive(arg_44_0.techPage:Find("page/lock_mask"), not var_44_0)

	local var_44_2 = arg_44_0.techActivity:getConfig("config_data")[3]
	local var_44_3, var_44_4 = unpack(var_44_2[math.max(1, arg_44_1)])
	local var_44_5 = underscore.map(var_44_3, function(arg_45_0)
		return arg_44_0.taskProxy:getTaskVO(arg_45_0) or arg_44_0:GetTechTask(arg_45_0, var_44_0 or var_44_1)
	end)

	table.sort(var_44_5, CompareFuncs({
		function(arg_46_0)
			return arg_46_0:isReceive() and 1 or 0
		end,
		function(arg_47_0)
			return arg_47_0:isFinish() and 0 or 1
		end,
		function(arg_48_0)
			return arg_48_0.id
		end
	}))

	local var_44_6 = arg_44_0.techPage:Find("page/scroll/Viewport/Content")

	UIItemList.StaticAlign(var_44_6, var_44_6:Find("tpl"), #var_44_5, function(arg_49_0, arg_49_1, arg_49_2)
		arg_49_1 = arg_49_1 + 1

		if arg_49_0 == UIItemList.EventUpdate then
			local var_49_0 = var_44_5[arg_49_1]

			setText(arg_49_2:Find("normal/number"), string.format("NO.%02d", arg_49_1))
			setText(arg_49_2:Find("normal/desc"), var_49_0:getConfig("desc"))

			local var_49_1 = arg_49_2:Find("normal/awards")
			local var_49_2 = var_49_1:GetChild(0)

			arg_44_0:updateTaskAwards(var_49_0:getConfig("award_display"), var_49_1, var_49_2)

			local var_49_3 = arg_49_2:Find("normal/go_btn")
			local var_49_4 = arg_49_2:Find("normal/get_btn")
			local var_49_5 = arg_49_2:Find("normal/got_btn")
			local var_49_6 = arg_49_2:Find("normal/lock_btn")
			local var_49_7 = arg_49_2:Find("normal")
			local var_49_8 = arg_49_2:Find("lock")
			local var_49_9 = var_49_0:getConfig("target_num")
			local var_49_10 = var_49_0:getProgress()
			local var_49_11 = math.min(var_49_10, var_49_9)

			setText(arg_49_2:Find("normal/progress"), var_49_11 .. "/" .. var_49_9)
			setSlider(arg_49_2:Find("normal/slider"), 0, var_49_9, var_49_11)

			if not var_44_0 and not var_44_1 then
				setActive(var_49_3, false)
				setActive(var_49_4, false)
				setActive(var_49_5, false)
				setActive(var_49_6, true)
			else
				local var_49_12 = var_49_0:getTaskStatus()

				setActive(var_49_3, var_49_12 == 0)
				setActive(var_49_4, var_49_12 == 1)
				setActive(var_49_5, var_49_12 == 2)
				setActive(var_49_6, false)
			end

			onButton(arg_44_0, var_49_3, function()
				arg_44_0:emit(CommanderManualMediator.ON_TASK_GO, var_49_0)
			end, SFX_PANEL)
			onButton(arg_44_0, var_49_4, function()
				arg_44_0:TaskAwardsCheckAndSubmit(var_49_0)
			end, SFX_PANEL)
			setActive(var_49_7, true)
			setActive(var_49_8, false)
			arg_49_2:GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_tpl_update")
		end
	end)
	scrollTo(arg_44_0.techPage:Find("page/scroll"), 0, 1)

	local var_44_7 = arg_44_0.techPage:Find("page/ptPanel")
	local var_44_8

	if var_44_0 then
		var_44_8 = arg_44_0.taskProxy:getTaskVO(var_44_4)
	elseif var_44_1 then
		var_44_8 = arg_44_0:GetTechTask(var_44_4, var_44_1)
	end

	if var_44_8 then
		if var_44_8 and var_44_8:isClientTrigger() and not var_44_8:isFinish() then
			arg_44_0:emit(CommanderManualMediator.ON_UPDATE, var_44_8)
		end

		local var_44_9 = var_44_8:getConfig("target_num")
		local var_44_10 = var_44_8:getProgress()
		local var_44_11 = math.min(var_44_10, var_44_9)

		setText(var_44_7:Find("upgrade/progress/progress1"), var_44_11)
		setText(var_44_7:Find("upgrade/progress/progress2"), "/" .. var_44_9)
		setSlider(var_44_7:Find("slider"), 0, var_44_9, var_44_11)

		if var_44_11 == var_44_9 then
			var_44_7:Find("upgrade"):GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_ptPanel_upgrade")
		end

		setText(var_44_7:Find("desc"), var_44_8:getConfig("desc"))

		local var_44_12 = var_44_7:Find("awards")
		local var_44_13 = var_44_12:GetChild(0)

		arg_44_0:updateTaskAwards(var_44_8:getConfig("award_display"), var_44_12, var_44_13)

		local var_44_14 = var_44_7:Find("go_btn")
		local var_44_15 = var_44_7:Find("get_btn")
		local var_44_16 = var_44_7:Find("got_btn")
		local var_44_17 = var_44_8:getTaskStatus()

		setActive(var_44_14, var_44_17 == 0)
		setActive(var_44_15, var_44_17 == 1)
		setActive(var_44_16, var_44_17 == 2)

		local var_44_18 = var_44_7:Find("unlock_btn")
		local var_44_19 = var_44_7:Find("wait_btn")

		setActive(var_44_18, false)
		setActive(var_44_19, false)
		onButton(arg_44_0, var_44_14, function()
			arg_44_0:emit(CommanderManualMediator.ON_TASK_GO, var_44_8)
		end, SFX_PANEL)
		onButton(arg_44_0, var_44_15, function()
			arg_44_0:TaskAwardsCheckAndSubmit(var_44_8)
		end, SFX_PANEL)
	else
		local var_44_20 = #var_44_5
		local var_44_21 = var_44_0 and underscore.reduce(var_44_5, 0, function(arg_54_0, arg_54_1)
			return arg_54_0 + (arg_54_1:isReceive() and 1 or 0)
		end) or 0

		setText(var_44_7:Find("upgrade/progress/progress1"), var_44_21)
		setText(var_44_7:Find("upgrade/progress/progress2"), "/" .. var_44_20)
		setSlider(var_44_7:Find("slider"), 0, var_44_20, var_44_21)

		if var_44_21 == var_44_20 then
			var_44_7:Find("upgrade"):GetComponent(typeof(Animation)):Play("anim_CommanderManualUI_ptPanel_upgrade")
		end

		setText(var_44_7:Find("desc"), i18n("handbook_research_final_task_desc_locked", i18n("tec_catchup_" .. arg_44_1)))

		local var_44_22 = var_44_7:Find("awards")
		local var_44_23 = var_44_22:GetChild(0)

		arg_44_0:updateTaskAwards(pg.task_data_template[var_44_4].award_display, var_44_22, var_44_23)

		local var_44_24 = var_44_7:Find("go_btn")
		local var_44_25 = var_44_7:Find("get_btn")
		local var_44_26 = var_44_7:Find("got_btn")

		setActive(var_44_24, false)
		setActive(var_44_25, false)
		setActive(var_44_26, false)

		if var_44_20 <= var_44_21 then
			arg_44_0:emit(CommanderManualMediator.ON_TRIGGER, {
				cmd = 2,
				activity_id = arg_44_0.techActivity.id
			})
		end

		local var_44_27, var_44_28 = TechnologyConst.isTecActOn()
		local var_44_29 = arg_44_0.techFinishTaskId and arg_44_0.taskProxy:getTaskVO(arg_44_0.techFinishTaskId)
		local var_44_30 = arg_44_0.phaseId == "ready" or var_44_27 and var_44_29 and var_44_29:isReceive()
		local var_44_31 = not var_44_1 and not var_44_0
		local var_44_32 = var_44_30 and (arg_44_1 ~= 1 or arg_44_0.finishPhaseDic[0] or arg_44_0.phaseId == 0)
		local var_44_33 = var_44_7:Find("unlock_btn")
		local var_44_34 = var_44_7:Find("wait_btn")

		setText(var_44_33:Find("Text"), i18n("handbook_research_confirm", i18n("tec_catchup_" .. arg_44_1)))
		setText(var_44_34:Find("Text"), i18n("handbook_research_final_task_btn_locked"))
		setActive(var_44_33, var_44_31 and var_44_32)
		setActive(var_44_34, var_44_0 and var_44_21 < var_44_20)
		onButton(arg_44_0, var_44_33, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tec_catchup_confirm"),
				onYes = function()
					if arg_44_1 == 1 then
						arg_44_0:emit(CommanderManualMediator.ON_TRIGGER, {
							cmd = 3,
							activity_id = arg_44_0.techActivity.id
						})
					else
						arg_44_0:emit(CommanderManualMediator.ON_TRIGGER, {
							cmd = 1,
							activity_id = arg_44_0.techActivity.id,
							arg1 = math.max(arg_44_1, 1)
						})
					end
				end
			})
		end, SFX_CONFIRM)
		onButton(arg_44_0, var_44_34, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("handbook_research_final_task_desc_locked", i18n("tec_catchup_" .. arg_44_1)))
		end, SFX_CONFIRM)
	end
end

function var_0_0.UpdateTechPageState(arg_58_0)
	local var_58_0, var_58_1 = TechnologyConst.isTecActOn()
	local var_58_2 = arg_58_0.techFinishTaskId and arg_58_0.taskProxy:getTaskVO(arg_58_0.techFinishTaskId)
	local var_58_3 = arg_58_0.phaseId == "ready" or var_58_0 and var_58_2 and var_58_2:isReceive()

	eachChild(arg_58_0.techPage:Find("subPageScroll/Viewport/Content"), function(arg_59_0, arg_59_1)
		local var_59_0 = not arg_58_0.finishPhaseDic[arg_59_1] and arg_58_0.phaseId ~= arg_59_1
		local var_59_1 = var_58_3 and (arg_59_1 ~= 1 or arg_58_0.finishPhaseDic[0] or arg_58_0.phaseId == 0)

		setActive(arg_59_0:Find("name/lock"), false)
		setActive(arg_59_0:Find("select/bg"), not arg_58_0.finishPhaseDic[arg_59_1])
		setActive(arg_59_0:Find("select/bg_end"), arg_58_0.finishPhaseDic[arg_59_1])

		if var_59_1 then
			setActive(arg_59_0:Find("tip"), var_59_0)
		else
			setActive(arg_59_0:Find("tip"), arg_59_1 == arg_58_0.phaseId and var_58_1)
		end
	end)
end

function var_0_0.ShowBottomTip(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = arg_60_1:Find("subPageScroll"):GetComponent(typeof(ScrollRect))
	local var_60_1 = arg_60_1:Find("subPageScroll/Viewport/Content")
	local var_60_2 = var_60_1:GetComponent(typeof(VerticalLayoutGroup))
	local var_60_3 = var_60_2.padding.top
	local var_60_4 = var_60_2.padding.bottom
	local var_60_5 = var_60_2.spacing
	local var_60_6 = var_60_1:GetChild(0).rect.height
	local var_60_7 = var_60_3 + var_60_4 + var_60_6 * var_60_1.childCount + var_60_5 * (var_60_1.childCount - 1)
	local var_60_8 = arg_60_1:Find("subPageScroll/Viewport").rect.height

	if var_60_7 < var_60_8 + var_60_5 + var_60_6 then
		setActive(arg_60_1:Find("bottomTip"), false)

		return
	end

	local var_60_9 = math.floor(var_60_8 / (var_60_6 + var_60_5))
	local var_60_10 = math.ceil((var_60_1.childCount - var_60_9) * (1 - arg_60_2) + var_60_9)

	if var_60_10 < var_60_9 then
		var_60_10 = var_60_9
	end

	if var_60_10 > var_60_1.childCount - 1 then
		setActive(arg_60_1:Find("bottomTip"), false)

		return
	end

	setActive(arg_60_1:Find("bottomTip"), false)

	for iter_60_0 = var_60_10, var_60_1.childCount - 1 do
		if isActive(var_60_1:GetChild(iter_60_0):Find("tip")) then
			setActive(arg_60_1:Find("bottomTip"), true)

			break
		end
	end
end

function var_0_0.TaskAwardsCheckAndSubmit(arg_61_0, arg_61_1)
	local var_61_0 = {}
	local var_61_1 = arg_61_1:getConfig("award_display")
	local var_61_2 = getProxy(PlayerProxy):getRawData()
	local var_61_3 = pg.gameset.urpt_chapter_max.description[1]
	local var_61_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_61_3)
	local var_61_5, var_61_6 = Task.StaticJudgeOverflow(var_61_2.gold, var_61_2.oil, var_61_4, true, true, var_61_1)

	if var_61_5 then
		table.insert(var_61_0, function(arg_62_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_61_6,
				onYes = arg_62_0
			})
		end)
	end

	seriesAsync(var_61_0, function()
		arg_61_0:emit(CommanderManualMediator.ON_TASK_SUBMIT, arg_61_1)
	end)
end

function var_0_0.PtAwardsCheckAndSubmit(arg_64_0, arg_64_1)
	local var_64_0 = {}
	local var_64_1 = arg_64_1:GetCurrentPtAward()
	local var_64_2 = getProxy(PlayerProxy):getRawData()
	local var_64_3 = pg.gameset.urpt_chapter_max.description[1]
	local var_64_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_64_3)
	local var_64_5, var_64_6 = Task.StaticJudgeOverflow(var_64_2.gold, var_64_2.oil, var_64_4, true, true, var_64_1)

	if var_64_5 then
		table.insert(var_64_0, function(arg_65_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				content = i18n("award_max_warning"),
				items = var_64_6,
				onYes = arg_65_0
			})
		end)
	end

	seriesAsync(var_64_0, function()
		arg_64_0:emit(CommanderManualMediator.GET_PT_AWARD, arg_64_1.id)
	end)
end

function var_0_0.willExit(arg_67_0)
	arg_67_0:UnOverlayPanel(arg_67_0.blurPanel, arg_67_0._tf)
end

function var_0_0.onBackPressed(arg_68_0)
	arg_68_0:closeView()
end

return var_0_0

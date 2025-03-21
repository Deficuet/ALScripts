local var_0_0 = class("TaskWeekPage", import(".TaskCommonPage"))

var_0_0.WEEK_TASK_TYPE_COMMON = 1
var_0_0.WEEK_TASK_TYPE_PT = 2

function var_0_0.getUIName(arg_1_0)
	return "TaskListForWeekPage"
end

function var_0_0.RefreshWeekProgress(arg_2_0)
	arg_2_0:UpdateWeekProgress(arg_2_0.contextData.weekTaskProgressInfo)
end

function var_0_0.OnLoaded(arg_3_0)
	var_0_0.super.OnLoaded(arg_3_0)

	local var_3_0 = arg_3_0:findTF("right_panel/task_progress")

	setActive(var_3_0, true)
	setText(var_3_0:Find("title"), i18n("week_task_title_label"))

	arg_3_0.awardPreviewBtn = var_3_0:Find("award_preview")

	setText(arg_3_0.awardPreviewBtn:Find("Text"), i18n("week_task_award_preview_label"))

	arg_3_0.phaseTxt = var_3_0:Find("phase/Text"):GetComponent(typeof(Text))
	arg_3_0.progressSlider = var_3_0:Find("slider"):GetComponent(typeof(Slider))
	arg_3_0.progressTxt = var_3_0:Find("slider/Text"):GetComponent(typeof(Text))
	arg_3_0.awardList = UIItemList.New(var_3_0:Find("awards"), var_3_0:Find("awards/itemtpl"))
	arg_3_0.getBtn = var_3_0:Find("get_btn")
	arg_3_0.getBtnEnableTF = arg_3_0.getBtn:Find("enable")
	arg_3_0.getBtnDisableTF = arg_3_0.getBtn:Find("disable")
	arg_3_0.tip = var_3_0:Find("tip")

	onButton(arg_3_0, arg_3_0.awardPreviewBtn, function()
		local var_4_0 = arg_3_0.contextData.weekTaskProgressInfo

		arg_3_0.contextData.ptAwardWindow:ExecuteAction("Display", var_4_0:GetAllPhaseDrops())
	end, SFX_PANEL)

	arg_3_0.topTF = arg_3_0._scrllPanel.parent
	arg_3_0.topPosy = arg_3_0._scrllPanel.localPosition.y + arg_3_0._scrllPanel.rect.height * 0.5

	arg_3_0._scrollView.onValueChanged:AddListener(function(arg_5_0)
		arg_3_0:UpdateCardTip()
	end)
end

function var_0_0.UpdateCardTip(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.taskCards) do
		local var_6_0 = arg_6_0.topTF:InverseTransformPoint(iter_6_1._tf.position).y + iter_6_1.height * 0.5

		iter_6_1.tip.anchoredPosition3D = math.abs(var_6_0 - arg_6_0.topPosy) < iter_6_1.tip.rect.height * 0.5 and Vector3(-5, -25) or Vector3(-5, 0)
	end
end

function var_0_0.onUpdateTask(arg_7_0, arg_7_1, arg_7_2)
	var_0_0.super.onUpdateTask(arg_7_0, arg_7_1, arg_7_2)

	local var_7_0 = arg_7_0.taskCards[arg_7_2]

	arg_7_2.name = var_7_0.taskVO.id

	if arg_7_1 == 0 then
		var_7_0.tip.anchoredPosition3D = Vector3(-5, -25)
	end
end

function var_0_0.Update(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if arg_8_0.contextData.weekTaskProgressInfo:ReachMaxPt() and arg_8_0:isShowing() then
		pg.UIMgr.GetInstance():LoadingOn(false)
		arg_8_0:DoDisablePtTaskAnim(function()
			pg.UIMgr.GetInstance():LoadingOff()
			arg_8_0:Flush(arg_8_2)

			if arg_8_3 then
				arg_8_3(arg_8_0.taskVOs or {})
			end
		end)
	elseif TaskScene.IsPassScenario() then
		arg_8_0:Flush(arg_8_2)

		if arg_8_3 then
			arg_8_3(arg_8_0.taskVOs or {})
		end
	else
		setActive(arg_8_0._tf, false)

		if arg_8_3 then
			arg_8_3({})
		end
	end
end

function var_0_0.DoDisablePtTaskAnim(arg_10_0, arg_10_1)
	local function var_10_0(arg_11_0, arg_11_1)
		arg_11_0:DoSubmitAnim(function()
			setActive(arg_11_0._go, false)
			arg_11_1()
		end)
	end

	arg_10_0._scrollView.enabled = false

	local var_10_1 = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.taskVOs or {}) do
		if iter_10_1.isWeekTask then
			local var_10_2 = arg_10_0:GetCard(iter_10_1.id)

			if var_10_2 then
				table.insert(var_10_1, function(arg_13_0)
					var_10_0(var_10_2, arg_13_0)
				end)
			end
		end
	end

	seriesAsync(var_10_1, function()
		arg_10_0._scrollView.enabled = true

		arg_10_1()
	end)
end

function var_0_0.GetCard(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.taskCards) do
		if iter_15_1.taskVO.id == arg_15_1 then
			return iter_15_1
		end
	end

	return nil
end

function var_0_0.Flush(arg_16_0, arg_16_1)
	arg_16_0.taskVOs = {}

	local var_16_0 = arg_16_0.contextData.weekTaskProgressInfo

	arg_16_0:UpdateWeekProgress(var_16_0)

	if not var_16_0:ReachMaxPt() then
		local var_16_1 = var_16_0:GetSubTasks()

		for iter_16_0, iter_16_1 in pairs(var_16_1) do
			table.insert(arg_16_0.taskVOs, iter_16_1)
		end
	end

	local var_16_2 = arg_16_0.contextData.taskVOsById

	for iter_16_2, iter_16_3 in pairs(var_16_2) do
		if iter_16_3:ShowOnTaskScene() and arg_16_1[iter_16_3:GetRealType()] then
			table.insert(arg_16_0.taskVOs, iter_16_3)
		end
	end

	table.sort(arg_16_0.taskVOs, CompareFuncs({
		function(arg_17_0)
			return -arg_17_0:getTaskStatus(arg_17_0)
		end,
		function(arg_18_0)
			return pg.NewGuideMgr.GetInstance():IsBusy() and arg_18_0.id == getDorm3dGameset("drom3d_weekly_task")[1] and 0 or 1
		end,
		function(arg_19_0)
			return arg_19_0.isWeekTask and 1 or 0
		end,
		function(arg_20_0)
			return arg_20_0.id
		end
	}))
	arg_16_0:Show()
	arg_16_0._scrollView:SetTotalCount(#arg_16_0.taskVOs, -1)
end

function var_0_0.UpdateWeekProgress(arg_21_0, arg_21_1)
	arg_21_0:UpdateWeekProgressGetBtn(arg_21_1)

	arg_21_0.phaseTxt.text = arg_21_1:GetPhase() .. "/" .. arg_21_1:GetTotalPhase()

	local var_21_0 = arg_21_1:GetProgress()
	local var_21_1 = arg_21_1:GetTarget()

	arg_21_0.progressSlider.value = var_21_0 / var_21_1
	arg_21_0.progressTxt.text = var_21_0 .. "/" .. var_21_1

	local var_21_2 = arg_21_1:GetDropList()

	arg_21_0.awardList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_21_2[arg_22_1 + 1]
			local var_22_1 = {
				type = var_22_0[1],
				id = var_22_0[2],
				count = var_22_0[3]
			}

			updateDrop(arg_22_2, var_22_1)
			onButton(arg_21_0, arg_22_2, function()
				arg_21_0:emit(TaskMediator.ON_DROP, var_22_1)
			end, SFX_PANEL)
		end
	end)
	arg_21_0.awardList:align(#var_21_2)
end

function var_0_0.UpdateWeekProgressGetBtn(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:CanUpgrade()

	setGray(arg_24_0.getBtn, not var_24_0, false)
	setActive(arg_24_0.getBtnEnableTF, var_24_0)
	setActive(arg_24_0.getBtnDisableTF, not var_24_0)
	setActive(arg_24_0.tip, var_24_0)
	onButton(arg_24_0, arg_24_0.getBtn, function()
		if var_24_0 then
			arg_24_0:JudgeOverflow(arg_24_1, function()
				arg_24_0:emit(TaskMediator.ON_SUBMIT_WEEK_PROGREE)
			end)
		end
	end, SFX_PANEL)
end

function var_0_0.JudgeOverflow(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = getProxy(PlayerProxy):getRawData()
	local var_27_1 = pg.gameset.urpt_chapter_max.description[1]
	local var_27_2 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_27_1)
	local var_27_3 = arg_27_1:GetDropList()
	local var_27_4, var_27_5 = Task.StaticJudgeOverflow(var_27_0.gold, var_27_0.oil, var_27_2, true, true, var_27_3)

	if var_27_4 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_ITEM_BOX,
			content = i18n("award_max_warning"),
			items = var_27_5,
			onYes = arg_27_2
		})
	else
		arg_27_2()
	end
end

function var_0_0.OnDestroy(arg_28_0)
	arg_28_0._scrollView.onValueChanged:RemoveAllListeners()
end

function var_0_0.RefreshWeekTaskPageBefore(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:GetCard(arg_29_1)

	if var_29_0 then
		setActive(var_29_0._go, false)
	end
end

return var_0_0

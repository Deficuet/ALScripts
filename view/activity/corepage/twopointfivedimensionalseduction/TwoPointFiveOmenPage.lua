local var_0_0 = class("TwoPointFiveOmenPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.total = arg_1_0.bg:Find("total_progress")
	arg_1_0.dayTF = arg_1_0.total:Find("day")
	arg_1_0.maxDayTF = arg_1_0.total:Find("max_day")
	arg_1_0.btnDetail = arg_1_0.total:Find("btn_detail")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.taskWindow = TwoPointFiveOmenTaskWindow.New(arg_1_0._tf, arg_1_0.event)
	arg_1_0.finishAll = false

	setActive(arg_1_0.item, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = arg_2_0.activity:getConfig("config_client").unlock_task

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	var_0_0.super.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.maxTF, #arg_3_0.taskGroup)
	onButton(arg_3_0, arg_3_0.btnDetail, function()
		arg_3_0.taskWindow:ExecuteAction("Show", arg_3_0.activity)
	end, SFX_PANEL)
end

function var_0_0.lastFinish(arg_5_0)
	local var_5_0 = arg_5_0.taskGroup[#arg_5_0.taskGroup]
	local var_5_1 = getProxy(TaskProxy):getTaskVO(var_5_0[1])
	local var_5_2 = getProxy(TaskProxy):getTaskVO(var_5_0[2])

	return var_5_1:getTaskStatus() == 2 and var_5_2:getTaskStatus() == 2
end

function var_0_0.UpdateTask(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1 + 1
	local var_6_1 = arg_6_2:Find("item")
	local var_6_2 = arg_6_0.taskGroup[arg_6_0.nday][var_6_0]
	local var_6_3 = arg_6_0.taskProxy:getTaskById(var_6_2) or arg_6_0.taskProxy:getFinishTaskById(var_6_2)

	assert(var_6_3, "without this task by id: " .. var_6_2)

	local var_6_4 = Drop.Create(var_6_3:getConfig("award_display")[1])

	updateDrop(var_6_1, var_6_4)
	onButton(arg_6_0, var_6_1, function()
		arg_6_0:emit(BaseUI.ON_DROP, var_6_4)
	end, SFX_PANEL)

	local var_6_5 = var_6_3:getProgress()
	local var_6_6 = var_6_3:getConfig("target_num")
	local var_6_7 = var_6_3:getConfig("desc")

	if utf8.len(var_6_7) >= 11 then
		setScrollText(arg_6_2:Find("mask/description"), var_6_7)
	else
		setText(arg_6_2:Find("mask/description"), var_6_7)
	end

	local var_6_8, var_6_9 = arg_6_0:GetProgressColor()
	local var_6_10

	var_6_10 = var_6_8 and setColorStr(var_6_5, var_6_8) or var_6_5

	local var_6_11

	var_6_11 = var_6_9 and setColorStr("/" .. var_6_6, var_6_9) or "/" .. var_6_6

	setText(arg_6_2:Find("progressText"), var_6_10 .. var_6_11)
	setSlider(arg_6_2:Find("progress"), 0, var_6_6, var_6_5)

	local var_6_12 = arg_6_2:Find("go_btn")
	local var_6_13 = arg_6_2:Find("get_btn")
	local var_6_14 = arg_6_2:Find("got_btn")
	local var_6_15 = var_6_3:getTaskStatus()

	setActive(var_6_12, var_6_15 == 0)
	setActive(var_6_13, var_6_15 == 1)
	setActive(var_6_14, var_6_15 == 2)
	onButton(arg_6_0, var_6_12, function()
		arg_6_0:emit(ActivityMediator.ON_TASK_GO, var_6_3)
	end, SFX_PANEL)
	onButton(arg_6_0, var_6_13, function()
		local var_9_0 = {}
		local var_9_1 = var_6_3:getConfig("award_display")
		local var_9_2 = getProxy(PlayerProxy):getRawData()
		local var_9_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_9_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_9_3)
		local var_9_5, var_9_6 = Task.StaticJudgeOverflow(var_9_2.gold, var_9_2.oil, var_9_4, true, true, var_9_1)

		if var_9_5 then
			table.insert(var_9_0, function(arg_10_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_9_6,
					onYes = arg_10_0
				})
			end)
		end

		seriesAsync(var_9_0, function()
			arg_6_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_6_3)
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_12_0)
	arg_12_0.nday = arg_12_0:getTaskIdx(arg_12_0.activity)

	if arg_12_0.dayTF then
		setText(arg_12_0.dayTF, arg_12_0.nday)
		setText(arg_12_0.maxDayTF, "/" .. #arg_12_0.taskGroup)
	end

	arg_12_0.uilist:align(#arg_12_0.taskGroup[arg_12_0.nday])

	if arg_12_0.taskWindow:isShowing() then
		arg_12_0.taskWindow:ExecuteAction("Show", arg_12_0.activity)
	end

	arg_12_0:PlayStory()
end

function var_0_0.PlayStory(arg_13_0)
	local var_13_0 = 3
	local var_13_1 = arg_13_0.activity:getConfig("config_client").story
	local var_13_2 = checkExist(var_13_1, {
		var_13_0
	}, {
		1
	})

	if not var_13_2 or var_13_0 > arg_13_0.nday then
		return
	end

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.taskGroup[var_13_0]) do
		if not arg_13_0:isTaskFinished(iter_13_1) then
			return
		end
	end

	local var_13_3 = pg.NewStoryMgr.GetInstance()

	if not var_13_3:IsPlayed(var_13_2) then
		var_13_3:Play(var_13_2)
	end
end

function var_0_0.getTaskIdx(arg_14_0, arg_14_1)
	local var_14_0 = 1
	local var_14_1 = arg_14_1:getNDay()
	local var_14_2 = #arg_14_0.taskGroup
	local var_14_3 = math.min(var_14_1, var_14_2)
	local var_14_4 = true

	for iter_14_0 = 1, var_14_3 do
		if not var_14_4 then
			break
		end

		var_14_0 = iter_14_0

		if iter_14_0 < var_14_3 then
			for iter_14_1, iter_14_2 in ipairs(arg_14_0.taskGroup[iter_14_0]) do
				if not arg_14_0:isTaskFinished(iter_14_2) then
					var_14_4 = false

					break
				end
			end
		end
	end

	return math.min(var_14_0, var_14_2)
end

function var_0_0.isTaskFinished(arg_15_0, arg_15_1)
	if not arg_15_0.taskProxy then
		arg_15_0.taskProxy = getProxy(TaskProxy)
	end

	local var_15_0 = arg_15_0.taskProxy:getTaskById(arg_15_1) or arg_15_0.taskProxy:getFinishTaskById(arg_15_1)

	return var_15_0 and var_15_0:getTaskStatus() == 2
end

function var_0_0.GetProgressColor(arg_16_0)
	return "#ff89b9", "#ffb1d8"
end

function var_0_0.OnHideFlush(arg_17_0)
	if arg_17_0.taskWindow:isShowing() then
		arg_17_0.taskWindow:Hide()
	end
end

function var_0_0.OnDestroy(arg_18_0)
	if arg_18_0.taskWindow then
		arg_18_0.taskWindow:Hide()
		arg_18_0.taskWindow:Destroy()

		arg_18_0.taskWindow = nil
	end
end

return var_0_0

local var_0_0 = class("BlackFriday2026ReturnPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.endAward = arg_1_0.bg:Find("rule/item")
	arg_1_0.taskProgress = arg_1_0.bg:Find("rule/taskProgress")
	arg_1_0.endGetBtn = arg_1_0.bg:Find("rule/btn_get")
	arg_1_0.endGotBtn = arg_1_0.bg:Find("rule/btn_got")
	arg_1_0.task = arg_1_0.bg:Find("task")
	arg_1_0.taskTouch = arg_1_0.task:Find("bg")
	arg_1_0.taskAward = arg_1_0.task:Find("item")
	arg_1_0.dayTF = arg_1_0.task:Find("day")
	arg_1_0.taskWindow = BlackFriday2026ReturnTaskWindow.New(arg_1_0._tf, arg_1_0.event)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.nday = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = arg_2_0.activity:getConfig("config_client").unlock_task

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.taskTouch, function()
		arg_3_0.taskWindow:ExecuteAction("Show", arg_3_0.activity)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.endGetBtn, function()
		local var_5_0 = arg_3_0.activity:getConfig("config_client").extra_task
		local var_5_1 = arg_3_0.taskProxy:getTaskById(var_5_0) or arg_3_0.taskProxy:getFinishTaskById(var_5_0)

		if var_5_1 and var_5_1:getTaskStatus() == 1 then
			arg_3_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_5_1)
		end
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_6_0)
	arg_6_0.nday = arg_6_0:getTaskIdx(arg_6_0.activity)

	local var_6_0 = "#009BBC"
	local var_6_1 = "#000000"
	local var_6_2 = arg_6_0:GetDayTaskVo(arg_6_0.nday)
	local var_6_3 = arg_6_0.nday
	local var_6_4 = #arg_6_0.taskGroup

	if var_6_2:getTaskStatus() ~= 2 then
		var_6_3 = var_6_3 - 1
	end

	local var_6_5 = setColorStr(var_6_3, var_6_0)
	local var_6_6 = setColorStr("/" .. var_6_4, var_6_1)

	setText(arg_6_0.taskProgress, var_6_5 .. var_6_6)
	setText(arg_6_0.dayTF, arg_6_0.nday .. "/" .. var_6_4)
	arg_6_0:UpdateTask()
	arg_6_0:UpdateEndAward()

	if arg_6_0.taskWindow:isShowing() then
		arg_6_0.taskWindow:ExecuteAction("Show", arg_6_0.activity)
	end
end

function var_0_0.UpdateTask(arg_7_0)
	arg_7_0:InitAward(arg_7_0.taskAward, arg_7_0.nday)

	local var_7_0 = arg_7_0:GetDayTaskVo(arg_7_0.nday)
	local var_7_1 = var_7_0:getProgress()
	local var_7_2 = var_7_0:getConfig("target_num")

	setText(arg_7_0.task:Find("description"), var_7_0:getConfig("desc"))
	setText(arg_7_0.task:Find("progressText"), var_7_1 .. "/" .. var_7_2)
	setSlider(arg_7_0.task:Find("progress"), 0, var_7_2, var_7_1)

	local var_7_3 = arg_7_0.task:Find("go_btn")
	local var_7_4 = arg_7_0.task:Find("get_btn")
	local var_7_5 = arg_7_0.task:Find("got_btn")
	local var_7_6 = var_7_0:getTaskStatus()

	setActive(var_7_3, var_7_6 == 0)
	setActive(var_7_4, var_7_6 == 1)
	setActive(var_7_5, var_7_6 == 2)
	onButton(arg_7_0, var_7_3, function()
		arg_7_0:emit(ActivityMediator.ON_TASK_GO, var_7_0)
	end, SFX_PANEL)
	onButton(arg_7_0, var_7_4, function()
		local var_9_0 = {}
		local var_9_1 = var_7_0:getConfig("award_display")
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
			arg_7_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_7_0)
		end)
	end, SFX_PANEL)
end

function var_0_0.UpdateEndAward(arg_12_0)
	local var_12_0 = arg_12_0.activity:getConfig("config_client").extra_task
	local var_12_1 = arg_12_0.taskProxy:getTaskById(var_12_0) or arg_12_0.taskProxy:getFinishTaskById(var_12_0)

	if var_12_1 == nil then
		warning("未获取到活动数据")

		return
	end

	local var_12_2 = var_12_1:getTaskStatus()

	setActive(arg_12_0.endGetBtn, var_12_2 == 1)
	setActive(arg_12_0.endGotBtn, var_12_2 == 2)

	local var_12_3 = Drop.Create(var_12_1:getConfig("award_display")[1])

	updateDrop(arg_12_0.endAward, var_12_3)
	onButton(arg_12_0, arg_12_0.endAward, function()
		arg_12_0:emit(BaseUI.ON_DROP, var_12_3)
	end, SFX_PANEL)
end

function var_0_0.InitAward(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0:GetDayTaskVo(arg_14_2)
	local var_14_1 = Drop.Create(var_14_0:getConfig("award_display")[1])

	updateDrop(arg_14_1, var_14_1)
	onButton(arg_14_0, arg_14_1, function()
		arg_14_0:emit(BaseUI.ON_DROP, var_14_1)
	end, SFX_PANEL)
end

function var_0_0.GetDayTaskVo(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.taskGroup[arg_16_1][1]
	local var_16_1 = arg_16_0.taskProxy:getTaskById(var_16_0) or arg_16_0.taskProxy:getFinishTaskById(var_16_0)

	assert(var_16_1, "without this task by id: " .. var_16_0)

	return var_16_1
end

function var_0_0.getTaskIdx(arg_17_0, arg_17_1)
	local var_17_0 = 1
	local var_17_1 = arg_17_1:getNDay()
	local var_17_2 = #arg_17_0.taskGroup
	local var_17_3 = math.min(var_17_1, var_17_2)
	local var_17_4 = true

	for iter_17_0 = 1, var_17_3 do
		if not var_17_4 then
			break
		end

		var_17_0 = iter_17_0

		if iter_17_0 < var_17_3 then
			for iter_17_1, iter_17_2 in ipairs(arg_17_0.taskGroup[iter_17_0]) do
				if not arg_17_0:isTaskFinished(iter_17_2) then
					var_17_4 = false

					break
				end
			end
		end
	end

	return math.min(var_17_0, var_17_2)
end

function var_0_0.isTaskFinished(arg_18_0, arg_18_1)
	if not arg_18_0.taskProxy then
		arg_18_0.taskProxy = getProxy(TaskProxy)
	end

	local var_18_0 = arg_18_0.taskProxy:getTaskById(arg_18_1) or arg_18_0.taskProxy:getFinishTaskById(arg_18_1)

	return var_18_0 and var_18_0:getTaskStatus() == 2
end

function var_0_0.OnHideFlush(arg_19_0)
	if arg_19_0.taskWindow:isShowing() then
		arg_19_0.taskWindow:Hide()
	end
end

function var_0_0.OnDestroy(arg_20_0)
	if arg_20_0.taskWindow then
		arg_20_0.taskWindow:Hide()
		arg_20_0.taskWindow:Destroy()

		arg_20_0.taskWindow = nil
	end
end

return var_0_0

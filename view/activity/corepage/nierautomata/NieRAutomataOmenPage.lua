local var_0_0 = class("NieRAutomataOmenPage", import("view.activity.CorePage.CoreLoginTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("bg")
	arg_1_0.introduction = arg_1_0.bg:Find("Introduction")
	arg_1_0.desc1 = arg_1_0.introduction:Find("desc1")
	arg_1_0.desc2 = arg_1_0.introduction:Find("desc2")
	arg_1_0.total = arg_1_0.bg:Find("total_progress")
	arg_1_0.dayTF = arg_1_0.total:Find("day")
	arg_1_0.maxDayTF = arg_1_0.total:Find("max_day")
	arg_1_0.btnDetail = arg_1_0.total:Find("btn_detail")
	arg_1_0.btnDetailText = arg_1_0.btnDetail:Find("detail")
	arg_1_0.item = arg_1_0.bg:Find("item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.taskWindow = NieRAutomataOmenTaskWindow.New(arg_1_0._tf, arg_1_0.event)
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
	setText(arg_3_0.btnDetailText, i18n("nier_a2_mission_detail"))
	onButton(arg_3_0, arg_3_0.btnDetail, function()
		arg_3_0.taskWindow:ExecuteAction("Show", arg_3_0.activity)
	end, SFX_PANEL)
end

function var_0_0.OnShowFlush(arg_5_0)
	var_0_0.super.OnShowFlush(arg_5_0)
end

function var_0_0.GetTypewriterSpeed(arg_6_0)
	local var_6_0 = arg_6_0.activity:getConfig("config_client").typewriterSpeed

	return var_6_0 and var_6_0 or 0.1
end

function var_0_0.Playwriter(arg_7_0)
	local var_7_0 = {}

	if not arg_7_0.finishAll then
		table.insert(var_7_0, function(arg_8_0)
			local var_8_0 = arg_7_0.desc1
			local var_8_1 = GetOrAddComponent(var_8_0, typeof(Typewriter))

			function var_8_1.endFunc()
				arg_8_0()
			end

			var_8_1:setSpeed(arg_7_0:GetTypewriterSpeed())
			var_8_1:Play()
		end)
	else
		table.insert(var_7_0, function(arg_10_0)
			local var_10_0 = arg_7_0.activity:getConfig("config_client").story
			local var_10_1 = checkExist(var_10_0, {
				arg_7_0.nday
			}, {
				1
			})

			if var_10_1 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_10_1) then
				pg.NewStoryMgr.GetInstance():Play(var_10_1, function()
					arg_10_0()
				end)
			else
				arg_10_0()
			end
		end)
	end

	table.insert(var_7_0, function(arg_12_0)
		local var_12_0 = arg_7_0.desc2

		setActive(arg_7_0.desc2, true)

		local var_12_1 = GetOrAddComponent(var_12_0, typeof(Typewriter))

		function var_12_1.endFunc()
			arg_12_0()
		end

		var_12_1:setSpeed(arg_7_0:GetTypewriterSpeed())
		var_12_1:Play()
	end)
	seriesAsync(var_7_0, callback)
end

function var_0_0.LocalFresh(arg_14_0, arg_14_1)
	local var_14_0 = "nier_a2_text_block_day"
	local var_14_1

	arg_14_0.finishAll = arg_14_1 >= 7 and arg_14_0:lastFinish()

	if arg_14_0.finishAll then
		var_14_1 = i18n(var_14_0 .. "_fin")

		setActive(arg_14_0.desc1, false)
	else
		var_14_1 = i18n(var_14_0 .. arg_14_1)

		setText(arg_14_0.desc1, var_14_1[1].info)
	end

	setText(arg_14_0.desc2, var_14_1[2].info)
	setActive(arg_14_0.desc2, false)
	arg_14_0:Playwriter()
end

function var_0_0.lastFinish(arg_15_0)
	local var_15_0 = arg_15_0.taskGroup[#arg_15_0.taskGroup]
	local var_15_1 = getProxy(TaskProxy):getTaskVO(var_15_0[1])
	local var_15_2 = getProxy(TaskProxy):getTaskVO(var_15_0[2])

	return var_15_1:getTaskStatus() == 2 and var_15_2:getTaskStatus() == 2
end

function var_0_0.UpdateTask(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_1 + 1
	local var_16_1 = arg_16_2:Find("item")
	local var_16_2 = arg_16_0.taskGroup[arg_16_0.nday][var_16_0]
	local var_16_3 = arg_16_0.taskProxy:getTaskById(var_16_2) or arg_16_0.taskProxy:getFinishTaskById(var_16_2)

	assert(var_16_3, "without this task by id: " .. var_16_2)

	local var_16_4 = Drop.Create(var_16_3:getConfig("award_display")[1])

	updateDrop(var_16_1, var_16_4)
	onButton(arg_16_0, var_16_1, function()
		arg_16_0:emit(BaseUI.ON_DROP, var_16_4)
	end, SFX_PANEL)

	local var_16_5 = var_16_3:getProgress()
	local var_16_6 = var_16_3:getConfig("target_num")
	local var_16_7 = var_16_3:getConfig("desc")

	if utf8.len(var_16_7) >= 11 then
		setScrollText(arg_16_2:Find("mask/description"), var_16_7)
	else
		setText(arg_16_2:Find("mask/description"), var_16_7)
	end

	local var_16_8, var_16_9 = arg_16_0:GetProgressColor()
	local var_16_10

	var_16_10 = var_16_8 and setColorStr(var_16_5, var_16_8) or var_16_5

	local var_16_11

	var_16_11 = var_16_9 and setColorStr("/" .. var_16_6, var_16_9) or "/" .. var_16_6

	setText(arg_16_2:Find("progressText"), var_16_10 .. var_16_11)
	setSlider(arg_16_2:Find("progress"), 0, var_16_6, var_16_5)

	local var_16_12 = arg_16_2:Find("go_btn")
	local var_16_13 = arg_16_2:Find("get_btn")
	local var_16_14 = arg_16_2:Find("got_btn")
	local var_16_15 = var_16_3:getTaskStatus()

	setActive(var_16_12, var_16_15 == 0)
	setActive(var_16_13, var_16_15 == 1)
	setActive(var_16_14, var_16_15 == 2)
	onButton(arg_16_0, var_16_12, function()
		arg_16_0:emit(ActivityMediator.ON_TASK_GO, var_16_3)
	end, SFX_PANEL)
	onButton(arg_16_0, var_16_13, function()
		local var_19_0 = {}
		local var_19_1 = var_16_3:getConfig("award_display")
		local var_19_2 = getProxy(PlayerProxy):getRawData()
		local var_19_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_19_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_19_3)
		local var_19_5, var_19_6 = Task.StaticJudgeOverflow(var_19_2.gold, var_19_2.oil, var_19_4, true, true, var_19_1)

		if var_19_5 then
			table.insert(var_19_0, function(arg_20_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_19_6,
					onYes = arg_20_0
				})
			end)
		end

		seriesAsync(var_19_0, function()
			arg_16_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_16_3)
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_22_0)
	arg_22_0.nday = arg_22_0:getTaskIdx(arg_22_0.activity)

	if arg_22_0.dayTF then
		setText(arg_22_0.dayTF, arg_22_0.nday)
		setText(arg_22_0.maxDayTF, "/" .. #arg_22_0.taskGroup)
	end

	arg_22_0:LocalFresh(arg_22_0.nday)
	arg_22_0.uilist:align(#arg_22_0.taskGroup[arg_22_0.nday])

	if arg_22_0.taskWindow:isShowing() then
		arg_22_0.taskWindow:ExecuteAction("Show", arg_22_0.activity)
	end
end

function var_0_0.getTaskIdx(arg_23_0, arg_23_1)
	local var_23_0 = 1
	local var_23_1 = arg_23_1:getNDay()
	local var_23_2 = #arg_23_0.taskGroup
	local var_23_3 = math.min(var_23_1, var_23_2)
	local var_23_4 = true

	for iter_23_0 = 1, var_23_3 do
		if not var_23_4 then
			break
		end

		var_23_0 = iter_23_0

		if iter_23_0 < var_23_3 then
			for iter_23_1, iter_23_2 in ipairs(arg_23_0.taskGroup[iter_23_0]) do
				if not arg_23_0:isTaskFinished(iter_23_2) then
					var_23_4 = false

					break
				end
			end
		end
	end

	return math.min(var_23_0, var_23_2)
end

function var_0_0.isTaskFinished(arg_24_0, arg_24_1)
	if not arg_24_0.taskProxy then
		arg_24_0.taskProxy = getProxy(TaskProxy)
	end

	local var_24_0 = arg_24_0.taskProxy:getTaskById(arg_24_1) or arg_24_0.taskProxy:getFinishTaskById(arg_24_1)

	return var_24_0 and var_24_0:getTaskStatus() == 2
end

function var_0_0.GetProgressColor(arg_25_0)
	return "#ffbc46", "#52514a"
end

function var_0_0.OnHideFlush(arg_26_0)
	if arg_26_0.taskWindow:isShowing() then
		arg_26_0.taskWindow:Hide()
	end
end

function var_0_0.OnDestroy(arg_27_0)
	if arg_27_0.taskWindow then
		arg_27_0.taskWindow:Hide()
		arg_27_0.taskWindow:Destroy()

		arg_27_0.taskWindow = nil
	end
end

return var_0_0

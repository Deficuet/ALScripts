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

function var_0_0.InvalidateWriter(arg_7_0)
	arg_7_0.writerToken = (arg_7_0.writerToken or 0) + 1

	if arg_7_0.desc1 then
		GetOrAddComponent(arg_7_0.desc1, typeof(Typewriter)).endFunc = nil
	end

	if arg_7_0.desc2 then
		GetOrAddComponent(arg_7_0.desc2, typeof(Typewriter)).endFunc = nil
	end
end

function var_0_0.Playwriter(arg_8_0)
	arg_8_0:InvalidateWriter()

	local var_8_0 = arg_8_0.writerToken

	local function var_8_1()
		return arg_8_0.writerToken == var_8_0 and arg_8_0._go and isActive(arg_8_0._go)
	end

	local var_8_2 = {}

	if not arg_8_0.finishAll then
		table.insert(var_8_2, function(arg_10_0)
			if not var_8_1() then
				return
			end

			local var_10_0 = arg_8_0.desc1
			local var_10_1 = GetOrAddComponent(var_10_0, typeof(Typewriter))

			function var_10_1.endFunc()
				if not var_8_1() then
					return
				end

				arg_10_0()
			end

			var_10_1:setSpeed(arg_8_0:GetTypewriterSpeed())
			var_10_1:Play()
		end)
	else
		table.insert(var_8_2, function(arg_12_0)
			if not var_8_1() then
				return
			end

			local var_12_0 = arg_8_0.activity:getConfig("config_client").story
			local var_12_1 = checkExist(var_12_0, {
				arg_8_0.nday
			}, {
				1
			})

			if var_12_1 and not pg.NewStoryMgr.GetInstance():IsPlayed(var_12_1) then
				pg.NewStoryMgr.GetInstance():Play(var_12_1, function()
					if not var_8_1() then
						return
					end

					arg_12_0()
				end)
			else
				arg_12_0()
			end
		end)
	end

	table.insert(var_8_2, function(arg_14_0)
		if not var_8_1() then
			return
		end

		local var_14_0 = arg_8_0.desc2

		setActive(arg_8_0.desc2, true)

		local var_14_1 = GetOrAddComponent(var_14_0, typeof(Typewriter))

		function var_14_1.endFunc()
			if not var_8_1() then
				return
			end

			arg_14_0()
		end

		var_14_1:setSpeed(arg_8_0:GetTypewriterSpeed())
		var_14_1:Play()
	end)
	seriesAsync(var_8_2)
end

function var_0_0.LocalFresh(arg_16_0, arg_16_1)
	local var_16_0 = "nier_a2_text_block_day"
	local var_16_1

	arg_16_0.finishAll = arg_16_1 >= 7 and arg_16_0:lastFinish()

	if arg_16_0.finishAll then
		var_16_1 = i18n(var_16_0 .. "_fin")

		setActive(arg_16_0.desc1, false)
	else
		var_16_1 = i18n(var_16_0 .. arg_16_1)

		setText(arg_16_0.desc1, var_16_1[1].info)
	end

	setText(arg_16_0.desc2, var_16_1[2].info)
	setActive(arg_16_0.desc2, false)
	arg_16_0:Playwriter()
end

function var_0_0.lastFinish(arg_17_0)
	local var_17_0 = arg_17_0.taskGroup[#arg_17_0.taskGroup]
	local var_17_1 = getProxy(TaskProxy):getTaskVO(var_17_0[1])
	local var_17_2 = getProxy(TaskProxy):getTaskVO(var_17_0[2])

	return var_17_1:getTaskStatus() == 2 and var_17_2:getTaskStatus() == 2
end

function var_0_0.UpdateTask(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1 + 1
	local var_18_1 = arg_18_2:Find("item")
	local var_18_2 = arg_18_0.taskGroup[arg_18_0.nday][var_18_0]
	local var_18_3 = arg_18_0.taskProxy:getTaskById(var_18_2) or arg_18_0.taskProxy:getFinishTaskById(var_18_2)

	assert(var_18_3, "without this task by id: " .. var_18_2)

	local var_18_4 = Drop.Create(var_18_3:getConfig("award_display")[1])

	updateDrop(var_18_1, var_18_4)
	onButton(arg_18_0, var_18_1, function()
		arg_18_0:emit(BaseUI.ON_DROP, var_18_4)
	end, SFX_PANEL)

	local var_18_5 = var_18_3:getProgress()
	local var_18_6 = var_18_3:getConfig("target_num")
	local var_18_7 = var_18_3:getConfig("desc")

	if utf8.len(var_18_7) >= 11 then
		setScrollText(arg_18_2:Find("mask/description"), var_18_7)
	else
		setText(arg_18_2:Find("mask/description"), var_18_7)
	end

	local var_18_8, var_18_9 = arg_18_0:GetProgressColor()
	local var_18_10

	var_18_10 = var_18_8 and setColorStr(var_18_5, var_18_8) or var_18_5

	local var_18_11

	var_18_11 = var_18_9 and setColorStr("/" .. var_18_6, var_18_9) or "/" .. var_18_6

	setText(arg_18_2:Find("progressText"), var_18_10 .. var_18_11)
	setSlider(arg_18_2:Find("progress"), 0, var_18_6, var_18_5)

	local var_18_12 = arg_18_2:Find("go_btn")
	local var_18_13 = arg_18_2:Find("get_btn")
	local var_18_14 = arg_18_2:Find("got_btn")
	local var_18_15 = var_18_3:getTaskStatus()

	setActive(var_18_12, var_18_15 == 0)
	setActive(var_18_13, var_18_15 == 1)
	setActive(var_18_14, var_18_15 == 2)
	onButton(arg_18_0, var_18_12, function()
		arg_18_0:emit(ActivityMediator.ON_TASK_GO, var_18_3)
	end, SFX_PANEL)
	onButton(arg_18_0, var_18_13, function()
		local var_21_0 = {}
		local var_21_1 = var_18_3:getConfig("award_display")
		local var_21_2 = getProxy(PlayerProxy):getRawData()
		local var_21_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_21_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_21_3)
		local var_21_5, var_21_6 = Task.StaticJudgeOverflow(var_21_2.gold, var_21_2.oil, var_21_4, true, true, var_21_1)

		if var_21_5 then
			table.insert(var_21_0, function(arg_22_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_21_6,
					onYes = arg_22_0
				})
			end)
		end

		seriesAsync(var_21_0, function()
			arg_18_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_18_3)
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_24_0)
	arg_24_0.nday = arg_24_0:getTaskIdx(arg_24_0.activity)

	if arg_24_0.dayTF then
		setText(arg_24_0.dayTF, arg_24_0.nday)
		setText(arg_24_0.maxDayTF, "/" .. #arg_24_0.taskGroup)
	end

	arg_24_0:LocalFresh(arg_24_0.nday)
	arg_24_0.uilist:align(#arg_24_0.taskGroup[arg_24_0.nday])

	if arg_24_0.taskWindow:isShowing() then
		arg_24_0.taskWindow:ExecuteAction("Show", arg_24_0.activity)
	end
end

function var_0_0.getTaskIdx(arg_25_0, arg_25_1)
	local var_25_0 = 1
	local var_25_1 = arg_25_1:getNDay()
	local var_25_2 = #arg_25_0.taskGroup
	local var_25_3 = math.min(var_25_1, var_25_2)
	local var_25_4 = true

	for iter_25_0 = 1, var_25_3 do
		if not var_25_4 then
			break
		end

		var_25_0 = iter_25_0

		if iter_25_0 < var_25_3 then
			for iter_25_1, iter_25_2 in ipairs(arg_25_0.taskGroup[iter_25_0]) do
				if not arg_25_0:isTaskFinished(iter_25_2) then
					var_25_4 = false

					break
				end
			end
		end
	end

	return math.min(var_25_0, var_25_2)
end

function var_0_0.isTaskFinished(arg_26_0, arg_26_1)
	if not arg_26_0.taskProxy then
		arg_26_0.taskProxy = getProxy(TaskProxy)
	end

	local var_26_0 = arg_26_0.taskProxy:getTaskById(arg_26_1) or arg_26_0.taskProxy:getFinishTaskById(arg_26_1)

	return var_26_0 and var_26_0:getTaskStatus() == 2
end

function var_0_0.GetProgressColor(arg_27_0)
	return "#ffbc46", "#52514a"
end

function var_0_0.OnHideFlush(arg_28_0)
	arg_28_0:InvalidateWriter()

	if arg_28_0.taskWindow:isShowing() then
		arg_28_0.taskWindow:Hide()
	end
end

function var_0_0.OnDestroy(arg_29_0)
	arg_29_0:InvalidateWriter()

	if arg_29_0.taskWindow then
		arg_29_0.taskWindow:Hide()
		arg_29_0.taskWindow:Destroy()

		arg_29_0.taskWindow = nil
	end
end

return var_0_0

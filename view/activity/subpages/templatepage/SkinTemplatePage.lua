local var_0_0 = class("SkinTemplatePage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD")
	arg_1_0.dayTF = arg_1_0:findTF("day", arg_1_0.bg)
	arg_1_0.item = arg_1_0:findTF("item", arg_1_0.bg)
	arg_1_0.items = arg_1_0:findTF("items", arg_1_0.bg)
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)

	setActive(arg_1_0.item, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.nday = 0
	arg_2_0.taskProxy = getProxy(TaskProxy)
	arg_2_0.taskGroup = arg_2_0.activity:getConfig("config_data")

	return updateActivityTaskStatus(arg_2_0.activity)
end

function var_0_0.OnFirstFlush(arg_3_0)
	arg_3_0.uilist:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTask(arg_4_1, arg_4_2)
		end
	end)
end

function var_0_0.UpdateTask(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1 + 1
	local var_5_1 = arg_5_0:findTF("item", arg_5_2)
	local var_5_2 = arg_5_0.taskGroup[arg_5_0.nday][var_5_0]
	local var_5_3 = arg_5_0.taskProxy:getTaskById(var_5_2) or arg_5_0.taskProxy:getFinishTaskById(var_5_2)

	assert(var_5_3, "without this task by id: " .. var_5_2)

	local var_5_4 = Drop.Create(var_5_3:getConfig("award_display")[1])

	updateDrop(var_5_1, var_5_4)
	onButton(arg_5_0, var_5_1, function()
		arg_5_0:emit(BaseUI.ON_DROP, var_5_4)
	end, SFX_PANEL)

	local var_5_5 = var_5_3:getProgress()
	local var_5_6 = var_5_3:getConfig("target_num")

	setText(arg_5_0:findTF("description", arg_5_2), var_5_3:getConfig("desc"))

	local var_5_7, var_5_8 = arg_5_0:GetProgressColor()
	local var_5_9

	var_5_9 = var_5_7 and setColorStr(var_5_5, var_5_7) or var_5_5

	local var_5_10

	var_5_10 = var_5_8 and setColorStr("/" .. var_5_6, var_5_8) or "/" .. var_5_6

	setText(arg_5_0:findTF("progressText", arg_5_2), var_5_9 .. var_5_10)
	setSlider(arg_5_0:findTF("progress", arg_5_2), 0, var_5_6, var_5_5)

	local var_5_11 = arg_5_0:findTF("go_btn", arg_5_2)
	local var_5_12 = arg_5_0:findTF("get_btn", arg_5_2)
	local var_5_13 = arg_5_0:findTF("got_btn", arg_5_2)
	local var_5_14 = var_5_3:getTaskStatus()

	setActive(var_5_11, var_5_14 == 0)
	setActive(var_5_12, var_5_14 == 1)
	setActive(var_5_13, var_5_14 == 2)
	onButton(arg_5_0, var_5_11, function()
		arg_5_0:emit(ActivityMediator.ON_TASK_GO, var_5_3)
	end, SFX_PANEL)
	onButton(arg_5_0, var_5_12, function()
		local var_8_0 = {}
		local var_8_1 = var_5_3:getConfig("award_display")
		local var_8_2 = getProxy(PlayerProxy):getRawData()
		local var_8_3 = pg.gameset.urpt_chapter_max.description[1]
		local var_8_4 = LOCK_UR_SHIP and 0 or getProxy(BagProxy):GetLimitCntById(var_8_3)
		local var_8_5, var_8_6 = Task.StaticJudgeOverflow(var_8_2.gold, var_8_2.oil, var_8_4, true, true, var_8_1)

		if var_8_5 then
			table.insert(var_8_0, function(arg_9_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_ITEM_BOX,
					content = i18n("award_max_warning"),
					items = var_8_6,
					onYes = arg_9_0
				})
			end)
		end

		seriesAsync(var_8_0, function()
			arg_5_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_5_3)
		end)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_11_0)
	arg_11_0.nday = arg_11_0.activity.data3

	arg_11_0:PlayStory()

	if arg_11_0.dayTF then
		setText(arg_11_0.dayTF, tostring(arg_11_0.nday))
	end

	arg_11_0.uilist:align(#arg_11_0.taskGroup[arg_11_0.nday])
end

function var_0_0.PlayStory(arg_12_0)
	local var_12_0 = arg_12_0.activity:getConfig("config_client").story

	if checkExist(var_12_0, {
		arg_12_0.nday
	}, {
		1
	}) then
		pg.NewStoryMgr.GetInstance():Play(var_12_0[arg_12_0.nday][1])
	end
end

function var_0_0.OnDestroy(arg_13_0)
	eachChild(arg_13_0.items, function(arg_14_0)
		Destroy(arg_14_0)
	end)
end

function var_0_0.GetProgressColor(arg_15_0)
	return nil
end

return var_0_0

local var_0_0 = class("WorldInPicturePage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.item = arg_1_0.bg:Find("items/item")
	arg_1_0.items = arg_1_0.bg:Find("items")
	arg_1_0.uilist = UIItemList.New(arg_1_0.items, arg_1_0.item)
	arg_1_0.help = arg_1_0._tf:Find("AD/help")
	arg_1_0.start = arg_1_0._tf:Find("AD/start")
	arg_1_0.dayTF = arg_1_0.bg:Find("Text")
	arg_1_0.tip = arg_1_0._tf:Find("AD/tip")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.help, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.worldinpicture_task_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.start, function()
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.WORLDINPICTURE)
	end, SFX_PANEL)

	arg_2_0.miniGameAct = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)
end

function var_0_0.UpdateTask(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1 + 1
	local var_5_1 = arg_5_2:Find("item")
	local var_5_2 = arg_5_0.taskGroup[arg_5_0.nday][var_5_0]
	local var_5_3 = arg_5_0.taskProxy:getTaskById(var_5_2) or arg_5_0.taskProxy:getFinishTaskById(var_5_2)

	assert(var_5_3, "without this task by id: " .. var_5_2)

	local var_5_4 = var_5_3:getConfig("award_display")[1]
	local var_5_5 = {
		type = var_5_4[1],
		id = var_5_4[2],
		count = var_5_4[3]
	}

	updateDrop(var_5_1, var_5_5)
	onButton(arg_5_0, var_5_1, function()
		arg_5_0:emit(BaseUI.ON_DROP, var_5_5)
	end, SFX_PANEL)

	local var_5_6 = var_5_3:getProgress()
	local var_5_7 = var_5_3:getConfig("target_num")

	setText(arg_5_2:Find("description"), var_5_3:getConfig("desc"))
	setSlider(arg_5_2:Find("progress"), 0, var_5_7, var_5_6)

	local var_5_8 = arg_5_2:Find("go_btn")
	local var_5_9 = arg_5_2:Find("get_btn")
	local var_5_10 = arg_5_2:Find("got_btn")
	local var_5_11 = var_5_3:getTaskStatus()

	setActive(var_5_8, var_5_11 == 0)
	setActive(var_5_9, var_5_11 == 1)
	setActive(var_5_10, var_5_11 == 2)
	onButton(arg_5_0, var_5_8, function()
		arg_5_0:emit(ActivityMediator.ON_TASK_GO, var_5_3)
	end, SFX_PANEL)
	onButton(arg_5_0, var_5_9, function()
		arg_5_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_5_3)
	end, SFX_PANEL)
	setText(arg_5_2:Find("progressText"), "<color=#789143>" .. var_5_6 .. "</color><color=#a3876f>/" .. var_5_7 .. "</color>")
end

function var_0_0.OnUpdateFlush(arg_9_0)
	var_0_0.super.OnUpdateFlush(arg_9_0)

	local var_9_0 = arg_9_0.miniGameAct
	local var_9_1 = var_9_0 and not var_9_0:isEnd() and var_9_0:readyToAchieve()

	setActive(arg_9_0.tip, var_9_1)
end

return var_0_0

local var_0_0 = class("TaiyuanAlterItemPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.UpdateTask(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = arg_1_1 + 1
	local var_1_1 = arg_1_2:Find("item")
	local var_1_2 = arg_1_0.taskGroup[arg_1_0.nday][var_1_0]
	local var_1_3 = arg_1_0.taskProxy:getTaskById(var_1_2) or arg_1_0.taskProxy:getFinishTaskById(var_1_2)

	assert(var_1_3, "without this task by id: " .. var_1_2)

	local var_1_4 = Drop.Create(var_1_3:getConfig("award_display")[1])

	updateDrop(var_1_1, var_1_4)
	onButton(arg_1_0, var_1_1, function()
		arg_1_0:emit(BaseUI.ON_DROP, var_1_4)
	end, SFX_PANEL)

	local var_1_5 = var_1_3:getProgress()
	local var_1_6 = var_1_3:getConfig("target_num")

	setText(arg_1_2:Find("description"), var_1_3:getConfig("desc"))

	local var_1_7, var_1_8 = arg_1_0:GetProgressColor()
	local var_1_9

	var_1_9 = var_1_7 and setColorStr(var_1_5, var_1_7) or var_1_5

	local var_1_10

	var_1_10 = var_1_8 and setColorStr("/" .. var_1_6, var_1_8) or "/" .. var_1_6

	setText(arg_1_2:Find("progressText"), "<color=#E95545>" .. var_1_9 .. "</color><color=#6D8189>" .. var_1_10 .. "</color>")
	setSlider(arg_1_2:Find("progress"), 0, var_1_6, var_1_5)

	local var_1_11 = arg_1_2:Find("go_btn")
	local var_1_12 = arg_1_2:Find("get_btn")
	local var_1_13 = arg_1_2:Find("got_btn")
	local var_1_14 = var_1_3:getTaskStatus()

	setActive(var_1_11, var_1_14 == 0)
	setActive(var_1_12, var_1_14 == 1)
	setActive(var_1_13, var_1_14 == 2)
	onButton(arg_1_0, var_1_11, function()
		arg_1_0:emit(ActivityMediator.ON_TASK_GO, var_1_3)
	end, SFX_PANEL)
	onButton(arg_1_0, var_1_12, function()
		arg_1_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_1_3)
	end, SFX_PANEL)
end

return var_0_0

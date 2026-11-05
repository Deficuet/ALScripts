local var_0_0 = class("DormTaskPage", import("...base.BaseActivityPage"))

function var_0_0.getResource(arg_1_0)
	return {
		"ui/activityuipage/dormtaskpage_atlas"
	}
end

function var_0_0.GetBgParams(arg_2_0)
	return arg_2_0.bg, "ui/activityuipage/dormtaskpage_atlas", "bg"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.bg = arg_3_0._tf:Find("AD")
	arg_3_0.slider = arg_3_0.bg:Find("slider"):GetComponent(typeof(Slider))
	arg_3_0.step = arg_3_0.bg:Find("step"):GetComponent(typeof(Text))
	arg_3_0.stepMax = arg_3_0.bg:Find("step_max"):GetComponent(typeof(Text))
	arg_3_0.progress = arg_3_0.bg:Find("progress"):GetComponent(typeof(Text))
	arg_3_0.desc = arg_3_0.bg:Find("desc"):GetComponent(typeof(Text))
	arg_3_0.awardTF = arg_3_0.bg:Find("award")
	arg_3_0.awardGot = arg_3_0.bg:Find("award_got")
	arg_3_0.battleBtn = arg_3_0.bg:Find("battle_btn")
	arg_3_0.getBtn = arg_3_0.bg:Find("get_btn")
	arg_3_0.gotBtn = arg_3_0.bg:Find("got_btn")
end

function var_0_0.OnDataSetting(arg_4_0)
	arg_4_0.nday = 0
	arg_4_0.taskProxy = getProxy(TaskProxy)
	arg_4_0.taskGroup = arg_4_0.activity:getConfig("config_client").unlock_task

	return updateActivityTaskStatus(arg_4_0.activity)
end

function var_0_0.OnFirstFlush(arg_5_0)
	onButton(arg_5_0, arg_5_0.battleBtn, function()
		arg_5_0:emit(ActivityMediator.ON_TASK_GO, arg_5_0.taskVO)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.getBtn, function()
		arg_5_0:emit(ActivityMediator.ON_TASK_SUBMIT, arg_5_0.taskVO)
	end, SFX_PANEL)
	setText(arg_5_0.stepMax, "/" .. #arg_5_0.taskGroup)
end

function var_0_0.OnUpdateFlush(arg_8_0)
	arg_8_0.taskIndex = arg_8_0:getTaskIdx(arg_8_0.activity)

	local var_8_0 = arg_8_0.taskGroup[arg_8_0.taskIndex][1]

	arg_8_0.taskVO = arg_8_0.taskProxy:getTaskById(var_8_0) or arg_8_0.taskProxy:getFinishTaskById(var_8_0)

	local var_8_1 = arg_8_0.taskVO:getConfig("award_display")[1]
	local var_8_2 = {
		type = var_8_1[1],
		id = var_8_1[2],
		count = var_8_1[3]
	}

	updateDrop(arg_8_0.awardTF, var_8_2)
	onButton(arg_8_0, arg_8_0.awardTF, function()
		arg_8_0:emit(BaseUI.ON_DROP, var_8_2)
	end, SFX_PANEL)

	if arg_8_0.step then
		setText(arg_8_0.step, "DAY" .. arg_8_0.taskIndex)
	end

	local var_8_3 = arg_8_0.taskVO:getProgress()
	local var_8_4 = arg_8_0.taskVO:getConfig("target_num")

	setText(arg_8_0.desc, arg_8_0.taskVO:getConfig("desc"))
	setText(arg_8_0.progress, var_8_3 .. "/" .. var_8_4)
	setSlider(arg_8_0.slider, 0, var_8_4, var_8_3)

	local var_8_5 = arg_8_0.taskVO:getTaskStatus()

	setActive(arg_8_0.battleBtn, var_8_5 == 0)
	setActive(arg_8_0.getBtn, var_8_5 == 1)
	setActive(arg_8_0.gotBtn, var_8_5 == 2)
	setActive(arg_8_0.awardGot, var_8_5 == 2)
end

function var_0_0.getTaskIdx(arg_10_0, arg_10_1)
	local var_10_0 = 1
	local var_10_1 = arg_10_1:getNDay()
	local var_10_2 = #arg_10_0.taskGroup
	local var_10_3 = math.min(var_10_1, var_10_2)
	local var_10_4 = true

	for iter_10_0 = 1, var_10_3 do
		if not var_10_4 then
			break
		end

		var_10_0 = iter_10_0

		if iter_10_0 < var_10_3 then
			for iter_10_1, iter_10_2 in ipairs(arg_10_0.taskGroup[iter_10_0]) do
				if not arg_10_0:isTaskFinished(iter_10_2) then
					var_10_4 = false

					break
				end
			end
		end
	end

	return math.min(var_10_0, var_10_2)
end

function var_0_0.isTaskFinished(arg_11_0, arg_11_1)
	if not arg_11_0.taskProxy then
		arg_11_0.taskProxy = getProxy(TaskProxy)
	end

	local var_11_0 = arg_11_0.taskProxy:getTaskById(arg_11_1) or arg_11_0.taskProxy:getFinishTaskById(arg_11_1)

	return var_11_0 and var_11_0:getTaskStatus() == 2
end

return var_0_0

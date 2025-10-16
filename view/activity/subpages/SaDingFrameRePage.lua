local var_0_0 = class("SaDingFrameRePage", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.battleBtn = arg_1_0.bg:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.bg:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("got_btn")
	arg_1_0.bar = GetComponent(arg_1_0._tf:Find("AD/switcher/phase2/barContent"), typeof(Slider))
	arg_1_0.cur = arg_1_0._tf:Find("AD/switcher/phase2/progress/step")
	arg_1_0.target = arg_1_0._tf:Find("AD/switcher/phase2/progress/all")
	arg_1_0.getTag = arg_1_0._tf:Find("AD/switcher/phase2/get")
	arg_1_0.gotTag = arg_1_0._tf:Find("AD/switcher/phase2/got")
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.avatarConfig = pg.activity_event_avatarframe[arg_2_0.activity:getConfig("config_id")]

	local var_2_0 = arg_2_0.avatarConfig.start_time

	if var_2_0 == "stop" then
		arg_2_0.timeStamp = nil
	else
		arg_2_0.timeStamp = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_2_0)
	end
end

function var_0_0.OnFirstFlush(arg_3_0)
	onButton(arg_3_0, arg_3_0.battleBtn, function()
		arg_3_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.getBtn, function()
		arg_3_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_3_0.activity.id
		})
	end, SFX_PANEL)

	arg_3_0.inPhase2 = arg_3_0.timeStamp and pg.TimeMgr.GetInstance():GetServerTime() - arg_3_0.timeStamp > 0
end

function var_0_0.OnUpdateFlush(arg_6_0)
	local var_6_0 = arg_6_0.activity.data1
	local var_6_1 = arg_6_0.avatarConfig.target

	var_6_0 = var_6_1 < var_6_0 and var_6_1 or var_6_0

	local var_6_2 = var_6_0 / var_6_1

	setText(arg_6_0.cur, var_6_2 >= 1 and setColorStr(var_6_0, COLOR_GREEN) or var_6_0)
	setText(arg_6_0.target, "/" .. var_6_1)
	setSlider(arg_6_0.bar, 0, var_6_1, var_6_0)

	local var_6_3 = var_6_1 <= var_6_0
	local var_6_4 = arg_6_0.activity.data2 >= 1

	setActive(arg_6_0.battleBtn, arg_6_0.inPhase2 and not var_6_3)
	setActive(arg_6_0.getBtn, arg_6_0.inPhase2 and not var_6_4 and var_6_3)
	setActive(arg_6_0.gotBtn, arg_6_0.inPhase2 and var_6_4)
	setActive(arg_6_0.getTag, arg_6_0.inPhase2 and not var_6_4 and var_6_3)
	setActive(arg_6_0.gotTag, arg_6_0.inPhase2 and var_6_4)
	setActive(arg_6_0._tf:Find("AD/switcher/phase2/progress"), not var_6_4)
end

return var_0_0

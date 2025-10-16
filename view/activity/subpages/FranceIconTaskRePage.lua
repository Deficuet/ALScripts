local var_0_0 = class("FranceIconTaskRePage", import("...base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.slider = arg_1_0.bg:Find("slider")
	arg_1_0.step = arg_1_0.bg:Find("step")
	arg_1_0.progress = arg_1_0.bg:Find("progress")
	arg_1_0.displayBtn = arg_1_0.bg:Find("display_btn")
	arg_1_0.awardTF = arg_1_0.bg:Find("award")
	arg_1_0.battleBtn = arg_1_0.bg:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.bg:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("got_btn")
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
	setActive(arg_2_0.displayBtn, false)
	setActive(arg_2_0.awardTF, false)
	onButton(arg_2_0, arg_2_0.battleBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity"
		})
	end, SFX_PANEL)

	arg_2_0.step = arg_2_0._tf:Find("AD/switcher/phase2/Image/step")
	arg_2_0.progress = arg_2_0._tf:Find("AD/switcher/phase2/Image/progress")
	arg_2_0.switchBtn = arg_2_0._tf:Find("AD/switcher/switch_btn")
	arg_2_0.bar = arg_2_0._tf:Find("AD/switcher/phase2/Image/barContent/bar")
	arg_2_0.phases = {
		arg_2_0._tf:Find("AD/switcher/phase1"),
		arg_2_0._tf:Find("AD/switcher/phase2")
	}
	arg_2_0.inPhase2 = false

	onToggle(arg_2_0, arg_2_0.switchBtn, function(arg_4_0)
		if arg_2_0.isSwitching then
			return
		end

		arg_2_0.inPhase2 = arg_4_0

		arg_2_0:Switch(arg_4_0)
	end, SFX_PANEL)

	local var_2_0 = pg.activity_event_avatarframe[arg_2_0.activity:getConfig("config_id")].start_time
	local var_2_1 = pg.TimeMgr.GetInstance():Table2ServerTime({
		year = var_2_0[1][1],
		month = var_2_0[1][2],
		day = var_2_0[1][3],
		hour = var_2_0[2][1],
		min = var_2_0[2][2],
		sec = var_2_0[2][3]
	})

	arg_2_0.inTime = pg.TimeMgr.GetInstance():GetServerTime() - var_2_1 > 0

	setActive(arg_2_0.battleBtn, isActive(arg_2_0.battleBtn) and arg_2_0.inTime)

	if arg_2_0.inTime then
		triggerToggle(arg_2_0.switchBtn, true)
	end
end

function var_0_0.Switch(arg_5_0, arg_5_1)
	arg_5_0.isSwitching = true

	local var_5_0 = GetOrAddComponent(arg_5_0.phases[1], typeof(CanvasGroup))
	local var_5_1 = arg_5_0.phases[1].localPosition
	local var_5_2 = arg_5_0.phases[2].localPosition

	arg_5_0.phases[2]:SetAsLastSibling()
	setActive(arg_5_0.phases[1]:Find("Image"), false)
	LeanTween.moveLocal(go(arg_5_0.phases[1]), var_5_2, 0.4):setOnComplete(System.Action(function()
		setActive(arg_5_0.phases[1]:Find("label"), true)
	end))
	LeanTween.value(go(arg_5_0.phases[1]), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_7_0)
		var_5_0.alpha = arg_7_0
	end))
	setActive(arg_5_0.phases[2]:Find("Image"), true)

	local var_5_3 = GetOrAddComponent(arg_5_0.phases[2], typeof(CanvasGroup))

	LeanTween.value(go(arg_5_0.phases[2]), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_8_0)
		var_5_3.alpha = arg_8_0
	end))
	setActive(arg_5_0.phases[2]:Find("label"), false)
	LeanTween.moveLocal(go(arg_5_0.phases[2]), var_5_1, 0.4):setOnComplete(System.Action(function()
		arg_5_0.isSwitching = nil
		arg_5_0.phases[1], arg_5_0.phases[2] = arg_5_0.phases[2], arg_5_0.phases[1]
	end))
	arg_5_0:UpdateAwardGot()
	onButton(arg_5_0, arg_5_0.getBtn, function()
		arg_5_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_5_0.activity.id
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateAwardGot(arg_11_0)
	local var_11_0 = arg_11_0.activity.data2 >= 1
	local var_11_1 = arg_11_0._tf:Find("AD/switcher/phase2/got")

	setActive(var_11_1, var_11_0)
end

function var_0_0.OnUpdateFlush(arg_12_0)
	local var_12_0 = arg_12_0.activity

	setActive(arg_12_0.battleBtn, isActive(arg_12_0.battleBtn) and arg_12_0.inTime)
	arg_12_0:UpdateAwardGot()

	local var_12_1 = arg_12_0.activity.data1
	local var_12_2 = pg.activity_event_avatarframe[arg_12_0.activity:getConfig("config_id")].target

	if var_12_2 < var_12_1 then
		var_12_1 = var_12_2
	end

	local var_12_3 = var_12_1 / var_12_2

	setText(arg_12_0.step, var_12_3 >= 1 and setColorStr(var_12_1, "#487CFFFF") or var_12_1)
	setText(arg_12_0.progress, "/" .. var_12_2)
	setFillAmount(arg_12_0.bar, var_12_1 / var_12_2)

	local var_12_4 = var_12_2 <= var_12_1
	local var_12_5 = arg_12_0.activity.data2 >= 1

	setActive(arg_12_0.battleBtn, not var_12_5 and not var_12_4 and arg_12_0.inTime)
	setActive(arg_12_0.getBtn, var_12_4 and not var_12_5)
	setActive(arg_12_0.gotBtn, var_12_5)
end

return var_0_0

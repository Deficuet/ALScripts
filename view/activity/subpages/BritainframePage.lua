local var_0_0 = class("BritainframePage", import(".TemplatePage.PtTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	var_0_0.super.OnFirstFlush(arg_1_0)
	setActive(arg_1_0.displayBtn, false)
	setActive(arg_1_0.awardTF, false)
	onButton(arg_1_0, arg_1_0.battleBtn, function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
			page = "activity"
		})
	end, SFX_PANEL)

	arg_1_0.step = arg_1_0._tf:Find("AD/switcher/phase2/background/step")
	arg_1_0.progress = arg_1_0._tf:Find("AD/switcher/phase2/background/progress")
	arg_1_0.switchBtn = arg_1_0._tf:Find("AD/switcher/switch_btn")
	arg_1_0.bar = arg_1_0._tf:Find("AD/switcher/phase2/background/barContent/bar")
	arg_1_0.phases = {
		arg_1_0._tf:Find("AD/switcher/phase1"),
		arg_1_0._tf:Find("AD/switcher/phase2")
	}
	arg_1_0.inPhase2 = false

	onToggle(arg_1_0, arg_1_0.switchBtn, function(arg_3_0)
		if arg_1_0.isSwitching then
			return
		end

		arg_1_0.inPhase2 = arg_3_0

		arg_1_0:Switch(arg_3_0)
	end, SFX_PANEL)

	local var_1_0 = arg_1_0.activity:getConfig("config_client")

	if pg.TimeMgr.GetInstance():inTime(var_1_0) then
		triggerToggle(arg_1_0.switchBtn, true)
	end
end

function var_0_0.Switch(arg_4_0, arg_4_1)
	arg_4_0.isSwitching = true

	local var_4_0 = GetOrAddComponent(arg_4_0.phases[1], typeof(CanvasGroup))
	local var_4_1 = arg_4_0.phases[1].localPosition
	local var_4_2 = arg_4_0.phases[2].localPosition

	arg_4_0.phases[2]:SetAsLastSibling()
	setActive(arg_4_0.phases[1]:Find("background"), false)
	LeanTween.moveLocal(go(arg_4_0.phases[1]), var_4_2, 0.4)
	LeanTween.value(go(arg_4_0.phases[1]), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_5_0)
		var_4_0.alpha = arg_5_0
	end))
	setActive(arg_4_0.phases[2]:Find("background"), true)

	local var_4_3 = GetOrAddComponent(arg_4_0.phases[2], typeof(CanvasGroup))

	LeanTween.value(go(arg_4_0.phases[2]), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_6_0)
		var_4_3.alpha = arg_6_0
	end))
	LeanTween.moveLocal(go(arg_4_0.phases[2]), var_4_1, 0.4):setOnComplete(System.Action(function()
		arg_4_0.isSwitching = nil
		arg_4_0.phases[1], arg_4_0.phases[2] = arg_4_0.phases[2], arg_4_0.phases[1]
	end))
	arg_4_0:UpdateAwardGot()
end

function var_0_0.UpdateAwardGot(arg_8_0)
	local var_8_0 = arg_8_0.bg:Find("switcher/phase2/background/got")
	local var_8_1 = not arg_8_0.ptData:CanGetNextAward() and arg_8_0.inPhase2

	setActive(var_8_0, var_8_1)

	local var_8_2 = arg_8_0.bg:Find("switcher/phase2/background")

	setActive(var_8_2:Find("progress"), not var_8_1)
	setActive(var_8_2:Find("step"), not var_8_1)
end

function var_0_0.OnUpdateFlush(arg_9_0)
	var_0_0.super.OnUpdateFlush(arg_9_0)

	local var_9_0 = arg_9_0.activity:getConfig("config_client")
	local var_9_1 = pg.TimeMgr.GetInstance():inTime(var_9_0)

	setActive(arg_9_0.battleBtn, isActive(arg_9_0.battleBtn) and var_9_1)
	arg_9_0:UpdateAwardGot()

	local var_9_2, var_9_3, var_9_4 = arg_9_0.ptData:GetResProgress()

	setText(arg_9_0.step, var_9_4 >= 1 and setColorStr(var_9_2, "#487CFFFF") or var_9_2)
	setText(arg_9_0.progress, "/" .. var_9_3)
	setFillAmount(arg_9_0.bar, var_9_2 / var_9_3)
end

return var_0_0

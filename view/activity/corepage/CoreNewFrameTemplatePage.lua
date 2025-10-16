local var_0_0 = class("CoreNewFrameTemplatePage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0._tf:Find("AD")
	arg_1_0.battleBtn = arg_1_0.bg:Find("battle_btn")
	arg_1_0.getBtn = arg_1_0.bg:Find("get_btn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("got_btn")
	arg_1_0.switchBtn = arg_1_0._tf:Find("AD/switch_btn")
	arg_1_0.phases = {
		arg_1_0._tf:Find("AD/switcher/phase1"),
		arg_1_0._tf:Find("AD/switcher/phase2")
	}
	arg_1_0.bar = arg_1_0._tf:Find("AD/switcher/phase2/Image/barContent/bar")
	arg_1_0.cur = arg_1_0._tf:Find("AD/switcher/phase2/Image/step")
	arg_1_0.target = arg_1_0._tf:Find("AD/switcher/phase2/Image/progress")
	arg_1_0.gotTag = arg_1_0._tf:Find("AD/switcher/phase2/Image/got")
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
	onToggle(arg_3_0, arg_3_0.switchBtn, function(arg_6_0)
		if arg_3_0.isSwitching then
			return
		end

		arg_3_0:Switch(arg_6_0)
	end, SFX_PANEL)

	arg_3_0.inPhase2 = arg_3_0.timeStamp and pg.TimeMgr.GetInstance():GetServerTime() - arg_3_0.timeStamp > 0

	triggerToggle(arg_3_0.switchBtn, arg_3_0.inPhase2)

	if not IsNil(arg_3_0.gotTag:Find("Text")) then
		setText(arg_3_0.gotTag:Find("Text"), i18n("avatarframe_got"))
	end
end

function var_0_0.OnUpdateFlush(arg_7_0)
	local var_7_0 = arg_7_0.activity.data1
	local var_7_1 = arg_7_0.avatarConfig.target

	var_7_0 = var_7_1 < var_7_0 and var_7_1 or var_7_0

	local var_7_2 = var_7_0 / var_7_1

	setText(arg_7_0.cur, var_7_2 >= 1 and var_7_0 or var_7_0)
	setText(arg_7_0.target, "/" .. var_7_1)
	setFillAmount(arg_7_0.bar, var_7_2)

	local var_7_3 = var_7_1 <= var_7_0
	local var_7_4 = arg_7_0.activity.data2 >= 1

	setActive(arg_7_0.battleBtn, arg_7_0.inPhase2 and not var_7_3)
	setActive(arg_7_0.getBtn, arg_7_0.inPhase2 and not var_7_4 and var_7_3)
	setActive(arg_7_0.gotBtn, arg_7_0.inPhase2 and var_7_4)
	setActive(arg_7_0.gotTag, arg_7_0.inPhase2 and var_7_4)
	setActive(arg_7_0.cur, not var_7_4)
	setActive(arg_7_0.target, not var_7_4)
end

function var_0_0.Switch(arg_8_0, arg_8_1)
	arg_8_0.isSwitching = true

	setToggleEnabled(arg_8_0.switchBtn, false)

	local var_8_0
	local var_8_1

	if arg_8_1 then
		var_8_0, var_8_1 = arg_8_0.phases[1], arg_8_0.phases[2]
	else
		var_8_0, var_8_1 = arg_8_0.phases[2], arg_8_0.phases[1]
	end

	local var_8_2 = GetOrAddComponent(var_8_0, typeof(CanvasGroup))
	local var_8_3 = var_8_0.localPosition
	local var_8_4 = var_8_1.localPosition

	var_8_1:SetAsLastSibling()
	setActive(var_8_0:Find("Image"), false)
	LeanTween.moveLocal(go(var_8_0), var_8_4, 0.4):setOnComplete(System.Action(function()
		setActive(var_8_0:Find("label"), true)
	end))
	LeanTween.value(go(var_8_0), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_10_0)
		var_8_2.alpha = arg_10_0
	end))
	setActive(var_8_1:Find("Image"), true)

	local var_8_5 = GetOrAddComponent(var_8_1, typeof(CanvasGroup))

	LeanTween.value(go(var_8_1), 0, 1, 0.4):setOnUpdate(System.Action_float(function(arg_11_0)
		var_8_5.alpha = arg_11_0
	end))
	setActive(var_8_1:Find("label"), false)
	LeanTween.moveLocal(go(var_8_1), var_8_3, 0.4):setOnComplete(System.Action(function()
		arg_8_0.isSwitching = nil

		setToggleEnabled(arg_8_0.switchBtn, true)
	end))
end

return var_0_0

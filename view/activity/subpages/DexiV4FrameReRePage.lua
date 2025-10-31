local var_0_0 = class("DexiV4FrameReRePage", import(".TemplatePage.NewFrameTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.super.OnInit(arg_1_0)

	arg_1_0.redDot = arg_1_0._tf:Find("AD/switcher/phase2/Image/red")
end

function var_0_0.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.battleBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.getBtn, function()
		arg_2_0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = arg_2_0.activity.id
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_5_0)
	local var_5_0 = arg_5_0.activity.data1
	local var_5_1 = arg_5_0.avatarConfig.target

	var_5_0 = var_5_1 < var_5_0 and var_5_1 or var_5_0

	local var_5_2 = var_5_0 / var_5_1

	setText(arg_5_0.cur, var_5_2 >= 1 and setColorStr(var_5_0, COLOR_GREEN) or var_5_0)
	setText(arg_5_0.target, "/" .. var_5_1)
	setFillAmount(arg_5_0.bar, var_5_2)

	local var_5_3 = var_5_1 <= var_5_0
	local var_5_4 = arg_5_0.activity.data2 >= 1

	setActive(arg_5_0.battleBtn, not var_5_3)
	setActive(arg_5_0.getBtn, not var_5_4 and var_5_3)
	setActive(arg_5_0.gotBtn, var_5_4)
	setActive(arg_5_0.gotTag, var_5_4)
	setActive(arg_5_0.redDot, arg_5_0.activity:readyToAchieve())
end

return var_0_0

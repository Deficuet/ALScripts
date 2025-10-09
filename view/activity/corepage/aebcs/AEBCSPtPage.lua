local var_0_0 = class("AEBCSPtPage", import("view.activity.CorePage.CorePtTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.bg = arg_1_0:findTF("AD/task_bg")
	arg_1_0.progress = arg_1_0:findTF("progress", arg_1_0.bg)
	arg_1_0.progres = arg_1_0:findTF("progres", arg_1_0.bg)
	arg_1_0.slider = arg_1_0:findTF("slider", arg_1_0.bg)
	arg_1_0.step = arg_1_0:findTF("step", arg_1_0.bg)
	arg_1_0.displayBtn = arg_1_0:findTF("display_btn", arg_1_0.bg)
	arg_1_0.awardTF = arg_1_0:findTF("award", arg_1_0.bg)
	arg_1_0.getBtn = arg_1_0:findTF("get_btn", arg_1_0.bg)
	arg_1_0.gotBtn = arg_1_0:findTF("got_btn", arg_1_0.bg)
	arg_1_0.battleBtn = arg_1_0:findTF("battle_btn", arg_1_0.bg)

	setText(arg_1_0:findTF("Text", arg_1_0.displayBtn), i18n("other_world_temple_award"))
	setText(arg_1_0:findTF("Text", arg_1_0.bg), i18n("Outpost_20250904_Progress"))
end

function var_0_0.OnFirstFlush(arg_2_0)
	arg_2_0.super.OnFirstFlush(arg_2_0)
	onButton(arg_2_0, arg_2_0.battleBtn, function()
		arg_2_0:emit(ActivityMediator.SPECIAL_BATTLE_OPERA)
	end, SFX_PANEL)
end

function var_0_0.OnUpdateFlush(arg_4_0)
	var_0_0.super.OnUpdateFlush(arg_4_0)

	local var_4_0, var_4_1, var_4_2 = arg_4_0.ptData:GetResProgress()

	setText(arg_4_0.progress, "/" .. var_4_1)
	setText(arg_4_0.progres, var_4_2 >= 1 and setColorStr(var_4_0, "#6ef0ff") or var_4_0)
end

return var_0_0

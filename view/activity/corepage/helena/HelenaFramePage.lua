local var_0_0 = class("HelenaFramePage", import("view.activity.CorePage.CoreNewFrameTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.super.OnInit(arg_1_0)

	arg_1_0.battleBtn = arg_1_0.bg:Find("switcher/phase2/task_bg_2/battle_btn")
	arg_1_0.getBtn = arg_1_0.bg:Find("switcher/phase2/task_bg_2/get_btn")
	arg_1_0.gotBtn = arg_1_0.bg:Find("switcher/phase2/task_bg_2/got_btn")
	arg_1_0.switchBtn = arg_1_0._tf:Find("AD/switcher/switch_btn")
	arg_1_0.gotTag = arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/Image/got")
	arg_1_0.bar = arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/Image/barContent/bar")
	arg_1_0.cur = arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/Image/step")
	arg_1_0.target = arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/Image/progress")

	setText(arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/battle_btn/Text"), i18n("other_world_task_go"))
	setText(arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/get_btn/Text"), i18n("other_world_task_get"))
	setText(arg_1_0._tf:Find("AD/switcher/phase2/task_bg_2/got_btn/Text"), i18n("other_world_task_got"))
end

function var_0_0.OnFirstFlush(arg_2_0)
	var_0_0.super.OnFirstFlush(arg_2_0)
end

function var_0_0.OnUpdateFlush(arg_3_0)
	var_0_0.super.OnUpdateFlush(arg_3_0)

	local var_3_0 = arg_3_0.activity.data1
	local var_3_1 = arg_3_0.avatarConfig.target

	var_3_0 = var_3_1 < var_3_0 and var_3_1 or var_3_0

	local var_3_2 = var_3_0 / var_3_1

	setText(arg_3_0.cur, (var_3_2 >= 1 and setColorStr(var_3_0, "#FCE87A") or setColorStr(var_3_0, "#FCE87A")) .. setColorStr("/" .. var_3_1, "#FFFFFF"))
	setActive(arg_3_0.target, false)
end

function var_0_0.Switch(arg_4_0, arg_4_1)
	arg_4_0.isSwitching = true

	setToggleEnabled(arg_4_0.switchBtn, false)

	if arg_4_1 then
		quickPlayAnimation(arg_4_0.bg:Find("switcher"), "anim_HelenaFramePage_switcher")
	else
		quickPlayAnimation(arg_4_0.bg:Find("switcher"), "anim_HelenaFramePage_switcher2")
	end

	arg_4_0.isSwitching = nil

	setToggleEnabled(arg_4_0.switchBtn, true)
end

return var_0_0

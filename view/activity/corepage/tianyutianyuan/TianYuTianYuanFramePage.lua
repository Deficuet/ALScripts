local var_0_0 = class("TianYuTianYuanFramePage", import("view.activity.CorePage.CoreNewFrameTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.super.OnInit(arg_1_0)

	arg_1_0.switchBtn = arg_1_0:findTF("AD/switcher/switch_btn")
end

function var_0_0.OnFirstFlush(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.phases) do
		setActive(iter_2_1, true)

		GetOrAddComponent(iter_2_1, typeof(CanvasGroup)).alpha = 0
	end

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

	local var_4_0
	local var_4_1

	if arg_4_1 then
		var_4_0, var_4_1 = arg_4_0.phases[1], arg_4_0.phases[2]
	else
		var_4_0, var_4_1 = arg_4_0.phases[2], arg_4_0.phases[1]
	end

	local var_4_2 = var_4_0.localPosition
	local var_4_3 = var_4_1.localPosition

	var_4_1:SetAsLastSibling()
	setCanvasGroupAlpha(GetOrAddComponent(var_4_0, typeof(CanvasGroup)), 0)
	setCanvasGroupAlpha(GetOrAddComponent(var_4_1, typeof(CanvasGroup)), 1)

	arg_4_0.isSwitching = nil

	setToggleEnabled(arg_4_0.switchBtn, true)
end

return var_0_0

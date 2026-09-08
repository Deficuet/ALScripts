local var_0_0 = class("ReversePacmanTechnologyRoleSkillToggle", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	setText(arg_2_0.uiNameText, i18n("reverse_pacman_support"))
end

function var_0_0.didEnter(arg_3_0)
	return
end

function var_0_0.OnSelected(arg_4_0, arg_4_1)
	setActive(arg_4_0.uiSelectedGo, arg_4_1)
	setActive(arg_4_0.uiUnselectedGo, not arg_4_1)

	local var_4_0 = arg_4_1 and Color.NewHex("#61bac7") or Color.NewHex("#313131")

	setTextColor(arg_4_0.uiNameText, var_4_0)
	setImageColor(arg_4_0.uiIconImage, var_4_0)
end

function var_0_0.RefreshTip(arg_5_0)
	local var_5_0 = ReversePacmanTools.GetActivity()

	setActive(arg_5_0.uiTipGo, var_5_0:GetRoleSkillTip())
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:detach()
end

return var_0_0

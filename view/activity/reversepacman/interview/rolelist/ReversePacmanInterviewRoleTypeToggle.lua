local var_0_0 = class("ReversePacmanInterviewRoleTypeToggle", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2
	arg_1_0.roleType = arg_1_3

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	if arg_2_0.roleType == ReversePacmanHomeConst.ROLE_TYPE.ALL then
		setText(arg_2_0.uiNameText, i18n("reverse_pacman_ship_type_0"))
	elseif arg_2_0.roleType == ReversePacmanHomeConst.ROLE_TYPE.CHASER then
		setText(arg_2_0.uiNameText, i18n("reverse_pacman_ship_type_1"))
	elseif arg_2_0.roleType == ReversePacmanHomeConst.ROLE_TYPE.AMBUSHER then
		setText(arg_2_0.uiNameText, i18n("reverse_pacman_ship_type_2"))
	elseif arg_2_0.roleType == ReversePacmanHomeConst.ROLE_TYPE.PLANNER then
		setText(arg_2_0.uiNameText, i18n("reverse_pacman_ship_type_3"))
	end

	onToggle(arg_2_0, arg_2_0.uiToggle, function(arg_3_0)
		if arg_3_0 then
			arg_2_0:emit(ReversePacmanInterviewRoleList.ON_CLICK_TOGGLE, arg_2_0.roleType)
		end
	end)
end

function var_0_0.didEnter(arg_4_0)
	return
end

function var_0_0.OnTriggerToggle(arg_5_0)
	triggerToggle(arg_5_0.uiToggle, true)
end

function var_0_0.willExit(arg_6_0)
	arg_6_0:detach()
end

return var_0_0

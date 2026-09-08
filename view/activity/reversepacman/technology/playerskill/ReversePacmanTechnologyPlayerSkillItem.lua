local var_0_0 = class("ReversePacmanTechnologyPlayerSkillItem", import("view.activity.ReversePacman.technology.roleSkill.ReversePacmanTechnologyRoleSkillItem"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)
	setText(arg_1_0.uiBuyText, i18n("reverse_pacman_level_upgrade"))
	setText(arg_1_0.uiBuyText2, i18n("reverse_pacman_level_upgrade"))
	setText(arg_1_0.uiSoldOutText, i18n("reverse_pacman_sold_out"))
end

return var_0_0

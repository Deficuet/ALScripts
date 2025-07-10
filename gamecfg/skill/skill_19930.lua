return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 19930,
	aniEffect = "",
	desc = "前两次空袭追加效果",
	effect_list = {
		{
			type = "BattleSkillHeal",
			casterAniEffect = "",
			target_choise = "TargetHelpLeastHPRatio",
			targetAniEffect = "",
			arg_list = {
				maxHPRatio = 0.03
			}
		},
		{
			type = "BattleSkillHeal",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				maxHPRatio = 0.03
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetAllHelp",
			targetAniEffect = "",
			arg_list = {
				buff_id = 19933
			}
		}
	}
}

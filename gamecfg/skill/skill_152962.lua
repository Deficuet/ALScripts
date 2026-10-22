return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 152962,
	picture = "0",
	desc = "本舰被击破时，跳转到无敌",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 152963
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp",
				"TargetNationality"
			},
			arg_list = {
				exceptCaster = true,
				buff_id = 152967,
				nationality = 96
			}
		}
	}
}

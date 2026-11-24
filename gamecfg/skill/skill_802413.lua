return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 802413,
	picture = "0",
	castCV = "skill",
	desc = "",
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp",
				"TargetNationality",
				"TargetHelpLeastHPRatio"
			},
			arg_list = {
				buff_id = 802415,
				nationality = {
					8,
					9
				}
			}
		}
	}
}

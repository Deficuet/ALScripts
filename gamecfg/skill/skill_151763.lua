return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 151763,
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
				"TargetNationality"
			},
			arg_list = {
				buff_id = 151764,
				nationality = 96
			}
		}
	}
}

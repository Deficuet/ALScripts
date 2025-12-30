return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 151881,
	picture = "0",
	castCV = "",
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
			target_choise = {
				"TargetPlayerMainFleet",
				"TargetHelpLeastHPRatio"
			},
			arg_list = {
				buff_id = 151882
			}
		}
	}
}

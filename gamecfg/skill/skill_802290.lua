return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 802290,
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
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 802292
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp"
			},
			arg_list = {
				buff_id = 802293
			}
		}
	}
}

return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 152140,
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
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllFoe"
			},
			arg_list = {
				buff_id = 152143
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetHarmRandom"
			},
			arg_list = {
				buff_id = 152142
			}
		}
	}
}

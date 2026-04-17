return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 106530,
	picture = "0",
	castCV = "skill",
	desc = "给2个前排上随机buff",
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
				"TargetPlayerVanguardFleet",
				"TargetRandom"
			},
			arg_list = {
				buff_id = 106531,
				delay = 1,
				randomCount = 2
			}
		}
	}
}

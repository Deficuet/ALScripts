return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 190001,
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
				"TargetPlayerMainFleet",
				"TargetRandom",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 190002,
				randomCount = 1,
				ship_type_list = {
					4,
					5
				}
			}
		}
	}
}

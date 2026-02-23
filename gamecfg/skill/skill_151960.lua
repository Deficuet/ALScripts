return {
	uiEffect = "",
	name = "护盾",
	cd = 0,
	painting = 1,
	id = 151960,
	picture = "0",
	castCV = "skill",
	desc = "给重樱驱逐护盾",
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
				"TargetShipType"
			},
			arg_list = {
				buff_id = 151961,
				ship_type_list = {
					1,
					20,
					21
				},
				nationality = {
					3
				}
			}
		}
	}
}

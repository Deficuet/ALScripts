return {
	uiEffect = "",
	name = "I404",
	cd = 0,
	painting = 1,
	id = 151580,
	picture = "0",
	castCV = "skill",
	desc = "I404",
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
				"TargetShipType",
				"TargetNationality"
			},
			arg_list = {
				buff_id = 151581,
				nationality = 3,
				ship_type_list = {
					8,
					17
				}
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 151582,
				ship_type_list = {
					8,
					17
				}
			}
		}
	}
}

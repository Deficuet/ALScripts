return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 112012,
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
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 112013
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetSelf",
				"TargetShipTag"
			},
			arg_list = {
				buff_id = 112014,
				ship_tag_list = {
					"BRS_burst"
				}
			}
		}
	}
}

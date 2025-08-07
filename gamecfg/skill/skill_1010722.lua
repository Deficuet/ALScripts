return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 1010722,
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
				"TargetShipTag"
			},
			arg_list = {
				buff_id = 1010723,
				ship_tag_list = {
					"Hipper Sister"
				}
			}
		}
	}
}

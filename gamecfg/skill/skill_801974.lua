return {
	uiEffect = "",
	name = "",
	cd = 0,
	castCV = "skill",
	id = 801974,
	picture = "0",
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
				buff_id = 801972,
				ship_tag_list = {
					"Yorktown"
				}
			}
		}
	}
}

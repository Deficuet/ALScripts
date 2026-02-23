return {
	uiEffect = "",
	name = "Nasty Asty +",
	cd = 0,
	painting = 1,
	id = 1011470,
	picture = "0",
	castCV = "skill",
	desc = "Nasty Asty +",
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
				buff_id = 1011471,
				ship_tag_list = {
					"Astoria-Class"
				}
			}
		}
	}
}

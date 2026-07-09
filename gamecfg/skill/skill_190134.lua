return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 190134,
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
				"TargetAllHarm",
				"TargetShipTag"
			},
			arg_list = {
				buff_id = 190139,
				ship_tag_list = {
					"gaoliangjs"
				}
			}
		}
	}
}

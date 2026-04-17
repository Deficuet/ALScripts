return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 106385,
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
				"TargetShipTag",
				"TargetRandom"
			},
			arg_list = {
				buff_id = 106386,
				randomCount = 1,
				ship_tag_list = {
					"Shizuku_20Low"
				}
			}
		}
	}
}

return {
	uiEffect = "",
	name = "五航战",
	cd = 0,
	painting = 1,
	id = 1010790,
	picture = "0",
	castCV = "skill",
	desc = "五航战",
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
				buff_id = 1010792
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp",
				"TargetShipTag"
			},
			arg_list = {
				buff_id = 1010792,
				ship_tag_list = {
					"Zuikaku"
				}
			}
		}
	}
}

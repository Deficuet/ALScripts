return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 1013882,
	picture = "0",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHarm",
				"TargetAttrCompare"
			},
			arg_list = {
				buff_id = 1013888,
				attrCompare = "velocity<=0"
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHarm",
				"TargetShipTag"
			},
			arg_list = {
				buff_id = 1013888,
				ship_tag_list = {
					"stuned"
				}
			}
		}
	}
}

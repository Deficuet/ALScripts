return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 902361,
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
				buff_id = 902362,
				attrCompare = "velocity<velocity"
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
				buff_id = 902362,
				ship_tag_list = {
					"stuned"
				}
			}
		}
	}
}

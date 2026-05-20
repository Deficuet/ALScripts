return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 802210,
	picture = "0",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 802214
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
				buff_id = 802221,
				ship_tag_list = {
					"ElbeMETA"
				}
			}
		}
	}
}

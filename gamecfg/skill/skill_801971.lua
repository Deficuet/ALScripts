return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 801971,
	picture = "0",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHarm",
				"TargetShipTag",
				"TargetRandom"
			},
			arg_list = {
				buff_id = 801977,
				randomCount = 1,
				ship_tag_list = {
					"YorktownMtarget"
				}
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 801971
			}
		}
	}
}

return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 60970,
	picture = "0",
	aniEffect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillHeal",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				maxHPRatio = 0.01
			}
		},
		{
			type = "BattleSkillHeal",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetAllHelp",
				"TargetShipTag"
			},
			arg_list = {
				maxHPRatio = 0.01,
				ship_tag_list = {
					"DAL"
				}
			}
		}
	}
}

return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 152500,
	picture = "0",
	castCV = "",
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
				"TargetAttrCompare"
			},
			arg_list = {
				attrCompare = "antiAirPower<antiAirPower",
				buff_id = 152502,
				exceptCaster = true
			}
		}
	}
}

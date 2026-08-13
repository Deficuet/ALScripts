return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 18989,
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
				buff_id = 19999,
				attrCompare = "velocity<velocity"
			}
		}
	}
}

return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 19960,
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
				buff_id = 19962,
				attrCompare = "velocity<velocity"
			}
		}
	}
}

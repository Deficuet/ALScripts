return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 151990,
	picture = "0",
	castCV = "skill",
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
				"TargetAllHarm",
				"TargetLowestHP"
			},
			arg_list = {
				buff_id = 151991
			}
		}
	}
}

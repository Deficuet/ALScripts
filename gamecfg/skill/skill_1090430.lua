return {
	uiEffect = "",
	name = "吸引火力·妙高",
	cd = 0,
	painting = 1,
	id = 1090430,
	picture = "0",
	castCV = "skill",
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
				buff_id = 1090432
			}
		}
	}
}

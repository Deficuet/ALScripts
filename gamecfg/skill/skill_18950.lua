return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 18950,
	picture = "0",
	castCV = "skill",
	desc = "燃油烟雾触发器",
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
				buff_id = 18951
			}
		}
	}
}

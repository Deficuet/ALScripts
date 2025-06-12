return {
	uiEffect = "",
	name = "LuckyLou +",
	cd = 0,
	painting = 1,
	id = 1010882,
	picture = "0",
	castCV = "skill",
	desc = "雷达标记",
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
				buff_id = 1010882
			}
		}
	}
}

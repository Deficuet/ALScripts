return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 117061,
	picture = "0",
	castCV = "skill",
	desc = "buff",
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
				buff_id = 117064
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 117062,
				quota = 1
			}
		}
	}
}

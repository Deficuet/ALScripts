return {
	uiEffect = "",
	name = "紧急回避",
	cd = 0,
	painting = 1,
	id = 801714,
	picture = "0",
	castCV = "skill",
	desc = "紧急回避",
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
				buff_id = 801715
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 801716
			}
		}
	}
}

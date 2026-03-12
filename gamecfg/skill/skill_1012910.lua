return {
	uiEffect = "",
	name = "六驱精锐·{namecode:12} +",
	cd = 0,
	painting = 1,
	id = 1012910,
	picture = "0",
	castCV = "skill",
	desc = "六驱精锐·{namecode:12} +",
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
				buff_id = 1012911
			}
		}
	}
}

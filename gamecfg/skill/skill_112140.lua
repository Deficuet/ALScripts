return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 112140,
	picture = "0",
	castCV = "skill_2",
	desc = "优米雅必杀识甲",
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
			target_choise = "TargetHarmRandom",
			targetAniEffect = "",
			arg_list = {
				buff_id = 112149
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 112145
			}
		}
	}
}

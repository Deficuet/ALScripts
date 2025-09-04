return {
	uiEffect = "",
	name = "祥瑞御免",
	cd = 0,
	painting = 1,
	id = 1011240,
	picture = "0",
	castCV = "skill",
	desc = "祥瑞御免",
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
				buff_id = 1011241
			}
		}
	}
}

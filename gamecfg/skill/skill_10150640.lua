return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 10150640,
	picture = "0",
	castCV = "skill",
	desc = "减伤",
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
				"TargetSelf"
			},
			arg_list = {
				buff_id = 10150641
			}
		}
	}
}

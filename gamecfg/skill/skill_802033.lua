return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 802033,
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
			target_choise = "TargetSelf",
			type = "BattleSkillEditTag",
			arg_list = {
				tag = "kelifulanjianshang"
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetPlayerMainFleet"
			},
			arg_list = {
				buff_id = 802035
			}
		}
	}
}

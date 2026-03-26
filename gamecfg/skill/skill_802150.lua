return {
	uiEffect = "",
	name = "科隆M降低机动",
	cd = 0,
	painting = 1,
	id = 802150,
	picture = "0",
	castCV = "skill",
	desc = "科隆M降低机动",
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
			target_choise = "TargetAllHarm",
			targetAniEffect = "",
			arg_list = {
				buff_id = 802152
			}
		}
	}
}

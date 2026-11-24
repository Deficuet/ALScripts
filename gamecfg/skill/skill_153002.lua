return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 153002,
	picture = "0",
	castCV = "skill",
	desc = "最强之盾",
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
			target_choise = "TargetPlayerVanguardFleet",
			targetAniEffect = "",
			arg_list = {
				buff_id = 153005
			}
		}
	}
}

return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 1,
	id = 112152,
	desc = "道具让技能时间减少",
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
				buff_id = 112151
			}
		}
	}
}

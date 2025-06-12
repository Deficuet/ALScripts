return {
	uiEffect = "",
	name = "LuckyLou +",
	cd = 0,
	painting = 1,
	id = 1010883,
	picture = "0",
	castCV = "skill",
	desc = "指示减伤",
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
				buff_id = 1010885
			}
		}
	}
}

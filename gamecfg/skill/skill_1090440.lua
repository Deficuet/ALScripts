return {
	uiEffect = "",
	name = "穿甲弹精通",
	cd = 0,
	painting = 1,
	id = 1090440,
	picture = "0",
	castCV = "skill",
	desc = "提高穿甲弹伤害",
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
				buff_id = 1090441
			}
		}
	}
}

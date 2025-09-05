return {
	uiEffect = "",
	name = "骑士之盾 +",
	cd = 0,
	painting = 1,
	id = 1005071,
	picture = "0",
	castCV = "skill",
	desc = "骑士之盾 +",
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
			target_choise = "TargetAllHelp",
			targetAniEffect = "",
			arg_list = {
				buff_id = 1005072
			}
		}
	}
}

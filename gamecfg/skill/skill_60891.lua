return {
	uiEffect = "神药球-普通",
	name = "",
	cd = 0,
	painting = 1,
	id = 60891,
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
			type = "BattleSkillHeal",
			casterAniEffect = "",
			target_choise = "TargetPlayerVanguardFleet",
			targetAniEffect = "",
			arg_list = {
				maxHPRatio = 0.01
			}
		}
	}
}

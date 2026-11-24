return {
	init_effect = "",
	name = "潜艇编队：先锋仅1艘时受到伤害降低",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	id = 40634,
	icon = 40630,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				maxTargetNumber = 1,
				skill_id = 40630,
				check_target = {
					"TargetPlayerVanguardFleet"
				}
			}
		}
	}
}

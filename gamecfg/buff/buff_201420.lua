return {
	time = 0,
	name = "2025信标BOSS 江风meta 触发技能弹条",
	init_effect = "",
	stack = 1,
	id = 201420,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFire"
			},
			arg_list = {
				rant = 10000,
				target = "TargetSelf",
				skill_id = 201420,
				index = {
					1
				}
			}
		}
	}
}

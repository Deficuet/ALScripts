return {
	time = 0.5,
	name = "2025信标BOSS 江风meta 触发技能减速",
	init_effect = "",
	stack = 1,
	id = 201421,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -8000
			}
		}
	}
}

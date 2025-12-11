return {
	time = 0,
	name = "2025信标BOSS 约克城meta 层数叠伤",
	init_effect = "",
	stack = 99,
	id = 201639,
	picture = "",
	last_effect = "",
	stack_cap = 12,
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 0.15
			}
		}
	}
}

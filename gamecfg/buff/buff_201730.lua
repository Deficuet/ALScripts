return {
	time = 0,
	name = "2026信标BOSS 雷根斯堡meta 角色多层叠伤",
	init_effect = "",
	stack = 99,
	id = 201730,
	picture = "",
	last_effect = "",
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
				number = 2
			}
		}
	}
}

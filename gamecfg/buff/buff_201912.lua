return {
	time = 0,
	name = "2026虎UR活动 万众一心",
	init_effect = "",
	stack = 99,
	id = 201912,
	picture = "",
	last_effect = "",
	stack_cap = 10,
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = 0.01
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.01
			}
		}
	}
}

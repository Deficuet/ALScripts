return {
	init_effect = "",
	name = "",
	time = 20,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61101,
	icon = 61100,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 2,
				mul = 0
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.02
			}
		}
	}
}

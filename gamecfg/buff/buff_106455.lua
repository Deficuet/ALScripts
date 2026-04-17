return {
	init_effect = "",
	name = "减速",
	time = 8,
	picture = "",
	desc = "减速实际",
	stack = 1,
	id = 106455,
	icon = 106450,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -2000
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "PattyHit"
			}
		}
	}
}

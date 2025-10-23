return {
	init_effect = "",
	name = "",
	time = 5,
	picture = "",
	desc = "减速",
	stack = 1,
	id = 10151768,
	icon = 151760,
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
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 3,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 11112,
	icon = 11110,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -3000
			}
		}
	}
}

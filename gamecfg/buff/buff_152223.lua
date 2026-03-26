return {
	init_effect = "",
	name = "",
	time = 8,
	picture = "",
	desc = "",
	stack = 1,
	id = 152223,
	icon = 152220,
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
				mul = -1000
			}
		}
	}
}

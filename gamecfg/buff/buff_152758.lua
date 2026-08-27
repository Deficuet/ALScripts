return {
	init_effect = "",
	name = "减速",
	time = 0.5,
	picture = "",
	desc = "减速回复",
	stack = 1,
	id = 152758,
	icon = 152750,
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
				mul = -5000
			}
		}
	}
}

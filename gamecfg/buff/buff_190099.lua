return {
	init_effect = "",
	name = "",
	time = 6,
	picture = "",
	desc = "减速",
	stack = 1,
	id = 190099,
	icon = 190090,
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
				mul = -3000
			}
		}
	}
}

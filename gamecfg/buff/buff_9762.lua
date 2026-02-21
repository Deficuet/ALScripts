return {
	init_effect = "",
	name = "制空权较低机制开启开关",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9762,
	icon = 9762,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffRegisterWaveFlags",
			trigger = {
				"onAttach"
			},
			arg_list = {
				flags = {
					9762
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "16-3击破路基0",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9754,
	icon = 9754,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffRegisterWaveFlags",
			trigger = {
				"onAttach"
			},
			arg_list = {
				flags = {
					9754
				}
			}
		}
	}
}

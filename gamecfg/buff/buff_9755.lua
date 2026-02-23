return {
	init_effect = "",
	name = "16-3击破路基1",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9755,
	icon = 9755,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffRegisterWaveFlags",
			trigger = {
				"onAttach"
			},
			arg_list = {
				flags = {
					9755
				}
			}
		}
	}
}

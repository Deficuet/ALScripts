return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 801602,
	icon = 801600,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAuraSquare",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 801603,
				effect = "None",
				cld_data = {
					box = {
						front_offset = 68
					}
				}
			}
		}
	}
}

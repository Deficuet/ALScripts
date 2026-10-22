return {
	init_effect = "",
	name = "",
	time = 0.7,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 152774,
	icon = 152770,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 152772,
				quota = 1,
				time = 0.5
			}
		}
	}
}

return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 118012,
	icon = 118010,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onOverHealing"
			},
			arg_list = {
				buff_id = 118017,
				quota = 1
			}
		}
	}
}

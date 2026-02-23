return {
	init_effect = "",
	name = "",
	time = 8,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61020,
	icon = 61020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 61021,
				quota = 1,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"YingSwei"
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 5,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 802155,
	icon = 802150,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 802156,
				target = {
					"TargetAllFoe",
					"TargetShipType"
				},
				ship_type_list = {
					8,
					17
				}
			}
		}
	}
}

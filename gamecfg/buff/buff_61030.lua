return {
	init_effect = "",
	name = "",
	time = 8,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61030,
	icon = 61030,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 61031,
				quota = 1,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"ChaoHo"
				}
			}
		}
	}
}

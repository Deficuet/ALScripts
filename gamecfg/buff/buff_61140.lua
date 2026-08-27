return {
	init_effect = "",
	name = "天风袋-检查装备人",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 61140,
	icon = 61140,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 61141,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Amatsukaze"
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "ERROR十三世-检查装备人",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61130,
	icon = 61130,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 61131,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Collett"
				}
			}
		}
	}
}

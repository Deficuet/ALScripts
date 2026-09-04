return {
	init_effect = "",
	name = "员工通行卡-检查装备人",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 61150,
	icon = 61150,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 61151,
				target = "TargetSelf",
				nationality = 2,
				check_target = {
					"TargetSelf",
					"TargetNationality"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 61152,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Javelin"
				}
			}
		}
	}
}

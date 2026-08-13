return {
	time = 3,
	name = "2026本宁顿活动 侵蚀性络合物",
	init_effect = "",
	stack = 1,
	id = 201828,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201829,
				minTargetNumber = 1,
				target = "TargetSelf",
				buff_level = 2,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"MAP_B"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201829,
				minTargetNumber = 1,
				target = "TargetSelf",
				buff_level = 4,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"MAP_D"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201829,
				minTargetNumber = 1,
				target = "TargetSelf",
				buff_level = 5,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"MAP_SP"
				}
			}
		}
	}
}

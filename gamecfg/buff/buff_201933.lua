return {
	time = 0.5,
	name = "2026风帆四期 沉星之渊 旋涡",
	init_effect = "",
	stack = 1,
	id = 201933,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201934,
				minTargetNumber = 1,
				target = "TargetSelf",
				buff_level = 1,
				check_target = {
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
				buff_id = 201934,
				minTargetNumber = 1,
				target = "TargetSelf",
				buff_level = 2,
				check_target = {
					"TargetShipTag"
				},
				ship_tag_list = {
					"MAP_C"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201934,
				minTargetNumber = 1,
				target = "TargetSelf",
				buff_level = 3,
				check_target = {
					"TargetShipTag"
				},
				ship_tag_list = {
					"MAP_SP"
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "敌方自我识别护甲",
	time = 5,
	picture = "",
	desc = "",
	stack = 1,
	id = 151534,
	icon = 151530,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 151535,
				armor_type = 1,
				target = "TargetSelf",
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipArmor"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 151535,
				armor_type = 2,
				target = "TargetSelf",
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipArmor"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 151536,
				armor_type = 3,
				target = "TargetSelf",
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipArmor"
				}
			}
		}
	}
}

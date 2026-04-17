return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 1,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 106398,
	icon = 106390,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxTargetNumber = 0,
				target = "TargetSelf",
				skill_id = 106398,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Shizuku_33LowSelf"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 106399,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Shizuku_33LowSelf"
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "天恩浑仪",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60910,
	icon = 60910,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 60919,
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Yumia"
				}
			}
		}
	}
}

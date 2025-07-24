return {
	init_effect = "",
	name = "地狱立方体",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60900,
	icon = 60900,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 60907,
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

return {
	init_effect = "",
	name = "神药球",
	time = 5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60890,
	icon = 60890,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 60899,
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

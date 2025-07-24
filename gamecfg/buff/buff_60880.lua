return {
	init_effect = "",
	name = "最终陨石",
	time = 5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60880,
	icon = 60880,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 60880,
				minTargetNumber = 1,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"YumiaSelf"
				}
			}
		}
	}
}

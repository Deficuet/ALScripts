return {
	init_effect = "",
	name = "宏伟光辉",
	time = 5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60860,
	icon = 60860,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 60869,
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

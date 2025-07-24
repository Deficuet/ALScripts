return {
	init_effect = "",
	name = "高级魔法书",
	time = 5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60870,
	icon = 60870,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 60870,
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

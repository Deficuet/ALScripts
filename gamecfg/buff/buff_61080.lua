return {
	init_effect = "",
	name = "写真看板-检查阵营",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61080,
	icon = 61080,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 61080,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"DOAXVV"
				}
			}
		}
	}
}

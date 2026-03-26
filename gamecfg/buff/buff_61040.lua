return {
	init_effect = "",
	name = "",
	time = 8,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61040,
	icon = 61040,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 5,
				skill_id = 61042
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				maxTargetNumber = 0,
				time = 5,
				skill_id = 61040,
				check_target = {
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Same_Nationality"
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60970,
	icon = 60970,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 3,
				maxTargetNumber = 0,
				time = 30,
				skill_id = 60970,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"DAL"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				minTargetNumber = 1,
				quota = 3,
				time = 30,
				skill_id = 60971,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"DAL"
				}
			}
		}
	}
}

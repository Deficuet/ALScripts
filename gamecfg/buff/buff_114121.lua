return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 2,
				target = "TargetSelf",
				skill_id = 114121,
				check_target = {
					"TargetAllHarm"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 114110,
				check_target = {
					"TargetAllHarm"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				check_target = "TargetHarmNearest",
				range = 45,
				skill_id = 114122,
				minTargetNumber = 1
			}
		}
	},
	{},
	init_effect = "",
	name = "光明之风-专武",
	time = 2,
	color = "red",
	picture = "",
	desc = "每10秒，触发光明之风-专武",
	stack = 1,
	id = 114120,
	icon = 114110,
	last_effect = ""
}

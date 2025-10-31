return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 114110,
				target = "TargetSelf"
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
				skill_id = 114111,
				minTargetNumber = 1
			}
		}
	},
	{},
	init_effect = "",
	name = "光明之风",
	time = 2,
	color = "red",
	picture = "",
	desc = "每10秒，触发光明之风",
	stack = 1,
	id = 114110,
	icon = 114110,
	last_effect = ""
}

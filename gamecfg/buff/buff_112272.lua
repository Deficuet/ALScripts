return {
	init_effect = "",
	name = "",
	time = 0.7,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 112272,
	icon = 112270,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				check_target = "TargetHarmNearest",
				range = 35,
				skill_id = 112271,
				maxTargetNumber = 0
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				check_target = "TargetHarmNearest",
				range = 35,
				skill_id = 112272,
				minTargetNumber = 1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 112273,
				target = "TargetSelf"
			}
		}
	}
}

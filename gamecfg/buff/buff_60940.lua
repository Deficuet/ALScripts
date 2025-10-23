return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60940,
	icon = 60940,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				skill_id = 60940,
				nationality = 96,
				check_target = {
					"TargetSelf",
					"TargetNationality"
				}
			}
		}
	}
}

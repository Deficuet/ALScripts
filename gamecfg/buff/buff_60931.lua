return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60931,
	icon = 60930,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 60932,
				maxTargetNumber = 0,
				target = "TargetSelf",
				nationality = 3,
				check_target = {
					"TargetSelf",
					"TargetNationality"
				}
			}
		}
	}
}

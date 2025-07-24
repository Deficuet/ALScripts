return {
	init_effect = "",
	name = "最终陨石",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60881,
	icon = 60880,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 60882,
				time = 1
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "YUMIAITEMSKILL60881",
				skill_id = 60881
			}
		}
	}
}

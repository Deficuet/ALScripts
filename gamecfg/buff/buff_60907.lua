return {
	init_effect = "",
	name = "地狱立方体",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60907,
	icon = 60900,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 60901,
				time = 1
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "YUMIAITEMSKILL60900",
				skill_id = 60900
			}
		}
	}
}

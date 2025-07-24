return {
	init_effect = "",
	name = "神药球",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60899,
	icon = 60890,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 60891,
				time = 1
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "YUMIAITEMSKILL60890",
				skill_id = 60890
			}
		}
	}
}

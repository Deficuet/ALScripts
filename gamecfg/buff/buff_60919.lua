return {
	init_effect = "",
	name = "天恩浑仪",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60919,
	icon = 60910,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 60911,
				time = 1
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "YUMIAITEMSKILL60910",
				skill_id = 60910
			}
		}
	}
}

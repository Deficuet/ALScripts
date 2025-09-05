return {
	init_effect = "",
	name = "高级魔法书",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60871,
	icon = 60870,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 60872,
				time = 1
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "YUMIAITEMSKILL60871",
				skill_id = 60871
			}
		}
	}
}

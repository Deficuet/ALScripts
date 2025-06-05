return {
	time = 0,
	name = "信标BOSS用 TAG标记LV",
	init_effect = "",
	stack = 1,
	id = 201435,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "LV8"
			}
		}
	}
}

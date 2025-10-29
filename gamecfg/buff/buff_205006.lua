return {
	init_effect = "",
	name = "通用 章节判断标记",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 205006,
	icon = 205006,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach"
			},
			arg_list = {
				tag = "MAP_B3"
			}
		}
	}
}

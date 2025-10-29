return {
	init_effect = "",
	name = "",
	time = 8,
	picture = "",
	desc = "标记",
	stack = 1,
	id = 1010195,
	icon = 10190,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "YueKeCheng"
			}
		}
	}
}

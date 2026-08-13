return {
	init_effect = "",
	name = "",
	time = 0.1,
	picture = "",
	desc = "标记",
	stack = 1,
	id = 19999,
	icon = 19980,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "SlowerThanKansas"
			}
		}
	}
}

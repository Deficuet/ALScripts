return {
	init_effect = "",
	name = "",
	time = 1,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 17944,
	icon = 17940,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "stuned"
			}
		}
	}
}

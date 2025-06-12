return {
	init_effect = "",
	name = "定身",
	time = 2.5,
	picture = "",
	desc = "",
	stack = 1,
	id = 19821,
	icon = 19820,
	last_effect = "naximofu_buff",
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

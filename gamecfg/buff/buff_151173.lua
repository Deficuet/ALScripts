return {
	init_effect = "",
	name = "",
	time = 0.5,
	picture = "",
	desc = "",
	stack = 1,
	id = 151173,
	icon = 151170,
	last_effect = "Darkness",
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

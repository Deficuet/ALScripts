return {
	init_effect = "",
	name = "定身",
	time = 1.3,
	picture = "",
	desc = "",
	stack = 1,
	id = 61132,
	icon = 61130,
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

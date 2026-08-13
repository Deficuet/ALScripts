return {
	init_effect = "",
	name = "定身",
	time = 1.5,
	picture = "",
	desc = "",
	stack = 1,
	id = 152634,
	icon = 152630,
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

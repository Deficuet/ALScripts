return {
	init_effect = "",
	name = "",
	time = 10,
	picture = "",
	desc = "10s DOT",
	stack = 1,
	id = 1011246,
	icon = 11240,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "torpedoPower",
				number = 179,
				time = 1,
				dotType = 2,
				k = 0
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "flood"
			}
		}
	}
}

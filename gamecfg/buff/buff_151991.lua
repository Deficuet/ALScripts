return {
	init_effect = "",
	name = "",
	time = 6.1,
	picture = "",
	desc = "",
	stack = 1,
	id = 151991,
	icon = 151990,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "cannonPower",
				number = 100,
				time = 1,
				dotType = 10,
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
				tag = "haichouhit"
			}
		}
	}
}

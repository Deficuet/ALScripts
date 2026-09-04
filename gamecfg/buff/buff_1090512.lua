return {
	init_effect = "",
	name = "进水",
	time = 15.1,
	picture = "",
	desc = "U73进水 持续伤害",
	stack = 1,
	id = 1090512,
	icon = 3610,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "torpedoPower",
				number = 5,
				time = 3,
				dotType = 2,
				k = 0.45
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

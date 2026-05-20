return {
	init_effect = "",
	name = "进水",
	time = 15.1,
	picture = "",
	desc = "U2501进水 持续伤害",
	stack = 1,
	id = 152379,
	icon = 152379,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "torpedoPower",
				number = 0,
				time = 3,
				dotType = 2,
				k = 0.2
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

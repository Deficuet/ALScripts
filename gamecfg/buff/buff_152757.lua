return {
	init_effect = "",
	name = "进水",
	time = 6.1,
	picture = "",
	desc = "进水持续伤害",
	stack = 1,
	id = 152757,
	icon = 152750,
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
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 152759
			}
		}
	}
}

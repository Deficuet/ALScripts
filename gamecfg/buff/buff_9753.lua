return {
	time = 0,
	name = "迷雾强化III",
	init_effect = "",
	stack = 1,
	id = 9753,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRate",
				number = 500
			}
		}
	}
}

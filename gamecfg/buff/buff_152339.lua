return {
	init_effect = "",
	name = "",
	time = 6,
	picture = "",
	desc = "",
	stack = 1,
	id = 152339,
	icon = 152330,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 0.08
			}
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 5,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 112171,
	icon = 112171,
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
				number = 0.05
			}
		}
	}
}

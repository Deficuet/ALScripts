return {
	init_effect = "",
	name = "",
	time = 8,
	picture = "",
	desc = "",
	stack = 1,
	id = 153063,
	icon = 153060,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "attackRating",
				number = -1000
			}
		}
	}
}

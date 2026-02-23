return {
	init_effect = "",
	name = "",
	time = 30,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 60993,
	icon = 60990,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "attackRating",
				number = 300
			}
		}
	}
}

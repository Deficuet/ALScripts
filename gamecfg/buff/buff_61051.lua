return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "命中提高3%",
	stack = 1,
	id = 61051,
	icon = 61050,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "attackRating",
				number = 300
			}
		}
	}
}

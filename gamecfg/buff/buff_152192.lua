return {
	init_effect = "",
	name = "",
	time = 15,
	picture = "",
	desc = "",
	stack = 1,
	id = 152192,
	icon = 152190,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "antiAirPower",
				number = -500
			}
		}
	}
}

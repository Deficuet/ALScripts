return {
	time = 0,
	name = "",
	init_effect = "jinengchufablue",
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 106561,
	icon = 106560,
	last_effect = "",
	blink = {
		0,
		0.7,
		1,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "antiAirPower",
				number = 1000
			}
		}
	}
}

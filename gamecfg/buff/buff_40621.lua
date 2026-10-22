return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "轻巡驱逐FFV-指挥-命中II",
	stack = 1,
	id = 40621,
	icon = 40620,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "command",
				convertRate = 0.8,
				convertAttr = "attackRating"
			}
		}
	}
}

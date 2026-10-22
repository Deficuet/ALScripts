return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "风帆-指挥-命中I",
	stack = 1,
	id = 40661,
	icon = 40660,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "command",
				convertRate = 0.4,
				convertAttr = "attackRating"
			}
		}
	}
}

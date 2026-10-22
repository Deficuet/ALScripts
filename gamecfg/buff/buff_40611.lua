return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "轻巡驱逐FFV-后勤-机动II",
	stack = 1,
	id = 40611,
	icon = 40610,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "support",
				convertRate = 0.8,
				convertAttr = "dodgeRate"
			}
		}
	}
}

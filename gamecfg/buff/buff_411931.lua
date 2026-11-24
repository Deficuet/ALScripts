return {
	init_effect = "",
	name = "驱逐-后勤-机动I具体效果",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "驱逐-后勤-机动I",
	stack = 1,
	id = 411931,
	icon = 411930,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "support",
				convertRate = 0.4,
				convertAttr = "dodgeRate"
			}
		}
	}
}

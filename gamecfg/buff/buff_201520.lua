return {
	time = 0,
	name = "2025白凤UR活动 EX普通 烟雾玉烟雾效果",
	init_effect = "",
	stack = 1,
	id = 201520,
	picture = "",
	last_effect = "",
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 0.5
			}
		}
	}
}

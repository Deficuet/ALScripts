return {
	time = 0,
	name = "",
	init_effect = "jinengchufablue",
	picture = "",
	desc = "受伤降低",
	stack = 1,
	id = 152013,
	icon = 152010,
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
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.2
			}
		}
	}
}

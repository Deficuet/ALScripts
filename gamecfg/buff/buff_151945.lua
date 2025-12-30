return {
	init_effect = "jinengchufablue",
	name = "",
	time = 0,
	picture = "",
	desc = "受伤降低",
	stack = 1,
	id = 151945,
	icon = 151945,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.15
			}
		}
	}
}

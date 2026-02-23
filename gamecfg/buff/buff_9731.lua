return {
	desc_get = "",
	name = "占得先机我方buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9731,
	icon = 9731,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "aimBiasDecaySpeed",
				number = -0.2
			}
		}
	}
}

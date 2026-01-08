return {
	desc_get = "",
	name = "占得先机敌方buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9732,
	icon = 9732,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "aimBiasDecaySpeed",
				number = 0.2
			}
		}
	}
}

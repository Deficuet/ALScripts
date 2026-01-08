return {
	desc_get = "",
	name = "狭路相逢II我方buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9739,
	icon = 9739,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "aimBiasDecaySpeed",
				number = -0.1
			}
		}
	}
}

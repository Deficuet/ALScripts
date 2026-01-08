return {
	desc_get = "",
	name = "狭路相逢II敌方buff",
	init_effect = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 9740,
	icon = 9740,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "aimBiasDecaySpeed",
				number = 0.1
			}
		}
	}
}

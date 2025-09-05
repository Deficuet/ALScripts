return {
	init_effect = "",
	name = "",
	time = 0.7,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 112093,
	icon = 112090,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "Atelier_Yumia_close1"
			}
		}
	}
}

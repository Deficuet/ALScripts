return {
	init_effect = "",
	name = "",
	time = 10,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 106475,
	icon = 106470,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = -0.08
			}
		}
	}
}

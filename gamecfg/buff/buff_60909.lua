return {
	init_effect = "",
	name = "",
	time = 5,
	color = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 60899,
	icon = 60890,
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

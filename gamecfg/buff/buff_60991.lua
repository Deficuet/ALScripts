return {
	init_effect = "",
	name = "",
	time = 30,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 60991,
	icon = 60990,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = 0.01
			}
		}
	}
}

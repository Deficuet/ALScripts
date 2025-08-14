return {
	time = 0,
	name = "",
	init_effect = "jinengchufared",
	picture = "",
	desc = "",
	stack = 3,
	id = 151421,
	icon = 151420,
	last_effect = "",
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove",
				"onStack"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = 0.03
			}
		}
	}
}

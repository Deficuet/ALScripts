return {
	init_effect = "",
	name = "减速",
	time = 0,
	picture = "",
	desc = "降低伤害debuff",
	stack = 1,
	id = 152764,
	icon = 152760,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = -0.1
			}
		}
	}
}

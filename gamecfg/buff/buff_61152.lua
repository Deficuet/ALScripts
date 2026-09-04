return {
	init_effect = "",
	name = "员工通行卡-标枪增伤",
	time = 60,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 61152,
	icon = 61150,
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
				number = 0.05
			}
		}
	}
}

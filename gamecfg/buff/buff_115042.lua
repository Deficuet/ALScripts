return {
	init_effect = "",
	name = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 3,
	id = 115042,
	icon = 115010,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate",
				"onStack"
			},
			arg_list = {
				attr = "cri",
				number = 0.08
			}
		}
	}
}

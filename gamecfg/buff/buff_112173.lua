return {
	init_effect = "",
	name = "",
	time = 5,
	picture = "",
	desc = "-宏伟光辉的四元素伤害 暴击下降-雷",
	stack = 1,
	id = 112173,
	icon = 112170,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAircraftAttr",
			trigger = {
				"onAircraftCreate"
			},
			arg_list = {
				attr = "cri",
				number = -0.1
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "cri",
				number = -0.1
			}
		}
	}
}

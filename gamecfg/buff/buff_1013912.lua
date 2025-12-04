return {
	time = 3,
	name = "",
	init_effect = "jinengchufared",
	color = "red",
	picture = "",
	desc = "1号位置装备发射的子弹伤害提高+附加减速",
	stack = 1,
	id = 1013912,
	icon = 13910,
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
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = 0.5,
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffOrb",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				rant = 10000,
				buff_id = 1013913,
				index = {
					1
				}
			}
		}
	}
}

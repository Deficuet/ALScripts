return {
	time = 0,
	name = "2026DOA三期活动 EX 距离增减伤机制",
	init_effect = "",
	stack = 1,
	id = 201744,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBombBulletBang"
			},
			arg_list = {
				attr = "damageRatioBullet",
				displacement_convert = {
					rate = -0.02,
					base = 20,
					max = 1
				}
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onTorpedoBulletBang"
			},
			arg_list = {
				attr = "damageRatioBullet",
				displacement_convert = {
					rate = -0.02,
					base = 20,
					max = 1
				}
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCollideBefore"
			},
			arg_list = {
				attr = "damageRatioBullet",
				displacement_convert = {
					rate = -0.02,
					base = 20,
					max = 1
				}
			}
		}
	}
}

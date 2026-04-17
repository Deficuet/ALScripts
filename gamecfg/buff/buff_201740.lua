return {
	time = 0,
	name = "2026DOA三期活动 EX 先锋舰队额外增伤",
	init_effect = "",
	stack = 1,
	id = 201740,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "damageRatioByCannon",
				number = 1
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onAttach",
				"onTorpedoWeaponBulletCreate"
			},
			arg_list = {
				attr = "damageRatioByBulletTorpedo",
				number = 0.5
			}
		}
	}
}

return {
	icon = 30590,
	name = "",
	time = 0,
	stack = 1,
	id = 30593,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffOverrideBullet",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				bullet_type = 1,
				override = {
					ignoreShield = true
				},
				index = {
					1,
					2
				}
			}
		}
	}
}

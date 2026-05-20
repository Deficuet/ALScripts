return {
	icon = 152290,
	name = "",
	time = 0,
	stack = 1,
	id = 152292,
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
					4
				}
			}
		}
	}
}

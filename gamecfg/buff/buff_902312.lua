return {
	init_effect = "",
	name = "",
	time = 10,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 902312,
	icon = 10310,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "criDamage",
				number = 9999.3,
				index = {
					1
				}
			}
		}
	}
}

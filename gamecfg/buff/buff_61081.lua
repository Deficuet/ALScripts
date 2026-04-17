return {
	init_effect = "",
	name = "写真看板-暴击率提高",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61081,
	icon = 61080,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "cri",
				number = 0.03,
				index = {
					1,
					2,
					3
				}
			}
		},
		{
			type = "BattleBuffAddAircraftAttr",
			trigger = {
				"onAircraftCreate"
			},
			arg_list = {
				attr = "cri",
				number = 0.03,
				index = {
					1,
					2,
					3
				}
			}
		}
	}
}

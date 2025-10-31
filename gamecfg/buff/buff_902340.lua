return {
	init_effect = "",
	name = "飓风的掠夺",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 902340,
	icon = 902340,
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
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatioByAir",
				number = -0.3
			}
		}
	}
}

return {
	init_effect = "",
	name = "受到伤害降低，依据战术属性",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 40631,
	icon = 40630,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "support",
				convertRate = -0.0002,
				convertAttr = "injureRatio"
			}
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "战列受到伤害降低,+装填",
	stack = 1,
	id = 40311,
	icon = 40310,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "support",
				convertRate = -0.00025,
				convertAttr = "injureRatio"
			}
		},
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "support",
				convertRate = 0.8,
				convertAttr = "loadSpeed"
			}
		}
	}
}

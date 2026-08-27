return {
	init_effect = "",
	name = "天风袋-回避提升",
	time = 60,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 61141,
	icon = 61140,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRateExtra",
				number = 0.02
			}
		}
	}
}

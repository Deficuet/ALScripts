return {
	init_effect = "",
	name = "航空向破甲",
	time = 5,
	picture = "",
	desc = "",
	stack = 1,
	id = 60885,
	icon = 60880,
	last_effect = "Pojia01",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatioByAir",
				number = 0.1
			}
		}
	}
}

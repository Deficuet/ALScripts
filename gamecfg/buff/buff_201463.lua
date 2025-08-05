return {
	time = 8,
	name = "2025优米雅联动 核心等级LV3 易伤",
	init_effect = "",
	stack = 1,
	id = 201463,
	picture = "",
	last_effect = "Pojia02",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 0.03
			}
		}
	}
}

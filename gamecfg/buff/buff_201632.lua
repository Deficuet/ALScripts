return {
	time = 0,
	name = "2025信标BOSS 约克城meta 领域展开",
	init_effect = "",
	stack = 1,
	id = 201632,
	picture = "",
	last_effect = "",
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

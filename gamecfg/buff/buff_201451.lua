return {
	time = 0.2,
	name = "2025黑岩联动 死亡主宰大招锁链捆绑",
	init_effect = "",
	stack = 2,
	id = 201451,
	picture = "",
	last_effect = "heiyan_suolian",
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
				number = 0.2
			}
		},
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		}
	}
}

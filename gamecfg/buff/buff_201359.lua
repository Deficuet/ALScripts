return {
	init_effect = "",
	name = "2025狮UR活动 EX 幻影冲锋 命中造成眩晕",
	time = 3,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 201359,
	icon = 201359,
	last_effect = "xuanyun",
	effect_list = {
		{
			type = "BattleBuffCease",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "stuned"
			}
		}
	}
}

return {
	init_effect = "",
	name = "2024匹兹堡活动 冻雨打击支援 冻结效果",
	time = 5,
	picture = "",
	desc = "",
	stack = 1,
	id = 200995,
	icon = 200995,
	last_effect = "",
	effect_list = {
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
		},
		{
			type = "BattleBuffCease",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		}
	}
}

return {
	time = 5,
	name = "2025信标BOSS 夕立meta 自身CD标记",
	init_effect = "",
	stack = 1,
	id = 201506,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "Xili_CD"
			}
		}
	}
}

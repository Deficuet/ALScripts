return {
	time = 0,
	name = "2025白凤UR活动 EX 精神同步触发标记",
	init_effect = "",
	stack = 1,
	id = 201515,
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
				tag = "player"
			}
		},
		{
			type = "BattleBuffRegisterWaveFlags",
			trigger = {
				"onAttach"
			},
			arg_list = {
				flags = {
					201515
				}
			}
		}
	}
}

return {
	time = 0,
	name = "2026信标BOSS 布里斯托尔meta 维度追猎 已回归跟随状态标记",
	init_effect = "",
	stack = 1,
	id = 201795,
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
				tag = "cdFinish"
			}
		}
	}
}

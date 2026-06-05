return {
	time = 0,
	name = "2026信标BOSS 布里斯托尔meta 维度追猎 检测到回归标记则重启监听",
	init_effect = "",
	stack = 1,
	id = 201796,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201797,
				time = 0.1
			}
		}
	}
}

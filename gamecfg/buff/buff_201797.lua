return {
	time = 1,
	name = "2026信标BOSS 布里斯托尔meta 维度追猎 检测到回归标记则重启监听",
	init_effect = "",
	stack = 1,
	id = 201797,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 201786,
				target = "TargetSelf",
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"cdFinish"
				}
			}
		}
	}
}

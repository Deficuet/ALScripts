return {
	time = 0,
	name = "2026伯利欣根活动 EX 转阶段",
	init_effect = "",
	stack = 1,
	id = 201779,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 201780,
				hpUpperBound = 0.2,
				target = "TargetSelf",
				quota = 1
			}
		}
	}
}

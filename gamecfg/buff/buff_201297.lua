return {
	init_effect = "",
	name = "2025拉斐尔活动 EX 转阶段",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 201297,
	icon = 201297,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 201298,
				hpUpperBound = 0.4,
				target = "TargetSelf",
				quota = 1
			}
		}
	}
}

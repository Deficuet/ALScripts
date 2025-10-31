return {
	time = 7,
	name = "2025白凤UR活动 天原加护-白凤",
	init_effect = "",
	stack = 1,
	id = 201526,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201527
			}
		}
	}
}

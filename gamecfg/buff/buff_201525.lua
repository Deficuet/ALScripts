return {
	time = 3,
	name = "2025白凤UR活动 天原加护-白凤",
	init_effect = "",
	stack = 1,
	id = 201525,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201526
			}
		}
	}
}

return {
	time = 3,
	name = "2026虎UR活动 异常空间",
	init_effect = "",
	stack = 1,
	id = 201901,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201902
			}
		}
	}
}

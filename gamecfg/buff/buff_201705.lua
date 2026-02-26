return {
	time = 3,
	name = "2026莫斯科活动 发光的料理",
	init_effect = "",
	stack = 1,
	id = 201705,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201706
			}
		}
	}
}

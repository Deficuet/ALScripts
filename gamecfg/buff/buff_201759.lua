return {
	time = 3,
	name = "2026伯利欣根活动 神光之网 初始化",
	init_effect = "",
	stack = 1,
	id = 201759,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201760
			}
		}
	}
}

return {
	time = 3,
	name = "2026风帆四期 雾霭回廊",
	init_effect = "",
	stack = 1,
	id = 201924,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201925
			}
		}
	}
}

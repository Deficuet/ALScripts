return {
	time = 3,
	name = "2025风帆三期 群岛遗迹支援",
	init_effect = "",
	stack = 1,
	id = 201547,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201548
			}
		}
	}
}

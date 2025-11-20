return {
	time = 0,
	name = "2025约战联动 角色支援 鸢一折纸",
	init_effect = "",
	stack = 1,
	id = 201609,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onDALCollabFlagShip"
			},
			arg_list = {
				buff_id = 201610
			}
		}
	}
}

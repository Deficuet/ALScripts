return {
	time = 3,
	name = "2025约战联动 角色支援 时崎狂三",
	init_effect = "",
	stack = 1,
	id = 201620,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onDALCollabFlagShip"
			},
			arg_list = {
				buff_id = 201621
			}
		}
	}
}

return {
	time = 0,
	name = "2025约战联动 角色支援 四糸乃",
	init_effect = "",
	stack = 1,
	id = 201613,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onDALCollabFlagShip"
			},
			arg_list = {
				buff_id = 201614
			}
		}
	}
}

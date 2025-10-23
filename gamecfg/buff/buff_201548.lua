return {
	time = 7,
	name = "2025风帆三期 群岛遗迹支援",
	init_effect = "",
	stack = 1,
	id = 201548,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201549
			}
		}
	}
}

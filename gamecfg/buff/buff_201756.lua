return {
	time = 2,
	name = "2026伯利欣根活动 黑日凌空 初始化",
	init_effect = "",
	stack = 1,
	id = 201756,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201757
			}
		}
	}
}

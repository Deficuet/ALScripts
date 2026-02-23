return {
	time = 0,
	name = "鱼雷连射失败计数buff",
	init_effect = "",
	stack = 3,
	id = 151979,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 151978,
				repeat_count = -1,
				target = {
					"TargetSelf"
				}
			}
		}
	}
}

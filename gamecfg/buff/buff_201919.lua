return {
	time = 45,
	name = "2026虎UR活动 EX困难 暴走冷却",
	init_effect = "",
	stack = 1,
	id = 201919,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201917,
				target = "TargetSelf"
			}
		}
	}
}

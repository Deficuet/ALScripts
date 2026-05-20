return {
	time = 0,
	name = "2026伯利欣根活动 神光之网 触发间隔",
	init_effect = "",
	stack = 1,
	id = 201761,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201762,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201762,
				target = "TargetSelf",
				time = 30
			}
		}
	}
}

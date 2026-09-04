return {
	time = 0,
	name = "2026年信标BOSS 萨拉托加meta 目标锁定",
	init_effect = "",
	stack = 1,
	id = 201892,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201893,
				target = "TargetAllHarm"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201893,
				target = "TargetAllHarm",
				time = 15
			}
		}
	}
}

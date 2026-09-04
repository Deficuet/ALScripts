return {
	time = 1,
	name = "2026年信标BOSS 萨拉托加meta 目标锁定",
	init_effect = "",
	stack = 1,
	id = 201893,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201894,
				target = "TargetPlayerLeaderShip"
			}
		}
	}
}

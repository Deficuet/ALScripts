return {
	time = 1,
	name = "2026信标BOSS 布里斯托尔meta 维度追猎 监听无敌消失",
	init_effect = "",
	stack = 1,
	id = 201792,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 201793,
				maxTargetNumber = 0,
				check_target = {
					"TargetSelf",
					"TargetShipTag"
				},
				ship_tag_list = {
					"isInvincible_1"
				}
			}
		}
	}
}

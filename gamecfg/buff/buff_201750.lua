return {
	time = 0.5,
	name = "2026伯利欣根活动 恶念残影 亡语效果 回血",
	init_effect = "",
	stack = 99,
	id = 20170,
	picture = "",
	last_effect = "Health",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				casterMaxHPRatio = 0.1
			}
		}
	}
}

return {
	time = 0,
	name = "2026伯利欣根活动 EX 狂暴状态流失生命",
	init_effect = "",
	stack = 1,
	id = 201782,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				maxHPRatio = -0.005
			}
		}
	}
}

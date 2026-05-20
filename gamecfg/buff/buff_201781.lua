return {
	time = 0,
	name = "2026伯利欣根活动 EX 狂暴状态流失生命",
	init_effect = "",
	stack = 1,
	id = 201781,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201782,
				time = 1
			}
		}
	}
}

return {
	time = 0,
	name = "2026本宁顿活动 剧情战4 海洛芬特支援",
	init_effect = "",
	stack = 1,
	id = 201884,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201885,
				target = "TargetSelf",
				time = 1
			}
		}
	}
}

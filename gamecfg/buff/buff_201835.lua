return {
	time = 0,
	name = "2026本宁顿活动 EX普通 龙卷风引力",
	init_effect = "",
	stack = 1,
	id = 201835,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAdditiveSpeed",
			trigger = {
				"onUpdate",
				"onRemove"
			},
			arg_list = {
				gravitationalCaster = true,
				force = 0.2
			}
		}
	}
}

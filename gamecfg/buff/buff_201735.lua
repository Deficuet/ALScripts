return {
	time = 0,
	name = "2026信标BOSS 雷根斯堡meta 阶段式胜利效果",
	init_effect = "",
	stack = 1,
	id = 201735,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAura",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201736,
				cld_data = {
					box = {
						range = 500
					}
				}
			}
		}
	}
}

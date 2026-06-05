return {
	time = 0,
	name = "2026信标BOSS 布里斯托尔meta 提灯效果",
	init_effect = "",
	stack = 1,
	id = 201785,
	picture = "",
	last_effect = "xilimeta_miaozhun",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRateExtra",
				number = -0.2
			}
		}
	}
}

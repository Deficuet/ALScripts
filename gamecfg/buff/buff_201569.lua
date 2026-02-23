return {
	time = 0,
	name = "2025约战联动 飞船组件升级 鸢尾LV2",
	init_effect = "",
	stack = 1,
	id = 201569,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.02
			}
		}
	}
}

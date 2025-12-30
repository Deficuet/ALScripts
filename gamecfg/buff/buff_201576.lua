return {
	time = 20,
	name = "2025约战联动 飞船组件升级 撒丁LV3",
	init_effect = "",
	stack = 1,
	id = 201576,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "loadSpeed",
				number = 1500
			}
		}
	}
}

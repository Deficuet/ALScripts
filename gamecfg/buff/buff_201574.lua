return {
	time = 10,
	name = "2025约战联动 飞船组件升级 撒丁LV1",
	init_effect = "",
	stack = 1,
	id = 201574,
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

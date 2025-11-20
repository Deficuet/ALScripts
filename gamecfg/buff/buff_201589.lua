return {
	time = 0,
	name = "2025约战联动 飞船组件升级 重樱LV1",
	init_effect = "",
	stack = 1,
	id = 201589,
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
				attr = "torpedoPower",
				number = 200
			}
		}
	}
}

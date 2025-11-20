return {
	time = 0,
	name = "2025约战联动 飞船组件升级 东煌LV1",
	init_effect = "",
	stack = 1,
	id = 201586,
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
				attr = "attackRating",
				number = 200
			}
		}
	}
}

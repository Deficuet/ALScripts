return {
	time = 0,
	name = "2025约战联动 飞船组件升级 郁金LV1",
	init_effect = "",
	stack = 1,
	id = 201580,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 2,
				mul = 0
			}
		}
	}
}

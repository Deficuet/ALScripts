return {
	time = 0,
	name = "2025约战联动 飞船组件升级 北联LV1",
	init_effect = "",
	stack = 1,
	id = 201577,
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
				attr = "damageRatioBullet",
				number = 0.01
			}
		}
	}
}

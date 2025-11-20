return {
	time = 3,
	name = "2025约战联动 飞船组件升级 白鹰LV1",
	init_effect = "",
	stack = 1,
	id = 201561,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201561,
				target = "TargetSelf"
			}
		}
	}
}

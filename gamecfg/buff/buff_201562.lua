return {
	time = 0,
	name = "2025约战联动 飞船组件升级 白鹰LV2",
	init_effect = "",
	stack = 1,
	id = 201562,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201562,
				target = "TargetSelf"
			}
		}
	}
}

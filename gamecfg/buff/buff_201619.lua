return {
	time = 0,
	name = "2025约战联动 角色支援 八舞",
	init_effect = "",
	stack = 1,
	id = 201619,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201619,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 20,
				target = "TargetSelf",
				skill_id = 201620
			}
		}
	}
}

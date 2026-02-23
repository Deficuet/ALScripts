return {
	time = 0,
	name = "2025约战联动 角色支援 鸢一折纸",
	init_effect = "",
	stack = 1,
	id = 201612,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201612,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 15,
				target = "TargetSelf",
				skill_id = 201612
			}
		}
	}
}

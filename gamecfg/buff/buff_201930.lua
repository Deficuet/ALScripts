return {
	time = 0,
	name = "2026风帆四期 沉星之渊",
	init_effect = "",
	stack = 1,
	id = 201930,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201930,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 12,
				target = "TargetSelf",
				skill_id = 201930
			}
		}
	}
}

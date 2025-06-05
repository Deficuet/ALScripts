return {
	time = 0,
	name = "2025信标BOSS 江风meta 累计命中触发次数",
	init_effect = "",
	stack = 99,
	id = 201424,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStack"
			},
			arg_list = {
				skill_id = 201424,
				stack_require = ">=10"
			}
		}
	}
}

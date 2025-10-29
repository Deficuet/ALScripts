return {
	time = 30,
	name = "2025马塞纳活动 剧情战 舰炮齐射",
	init_effect = "",
	stack = 1,
	id = 201496,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				time = 3,
				skill_id = 201496
			}
		}
	}
}

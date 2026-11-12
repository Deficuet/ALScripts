return {
	time = 10,
	name = "2026二点五次元联动 剧情战 柴郡登场技能",
	init_effect = "",
	stack = 1,
	id = 201954,
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
				time = 2,
				skill_id = 201954
			}
		}
	}
}

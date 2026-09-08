return {
	time = 0,
	name = "2026虎UR活动 剧情战 无限回血",
	init_effect = "",
	stack = 1,
	id = 201922,
	picture = "",
	last_effect = "health",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 1,
				target = "TargetSelf",
				skill_id = 201922
			}
		}
	}
}

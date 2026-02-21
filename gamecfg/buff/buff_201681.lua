return {
	time = 10,
	name = "2025列克星敦II活动 剧情战2 我方额外单位",
	init_effect = "",
	stack = 1,
	id = 201681,
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
				skill_id = 201681
			}
		}
	}
}

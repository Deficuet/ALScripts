return {
	time = 0,
	name = "2026本宁顿活动 剧情战3 主要流程",
	init_effect = "",
	stack = 1,
	id = 201878,
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
				skill_id = 201877
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				time = 23,
				skill_id = 201878
			}
		}
	}
}

return {
	time = 0,
	name = "2026年信标BOSS 萨拉托加meta 场外跨射弹条展示",
	init_effect = "",
	stack = 1,
	id = 201895,
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
				time = 3.5,
				skill_id = 201895
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 15.5,
				skill_id = 201895
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 27.5,
				skill_id = 201895
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 54.5,
				skill_id = 201895
			}
		}
	}
}

return {
	time = 10,
	name = "2026尼尔联动 A2近身斩击",
	init_effect = "",
	stack = 1,
	id = 201804,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201804
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 1.5,
				skill_id = 201805
			}
		}
	}
}

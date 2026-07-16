return {
	time = 10,
	name = "2026尼尔联动 2B近身斩击",
	init_effect = "",
	stack = 1,
	id = 201805,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201806
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
				skill_id = 201807
			}
		}
	}
}

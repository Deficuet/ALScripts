return {
	desc_get = "",
	name = "吸引火力·妙高",
	init_effect = "",
	time = 8,
	color = "blue",
	picture = "",
	desc = "",
	stack = 2,
	id = 1090433,
	icon = 4040,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 1090431
			}
		}
	}
}

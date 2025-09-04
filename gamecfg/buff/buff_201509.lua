return {
	time = 0,
	name = "2025信标BOSS 夕立meta 点燃带来的减伤（附带特效用于显示点燃单位存在个数）",
	init_effect = "",
	stack = 10,
	id = 201509,
	picture = "",
	last_effect_cld_scale = true,
	last_effect = "None",
	last_effect_stack_list = {
		"None",
		"qinshibuff4",
		"qinshibuff4",
		"qinshibuff3",
		"qinshibuff3",
		"qinshibuff3",
		"qinshibuff3",
		"qinshibuff3",
		"qinshibuff3",
		"qinshibuff3"
	},
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
			type = "BattleBuffAura",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				buff_id = 200454,
				cld_data = {
					box = {
						range = 3
					}
				}
			}
		}
	}
}

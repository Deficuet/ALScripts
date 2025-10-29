return {
	time = 0,
	name = "航空作战技巧",
	init_effect = "jinengchufared",
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 902330,
	icon = 902330,
	last_effect = "",
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	shipInfoScene = {
		equip = {
			{
				number = 10,
				check_label = {
					"DB"
				},
				label = {
					"DB"
				}
			},
			{
				number = 10,
				check_label = {
					"TB"
				},
				label = {
					"TB"
				}
			},
			{
				number = 10,
				check_label = {
					"FT"
				},
				label = {
					"FT"
				}
			}
		}
	},
	effect_list = {
		{
			type = "BattleBuffAddProficiency",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.1,
				label = {
					"DB"
				}
			}
		},
		{
			type = "BattleBuffAddProficiency",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.1,
				label = {
					"TB"
				}
			}
		},
		{
			type = "BattleBuffAddProficiency",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.1,
				label = {
					"FT"
				}
			}
		}
	}
}

return {
	time = 0,
	name = "空域演训",
	init_effect = "jinengchufared",
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 902280,
	icon = 902280,
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
					"FT"
				},
				label = {
					"FT"
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
					"FT"
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
		}
	}
}

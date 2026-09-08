return {
	time = 0,
	name = "2026虎UR活动 异常空间",
	init_effect = "",
	stack = 1,
	id = 201902,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAura",
			trigger = {
				"onAttach"
			},
			arg_list = {
				friendly_fire = true,
				buff_id = 201903,
				cld_data = {
					box = {
						range = 300
					}
				}
			}
		},
		{
			type = "BattleBuffAura",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201904,
				cld_data = {
					box = {
						range = 300
					}
				}
			}
		}
	}
}

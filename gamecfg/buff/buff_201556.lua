return {
	time = 0,
	name = "2025约战联动 L3 BOSS光环",
	init_effect = "",
	stack = 1,
	id = 201556,
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
				buff_id = 201557,
				cld_data = {
					box = {
						range = 50
					}
				}
			}
		}
	}
}

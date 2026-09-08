return {
	time = 0,
	name = "2026虎UR活动 万众一心",
	init_effect = "",
	stack = 1,
	id = 201910,
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
				buff_id = 201911,
				cld_data = {
					box = {
						range = 300
					}
				}
			}
		}
	}
}

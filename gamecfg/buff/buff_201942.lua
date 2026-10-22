return {
	time = 0,
	name = "2026风帆四期 EX困难 我方群体对BOSS点燃增伤",
	init_effect = "",
	stack = 1,
	id = 201942,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAura",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				friendly_fire = true,
				buff_id = 201943,
				cld_data = {
					box = {
						range = 300
					}
				}
			}
		}
	}
}

return {
	time = 0.5,
	name = "2026风帆四期 EX困难 去除我方群体对BOSS点燃增伤",
	init_effect = "",
	stack = 1,
	id = 201944,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					201942
				}
			}
		}
	}
}

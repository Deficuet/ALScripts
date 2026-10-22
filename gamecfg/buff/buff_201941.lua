return {
	time = 0.5,
	name = "2026风帆四期 EX困难 BOSS免疫常规点燃",
	init_effect = "",
	stack = 1,
	id = 201941,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id_list = {
					311
				}
			}
		}
	}
}

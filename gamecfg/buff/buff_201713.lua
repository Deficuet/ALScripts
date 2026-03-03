return {
	time = 0.1,
	name = "2026莫斯科活动 EX 困难 棋子伤害",
	init_effect = "",
	stack = 1,
	id = 201713,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					201712
				}
			}
		}
	}
}

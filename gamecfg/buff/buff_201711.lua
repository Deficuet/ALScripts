return {
	time = 0,
	name = "2026莫斯科活动 EX 困难 白棋",
	init_effect = "",
	stack = 1,
	id = 201711,
	picture = "",
	last_effect = "mosike_weiqi02",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStack"
			},
			arg_list = {
				skill_id = 201712
			}
		},
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id_list = {
					201710
				}
			}
		}
	}
}

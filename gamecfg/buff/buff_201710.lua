return {
	time = 0,
	name = "2026莫斯科活动 EX 困难 黑棋",
	init_effect = "",
	stack = 1,
	id = 201710,
	picture = "",
	last_effect = "mosike_weiqi01",
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
					201711
				}
			}
		}
	}
}

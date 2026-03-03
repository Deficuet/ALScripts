return {
	time = 7,
	name = "2026莫斯科活动 日进斗金",
	init_effect = "",
	stack = 1,
	id = 201702,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201703
			}
		}
	}
}

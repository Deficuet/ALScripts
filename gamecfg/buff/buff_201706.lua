return {
	time = 1,
	name = "2026莫斯科活动 发光的料理",
	init_effect = "",
	stack = 1,
	id = 201706,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201707
			}
		}
	}
}

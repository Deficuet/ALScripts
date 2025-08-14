return {
	time = 0.5,
	name = "2025马塞纳活动 EX 白形态 死亡时唤醒另一形态，并附加增伤BUFF",
	init_effect = "",
	stack = 1,
	id = 201491,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201484
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201487
			}
		}
	}
}

return {
	time = 0,
	name = "2025黑岩联动 剧情战 黑岩前排交替触发特殊弹幕",
	init_effect = "",
	stack = 1,
	id = 201453,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201454
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201454,
				time = 10
			}
		}
	}
}

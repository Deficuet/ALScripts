return {
	time = 7,
	name = "2026伯利欣根活动 神光之网 初始化",
	init_effect = "",
	stack = 1,
	id = 201760,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201761
			}
		}
	}
}

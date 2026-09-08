return {
	time = 7,
	name = "2026虎UR活动 共鸣之声",
	init_effect = "",
	stack = 1,
	id = 201906,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201907
			}
		}
	}
}

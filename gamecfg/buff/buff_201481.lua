return {
	init_effect = "",
	name = "2025马塞纳活动 埃姆登高频率形态变化",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 201481,
	icon = 201481,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201482,
				time = 1
			}
		}
	}
}

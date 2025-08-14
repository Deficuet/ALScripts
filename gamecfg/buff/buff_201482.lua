return {
	init_effect = "",
	name = "2025马塞纳活动 埃姆登高频率形态变化",
	time = 0.5,
	picture = "",
	desc = "",
	stack = 1,
	id = 201482,
	icon = 201482,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffActionKeyOffset",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				key = "_switch"
			}
		}
	}
}

return {
	init_effect = "",
	name = "2025马塞纳活动 埃姆登形态变化",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 201480,
	icon = 201480,
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

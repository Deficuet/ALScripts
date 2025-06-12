return {
	init_effect = "",
	name = "",
	time = 1.5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 17945,
	icon = 17940,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "stuned"
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "MJDE1AIM"
			}
		}
	}
}

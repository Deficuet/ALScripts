return {
	init_effect = "",
	name = "",
	time = 7,
	picture = "",
	desc = "标记",
	stack = 1,
	id = 190133,
	icon = 190130,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "CaptureWeb1"
			}
		}
	}
}

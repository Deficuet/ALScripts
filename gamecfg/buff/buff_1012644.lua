return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "标记-Enemy",
	stack = 1,
	id = 1012644,
	icon = 12640,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "RGC"
			}
		}
	}
}

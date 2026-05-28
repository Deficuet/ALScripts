return {
	init_effect = "",
	name = "",
	time = 10,
	picture = "",
	desc = "标记",
	stack = 1,
	id = 802184,
	icon = 802180,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "knsbmeta"
			}
		}
	}
}

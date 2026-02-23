return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 10,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 151827,
	icon = 151820,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			pop = {},
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "Pasadena_NOTCoolDown"
			}
		}
	}
}

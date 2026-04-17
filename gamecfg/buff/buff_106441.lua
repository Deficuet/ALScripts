return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "装备效率提高",
	stack = 1,
	id = 106441,
	icon = 106440,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddProficiency",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 0.1,
				index = {
					2
				}
			}
		}
	}
}

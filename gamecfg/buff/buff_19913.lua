return {
	desc_get = "",
	name = "取消分担",
	init_effect = "",
	time = 1,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 19913,
	icon = 19910,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					19912
				}
			}
		}
	}
}

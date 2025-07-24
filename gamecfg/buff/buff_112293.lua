return {
	init_effect = "",
	name = "",
	time = 0.5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 112293,
	icon = 112280,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id_list = {
					112291
				}
			}
		}
	}
}

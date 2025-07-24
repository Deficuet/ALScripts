return {
	init_effect = "",
	name = "",
	time = 0.6,
	picture = "",
	desc = "",
	stack = 1,
	id = 112094,
	icon = 112090,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 112094
			}
		},
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					112121
				}
			}
		}
	}
}

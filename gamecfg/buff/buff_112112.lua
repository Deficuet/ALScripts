return {
	init_effect = "",
	name = "",
	time = 0.2,
	color = "red",
	picture = "",
	desc = "",
	stack = 2,
	id = 112112,
	icon = 112110,
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
					112111
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 112111
			}
		}
	}
}

return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 1,
	color = "red",
	picture = "",
	desc = "",
	stack = 99,
	id = 152362,
	icon = 152362,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 152361
			}
		}
	}
}

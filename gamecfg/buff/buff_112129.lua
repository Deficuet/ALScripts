return {
	init_effect = "",
	name = "",
	time = 0.2,
	color = "red",
	picture = "",
	desc = "",
	stack = 6,
	id = 112129,
	icon = 112110,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 112129
			}
		}
	}
}

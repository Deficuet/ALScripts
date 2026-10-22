return {
	init_effect = "",
	name = "",
	time = 0.5,
	color = "red",
	picture = "",
	desc = "",
	stack = 99,
	id = 152784,
	icon = 152780,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 152781
			}
		}
	}
}

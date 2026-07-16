return {
	init_effect = "",
	name = "回血",
	time = 0,
	picture = "",
	desc = "",
	stack = 10,
	id = 117065,
	icon = 117060,
	last_effect = "Health",
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				maxHPRatio = 0.01
			}
		}
	}
}

return {
	init_effect = "",
	name = "",
	time = 0.5,
	picture = "",
	desc = "",
	stack = 1,
	id = 106396,
	icon = 106390,
	last_effect = "Health",
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				casterMaxHPRatio = 0.08
			}
		}
	}
}

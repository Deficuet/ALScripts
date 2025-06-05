return {
	time = 3,
	name = "2025信标BOSS 江风meta 斩击命中 百分比伤害",
	init_effect = "",
	stack = 10,
	id = 201423,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffHP",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				casterMaxHPRatio = -0.05
			}
		}
	}
}

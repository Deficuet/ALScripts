return {
	init_effect = "",
	name = "地狱立方体",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 20,
	id = 60901,
	icon = 60900,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				countTarget = 20,
				countType = 60900
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 60900,
				countType = 60900
			}
		}
	}
}

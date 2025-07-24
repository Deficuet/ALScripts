return {
	init_effect = "",
	name = "天恩浑仪",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 10,
	id = 60911,
	icon = 60910,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				countTarget = 10,
				countType = 60910
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				buff_id = 60912,
				quota = 1,
				target = "TargetSelf",
				countType = 60910
			}
		}
	}
}

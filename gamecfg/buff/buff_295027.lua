return {
	time = 0,
	name = "航母开局预装填",
	init_effect = "",
	stack = 1,
	id = 295027,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddReloadRequirement",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				type = "airAssist",
				number = -0.99
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onAirAssistReady"
			},
			arg_list = {
				count = 1
			}
		}
	}
}

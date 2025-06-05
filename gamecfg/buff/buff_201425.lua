return {
	time = 0,
	name = "2025信标BOSS 江风meta 累计损血",
	init_effect = "",
	stack = 1,
	id = 201425,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				maxHPRatio = 0.2,
				keep = true,
				countTarget = 1,
				countType = 201425
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				buff_id = 201426,
				target = "TargetSelf",
				countType = 201425
			}
		}
	}
}

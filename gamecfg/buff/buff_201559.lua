return {
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
				countType = 201559
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				buff_id = 201560,
				target = "TargetSelf",
				countType = 201559
			}
		}
	},
	{},
	{},
	time = 0,
	name = "2025约战联动 L4 BOSS 反击弹幕",
	init_effect = "",
	stack = 1,
	id = 201559,
	picture = "",
	last_effect = ""
}

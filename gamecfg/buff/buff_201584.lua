return {
	time = 0,
	name = "2025约战联动 飞船组件升级 白鹰LV2",
	init_effect = "",
	stack = 1,
	id = 201584,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				maxHPRatio = 0.3,
				countTarget = 1,
				countType = 201561
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
				skill_id = 201564,
				countType = 201561
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				buff_id = 201564,
				quota = 1,
				target = "TargetSelf",
				countType = 201561
			}
		}
	}
}

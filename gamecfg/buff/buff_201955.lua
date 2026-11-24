return {
	time = 0,
	name = "2026莫洛托夫SP 剧情战 血量监测",
	init_effect = "",
	stack = 1,
	id = 201955,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpUpperBound = 0.1,
				target = "TargetSelf",
				skill_id = 200364,
				quota = 1
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 200440,
				exceptCaster = true,
				quota = 1,
				hpUpperBound = 0.1,
				target = {
					"TargetSpectreUnit",
					"TargetAllHelp"
				}
			}
		}
	}
}

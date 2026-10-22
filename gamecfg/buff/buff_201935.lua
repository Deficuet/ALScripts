return {
	time = 0,
	name = "2026风帆四期 EX困难 守护状态",
	init_effect = "",
	stack = 1,
	id = 201935,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201939,
				exceptCaster = true,
				target = "TargetAllHelp"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201942,
				target = "TargetHarmFarthest"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				buff_id = 201936,
				hpUpperBound = 0.2,
				target = "TargetSelf",
				quota = 1
			}
		}
	}
}

return {
	time = 3,
	name = "常用设置 潜艇BOSS在道中结束后上浮",
	init_effect = "",
	stack = 1,
	id = 201802,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 201803,
				maxTargetNumber = 1,
				target = "TargetSelf",
				check_target = {
					"TargetAllHelp"
				}
			}
		}
	}
}

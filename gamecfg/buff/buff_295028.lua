return {
	time = 0,
	name = "EX困难模式 航母空袭效果添加伤害免疫护盾",
	init_effect = "",
	stack = 1,
	id = 295028,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAllInStrike"
			},
			arg_list = {
				fleetPos = "Leader",
				buff_id = 295029,
				target = "TargetFleetIndex"
			}
		}
	}
}

return {
	time = 0,
	name = "2026风帆四期 EX困难 BOSS免疫常规点燃",
	init_effect = "",
	stack = 1,
	id = 201940,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201941,
				target = "TargetSelf",
				time = 0.2
			}
		}
	}
}

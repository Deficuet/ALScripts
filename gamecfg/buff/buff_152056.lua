return {
	init_effect = "",
	name = "20秒",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 152056,
	icon = 152050,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 152051,
				target = "TargetSelf",
				time = 20
			}
		}
	}
}

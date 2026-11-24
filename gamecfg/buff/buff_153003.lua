return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 153003,
	icon = 153000,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onTakeDamage"
			},
			arg_list = {
				buff_id = 153004,
				quota = 1,
				target = "TargetSelf"
			}
		}
	}
}

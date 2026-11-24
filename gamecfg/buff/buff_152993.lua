return {
	time = 0,
	name = "",
	init_effect = "",
	stack = 5,
	id = 152993,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onChargeWeaponFire"
			},
			pop = {},
			arg_list = {
				buff_id = 152994,
				repeat_count = -1,
				target = {
					"TargetSelf"
				}
			}
		}
	}
}

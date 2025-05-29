return {
	time = 0,
	name = "格伦维尔meta开火计数-2",
	init_effect = "",
	stack = 12,
	id = 801725,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				buff_id = 801726,
				repeat_count = -1,
				target = {
					"TargetSelf"
				}
			}
		}
	}
}

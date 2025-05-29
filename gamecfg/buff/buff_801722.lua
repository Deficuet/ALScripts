return {
	time = 0,
	name = "格伦维尔meta开火计数",
	init_effect = "",
	stack = 12,
	id = 801722,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				buff_id = 801723,
				repeat_count = -1,
				target = {
					"TargetSelf"
				}
			}
		}
	}
}

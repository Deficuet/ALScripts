return {
	time = 0,
	name = "2026风帆四期 EX困难 BOSS本体死亡处理",
	init_effect = "",
	stack = 1,
	id = 201945,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onBeforeFatalDamage"
			},
			arg_list = {
				buff_id = 200440,
				exceptCaster = true,
				target = {
					"TargetSpectreUnit",
					"TargetAllHelp"
				}
			}
		}
	}
}

return {
	time = 0,
	name = "2025马塞纳活动 EX 黑形态次数盾",
	init_effect = "",
	stack = 1,
	id = 201483,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixDamage",
			trigger = {
				"onBeforeTakeDamage"
			},
			arg_list = {
				target = "TargetSelf",
				value = 1
			}
		}
	}
}

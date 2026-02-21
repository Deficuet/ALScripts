return {
	time = 0,
	name = "2025列克星敦II活动 剧情战4 锁伤害上限",
	init_effect = "",
	stack = 1,
	id = 201677,
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
				value = 1333332
			}
		}
	}
}

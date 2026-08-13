return {
	time = 0,
	name = "2026本宁顿活动 剧情战 锁血",
	init_effect = "",
	stack = 1,
	id = 201875,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffLockHealth",
			trigger = {
				"onAttach",
				"onTakeDamage"
			},
			arg_list = {
				value = 1
			}
		}
	}
}

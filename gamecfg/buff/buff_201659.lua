return {
	time = 0,
	name = "2025列克星敦II活动 SP 与变形BOSS生命共享",
	init_effect = "",
	stack = 1,
	id = 201659,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffHPLink",
			trigger = {
				"onTakeDamage",
				"onRemove"
			},
			arg_list = {
				number = 0.5
			}
		}
	}
}

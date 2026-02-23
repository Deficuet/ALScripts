return {
	time = 0,
	name = "2025列克星敦II活动 SP BOSS大小与血量相关",
	init_effect = "",
	stack = 1,
	id = 201662,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffSize",
			trigger = {
				"onAttach",
				"onRemove",
				"onHPRatioUpdate"
			},
			arg_list = {
				number = 2.2,
				hp_scale = 1
			}
		}
	}
}

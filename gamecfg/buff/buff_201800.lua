return {
	time = 0,
	name = "2026信标BOSS 布里斯托尔meta 灯下之影",
	init_effect = "",
	stack = 1,
	id = 201800,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "attackRating",
				number = -500
			}
		}
	}
}

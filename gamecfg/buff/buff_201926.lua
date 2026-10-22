return {
	time = 0,
	name = "2026风帆四期 雾霭回廊 我方debuff",
	init_effect = "",
	stack = 1,
	id = 201926,
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
				number = -300
			}
		}
	}
}

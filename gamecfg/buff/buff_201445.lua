return {
	time = 8,
	name = "2025黑岩联动 BOSS减伤盾",
	init_effect = "",
	stack = 1,
	id = 201445,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.99
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201446
			}
		}
	}
}

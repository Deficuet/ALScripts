return {
	init_effect = "",
	name = "破甲debuff",
	time = 2,
	picture = "",
	desc = "",
	stack = 1,
	id = 117079,
	icon = 117070,
	last_effect = "Pojia01",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatioByCannon",
				number = 0.08
			}
		}
	}
}

return {
	init_effect = "jinengchufared",
	name = "指挥喵天赋",
	time = 0,
	picture = "",
	desc = "受到伤害降低1.5%",
	stack = 2,
	id = 40671,
	icon = 40670,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.015
			}
		}
	}
}

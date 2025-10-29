return {
	time = 20,
	name = "",
	init_effect = "jinengchufablue",
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 151514,
	icon = 151510,
	last_effect = "",
	blink = {
		0,
		0.7,
		1,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "igniteReduce",
				number = 10000
			}
		}
	}
}

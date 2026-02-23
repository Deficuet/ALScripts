return {
	init_effect = "",
	name = "",
	time = 30,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 60992,
	icon = 60990,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRate",
				number = 300
			}
		}
	}
}

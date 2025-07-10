return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "岸基空袭用航空数值",
	stack = 1,
	id = 19973,
	icon = 19970,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "airPower",
				number = 400
			}
		}
	}
}

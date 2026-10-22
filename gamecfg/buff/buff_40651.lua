return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "先锋-指挥-炮击I",
	stack = 1,
	id = 40651,
	icon = 40650,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "command",
				convertRate = 0.4,
				convertAttr = "cannonPower"
			}
		}
	}
}

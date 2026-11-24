return {
	init_effect = "",
	name = "航母-指挥-航空I+航母-指挥-装填I具体效果",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "航母-指挥-航空I+航母-指挥-装填I",
	stack = 1,
	id = 40111,
	icon = 40111,
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
				convertAttr = "airPower"
			}
		},
		{
			type = "BattleBuffAddAttrRatioCommander",
			trigger = {
				"onAttach"
			},
			arg_list = {
				ability = "command",
				convertRate = 0.4,
				convertAttr = "loadSpeed"
			}
		}
	}
}

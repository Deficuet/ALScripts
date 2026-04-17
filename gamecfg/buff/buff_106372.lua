return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 99,
	id = 106372,
	icon = 106370,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove",
				"onStack"
			},
			arg_list = {
				attr = "cannonPower",
				number = 100
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove",
				"onStack"
			},
			arg_list = {
				attr = "dodgeRate",
				number = 100
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove",
				"onStack"
			},
			arg_list = {
				attr = "antiAirPower",
				number = 100
			}
		},
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id_list = {
					106374
				}
			}
		}
	}
}

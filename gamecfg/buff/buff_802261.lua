return {
	init_effect = "",
	name = "",
	time = 8,
	picture = "",
	desc = "标记&DOT",
	stack = 1,
	id = 802261,
	icon = 802260,
	last_effect = "lanhuozhuoshao",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "DATA857MARK"
			}
		},
		{
			type = "BattleBuffDOT",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				attr = "cannonPower",
				number = 42,
				time = 1,
				dotType = 10,
				k = 0
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRate",
				number = -500
			}
		}
	}
}

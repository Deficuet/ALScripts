return {
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				group = 190000,
				attr = "damageReduceFromAmmoType_2",
				number = -0.05
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "xietongdajidiren"
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	init_effect = "",
	name = "",
	time = 5,
	color = "blue",
	picture = "",
	desc = "穿甲弹易伤",
	stack = 1,
	id = 190007,
	icon = 190000,
	last_effect = "Darkness"
}

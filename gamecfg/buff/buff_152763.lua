return {
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
				group = 152760,
				attr = "perfectDodge",
				number = 1
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 152762,
				target = "TargetSelf"
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
	time = 4,
	name = "",
	init_effect = "jinengchufablue",
	picture = "",
	desc = "",
	stack = 1,
	id = 152763,
	icon = 152760,
	last_effect = ""
}

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
			type = "BattleBuffHP",
			trigger = {
				"onAttach"
			},
			arg_list = {
				currentHPRatio = 0.9999,
				number = 1
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				group = 152963,
				attr = "isInvincible",
				number = 1
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "isInvincible_1"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			pop = {
				displayID = 152963,
				trigger = {
					"onRemove"
				}
			},
			arg_list = {
				buff_id = 152964
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
	time = 0.1,
	name = "无敌阶段",
	init_effect = "jinengchufablue",
	picture = "",
	desc = "0.1s无敌后进入归航",
	stack = 1,
	id = 152963,
	icon = 152963,
	last_effect = ""
}

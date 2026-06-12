return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			pop = {},
			trigger = {
				"onStartGame"
			},
			arg_list = {
				target = "TargetSelf",
				buff_id = 1010801
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 1010801,
				time = 20
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 1010800,
				check_target = {
					"TargetAllHelp",
					"TargetShipTag"
				},
				ship_tag_list = {
					"Shokaku"
				}
			}
		}
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	{
		desc = "五航战"
	},
	init_effect = "",
	name = "五航战",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 1010800,
	icon = 10800,
	last_effect = ""
}

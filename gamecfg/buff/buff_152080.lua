return {
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			pop = {},
			arg_list = {
				buff_id = 152081,
				target = "TargetAllHelp"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minTargetNumber = 3,
				buff_id = 152081,
				repeat_count = 10,
				check_target = {
					"TargetAllHelp",
					"TargetNationality"
				},
				nationality = {
					5
				}
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
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 152080,
	icon = 152080,
	last_effect = ""
}

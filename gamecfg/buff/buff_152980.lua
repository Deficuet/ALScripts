return {
	effect_list = {
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 152981,
				exceptCaster = true,
				nationality = 96,
				target = {
					"TargetAllHelp",
					"TargetNationality"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 152980,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffField",
			trigger = {
				""
			},
			arg_list = {
				buff_id = 152982,
				exceptCaster = true,
				nationality = 96,
				target = {
					"TargetAllHelp",
					"TargetNationality"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onSink"
			},
			arg_list = {
				skill_id = 152984,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFinishGame"
			},
			arg_list = {
				skill_id = 152985
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
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 152980,
	icon = 152960,
	last_effect = ""
}

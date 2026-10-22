return {
	effect_list = {
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 152961,
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
				skill_id = 152960,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffField",
			trigger = {},
			arg_list = {
				buff_id = 152962,
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
				skill_id = 152963,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFinishGame"
			},
			arg_list = {
				skill_id = 152964
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
	id = 152960,
	icon = 152960,
	last_effect = ""
}

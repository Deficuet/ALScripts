return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 2,
				target = "TargetSelf",
				skill_id = 152971,
				check_target = {
					"TargetAllHarm"
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				maxTargetNumber = 1,
				target = "TargetSelf",
				skill_id = 152972,
				check_target = {
					"TargetAllHarm"
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
	time = 3,
	picture = "",
	desc = "",
	stack = 1,
	id = 152972,
	icon = 152970,
	last_effect = ""
}

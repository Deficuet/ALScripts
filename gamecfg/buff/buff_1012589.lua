return {
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onUpdate"
			},
			arg_list = {
				buff_id_list = {
					12580
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrike"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 1012580
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
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 1012589,
	icon = 12580,
	last_effect = ""
}

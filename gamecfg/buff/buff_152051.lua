return {
	effect_list = {
		{
			type = "BattleBuffCastSkillRandom",
			trigger = {
				"onAttach"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id_list = {
					152050,
					152051,
					152052
				},
				range = {
					{
						0,
						0.33
					},
					{
						0.33,
						66
					},
					{
						0.66,
						1
					}
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 152053,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				rant = 1000,
				target = "TargetSelf",
				skill_id = 152054
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
	time = 3,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 152051,
	icon = 152050,
	last_effect = ""
}

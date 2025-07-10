return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 2,
				initialCD = true,
				time = 0.5,
				skill_id = 19920,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 19922
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
	time = 1.5,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 19922,
	icon = 19920,
	last_effect = ""
}

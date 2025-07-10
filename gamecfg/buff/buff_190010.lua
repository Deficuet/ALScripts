return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRear",
				"onCenter"
			},
			arg_list = {
				skill_id = 190010
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 3,
				time = 10,
				target = "TargetSelf",
				skill_id = 190011
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpUpperBound = 0.5,
				quota = 1,
				skill_id = 190012
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
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 190010,
	icon = 190010,
	last_effect = ""
}

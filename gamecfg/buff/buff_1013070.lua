return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAirAssistReady"
			},
			arg_list = {
				skill_id = 1013070,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 1013071,
				time = 20
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onHPRatioUpdate"
			},
			arg_list = {
				hpUpperBound = 0.3,
				target = "TargetSelf",
				skill_id = 1013072,
				quota = 1
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
	id = 1013070,
	icon = 13070,
	last_effect = ""
}

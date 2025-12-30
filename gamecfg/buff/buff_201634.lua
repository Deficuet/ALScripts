return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				time = 52.5,
				skill_id = 201634
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201635,
				quota = 1,
				time = 53,
				exceptCaster = true,
				target = {
					"TargetSpectreUnit",
					"TargetAllHelp"
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
	{},
	{},
	{},
	{},
	{},
	time = 0,
	name = "2025信标BOSS 约克城meta 浮游炮",
	init_effect = "",
	stack = 1,
	id = 201634,
	picture = "",
	last_effect = ""
}

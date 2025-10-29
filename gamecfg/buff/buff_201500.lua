return {
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "DMG_TAG_EHC_ignited",
				number = 0.3
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201501,
				target = "TargetSelf",
				time = 0.5
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201504,
				target = "TargetSelf",
				time = 0.2
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	time = 0,
	name = "2025信标BOSS 夕立meta 相关BUFF",
	init_effect = "",
	stack = 1,
	id = 201500,
	picture = "",
	last_effect = ""
}

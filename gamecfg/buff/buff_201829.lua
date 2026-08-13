return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201826,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201830,
				target = "TargetSelf",
				time = 2
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	time = 0,
	name = "2026本宁顿活动 侵蚀性络合物",
	init_effect = "",
	stack = 1,
	id = 201829,
	picture = "",
	last_effect = ""
}

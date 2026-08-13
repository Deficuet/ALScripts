return {
	effect_list = {
		{
			type = "BattleBuffCastSkillRandom",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id_list = {
					201827,
					201828
				},
				range = {
					{
						0,
						0.6
					},
					{
						0.6,
						1
					}
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 201832
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	time = 0.5,
	name = "2026本宁顿活动 侵蚀性络合物",
	init_effect = "",
	stack = 1,
	id = 201831,
	picture = "",
	last_effect = ""
}

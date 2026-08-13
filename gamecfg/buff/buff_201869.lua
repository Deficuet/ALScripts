return {
	time = 40,
	name = "2026本宁顿活动 EX普通 吹风阶段 初始随机为右",
	init_effect = "",
	stack = 1,
	id = 201869,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201869
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 10,
				skill_id = 201868
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 20,
				skill_id = 201869
			}
		}
	}
}

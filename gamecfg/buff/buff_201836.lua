return {
	time = 0,
	name = "2026本宁顿活动 EX普通 龙卷风伤害",
	init_effect = "",
	stack = 1,
	id = 201836,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201834,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 1,
				target = "TargetSelf",
				skill_id = 201834
			}
		}
	}
}

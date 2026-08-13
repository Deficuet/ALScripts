return {
	time = 3,
	name = "2026本宁顿活动 EX困难 吹风阶段 污染堆叠",
	init_effect = "",
	stack = 1,
	id = 201850,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 201851,
				maxTargetNumber = 0,
				target = "TargetSelf",
				nationality = 97,
				check_target = {
					"TargetSelf",
					"TargetNationality"
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
				buff_id = 201853,
				minTargetNumber = 1,
				target = "TargetSelf",
				nationality = 97,
				check_target = {
					"TargetSelf",
					"TargetNationality"
				}
			}
		}
	}
}

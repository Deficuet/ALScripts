return {
	time = 0.5,
	name = "2025马塞纳活动 EX 白形态苏醒",
	init_effect = "xiaoguanghui_shengguang",
	stack = 1,
	id = 201489,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id_list = {
					201494
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 200364,
				target = "TargetSelf"
			}
		}
	}
}

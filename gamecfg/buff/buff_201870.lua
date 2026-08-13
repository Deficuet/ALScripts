return {
	time = 10,
	name = "2026本宁顿活动 EX普通 吹风阶段 左侧风向",
	init_effect = "",
	stack = 1,
	id = 201870,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201847,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201872,
				target = "TargetShipTag",
				time = 0.4,
				ship_tag_list = {
					"left"
				}
			}
		}
	}
}

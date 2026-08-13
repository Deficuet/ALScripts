return {
	time = 10,
	name = "2026本宁顿活动 EX困难 吹风阶段 右侧风向",
	init_effect = "",
	stack = 1,
	id = 201848,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201848,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201849,
				target = "TargetShipTag",
				time = 0.4,
				ship_tag_list = {
					"right"
				}
			}
		}
	}
}

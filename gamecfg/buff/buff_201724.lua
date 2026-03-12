return {
	time = 3,
	name = "2026信标BOSS 雷根斯堡meta 单独印记施加判断",
	init_effect = "",
	stack = 1,
	id = 201724,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 201731,
				target = "TargetSelf",
				attrCompare = "torpedoPower>0",
				check_target = {
					"TargetSelf",
					"TargetAttrCompare"
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				buff_id = 201732,
				target = "TargetSelf",
				attrCompare = "torpedoPower<=0",
				check_target = {
					"TargetSelf",
					"TargetAttrCompare"
				}
			}
		}
	}
}

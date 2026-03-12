return {
	time = 0,
	name = "2026信标BOSS 雷根斯堡meta 阶段式胜利效果",
	init_effect = "",
	stack = 99,
	id = 201737,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "cannonPower",
				number = 1500
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "torpedoPower",
				number = 1500
			}
		}
	}
}

return {
	time = 2.9,
	name = "2026尼尔联动 近身斩击期间本体无敌",
	init_effect = "",
	stack = 1,
	id = 201809,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffSetBattleUnitType",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				value = -99
			}
		}
	}
}

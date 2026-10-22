return {
	time = 0,
	name = "2026风帆四期 EX困难 BOSS被守护状态",
	init_effect = "",
	stack = 1,
	id = 201939,
	picture = "",
	last_effect = "wudihudun",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffSetBattleUnitType",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				value = -100
			}
		}
	}
}

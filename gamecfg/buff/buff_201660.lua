return {
	time = 0,
	name = "2025列克星敦II活动 SP 隐藏本体",
	init_effect = "",
	stack = 1,
	id = 201660,
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

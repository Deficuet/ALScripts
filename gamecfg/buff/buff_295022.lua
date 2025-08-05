return {
	time = 0,
	name = "EX部分小怪入场后移动减速",
	init_effect = "",
	stack = 1,
	id = 295022,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -8000
			}
		}
	}
}

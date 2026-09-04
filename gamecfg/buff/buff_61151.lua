return {
	init_effect = "",
	name = "员工通行卡-皇家航速",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 61151,
	icon = 61150,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 3,
				mul = 0
			}
		}
	}
}

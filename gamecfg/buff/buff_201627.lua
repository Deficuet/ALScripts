return {
	time = 0,
	name = "2025约战联动 角色支援 时崎狂三",
	init_effect = "",
	stack = 1,
	id = 201627,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -2000
			}
		}
	}
}

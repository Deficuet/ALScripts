return {
	icon = 153000,
	name = "",
	time = 10,
	stack = 1,
	id = 153006,
	picture = "",
	effect_list = {
		{
			type = "BattleBuffAddReloadRequirement",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				index = 2,
				type = 2,
				number = 999
			}
		}
	}
}

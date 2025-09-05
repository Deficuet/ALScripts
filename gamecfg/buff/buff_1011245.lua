return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "6s后死亡",
	stack = 1,
	id = 1011245,
	icon = 11240,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDeath",
			trigger = {
				"onAttach"
			},
			arg_list = {
				instant_kill = true
			}
		}
	}
}

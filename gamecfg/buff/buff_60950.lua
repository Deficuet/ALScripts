return {
	init_effect = "",
	name = "封解主-更换BGM",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60950,
	icon = 60950,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDiva",
			trigger = {
				"onInitGame"
			},
			arg_list = {
				bgm_list = {
					"dal-az-theme"
				}
			}
		}
	}
}

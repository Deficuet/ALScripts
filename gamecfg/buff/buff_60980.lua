return {
	init_effect = "",
	name = "海蓝色之迷-更换BGM",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 60980,
	icon = 60980,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDiva",
			trigger = {
				"onInitGame"
			},
			arg_list = {
				bgm_list = {
					"theme-helena"
				}
			}
		}
	}
}

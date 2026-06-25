return {
	init_effect = "",
	name = "欢乐小丑帽-更换BGM",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61110,
	icon = 61110,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDiva",
			trigger = {
				"onInitGame"
			},
			arg_list = {
				bgm_list = {
					"story-magicalnight-pv"
				}
			}
		}
	}
}

return {
	init_effect = "",
	name = "千雷装饰笔-更换BGM",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61070,
	icon = 61070,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDiva",
			trigger = {
				"onInitGame"
			},
			arg_list = {
				bgm_list = {
					"doa-az-pv-1"
				}
			}
		}
	}
}

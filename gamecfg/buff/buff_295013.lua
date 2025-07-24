return {
	init_effect = "",
	name = "EX小怪超出范围时死亡",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "",
	stack = 1,
	id = 295013,
	icon = 295013,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffDeath",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				maxY = 91,
				minY = 9,
				maxX = 31
			}
		}
	}
}

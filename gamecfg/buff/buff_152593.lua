return {
	init_effect = "",
	name = "装甲",
	time = 5,
	picture = "",
	desc = "护盾",
	stack = 1,
	id = 152593,
	icon = 152590,
	last_effect = "Shield",
	effect_list = {
		{
			type = "BattleBuffShield",
			trigger = {
				"onStack",
				"onTakeDamage"
			},
			arg_list = {
				maxHPRatio = 0.01
			}
		}
	}
}

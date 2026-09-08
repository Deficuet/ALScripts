return {
	init_effect = "",
	name = "装甲",
	time = 0,
	picture = "",
	desc = "护盾",
	stack = 1,
	id = 152674,
	icon = 152670,
	last_effect = "Shield",
	effect_list = {
		{
			type = "BattleBuffShield",
			trigger = {
				"onStack",
				"onTakeDamage"
			},
			arg_list = {
				maxHPRatio = 0.05
			}
		}
	}
}

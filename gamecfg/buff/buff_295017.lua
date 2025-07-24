return {
	time = 0,
	name = "EX使我方后排不受触底伤害",
	init_effect = "",
	stack = 1,
	id = 295017,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "immuneDirectHit",
				number = 1
			}
		}
	}
}

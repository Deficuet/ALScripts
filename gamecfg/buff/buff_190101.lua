return {
	init_effect = "",
	name = "",
	time = 6,
	picture = "",
	desc = "受到伤害提高",
	stack = 1,
	id = 190101,
	icon = 190100,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = 0.03
			}
		}
	}
}

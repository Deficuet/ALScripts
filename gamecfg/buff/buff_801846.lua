return {
	init_effect = "",
	name = "",
	time = 8,
	picture = "",
	desc = "敌方效果-航速下降+机动下降",
	stack = 1,
	id = 801846,
	icon = 801840,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 0,
				mul = -3000
			}
		},
		{
			type = "BattleBuffAddAttrRatio",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "dodgeRate",
				number = -300
			}
		}
	}
}

return {
	init_effect = "",
	name = "海渊下的力量",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "战斗中，自身对轻型护甲敌人造成的伤害减少5%，对中型护甲敌人造成的伤害提升12%",
	stack = 1,
	id = 61170,
	icon = 61170,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "damageToArmorRateEnhance_1",
				number = -0.05
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "damageToArmorRateEnhance_2",
				number = 0.12
			}
		}
	}
}

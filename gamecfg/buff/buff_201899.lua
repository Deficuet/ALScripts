return {
	time = 25,
	name = "2026年信标BOSS 萨拉托加meta 护甲切换",
	init_effect = "",
	stack = 1,
	id = 201899,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "armorType",
				number = 1
			}
		}
	}
}

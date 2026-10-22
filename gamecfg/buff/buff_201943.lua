return {
	time = 0,
	name = "2026风帆四期 EX困难 我方群体对BOSS点燃增伤",
	init_effect = "",
	stack = 1,
	id = 201943,
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
				attr = "DMG_TAG_EHC_ignited",
				number = 0.5
			}
		}
	}
}

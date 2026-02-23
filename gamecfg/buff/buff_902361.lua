return {
	init_effect = "",
	name = "",
	time = 0,
	color = "yellow",
	picture = "",
	desc = "航速提高10%",
	stack = 1,
	id = 902361,
	icon = 902360,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach"
			},
			arg_list = {
				add = 0,
				mul = 2000
			}
		},
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "DMG_TAG_EHC_SlowerThanFormidable",
				number = 0.1
			}
		}
	}
}

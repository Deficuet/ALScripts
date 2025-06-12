return {
	desc_get = "",
	name = "",
	init_effect = "jinengchufared",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 1013883,
	icon = 13880,
	last_effect = "",
	blink = {
		1,
		0,
		0,
		0.3,
		0.3
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				attr = "DMG_TAG_EHC_SlowerThanStrasser",
				number = 0.1
			}
		}
	}
}

return {
	desc_get = "",
	name = "",
	init_effect = "jinengchufared",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 151364,
	icon = 151360,
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
				attr = "DMG_TAG_EHC_U552SKILL",
				number = 0.1
			}
		}
	}
}

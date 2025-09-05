return {
	init_effect = "",
	name = "",
	time = 0.2,
	picture = "",
	desc = "优米雅武技对轻技能tag",
	stack = 1,
	id = 112116,
	icon = 112110,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "Yumia_Skill2_Lit"
			}
		}
	}
}

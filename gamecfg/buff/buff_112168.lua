return {
	init_effect = "",
	name = "",
	time = 7.1,
	picture = "",
	desc = "优米雅武技对轻必杀tag",
	stack = 1,
	id = 112168,
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
				tag = "Yumia_Skill2_Lit_fin2"
			}
		}
	}
}

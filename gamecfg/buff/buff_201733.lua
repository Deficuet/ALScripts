return {
	init_effect = "",
	name = "2026信标BOSS 雷根斯堡meta 印记施加给BOSS",
	time = 0,
	stack = 99,
	id = 201733,
	picture = "",
	last_effect = "leigensibao_alter_sign",
	last_effect_stack_text = {
		node = "scale/stack/text"
	},
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onStack",
				"onRemove"
			},
			arg_list = {
				attr = "injureRatio",
				number = -0.2
			}
		}
	}
}

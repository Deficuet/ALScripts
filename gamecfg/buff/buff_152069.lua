return {
	init_effect = "",
	name = "顽皮标记",
	time = 6.1,
	color = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 152069,
	icon = 152060,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "Ozornoy_mark"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 2,
				time = 3,
				target = "TargetSelf",
				skill_id = 152069
			}
		}
	}
}

return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0.2,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 118029,
	icon = 118020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 118029
			}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "LilielBomb"
			}
		}
	}
}

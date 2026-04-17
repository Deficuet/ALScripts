return {
	init_effect = "",
	name = "",
	time = 20,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 106480,
	icon = 106480,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffFixVelocity",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				add = 3
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 106480
			}
		}
	}
}

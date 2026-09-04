return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 1012953,
	icon = 12950,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFoeDying"
			},
			arg_list = {
				killer = "self",
				target = "TargetSelf",
				skill_id = 1012952
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onFoeDying"
			},
			arg_list = {
				killer = "child",
				target = "TargetSelf",
				skill_id = 1012952
			}
		}
	}
}

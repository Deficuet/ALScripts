return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 151422,
	icon = 151420,
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
				skill_id = 151422
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
				skill_id = 151422
			}
		}
	}
}

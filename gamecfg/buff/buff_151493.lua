return {
	init_effect = "",
	name = "20秒",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 151493,
	icon = 151490,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				target = "TargetSelf",
				time = 20,
				skill_id = 151494
			}
		}
	}
}

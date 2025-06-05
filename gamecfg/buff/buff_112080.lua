return {
	init_effect = "",
	name = "Dead  Reaping",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 112080,
	icon = 112080,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAllInStrikeSteady"
			},
			arg_list = {
				quota = 1,
				target = "TargetSelf",
				skill_id = 112080
			}
		}
	}
}

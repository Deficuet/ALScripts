return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 6,
	id = 118039,
	icon = 118020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				quota = 7,
				target = "TargetSelf",
				skill_id = 118031
			}
		}
	}
}

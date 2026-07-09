return {
	init_effect = "",
	name = "装填号令",
	time = 15,
	color = "red",
	picture = "",
	desc = "15%的概率发动",
	stack = 1,
	id = 1090491,
	icon = 2020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				rant = 2500,
				skill_id = 1090491,
				target = "TargetSelf"
			}
		}
	}
}

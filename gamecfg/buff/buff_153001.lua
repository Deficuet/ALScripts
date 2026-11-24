return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 1,
	color = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 153001,
	icon = 153000,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 153001,
				target = "TargetSelf"
			}
		}
	}
}

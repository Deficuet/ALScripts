return {
	init_effect = "",
	name = "ERROR十三世-读秒",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 61131,
	icon = 61130,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				quota = 1,
				time = 13,
				skill_id = 61130
			}
		}
	}
}

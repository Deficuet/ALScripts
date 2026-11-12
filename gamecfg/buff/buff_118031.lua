return {
	desc_get = "",
	name = "",
	init_effect = "",
	time = 6,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 118031,
	icon = 118020,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 118030,
				time = 5
			}
		}
	}
}

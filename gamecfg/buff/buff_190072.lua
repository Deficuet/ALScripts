return {
	init_effect = "",
	name = "暴风雨2",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 190072,
	icon = 190070,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 10,
				target = "TargetSelf",
				skill_id = 190070
			}
		}
	}
}

return {
	time = 0,
	name = "2025白凤UR活动 EX 烟雾玉烟雾 效果逐渐消失",
	init_effect = "",
	stack = 1,
	id = 201513,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 0.2,
				target = "TargetSelf",
				skill_id = 201513
			}
		}
	}
}

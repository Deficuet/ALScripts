return {
	init_effect = "",
	name = "主线16章召唤烟幕发生蛋船",
	time = 0,
	color = "blue",
	picture = "",
	desc = "",
	stack = 1,
	id = 9728,
	icon = 9728,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 9728,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 30,
				target = "TargetSelf",
				skill_id = 9728
			}
		}
	}
}

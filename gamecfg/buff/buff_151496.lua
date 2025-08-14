return {
	init_effect = "",
	name = "10秒触发一次",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 151496,
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
				time = 10,
				skill_id = 151495
			}
		}
	}
}

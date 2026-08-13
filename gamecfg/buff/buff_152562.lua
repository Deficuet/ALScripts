return {
	init_effect = "",
	name = "弹幕",
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	id = 152562,
	icon = 152560,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 15,
				target = "TargetSelf",
				skill_id = 152560
			}
		}
	}
}

return {
	init_effect = "",
	name = "骑士之盾 +",
	time = 3,
	picture = "",
	desc = "概率触发器",
	stack = 1,
	id = 1005071,
	icon = 5070,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				rant = 7500,
				skill_id = 1005071,
				target = "TargetSelf"
			}
		}
	}
}

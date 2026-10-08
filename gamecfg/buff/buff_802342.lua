return {
	init_effect = "",
	name = "",
	time = 3,
	picture = "",
	desc = "概率触发器",
	stack = 1,
	id = 802342,
	icon = 802340,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				rant = 7000,
				skill_id = 802340,
				target = "TargetSelf"
			}
		}
	}
}

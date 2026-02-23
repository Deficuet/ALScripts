return {
	time = 3,
	name = "2025信标BOSS 约克城meta 瞬移回初始点",
	init_effect = "",
	stack = 1,
	id = 201636,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201636,
				target = "TargetSelf"
			}
		}
	}
}

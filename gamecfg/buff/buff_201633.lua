return {
	time = 2,
	name = "2025信标BOSS 约克城meta 领域展开弹条",
	init_effect = "",
	stack = 1,
	id = 201633,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201633,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onRemove"
			},
			arg_list = {
				skill_id = 201632,
				target = "TargetSelf"
			}
		}
	}
}

return {
	time = 3,
	name = "2025优米雅联动 核心等级LV3",
	init_effect = "",
	stack = 1,
	id = 201462,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201462,
				target = "TargetSelf"
			}
		}
	}
}

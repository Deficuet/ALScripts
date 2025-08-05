return {
	time = 0,
	name = "2025优米雅联动 核心等级LV2",
	init_effect = "",
	stack = 1,
	id = 201457,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				target = "TargetSelf",
				time = 15,
				skill_id = 201457
			}
		}
	}
}

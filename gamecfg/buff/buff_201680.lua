return {
	time = 0,
	name = "2025列克星敦II活动 剧情战4 触发后排弹幕",
	init_effect = "",
	stack = 1,
	id = 201680,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201680,
				target = "TargetSelf"
			}
		}
	}
}

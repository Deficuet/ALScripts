return {
	time = 0,
	name = "2025列克星敦II活动 剧情战6 我方回血",
	init_effect = "",
	stack = 1,
	id = 201682,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				time = 1,
				target = "TargetSelf",
				skill_id = 201682
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201683,
				target = "TargetAllHelp"
			}
		}
	}
}

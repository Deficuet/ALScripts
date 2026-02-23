return {
	time = 0,
	name = "2025列克星敦II活动 剧情战1流程",
	init_effect = "",
	stack = 1,
	id = 201669,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 201669
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				skill_id = 201669,
				time = 3
			}
		}
	}
}

return {
	init_effect = "",
	name = "停止移动",
	time = 1,
	picture = "",
	desc = "",
	stack = 1,
	id = 151721,
	icon = 151720,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffStun",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		},
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "stuned"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				skill_id = 151721,
				target = "TargetSelf"
			}
		}
	}
}

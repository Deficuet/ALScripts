return {
	init_effect = "",
	name = "",
	time = 0,
	picture = "",
	desc = "标记-Enemy",
	stack = 1,
	id = 1019165,
	icon = 19160,
	last_effect = "Darkness",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "ZZY"
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onSink"
			},
			arg_list = {
				buff_id = 1019166,
				target = {
					"TargetAllHelp",
					"TargetNearest"
				}
			}
		}
	}
}

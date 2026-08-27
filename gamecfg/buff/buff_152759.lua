return {
	init_effect = "",
	name = "定身buff",
	time = 1,
	picture = "",
	desc = "",
	stack = 1,
	id = 152759,
	icon = 152750,
	last_effect = "tianjinfeng_xuanfeng",
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
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 152758
			}
		}
	}
}

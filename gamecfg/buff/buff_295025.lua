return {
	time = 0,
	name = "玩家角色标志",
	init_effect = "",
	stack = 1,
	id = 295025,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddTag",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				tag = "character"
			}
		}
	}
}

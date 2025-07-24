return {
	time = 0,
	name = "2025优米雅联动 核心等级LV3",
	init_effect = "",
	stack = 1,
	id = 201461,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201462
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201462,
				target = "TargetSelf",
				time = 20
			}
		}
	}
}

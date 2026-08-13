return {
	time = 0,
	name = "2026本宁顿活动 雨中花海",
	init_effect = "",
	stack = 1,
	id = 201823,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201824
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 201824,
				time = 25
			}
		}
	}
}

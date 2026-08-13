return {
	time = 3,
	name = "2026本宁顿活动 侵蚀性络合物",
	init_effect = "",
	stack = 1,
	id = 201826,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 201827
			}
		}
	}
}

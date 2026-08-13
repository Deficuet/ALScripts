return {
	time = 3,
	name = "2026本宁顿活动 EX困难 吹风阶段流程",
	init_effect = "",
	stack = 1,
	id = 201856,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach"
			},
			arg_list = {
				buff_id = 201844,
				target = "TargetPlayerFlagShip"
			}
		}
	}
}

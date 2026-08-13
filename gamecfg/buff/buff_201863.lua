return {
	time = 0.1,
	name = "2026本宁顿活动 EX困难 吹风阶段 10层污染判断 玩家角色",
	init_effect = "",
	stack = 1,
	id = 201863,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201864,
				target = "TargetPlayerVanguardFleet"
			}
		}
	}
}

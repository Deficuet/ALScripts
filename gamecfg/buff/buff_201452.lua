return {
	time = 3,
	name = "2025黑岩联动 剧情战 黑岩前排交替触发特殊弹幕",
	init_effect = "",
	stack = 1,
	id = 201452,
	picture = "",
	last_effect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201453
			}
		}
	}
}

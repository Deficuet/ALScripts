return {
	time = 1,
	name = "EX部分小怪入场后移动减速",
	init_effect = "",
	stack = 1,
	id = 295021,
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
				buff_id = 295022
			}
		}
	}
}

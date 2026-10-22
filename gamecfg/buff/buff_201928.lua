return {
	time = 2,
	name = "2026风帆四期 沉星之渊",
	init_effect = "",
	stack = 1,
	id = 201928,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onRemove"
			},
			arg_list = {
				buff_id = 201930
			}
		}
	}
}
